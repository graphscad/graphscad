# coding: utf8
# from __future__ import unicode_literals

import core as gc


class Node_cube(gc.Dagnode):

    def getcomment(self):
        return 'this node is used to create a cube'

    def getdisplaytype(self):
        return 'object'

    def getinputplugs(self):
        return [
                {'name': 'sizex', 'value': '1', 'type': 'str','tip':'x size of cube'},
                {'name': 'sizey', 'value': '1', 'type': 'str','tip':'y size of cube'},
                {'name': 'sizez', 'value': '1', 'type': 'str','tip':'z size of cube'},
                {'name': 'tx', 'value': '0', 'type': 'str','tip':'x translation of output object'},
                {'name': 'ty', 'value': '0', 'type': 'str','tip':'y translation of output object'},
                {'name': 'tz', 'value': '0', 'type': 'str','tip':'z translation of output object'},
                {'name': 'center', 'value': 'false', 'type': 'str', 'combo' : ['true','false'],'tip':'centering of cube'}
                ]

    def getoutputplugs(self):
        return [{'name': 'object', 'value': '', 'type': 'object','tip':'output of 3D object'}]


    def evaluate(self):
        x = self.getinputplugvalue('sizex')
        y = self.getinputplugvalue('sizey')
        z = self.getinputplugvalue('sizez')
        tx = self.getinputplugvalue('tx')
        ty = self.getinputplugvalue('ty')
        tz = self.getinputplugvalue('tz')
        center = self.getinputplugvalue('center')
        
        self.modulebegin(self.name,tx=tx,ty=ty,tz=tz)
        self.moduleaddcode('cube(['+x+','+y+','+z+'],center='+center+');')
        self.moduleend()
        
        self.setoutputplugvalue('object', self.modulename(self.name))
        return

