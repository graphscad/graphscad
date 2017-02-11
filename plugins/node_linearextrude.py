# coding: utf8
# from __future__ import unicode_literals

import core as cdc


_DEBUG = True


class Node_linearextrude(cdc.Dagnode):

    def getcomment(self):
        return 'this node is used to extrude a 2D object'

    def getdisplaytype(self):
        return 'operation2d'

    def getinputplugs(self):
        return [
            {'name': 'object2d', 'value': '', 'type': 'object2d'},
            {'name': 'height',  'value': '1', 'type': 'str'},
            {'name': 'center',  'value': 'true', 'type': 'str','combo' : ['true','false']},
            {'name': 'convexity',  'value': '1', 'type': 'str'},
            {'name': 'twist',  'value': '0', 'type': 'str'},
            {'name': 'slices',  'value': '1', 'type': 'str'},
            {'name': 'scale',  'value': '1', 'type': 'str'}
            ]
    def getoutputplugs(self):
        return [{'name': 'object', 'value': '', 'type': 'object'}]

    def evaluate(self):
        obj=self.getinputplugvalue('object2d')
        height=self.getinputplugvalue('height')
        center=self.getinputplugvalue('center')
        convexity=self.getinputplugvalue('convexity')
        twist=self.getinputplugvalue('twist')
        slices=self.getinputplugvalue('slices')
        scale=self.getinputplugvalue('scale')

        self.modulebegin(self.name)
        self.moduleaddcode('linear_extrude(height='+height+',center='+center+',convexity='+convexity+',twist='+twist+',slices='+slices+',scale='+scale+')\n{\n'+self.modulecall(obj)+'}')
        self.moduleend()
        self.setoutputplugvalue('object', self.modulename(self.name))
        return
