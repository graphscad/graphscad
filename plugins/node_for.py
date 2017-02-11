# coding: utf8
# from __future__ import unicode_literals

import core as cdc


_DEBUG = True


class Node_for(cdc.Dagnode):

    def getcomment(self):
        return 'this node is used to create a loop statement for 3D object'

    def getdisplaytype(self):
        return 'control statement'



    def getinputplugs(self):
        return [
            {'name': 'object', 'value': '', 'type': 'object','tip':'input object'},
            {'name': 'variablename', 'value': 'i', 'type': 'str', 'combo' : ['i','j','k','l','m','n'],'tip':'name of variable that will change during loop'},
            {'name': 'start', 'value': '0', 'type': 'str','tip':'start value of variable used in loop'},
            {'name': 'end', 'value': '1', 'type': 'str','tip':'target value of variable used in loop'},
            {'name': 'step', 'value': '1', 'type': 'str','tip':'increment of variable for each loop'}
            ]

    def getoutputplugs(self):
        return [
                {'name': 'object', 'value': '', 'type': 'object','tip':'output object'}
                ]

    def evaluate(self):
        obj = self.getinputplugvalue('object')
        vname = self.getinputplugvalue('variablename')
        start = self.getinputplugvalue('start')
        end = self.getinputplugvalue('end')
        step = self.getinputplugvalue('step')

        self.modulebegin(self.name)
        self.moduleaddcode('for('+vname+'=['+start+':'+step+':'+end+']){'+self.modulecall(obj)+'}')
        self.moduleend()

        self.setoutputplugvalue('object', self.modulename(self.name))
#        self.setoutputplugvalue('#object',vname+'=('+start+');\n')
        return
