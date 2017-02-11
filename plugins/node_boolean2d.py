# coding: utf8
# from __future__ import unicode_literals

import core as cdc


class Node_boolean2d(cdc.Dagnode):

    def getcomment(self):
        return 'Boolean operation on multiple 2D objects'

    def getdisplaytype(self):
        return 'operation2d'

    def getinputplugs(self):
        return [
            {'name': 'op', 'value': 'difference', 'type': 'str', 'combo' : ['difference','union','intersection']},
            {'name': 'tx', 'value': '0', 'type': 'str','tip':'x translation of output object'},
            {'name': 'ty', 'value': '0', 'type': 'str','tip':'y translation of output object'},
            {'name': 'tz', 'value': '0', 'type': 'str','tip':'z translation of output object'},
            {'name': 'object2d1', 'value': '', 'type': 'object2d','tip':'First object of boolean operation'},
            {'name': 'object2d2', 'value': '', 'type': 'object2d','tip':'a 2D object'},
            {'name': 'object2d3', 'value': '', 'type': 'object2d','tip':'a 2D object'},
            {'name': 'object2d4', 'value': '', 'type': 'object2d','tip':'a 2D object'},
            {'name': 'object2d5', 'value': '', 'type': 'object2d','tip':'a 2D object'},
            {'name': 'object2d6', 'value': '', 'type': 'object2d','tip':'a 2D object'},
            {'name': 'object2d7', 'value': '', 'type': 'object2d','tip':'a 2D object'},
            {'name': 'object2d8', 'value': '', 'type': 'object2d','tip':'a 2D object'},
            {'name': 'object2d9', 'value': '', 'type': 'object2d','tip':'a 2D object'},
            {'name': 'object2d10', 'value': '', 'type': 'object2d','tip':'a 2D object'},
            {'name': 'object2d11', 'value': '', 'type': 'object2d','tip':'a 2D object'},
            {'name': 'object2d12', 'value': '', 'type': 'object2d','tip':'a 2D object'},
            {'name': 'object2d13', 'value': '', 'type': 'object2d','tip':'a 2D object'},
            {'name': 'object2d14', 'value': '', 'type': 'object2d','tip':'a 2D object'},
            {'name': 'object2d15', 'value': '', 'type': 'object2d','tip':'a 2D object'},
            {'name': 'object2d16', 'value': '', 'type': 'object2d','tip':'a 2D object'},
            {'name': 'object2d17', 'value': '', 'type': 'object2d','tip':'a 2D object'},
            {'name': 'object2d18', 'value': '', 'type': 'object2d','tip':'a 2D object'},
            {'name': 'object2d19', 'value': '', 'type': 'object2d','tip':'a 2D object'},
            {'name': 'object2d20', 'value': '', 'type': 'object2d','tip':'a 2D object'}
            ]
    def getoutputplugs(self):
        return [{'name': 'object2d', 'value': '', 'type': 'object2d','tip':'output 2D object, result of boolean operation'}]

    def evaluate(self):
        op=self.getinputplugvalue('op')
        tx=self.getinputplugvalue('tx')
        ty=self.getinputplugvalue('ty')
        tz=self.getinputplugvalue('tz')
        objs=''
        for i in range(1,8):
            s=self.getinputplugvalue('object2d'+str(i))
            if len(s)>0:
                objs=objs+self.modulecall(s)

        self.modulebegin(self.name,tx=tx,ty=ty,tz=tz)
        self.moduleaddcode(op+'(){'+objs+'}')
        self.moduleend()
        self.setoutputplugvalue('object2d',self.modulename(self.name))
        return
