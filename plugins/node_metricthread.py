# coding: utf8
# from __future__ import unicode_literals

import core as cdc


class Node_metricthread(cdc.Dagnode):

    def getcomment(self):
        return 'this node is used to create a metric screw'

    def getdisplaytype(self):
        return 'object'

    def getinputplugs(self):
        return [
                {'name': 'pitch', 'value': '1', 'type': 'str','tip':'pitch of thread'},
                {'name': 'majordiameter', 'value': '5', 'type': 'str','tip':'major diameter of thread'},
                {'name': 'anglestep', 'value': '10', 'type': 'str','tip':'angle step of thread'},
                {'name': 'height', 'value': '5', 'type': 'str','tip':'height of thread'},
                {'name': 'tx', 'value': '0', 'type': 'str','tip':'x translation of output object'},
                {'name': 'ty', 'value': '0', 'type': 'str','tip':'y translation of output object'},
                {'name': 'tz', 'value': '0', 'type': 'str','tip':'z translation of output object'}
                ]

    def getoutputplugs(self):
        return [
                {'name': 'object', 'value': '', 'type': 'object','tip':'output thread object'}
                ]

    def getheader(self):
        return """
// Metric Screw Thread Library
// by Maximilian Karl <karlma@in.tum.de> (2014)
// 
//
// only use module thread(P,D,h,step)
// with the parameters:
// P    - screw thread pitch
// D    - screw thread major diameter
// h    - screw thread height
// step - step size in degree
// 

module screwthread_triangle(P) {
    difference() {
        translate([-sqrt(3)/3*P+sqrt(3)/2*P/8,0,0])
        rotate([90,0,0])
        cylinder(r=sqrt(3)/3*P,h=0.00001,$fn=3,center=true);

        translate([0,-P/2,-P/2])
        cube([P,P,P]);
    }
}

module screwthread_onerotation(P,D_maj,step) {
    H = sqrt(3)/2*P;
    D_min = D_maj - 5*sqrt(3)/8*P;
    for(i=[0:step:360-step])
    hull()
        for(j = [0,step])
        rotate([0,0,(i+j)])
        translate([D_maj/2,0,(i+j)/360*P])
        screwthread_triangle(P);
    translate([0,0,P/2])
    cylinder(r=D_min/2,h=2*P,$fn=360/step,center=true);
}

module screwthread(P,D,step,height) {
    /*intersection()
    {
        translate([-(D+1)/2,-(D+1)/2,0]) cube([D+1,D+1,height]);
        union()
        {*/
        for(i=[0:height/P])
            translate([0,0,i*P-P/2])
                screwthread_onerotation(P,D,step);
        /*}
    }*/
}

        """
        
        
        
    def evaluate(self):
        pitch=self.getinputplugvalue('pitch')
        majordiameter=self.getinputplugvalue('majordiameter')
        anglestep=self.getinputplugvalue('anglestep')
        height=self.getinputplugvalue('height')
        tx = self.getinputplugvalue('tx')
        ty = self.getinputplugvalue('ty')
        tz = self.getinputplugvalue('tz')

        code='screwthread('
        code=code+'P='+pitch+','
        code=code+'D='+majordiameter+','
        code=code+'step='+anglestep+','
        code=code+'height='+height+');'

        self.modulebegin(self.name,tx=tx,ty=ty,tz=tz)
        self.moduleaddcode(code)
        self.moduleend()
        self.setoutputplugvalue('object', self.modulename(self.name))
        
        return
