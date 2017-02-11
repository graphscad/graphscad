# coding: utf8
from __future__ import unicode_literals

import core as cdc


class Node_vectoradd(cdc.Dagnode):

    def getcomment(self):
        return 'this node add 2 vector. output is vector a+b'

    def getdisplaytype(self):
        return 'math'

    def getinputplugs(self):
        return [
            {'name': 'a', 'value': '[0,0,0]', 'type': 'vector'},
            {'name': 'b', 'value': '[0,0,0]', 'type': 'vector'}
            ]

    def getoutputplugs(self):
        return [
            {'name': 'vector', 'value': '[0,0,0]', 'type': 'vector'}
            ]

    def evaluate(self):
        a=self.getinputplugvalue('a')
        b=self.getinputplugvalue('b')
        self.setoutputplugvalue('vector','vectoradd('+a+','+b+')')
        return
