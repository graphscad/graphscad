# coding: utf8
# from __future__ import unicode_literals

import core as gc


class Node_add(gc.Dagnode):

    def getcomment(self):
        return "this node is used to add 2 expressions output=A+B"

    def getdisplaytype(self):
        return 'math'

    def getinputplugs(self):
        return [
                {'name': 'a', 'value': '0', 'type': 'str','tip':'value or expression'},
                {'name': 'b', 'value': '0', 'type': 'str','tip':'value or expression'}
                ]

    def getoutputplugs(self):
        return [{'name': 'a_add_b','value': '', 'type': 'str','tip':'output=A+B'}]

    def evaluate(self):
        a = self.getinputplugvalue('a')
        b = self.getinputplugvalue('b')
        self.setoutputplugvalue('a_add_b', '('+a+'+'+b+')')
        return
