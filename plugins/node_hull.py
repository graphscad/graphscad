# coding: utf8
# from __future__ import unicode_literals

import core as cdc


_DEBUG = True


class Node_hull(cdc.Dagnode):

    def getcomment(self):
        return 'this node create hull with multiple 3D objects'

    def getdisplaytype(self):
        return 'operation'

    def getinputplugs(self):
        return [
            {'name': 'tx', 'value': '0', 'type': 'str','tip':'x translation of output object'},
            {'name': 'ty', 'value': '0', 'type': 'str','tip':'y translation of output object'},
            {'name': 'tz', 'value': '0', 'type': 'str','tip':'z translation of output object'},
            {'name': 'object1', 'value': '', 'type': 'object','tip':'first object used in hull operation'},
            {'name': 'object2', 'value': '', 'type': 'object'},
            {'name': 'object3', 'value': '', 'type': 'object'},
            {'name': 'object4', 'value': '', 'type': 'object'},
            {'name': 'object5', 'value': '', 'type': 'object'},
            {'name': 'object6', 'value': '', 'type': 'object'},
            {'name': 'object7', 'value': '', 'type': 'object'},
            {'name': 'object8', 'value': '', 'type': 'object'},
            {'name': 'object9', 'value': '', 'type': 'object'},
            {'name': 'object10', 'value': '', 'type': 'object'},
            {'name': 'object11', 'value': '', 'type': 'object'},
            {'name': 'object12', 'value': '', 'type': 'object'},
            {'name': 'object13', 'value': '', 'type': 'object'},
            {'name': 'object14', 'value': '', 'type': 'object'},
            {'name': 'object15', 'value': '', 'type': 'object'},
            {'name': 'object16', 'value': '', 'type': 'object'},
            {'name': 'object17', 'value': '', 'type': 'object'},
            {'name': 'object18', 'value': '', 'type': 'object'},
            {'name': 'object19', 'value': '', 'type': 'object'},
            {'name': 'object20', 'value': '', 'type': 'object'}
            ]
    def getoutputplugs(self):
        return [{'name': 'object', 'value': '', 'type': 'object','tip':'output object'}]

    def evaluate(self):
        tx=self.getinputplugvalue('tx')
        ty=self.getinputplugvalue('ty')
        tz=self.getinputplugvalue('tz')
        objs=''
        for i in range(1,20):
            s=self.getinputplugvalue('object'+str(i))
            if len(s)>0:
                objs=objs+self.modulecall(s)
            
        self.modulebegin(self.name,tx=tx,ty=ty,tz=tz)
        self.moduleaddcode('hull(){'+objs+'}')
        self.moduleend()
        self.setoutputplugvalue('object', self.modulename(self.name))
            
        return

