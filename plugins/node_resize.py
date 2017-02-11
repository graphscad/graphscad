# coding: utf8
# from __future__ import unicode_literals

import core as cdc


class Node_resize(cdc.Dagnode):

    def getcomment(self):
        return 'this node is used to resize a 3D object'

    def getdisplaytype(self):
        return 'transform'

    def getinputplugs(self):
        return [
                {'name': 'object', 'value': '', 'type': 'object'},
                {'name': 'x', 'value': '1', 'type': 'str'},
                {'name': 'y', 'value': '1', 'type': 'str'},
                {'name': 'z', 'value': '1', 'type': 'str'}
                ]

    def getoutputplugs(self):
        return [{'name': 'object', 'value': '', 'type': 'object'}]

    def evaluate(self):
        obj= self.getinputplugvalue('object')
        x = self.getinputplugvalue('x')
        y = self.getinputplugvalue('y')
        z = self.getinputplugvalue('z')

        self.modulebegin(self.name)
        self.moduleaddcode('resize(['+x+','+y+','+z+']) {'+self.modulecall(obj)+'}')
        self.moduleend()
        
        self.setoutputplugvalue('object', self.modulename(self.name))

        return

