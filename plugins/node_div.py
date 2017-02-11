# coding: utf8
# from __future__ import unicode_literals

import core as cdc


class Node_div(cdc.Dagnode):

    def getcomment(self):
        return 'this node is used to divide 2 values output=(A/B)'

    def getdisplaytype(self):
        return 'math'

    def getinputplugs(self):
        return [
                {'name': 'a', 'value': '0', 'type': 'str','tip':'input expression or value A'},
                {'name': 'b', 'value': '1', 'type': 'str','tip':'input expression or value B'}
                ]

    def getoutputplugs(self):
        return [{'name': 'a_div_b','value': '', 'type': 'str','tip':'output expression (A/B)'}]

    def evaluate(self):
        a = self.getinputplugvalue('a')
        b = self.getinputplugvalue('b')
        self.setoutputplugvalue('a_div_b', '('+a+'/'+b+')')
        return
