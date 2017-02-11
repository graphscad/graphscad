# coding: utf8
# from __future__ import unicode_literals

import core as cdc



class Node_hexgrid(cdc.Dagnode):

    def getcomment(self):
        return 'this node is used to create an hex grid'

    def getdisplaytype(self):
        return 'object'

    def getinputplugs(self):
        return [
                {'name': 'grid_width', 'value': '50', 'type': 'str','tip':'x size of grid'},
                {'name': 'grid_lenght', 'value': '60', 'type': 'str','tip':'y size of grid'},
                {'name': 'grid_height', 'value': '1', 'type': 'str','tip':'height of hexagons'},
                {'name': 'hex_radius', 'value': '5', 'type': 'str','tip':'radius of hexagons'},
                {'name': 'hex_border_width', 'value': '1', 'type': 'str','tip':'space between hexagons'},
                {'name': 'center', 'value': 'false', 'type': 'str', 'combo' : ['true','false'],'tip':'centering of grid'},
                {'name': 'tx', 'value': '0', 'type': 'str','tip':'x translation of output object'},
                {'name': 'ty', 'value': '0', 'type': 'str','tip':'y translation of output object'},
                {'name': 'tz', 'value': '0', 'type': 'str','tip':'z translation of output object'}
                ]

    def getoutputplugs(self):
        return [{'name': 'object', 'value': '', 'type': 'object','tip':'output object'}]

    def getheader(self):
        return """

module hexgrid(
    grid_width=50,
    grid_lenght=60,
    grid_height=5,
    hex_radius=5,
    hex_border_width=1,
    center=true)
{
    ystep=2*sqrt(3/4*hex_radius*hex_radius);
    xstep=3*hex_radius/2;
    grid_width=round(grid_width/(xstep*2))*(2*xstep);
    grid_lenght=round(grid_lenght/(ystep*2))*(2*ystep);
    ox = center ? -grid_width/2  : 0;
    oy = center ? -grid_lenght/2 : 0;
   
    
    for (xi=[0:xstep:grid_width])
        for(yi=[0:ystep:grid_lenght])
        {
            x=xi+ox;
            y=((((xi/xstep)%2)==0)?0:ystep/2)+yi+oy;
            translate([x,y,0]) cylinder(r=(hex_radius-hex_border_width/2), h=grid_height, $fn=6);
        }
};

    

        """
        
        
        
    def evaluate(self):
        grid_width=self.getinputplugvalue('grid_width')
        grid_lenght=self.getinputplugvalue('grid_lenght')
        grid_height=self.getinputplugvalue('grid_height')
        hex_radius=self.getinputplugvalue('hex_radius')
        hex_border_width=self.getinputplugvalue('hex_border_width')
        tx = self.getinputplugvalue('tx')
        ty = self.getinputplugvalue('ty')
        tz = self.getinputplugvalue('tz')
        center=self.getinputplugvalue('center')

        c=''
        c=c+'hexgrid('
        c=c+'grid_width='+grid_width+','
        c=c+'grid_lenght='+grid_lenght+','
        c=c+'grid_height='+grid_height+','
        c=c+'hex_radius='+hex_radius+','
        c=c+'hex_border_width='+hex_border_width+','
        c=c+'center='+center
        c=c+');'

        self.modulebegin(self.name,tx=tx,ty=ty,tz=tz)
        self.moduleaddcode(c)
        self.moduleend()
        self.setoutputplugvalue('object', self.modulename(self.name))

        return

