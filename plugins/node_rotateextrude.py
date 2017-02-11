# coding: utf8
# from __future__ import unicode_literals

import core as cdc


_DEBUG = True


class Node_rotateextrude(cdc.Dagnode):

    def getcomment(self):
        return 'Rotate/extrude a 2D object '

    def getdisplaytype(self):
        return 'operation2d'

    def getinputplugs(self):
        return [
            {'name': 'object2d', 'value': '', 'type': 'object2d'},
            {'name': 'angle',  'value': '360', 'type': 'str'},
            {'name': 'convexity',  'value': '3', 'type': 'str'},
            {'name': '$fn',  'value': '16', 'type': 'str'}
            ]
    def getoutputplugs(self):
        return [{'name': 'object', 'value': '', 'type': 'object'}]

    def evaluate(self):
        obj=self.getinputplugvalue('object2d')
        angle=self.getinputplugvalue('angle')
        convexity=self.getinputplugvalue('convexity')
        fn=self.getinputplugvalue('$fn')
        
        self.modulebegin(self.name)
        self.moduleaddcode('rotate_extrude(angle='+angle+',convexity='+convexity+',$fn='+fn+'){'+self.modulecall(obj)+'}')
        self.moduleend()

        self.setoutputplugvalue('object', self.modulename(self.name))
        return
