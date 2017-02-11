# coding: utf8
from __future__ import unicode_literals

import core as cdc


class Node_vectorlength(cdc.Dagnode):

    def getcomment(self):
        return 'this node compute length of a vector'

    def getdisplaytype(self):
        return 'math'

    def getinputplugs(self):
        return [
            {'name': 'vector', 'value': '[0,0,0]', 'type': 'vector'},
            ]

    def getoutputplugs(self):
        return [
            {'name': 'length', 'value': '0', 'type': 'str'}
            ]

    def evaluate(self):
        v=self.getinputplugvalue('vector')
        self.setoutputplugvalue('length', 'vectorlength('+v+')')
        return
