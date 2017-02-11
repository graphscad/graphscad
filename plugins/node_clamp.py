# coding: utf8
# from __future__ import unicode_literals

import core as gc


class Node_clamp(gc.Dagnode):

    def getcomment(self):
        return 'cut an object in a cube'

    def getdisplaytype(self):
        return 'operation'

    def getinputplugs(self):
        return [
                {'name': 'object', 'value': '', 'type': 'object','tip':'input 3D object to clamp'},
                {'name': 'x', 'value': '1', 'type': 'str','tip':'x size of clamping cube'},
                {'name': 'y', 'value': '1', 'type': 'str','tip':'y size of clamping cube'},
                {'name': 'z', 'value': '1', 'type': 'str','tip':'z size of clamping cube'},
                {'name': 'tx', 'value': '0', 'type': 'str','tip':'x translation of output object'},
                {'name': 'ty', 'value': '0', 'type': 'str','tip':'y translation of output object'},
                {'name': 'tz', 'value': '0', 'type': 'str','tip':'z translation of output object'},
                {'name': 'center', 'value': 'false', 'type': 'str','tip':'centering of clamping cube'}
                ]

    def getoutputplugs(self):
        return [{'name': 'object', 'value': '', 'type': 'object'}]

    def evaluate(self):
        
        obj = self.getinputplugvalue('object')
        x = self.getinputplugvalue('x')
        y = self.getinputplugvalue('y')
        z = self.getinputplugvalue('z')
        tx = self.getinputplugvalue('tx')
        ty = self.getinputplugvalue('ty')
        tz = self.getinputplugvalue('tz')
        center = self.getinputplugvalue('center')

        c='intersection(){'
        c=c+'{'
        c=c+self.modulecall(obj)
        c=c+'}'
        c=c+'translate(['+tx+','+ty+','+tz+'])'
        c=c+'cube(['+x+','+y+','+z+'],center='+center+');'
        c=c+'}'

        self.modulebegin(self.name)
        self.moduleaddcode(c)
        self.moduleend()
        
        self.setoutputplugvalue('object', self.modulename(self.name))
        return

