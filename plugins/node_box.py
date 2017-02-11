# coding: utf8
# from __future__ import unicode_literals

import core as gc


class Node_box(gc.Dagnode):

    def getcomment(self):
        return 'Create an empty box'

    def getdisplaytype(self):
        return 'object'

    def getinputplugs(self):
        return [
                {'name': 'sizex', 'value': '1', 'type': 'str','tip':'x size of box'},
                {'name': 'sizey', 'value': '1', 'type': 'str','tip':'y size of box'},
                {'name': 'sizez', 'value': '1', 'type': 'str','tip':'z size of box'},
                {'name': 'tx', 'value': '0', 'type': 'str','tip':'x translation of box'},
                {'name': 'ty', 'value': '0', 'type': 'str','tip':'y translation of box'},
                {'name': 'tz', 'value': '0', 'type': 'str','tip':'z translation of box'},
                {'name': 'rounding', 'value': '0.1', 'type': 'str','tip':'radius of corner rounding'},
                {'name': 'tickness', 'value': '0.1', 'type': 'str','alias':'thickness','tip':'thickness of box'},
                {'name': 'interiorheight', 'value': '0.05', 'type': 'str','tip':'the thickness of the bottom of the box'},
                {'name': '$fn', 'value': '16', 'type': 'str'},
                {'name': 'center', 'value': 'false', 'type': 'str','combo' : ['true','false']}
                ]

    def getoutputplugs(self):
        return [{'name': 'object', 'value': '', 'type': 'object','tip':'output 3D object'}]

    def evaluate(self):
        x = self.getinputplugvalue('sizex')
        y = self.getinputplugvalue('sizey')
        z = self.getinputplugvalue('sizez')
        tx = self.getinputplugvalue('tx')
        ty = self.getinputplugvalue('ty')
        tz = self.getinputplugvalue('tz')
        rounding = self.getinputplugvalue('rounding')
        tickness = self.getinputplugvalue('tickness')
        interiorheight = self.getinputplugvalue('interiorheight')
        fn = self.getinputplugvalue('$fn')
        center = self.getinputplugvalue('center')


        xx='(('+x+')/2)' 
        yy='(('+y+')/2)' 
        zz='('+z+')' 
   
        xo='(('+xx+')-(max('+rounding+',0.00001)))'
        yo='(('+yy+')-(max('+rounding+',0.00001)))'
        zo=zz;
        

        xi='(('+xx+')-((max('+rounding+',0.00001))+('+tickness+')))'
        yi='(('+yy+')-((max('+rounding+',0.00001))+('+tickness+')))'
        zi='(('+zz+')-('+interiorheight+')+0.01)'

        c=''
        if center=='false':
            c=c+'translate([ '+xx+', '+yy+',0])'
        c=c+'difference(){'
        c=c+'hull()'
        c=c+'{'        
        c=c+'translate([-'+xo+',-'+yo+',0]) cylinder(r=max('+rounding+',0.00001),h='+zo+',$fn='+fn+');'
        c=c+'translate([-'+xo+', '+yo+',0]) cylinder(r=max('+rounding+',0.00001),h='+zo+',$fn='+fn+');'
        c=c+'translate([ '+xo+',-'+yo+',0]) cylinder(r=max('+rounding+',0.00001),h='+zo+',$fn='+fn+');'
        c=c+'translate([ '+xo+', '+yo+',0]) cylinder(r=max('+rounding+',0.00001),h='+zo+',$fn='+fn+');'
        c=c+'}'        
        c=c+'translate([ 0,0,'+interiorheight+'])'
        c=c+'hull()'
        c=c+'{'        
        c=c+'translate([-'+xi+',-'+yi+',0]) cylinder(r=max('+rounding+',0.00001),h='+zi+',$fn='+fn+');'
        c=c+'translate([-'+xi+', '+yi+',0]) cylinder(r=max('+rounding+',0.00001),h='+zi+',$fn='+fn+');'
        c=c+'translate([ '+xi+',-'+yi+',0]) cylinder(r=max('+rounding+',0.00001),h='+zi+',$fn='+fn+');'
        c=c+'translate([ '+xi+', '+yi+',0]) cylinder(r=max('+rounding+',0.00001),h='+zi+',$fn='+fn+');'
        c=c+'}'        
        c=c+'}'        

        self.modulebegin(self.name,tx=tx,ty=ty,tz=tz)
        self.moduleaddcode(c)
        self.moduleend()
        
        self.setoutputplugvalue('object', self.modulename(self.name))
        return

