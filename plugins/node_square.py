# coding: utf8
# from __future__ import unicode_literals

import core as cdc

class Node_square(cdc.Dagnode):

    def getcomment(self):
        return 'This node is used to create a 2D square'

    def getdisplaytype(self):
        return 'object2d'

    def getinputplugs(self):
        return [
                {'name': 'x', 'value': '1', 'type': 'str'},
                {'name': 'y', 'value': '1', 'type': 'str'},
                {'name': 'tx', 'value': '0', 'type': 'str'},
                {'name': 'ty', 'value': '0', 'type': 'str'},
                {'name': 'tz', 'value': '0', 'type': 'str'},
                {'name': 'center', 'value': 'false', 'type': 'str','combo' : ['true','false']}
                ]

    def getoutputplugs(self):
        return [{'name': 'object2d', 'value': '', 'type': 'object2d'}]

    def evaluate(self):
        x = self.getinputplugvalue('x')
        y = self.getinputplugvalue('y')
        center = self.getinputplugvalue('center')

        tx = self.getinputplugvalue('tx')
        ty = self.getinputplugvalue('ty')
        tz = self.getinputplugvalue('tz')
           

        self.modulebegin(self.name,tx=tx,ty=ty,tz=tz)
        self.moduleaddcode('square(size=['+x+','+y+'],center='+center+');')
        self.moduleend()

        self.setoutputplugvalue('object2d', self.modulename(self.name))
        return
