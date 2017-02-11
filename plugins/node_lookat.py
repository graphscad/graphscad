# coding: utf8
# from __future__ import unicode_literals

import core as cdc



class Node_lookat(cdc.Dagnode):

    def getcomment(self):
        return 'This node is used to orient a 3D object toward a 3D positions'

    def getdisplaytype(self):
        return 'transform'

    def getinputplugs(self):
        return [
            {'name': 'object', 'value': '', 'type': 'object','tip':'3D object to orient'},
            {'name': 'tx', 'value': '0', 'type': 'str','tip':'x translation to look at'},
            {'name': 'ty', 'value': '0', 'type': 'str','tip':'y translation to look at'},
            {'name': 'tz', 'value': '0', 'type': 'str','tip':'z translation to look at'},
    ]

    def getoutputplugs(self):
        return [{'name': 'object', 'value': '', 'type': 'object','tip':'output oriented 3D object'}]

    def evaluate(self):
        obj = self.getinputplugvalue('object')
        tx = self.getinputplugvalue('tx')
        ty = self.getinputplugvalue('ty')
        tz = self.getinputplugvalue('tz')

        self.modulebegin(self.name,tx=tx,ty=ty,tz=tz,space='lookat')
        self.moduleaddcode(self.modulecall(obj))
        self.moduleend()
        self.setoutputplugvalue('object', self.modulename(self.name))
        return
