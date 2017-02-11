# coding: utf8
# from __future__ import unicode_literals

import core as cdc


class Node_scale2d(cdc.Dagnode):

    def getcomment(self):
        return 'this node is used to scale a 2D object'

    def getdisplaytype(self):
        return 'transform2d'

    def getinputplugs(self):
        return [
                {'name': 'object2d', 'value': '', 'type': 'object2d','tip':'input 2D object to scale'},
                {'name': 'sx', 'value': '1', 'type': 'str','tip':'x scale factor'},
                {'name': 'sy', 'value': '1', 'type': 'str','tip':'y scale factor'},
                {'name': 'sz', 'value': '1', 'type': 'str','tip':'z scale factor'}
                ]

    def getoutputplugs(self):
        return [{'name': 'object2d', 'value': '', 'type': 'object2d','tip':'output scaled 2D object'}]

    def evaluate(self):
        obj= self.getinputplugvalue('object2d')
        sx = self.getinputplugvalue('sx')
        sy = self.getinputplugvalue('sy')
        sz = self.getinputplugvalue('sz')

        self.modulebegin(self.name,sx=sx,sy=sy,sz=sz)
        self.moduleaddcode(self.modulecall(obj))
        self.moduleend()

        self.setoutputplugvalue('object2d', self.modulename(self.name))
        return
