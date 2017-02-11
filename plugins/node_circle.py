# coding: utf8
# from __future__ import unicode_literals

import core as cdc

class Node_circle(cdc.Dagnode):

    def getcomment(self):
        return '2D circle'

    def getdisplaytype(self):
        return 'object2d'

    def getinputplugs(self):
        return [
                {'name': 'radius', 'value': '1', 'type': 'str','tip':'radius of circle'},
                {'name': 'tx', 'value': '0', 'type': 'str','tip':'x translation of circle'},
                {'name': 'ty', 'value': '0', 'type': 'str','tip':'y translation of circle'},
                {'name': 'tz', 'value': '0', 'type': 'str','tip':'z translation of circle'},
                {'name': '$fn', 'value': '', 'type': 'str'}
                ]

    def getoutputplugs(self):
        return [{'name': 'object2d', 'value': '', 'type': 'object2d','tip':'2D object output'}]

    def evaluate(self):
        radius = self.getinputplugvalue('radius')
        tx = self.getinputplugvalue('tx')
        ty = self.getinputplugvalue('ty')
        tz = self.getinputplugvalue('tz')
        fn = self.getinputplugvalue('$fn')
        if fn=='':
            fn='(16+'+radius+'*3.14116)'

        code=''
        code=code+'circle(r='+radius+',$fn='+fn+');'
        
        self.modulebegin(self.name,tx=tx,ty=ty,tz=tz)
        self.moduleaddcode(code)
        self.moduleend()

        self.setoutputplugvalue('object2d', self.modulename(self.name))
        return
