# coding: utf8
# from __future__ import unicode_literals

import core as cdc


_DEBUG = True


class Node_for2d(cdc.Dagnode):

    def getcomment(self):
        return 'this node is used to create a loop statement for 2D object'

    def getdisplaytype(self):
        return 'control statement'

    def getinputplugs(self):
        return [
            {'name': 'object2d', 'value': '', 'type': 'object2d','tip':'input object'},
            {'name': 'variablename', 'value': 'i', 'type': 'str', 'combo' : ['i','j','k','l','m','n'],'tip':'name of variable that will change during loop'},
            {'name': 'start', 'value': '0', 'type': 'str','tip':'start value of variable used in loop'},
            {'name': 'end', 'value': '1', 'type': 'str','tip':'target value of variable used in loop'},
            {'name': 'step', 'value': '1', 'type': 'str','tip':'increment of variable for each loop'}
            ]

    def getoutputplugs(self):
        return [
                {'name': 'object2d', 'value': '', 'type': 'object2d','tip':'output object'}
                ]

    def evaluate(self):
        obj = self.getinputplugvalue('object2d')
        vname = self.getinputplugvalue('variablename')
        start = self.getinputplugvalue('start')
        end = self.getinputplugvalue('end')
        step = self.getinputplugvalue('step')

        self.modulebegin(self.name)
        self.moduleaddcode('for('+vname+'=['+start+':'+step+':'+end+']){'+self.modulecall(obj)+'}')
        self.moduleend()

        self.setoutputplugvalue('object2d', self.modulename(self.name))
        self.setoutputplugvalue('#object', vname+'='+start+';\n')
        return
