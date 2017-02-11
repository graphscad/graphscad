# coding: utf8
from __future__ import unicode_literals

import core as cdc


class Node_vectorsplit(cdc.Dagnode):

    def getcomment(self):
        return 'this node output each component of a vector'

    def getdisplaytype(self):
        return 'math'

    def getinputplugs(self):
        return [
            {'name': 'vector', 'value': '[0,0,0]', 'type': 'vector'},
            ]

    def getoutputplugs(self):
        return [
            {'name': 'x', 'value': '0', 'type': 'str'},
            {'name': 'y', 'value': '0', 'type': 'str'},
            {'name': 'z', 'value': '0', 'type': 'str'}
            ]

    def evaluate(self):
        v=self.getinputplugvalue('vector')
        self.setoutputplugvalue('x', 'vectorx('+v+')')
        self.setoutputplugvalue('y', 'vectory('+v+')')
        self.setoutputplugvalue('z', 'vectorz('+v+')')
        return
