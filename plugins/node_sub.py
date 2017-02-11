# coding: utf8
from __future__ import unicode_literals

import core as cdc


class Node_sub(cdc.Dagnode):

    def getcomment(self):
        return 'this node is used to substract 2 values. output=A-B'

    def getdisplaytype(self):
        return 'math'

    def getinputplugs(self):
        return [
                {'name': 'a', 'value': '0', 'type': 'str'},
                {'name': 'b', 'value': '0', 'type': 'str'}
                ]

    def getoutputplugs(self):
        return [{'name': 'a_sub_b','value': '', 'type': 'str'}]

    def evaluate(self):
        a = self.getinputplugvalue('a')
        b = self.getinputplugvalue('b')
        self.setoutputplugvalue('a_sub_b', '('+a+'-'+b+')')
        return
