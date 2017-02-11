# coding: utf8
from __future__ import unicode_literals

import core as cdc


_DEBUG = True

class Node_translate(cdc.Dagnode):

    def getcomment(self):
        return 'This node is used to translate a 3D object'

    def getdisplaytype(self):
        return 'transform'

    def getinputplugs(self):
        return [
            {'name': 'object', 'value': '', 'type': 'object'},
            {'name': 'tx', 'value': '0', 'type': 'str' },
            {'name': 'ty', 'value': '0', 'type': 'str' },
            {'name': 'tz', 'value': '0', 'type': 'str' },
            {'name': 'space', 'value': 'world', 'type': 'str', 'combo' : ['world','object','local']}
            ]

    def getoutputplugs(self):
        return [{'name': 'object', 'value': '', 'type': 'object'}]

    def evaluate(self):
        obj = self.getinputplugvalue('object')
        tx = self.getinputplugvalue('tx')
        ty = self.getinputplugvalue('ty')
        tz = self.getinputplugvalue('tz')
        space = self.getinputplugvalue('space')

        self.modulebegin(self.name,tx=tx,ty=ty,tz=tz,space=space)
        self.moduleaddcode(self.modulecall(obj))
        self.moduleend()

        self.setoutputplugvalue('object', self.modulename(self.name))
        return
