# coding: utf8
# from __future__ import unicode_literals

import core as cdc


class Node_boolean(cdc.Dagnode):

    def getcomment(self):
        return 'boolean operation on 3D objects'

    def getdisplaytype(self):
        return 'operation'

    def getinputplugs(self):
        return [
            {'name': 'op', 'value': 'difference', 'type': 'str', 'combo' : ['difference','union','intersection']},
            {'name': 'tx', 'value': '0', 'type': 'str','tip':'x translation of output object'},
            {'name': 'ty', 'value': '0', 'type': 'str','tip':'y translation of output object'},
            {'name': 'tz', 'value': '0', 'type': 'str','tip':'z translation of output object'},
            {'name': 'object1', 'value': '', 'type': 'object','tip':'First object in boolean operation'},
            {'name': 'object2', 'value': '', 'type': 'object','tip':'a 3D object'},
            {'name': 'object3', 'value': '', 'type': 'object','tip':'a 3D object'},
            {'name': 'object4', 'value': '', 'type': 'object','tip':'a 3D object'},
            {'name': 'object5', 'value': '', 'type': 'object','tip':'a 3D object'},
            {'name': 'object6', 'value': '', 'type': 'object','tip':'a 3D object'},
            {'name': 'object7', 'value': '', 'type': 'object','tip':'a 3D object'},
            {'name': 'object8', 'value': '', 'type': 'object','tip':'a 3D object'},
            {'name': 'object9', 'value': '', 'type': 'object','tip':'a 3D object'},
            {'name': 'object10', 'value': '', 'type': 'object','tip':'a 3D object'},
            {'name': 'object11', 'value': '', 'type': 'object','tip':'a 3D object'},
            {'name': 'object12', 'value': '', 'type': 'object','tip':'a 3D object'},
            {'name': 'object13', 'value': '', 'type': 'object','tip':'a 3D object'},
            {'name': 'object14', 'value': '', 'type': 'object','tip':'a 3D object'},
            {'name': 'object15', 'value': '', 'type': 'object','tip':'a 3D object'},
            {'name': 'object16', 'value': '', 'type': 'object','tip':'a 3D object'},
            {'name': 'object17', 'value': '', 'type': 'object','tip':'a 3D object'},
            {'name': 'object18', 'value': '', 'type': 'object','tip':'a 3D object'},
            {'name': 'object19', 'value': '', 'type': 'object','tip':'a 3D object'},
            {'name': 'object20', 'value': '', 'type': 'object','tip':'a 3D object'}
            ]
    def getoutputplugs(self):
        return [{'name': 'object', 'value': '', 'type': 'object','tip':'output 3D object from boolean operation'}]

    def evaluate(self):
        op=self.getinputplugvalue('op')
        tx=self.getinputplugvalue('tx')
        ty=self.getinputplugvalue('ty')
        tz=self.getinputplugvalue('tz')
        objs=''
        for i in range(1,20):
            s=self.getinputplugvalue('object'+str(i))
            if len(s)>0:
                objs=objs+self.modulecall(s)
            
        self.modulebegin(self.name,tx=tx,ty=ty,tz=tz)
        self.moduleaddcode(op+'(){'+objs+'}')
        self.moduleend()    

        self.setoutputplugvalue('object',self.modulename(self.name))
        return
