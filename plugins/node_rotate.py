# coding: utf8
# from __future__ import unicode_literals

import core as cdc



class Node_rotate(cdc.Dagnode):

    def getcomment(self):
        return 'this node is used to rotate a 3D object'

    def getdisplaytype(self):
        return 'transform'

    def getinputplugs(self):
        return [
            {'name': 'object', 'value': '', 'type': 'object'},
            {'name': 'rx', 'value': '0', 'type': 'str'},
            {'name': 'ry', 'value': '0', 'type': 'str'},
            {'name': 'rz', 'value': '0', 'type': 'str'},
            {'name': 'space', 'value': 'world', 'type': 'str', 'combo' : ['world','object','local']}
    ]

    def getoutputplugs(self):
        return [{'name': 'object', 'value': '', 'type': 'object'}]

    def evaluate(self):
        obj = self.getinputplugvalue('object')
        rx = self.getinputplugvalue('rx')
        ry = self.getinputplugvalue('ry')
        rz = self.getinputplugvalue('rz')
        space= self.getinputplugvalue('space')
        
        self.modulebegin(self.name,rx=rx,ry=ry,rz=rz,space=space)
        self.moduleaddcode(self.modulecall(obj))
        self.moduleend()
        
        self.setoutputplugvalue('object', self.modulename(self.name))
        return
