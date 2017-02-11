# coding: utf8
# from __future__ import unicode_literals

import core as cdc


_DEBUG = True


class Node_rotate2d(cdc.Dagnode):

    def getcomment(self):
        return 'This node is used to rotate a 2D object'

    def getdisplaytype(self):
        return 'transform2d'

    def getinputplugs(self):
        return [
            {'name': 'object2d', 'value': '', 'type': 'object2d'},
            {'name': 'rx', 'value': '0', 'type': 'str'},
            {'name': 'ry', 'value': '0', 'type': 'str'},
            {'name': 'rz', 'value': '0', 'type': 'str'}
            ]

    def getoutputplugs(self):
        return [{'name': 'object2d', 'value': '', 'type': 'object2d'}]

    def evaluate(self):
        obj = self.getinputplugvalue('object2d')
        rx = self.getinputplugvalue('rx')
        ry = self.getinputplugvalue('ry')
        rz = self.getinputplugvalue('rz')
        
        self.modulebegin(self.name,rx=rx,ry=ry,rz=rz)
        self.moduleaddcode(self.modulecall(obj))
        self.moduleend()
        
        self.setoutputplugvalue('object2d', self.modulename(self.name))
        return
