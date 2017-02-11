# coding: utf8
# from __future__ import unicode_literals

import core as cdc


_DEBUG = True


class Node_intersectionfor(cdc.Dagnode):

    def getcomment(self):
        return 'this node is used to create a loop statement for 3D object'

    def getdisplaytype(self):
        return 'operation'



    def getinputplugs(self):
        return [
            {'name': 'object', 'value': '', 'type': 'object'},
            {'name': 'variablename', 'value': 'i', 'type': 'str', 'combo' : ['i','j','k','l','m','n']},
            {'name': 'start', 'value': '0', 'type': 'str'},
            {'name': 'end', 'value': '1', 'type': 'str'},
            {'name': 'step', 'value': '1', 'type': 'str'}
            ]

    def getoutputplugs(self):
        return [
                {'name': 'object', 'value': '', 'type': 'object'}
#                {'name': '#object', 'value': '', 'type': 'object'}
                ]

    def evaluate(self):
        obj = self.getinputplugvalue('object')
        vname = self.getinputplugvalue('variablename')
        start = self.getinputplugvalue('start')
        end = self.getinputplugvalue('end')
        step = self.getinputplugvalue('step')

        self.modulebegin(self.name)
        self.moduleaddcode('intersection_for('+vname+'=['+start+':'+step+':'+end+']){'+self.modulecall(obj)+'}')
        self.moduleend()

        self.setoutputplugvalue('object', self.modulename(self.name))
        return
