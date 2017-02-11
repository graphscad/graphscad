# coding: utf8
# from __future__ import unicode_literals

import core as cdc

class Node_cylinder(cdc.Dagnode):

    def getcomment(self):
        return 'this node is used to create a cylinder'

    def getdisplaytype(self):
        return 'object'

    def getinputplugs(self):
        return [
                {'name': 'radius', 'value': '1', 'type': 'str','alias':'top radius','tip':'top radius of cynlinder'},
                {'name': 'radius2', 'value': '', 'type': 'str','alias':'bottom radius','tip':'bottom radius of cynlinder'},
                {'name': 'height', 'value': '1', 'type': 'str','tip':'height of cylinder'},
                {'name': 'center', 'value': 'false', 'type': 'str','combo' : ['true','false'],'tip':'centering of cylinder (on Z axis)'},
                {'name': 'tx', 'value': '0', 'type': 'str','tip':'x translation of output object'},
                {'name': 'ty', 'value': '0', 'type': 'str','tip':'y translation of output object'},
                {'name': 'tz', 'value': '0', 'type': 'str','tip':'z translation of output object'},
                {'name': '$fn', 'value': '', 'type': 'str','tip':''}
                ]

    def getoutputplugs(self):
        return [{'name': 'object', 'value': '', 'type': 'object','tip':'output cylinder'}]

    def evaluate(self):
        # here you have to prepare the command the job......
        # convertimage  ./test.%04d.png  out.mov 101 200
        radius = self.getinputplugvalue('radius')
        radius2 = self.getinputplugvalue('radius2')
        if radius2=='':
            radius2=radius
        height = self.getinputplugvalue('height')
        center = self.getinputplugvalue('center')
        tx = self.getinputplugvalue('tx')
        ty = self.getinputplugvalue('ty')
        tz = self.getinputplugvalue('tz')
        fn = self.getinputplugvalue('$fn')
        if fn=='':
            fn='(16+'+radius+'*3.14116)'
        self.modulebegin(self.name,tx=tx,ty=ty,tz=tz)
        self.moduleaddcode('cylinder(r='+radius+',r1='+radius2+',h='+height+',center='+center+',$fn='+fn+');')
        self.moduleend()
        self.setoutputplugvalue('object', self.modulename(self.name))

        return
