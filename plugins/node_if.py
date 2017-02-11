# coding: utf8
# from __future__ import unicode_literals

import core as cdc


_DEBUG = True


class Node_if(cdc.Dagnode):

    def getcomment(self):
        return 'this node is used to create a if statement for 3D object'

    def getdisplaytype(self):
        return 'control statement'

    def getinputplugs(self):
        return [
            {'name': 'expression', 'value': '1==1', 'type': 'str','tip':'boolean expression to evaluate'},
            {'name': 'true', 'value': '', 'type': 'object','alias':'object if True','tip':'object to output if exression is true'},
            {'name': 'false', 'value': '', 'type': 'object','alias':'object if False','tip':'object to output if expression is false'}
            ]

    def getoutputplugs(self):
        return [
                {'name': 'object', 'value': '', 'type': 'object','tip':'output selected object from condition'}
                ]

    def evaluate(self):
        expression = self.getinputplugvalue('expression')
        itrue = self.getinputplugvalue('true')
        ifalse = self.getinputplugvalue('false')

        self.modulebegin(self.name)
        self.moduleaddcode('if('+expression+'){'+self.modulecall(itrue)+'} else {'+self.modulecall(ifalse)+'}')
        self.moduleend()

        self.setoutputplugvalue('object', self.modulename(self.name))
        return
