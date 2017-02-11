# coding: utf8
# from __future__ import unicode_literals

import core as cdc


_DEBUG = True


class Node_mirror2d(cdc.Dagnode):

    def getcomment(self):
        return 'Mirror a 2D object'

    def getdisplaytype(self):
        return 'transform2d'

    def getinputplugs(self):
        return [
            {'name': 'object2d', 'value': '', 'type': 'object2d'},
            {'name': 'x', 'value': '0', 'type': 'str'},
            {'name': 'y', 'value': '0', 'type': 'str'}
            ]

    def getoutputplugs(self):
        return [{'name': 'object2d', 'value': '', 'type': 'object2d'}]

    def evaluate(self):
        obj = self.getinputplugvalue('object2d')
        x = self.getinputplugvalue('x')
        y = self.getinputplugvalue('y')
        
        self.modulebegin(self.name,mx=x,my=y)
        self.moduleaddcode( 'mirror(['+x+','+y+',0]) {'+self.modulecall(obj)+'}')
        self.moduleend()
        self.setoutputplugvalue('object2d', self.modulename(self.name))
        return
