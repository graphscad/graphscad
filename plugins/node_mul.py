# coding: utf8
# from __future__ import unicode_literals

import core as cdc


class Node_mul(cdc.Dagnode):

    def getcomment(self):
        return 'this node is used to multiply 2 values output=A*B'

    def getdisplaytype(self):
        return 'math'

    def getinputplugs(self):
        return [
                {'name': 'a', 'value': '', 'type': 'str'},
                {'name': 'b', 'value': '', 'type': 'str'}
                ]

    def getoutputplugs(self):
        return [{'name': 'a_mul_b','value': '', 'type': 'str'}]

    def evaluate(self):
        a = self.getinputplugvalue('a')
        b = self.getinputplugvalue('b')
        self.setoutputplugvalue('a_mul_b', '('+a+'*'+b+')')
        return
