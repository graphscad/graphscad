# coding: utf8
# from __future__ import unicode_literals

import core as cdc


class Node_sphere(cdc.Dagnode):

    def getcomment(self):
        return 'This node is used to create a sphere'

    def getdisplaytype(self):
        return 'object'

    def getinputplugs(self):
        return [
                {'name': 'radius', 'value': '1', 'type': 'str','tip':'radius of sphere'},
                {'name': 'tx', 'value': '0', 'type': 'str','tip':'x translation'},
                {'name': 'ty', 'value': '0', 'type': 'str','tip':'y translation'},
                {'name': 'tz', 'value': '0', 'type': 'str','tip':'z translation'},
                {'name': '$fn', 'value': '', 'type': 'str'}
                ]

    def getoutputplugs(self):
        return [{'name': 'object', 'value': '', 'type': 'object','tip':'output 3D object'}]

    def evaluate(self):
        radius = self.getinputplugvalue('radius')
        fn = self.getinputplugvalue('$fn')
        if fn=='':
            fn='(16+'+radius+'*3.14116)'
        tx = self.getinputplugvalue('tx')
        ty = self.getinputplugvalue('ty')
        tz = self.getinputplugvalue('tz')
           
        self.modulebegin(self.name,tx,ty,tz)
        self.moduleaddcode(' sphere(r='+radius+',$fn='+fn+');')
        self.moduleend()

        self.setoutputplugvalue('object', self.modulename(self.name))
        return
