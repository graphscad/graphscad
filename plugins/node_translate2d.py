# coding: utf8
from __future__ import unicode_literals

import core as cdc


_DEBUG = True


class Node_translate2d(cdc.Dagnode):

    def getcomment(self):
        return 'This node is used to translate a 2D object'

    def getdisplaytype(self):
        return 'transform2d'

    def getinputplugs(self):
        return [
            {'name': 'object2d', 'value': '', 'type': 'object2d'},
            {'name': 'tx', 'value': '0', 'type': 'str'},
            {'name': 'ty', 'value': '0', 'type': 'str'},
            {'name': 'tz', 'value': '0', 'type': 'str'}
            ]

    def getoutputplugs(self):
        return [{'name': 'object2d', 'value': '', 'type': 'object2d'}]

    def evaluate(self):
        obj = self.getinputplugvalue('object2d')
        tx = self.getinputplugvalue('tx')
        ty = self.getinputplugvalue('ty')
        tz = self.getinputplugvalue('tz')
        
        self.modulebegin(self.name,tx=tx,ty=ty,tz=tz)
        self.moduleaddcode(self.modulecall(obj))
        self.moduleend()

        self.setoutputplugvalue('object2d', self.modulename(self.name))
        return
