# coding: utf8
# from __future__ import unicode_literals

import core as cdc


class Node_scale(cdc.Dagnode):

    def getcomment(self):
        return 'this node is used to scale a 3D object'

    def getdisplaytype(self):
        return 'transform'

    def getinputplugs(self):
        return [
                {'name': 'object', 'value': '', 'type': 'object'},
                {'name': 'sx', 'value': '1', 'type': 'str'},
                {'name': 'sy', 'value': '1', 'type': 'str'},
                {'name': 'sz', 'value': '1', 'type': 'str'},
                {'name': 'space', 'value': 'world', 'type': 'str', 'combo' : ['world','object','local']}
                ]

    def getoutputplugs(self):
        return [{'name': 'object', 'value': '', 'type': 'object'}]

    def evaluate(self):
        obj= self.getinputplugvalue('object')
        sx = self.getinputplugvalue('sx')
        sy = self.getinputplugvalue('sy')
        sz = self.getinputplugvalue('sz')
        space=self.getinputplugvalue('space')

        self.modulebegin(self.name,sx=sx,sy=sy,sz=sz,space=space)
        self.moduleaddcode(self.modulecall(obj))
        self.moduleend()

        self.setoutputplugvalue('object', self.modulename(self.name))
        return

