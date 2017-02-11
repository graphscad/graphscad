# coding: utf8
# from __future__ import unicode_literals

import core as cdc

class Node_gearrack(cdc.Dagnode):

    def getcomment(self):
        return 'this node is used to create a gear rack'

    def getdisplaytype(self):
        return 'object'

    def getinputplugs(self):
        return [
                {'name': 'mm_per_tooth', 'value': '3', 'type': 'str','tip':'unit per tooth'},
                {'name': 'number_of_teeth', 'value': '11', 'type': 'str','tip':'number of teeth'},
                {'name': 'thickness', 'value': '1', 'type': 'str','tip':'thickness of gear rack'},
                {'name': 'height', 'value': '10', 'type': 'str','tip':'height of gear rack'},
                {'name': 'pressure_angle', 'value': '28', 'type': 'str','tip':'pressure angle for tooth shape'},
                {'name': 'backlash', 'value': '0.0', 'type': 'str','tip':''},
                {'name': 'tx', 'value': '0', 'type': 'str','tip':'x translation of output object'},
                {'name': 'ty', 'value': '0', 'type': 'str','tip':'y translation of output object'},
                {'name': 'tz', 'value': '0', 'type': 'str','tip':'z translation of output object'}
                ]

    def getoutputplugs(self):
        return [
                {'name': 'object', 'value': '', 'type': 'object','tip':'output object'}
                ]

    def getheader(self):
        return """
//////////////////////////////////////////////////////////////////////////////////////////////
// Public Domain Parametric Involute Spur Gear (and involute helical gear and involute rack)
// version 1.1
// by Leemon Baird, 2011, Leemon@Leemon.com
//http://www.thingiverse.com/thing:5505
//
// This file is public domain.  Use it for any purpose, including commercial
// applications.  Attribution would be nice, but is not required.  There is
// no warranty of any kind, including its correctness, usefulness, or safety.
// 
// This is parameterized involute spur (or helical) gear.  It is much simpler and less powerful than
// others on Thingiverse.  But it is public domain.  I implemented it from scratch from the 
// descriptions and equations on Wikipedia and the web, using Mathematica for calculations and testing,
// and I now release it into the public domain.
//
//        http://en.wikipedia.org/wiki/Involute_gear
//        http://en.wikipedia.org/wiki/Gear
//        http://en.wikipedia.org/wiki/List_of_gear_nomenclature
//        http://gtrebaol.free.fr/doc/catia/spur_gear.html
//        http://www.cs.cmu.edu/~rapidproto/mechanisms/chpt7.html
//
// The module gear() gives an involute spur gear, with reasonable defaults for all the parameters.
// Normally, you should just choose the first 4 parameters, and let the rest be default values.
// The module gear() gives a gear in the XY plane, centered on the origin, with one tooth centered on
// the positive Y axis.  The various functions below it take the same parameters, and return various
// measurements for the gear.  The most important is pitch_radius, which tells how far apart to space
// gears that are meshing, and adendum_radius, which gives the size of the region filled by the gear.
// A gear has a "pitch circle", which is an invisible circle that cuts through the middle of each
// tooth (though not the exact center). In order for two gears to mesh, their pitch circles should 
// just touch.  So the distance between their centers should be pitch_radius() for one, plus pitch_radius() 
// for the other, which gives the radii of their pitch circles.
//
// In order for two gears to mesh, they must have the same mm_per_tooth and pressure_angle parameters.  
// mm_per_tooth gives the number of millimeters of arc around the pitch circle covered by one tooth and one
// space between teeth.  The pitch angle controls how flat or bulged the sides of the teeth are.  Common
// values include 14.5 degrees and 20 degrees, and occasionally 25.  Though I've seen 28 recommended for
// plastic gears. Larger numbers bulge out more, giving stronger teeth, so 28 degrees is the default here.
//
// The ratio of number_of_teeth for two meshing gears gives how many times one will make a full 
// revolution when the the other makes one full revolution.  If the two numbers are coprime (i.e. 
// are not both divisible by the same number greater than 1), then every tooth on one gear
// will meet every tooth on the other, for more even wear.  So coprime numbers of teeth are good.
//
//////////////////////////////////////////////////////////////////////////////////////////////
//a rack, which is a straight line with teeth (the same as a segment from a giant gear with a huge number of teeth).
//The "pitch circle" is a line along the X axis.
module gearrack (
    mm_per_tooth    = 3,    //this is the "circular pitch", the circumference of the pitch circle divided by the number of teeth
    number_of_teeth = 11,   //total number of teeth along the rack
    thickness       = 6,    //thickness of rack in mm (affects each tooth)
    height          = 120,   //height of rack in mm, from tooth top to far side of rack.
    pressure_angle  = 28,   //Controls how straight or bulged the tooth sides are. In degrees.
    backlash        = 0.0   //gap between two meshing teeth, in the direction along the circumference of the pitch circle
) {
    pi = 3.1415926;
    a = mm_per_tooth / pi; //addendum
    t = a/(2*cos(pressure_angle));         //tooth side is tilted so top/bottom corners move this amount
        for (i = [0:number_of_teeth-1] )
            translate([i*mm_per_tooth,0,0])
                linear_extrude(height = thickness, center = true, convexity = 10)
                    polygon(
                        points=[
                            [-mm_per_tooth * 3/4,                 a-height],
                            [-mm_per_tooth * 3/4 - backlash,     -a],
                            [-mm_per_tooth * 1/4 + backlash - t, -a],
                            [-mm_per_tooth * 1/4 + backlash + t,  a],
                            [ mm_per_tooth * 1/4 - backlash - t,  a],
                            [ mm_per_tooth * 1/4 - backlash + t, -a],
                            [ mm_per_tooth * 3/4 + backlash,     -a],
                            [ mm_per_tooth * 3/4,                 a-height],
                        ],
                        paths=[[0,1,2,3,4,5,6,7]]
                    );
};    

        """
        
    def evaluate(self):
        mm_per_tooth=self.getinputplugvalue('mm_per_tooth')
        number_of_teeth=self.getinputplugvalue('number_of_teeth')
        thickness=self.getinputplugvalue('thickness')
        height=self.getinputplugvalue('height')
        pressure_angle=self.getinputplugvalue('pressure_angle')
        backlash=self.getinputplugvalue('backlash')
        tx = self.getinputplugvalue('tx')
        ty = self.getinputplugvalue('ty')
        tz = self.getinputplugvalue('tz')

        code='gearrack('
        code=code+'mm_per_tooth='+mm_per_tooth+','
        code=code+'number_of_teeth='+number_of_teeth+','
        code=code+'thickness='+thickness+','
        code=code+'height='+height+','
        code=code+'pressure_angle='+pressure_angle+','
        code=code+'backlash='+backlash+');'

        self.modulebegin(self.name,tx=tx,ty=ty,tz=tz)
        self.moduleaddcode(code)
        self.moduleend()
        self.setoutputplugvalue('object', self.modulename(self.name))
        
        return
