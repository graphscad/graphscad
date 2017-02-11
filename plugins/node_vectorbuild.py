# coding: utf8
from __future__ import unicode_literals

import core as cdc


class Node_vectorbuild(cdc.Dagnode):

    def getcomment(self):
        return 'this node build a vector from 3 components'

    def getdisplaytype(self):
        return 'math'

    def getinputplugs(self):
        return [
            {'name': 'x', 'value': '0', 'type': 'str'},
            {'name': 'y', 'value': '0', 'type': 'str'},
            {'name': 'z', 'value': '0', 'type': 'str'}
            ]

    def getoutputplugs(self):
        return [
            {'name': 'vector', 'value': '[0,0,0]', 'type': 'vector'}
            ]

    def evaluate(self):
        x=self.getinputplugvalue('x')
        y=self.getinputplugvalue('y')
        z=self.getinputplugvalue('z')
        self.setoutputplugvalue('vector', '['+x+','+y+','+z+']')
        return
