# coding: utf8
# from __future__ import unicode_literals

import core as cdc


class Node_resize2d(cdc.Dagnode):

    def getcomment(self):
        return 'this node is used to resize a 2D object'

    def getdisplaytype(self):
        return 'transform2d'

    def getinputplugs(self):
        return [
                {'name': 'object2d', 'value': '', 'type': 'object2d'},
                {'name': 'x', 'value': '1', 'type': 'str'},
                {'name': 'y', 'value': '1', 'type': 'str'}
               
                ]

    def getoutputplugs(self):
        return [{'name': 'object2d', 'value': '', 'type': 'object2d'}]

    def evaluate(self):
        obj= self.getinputplugvalue('object2d')
        x = self.getinputplugvalue('x')
        y = self.getinputplugvalue('y')

        self.modulebegin(self.name)
        self.moduleaddcode( 'resize(['+x+','+y+']) {'+self.modulecall(obj)+'}')
        self.moduleend()
        
        self.setoutputplugvalue('object2d', self.modulename(self.name))

        return

