# coding: utf8
# from __future__ import unicode_literals

import core as cdc


_DEBUG = True


class Node_minkowski(cdc.Dagnode):

    def getcomment(self):
        return 'Minkowski operation (caution.... it s very slow)'

    def getdisplaytype(self):
        return 'operation'

    def getinputplugs(self):
        return [
            {'name': 'tx', 'value': '0', 'type': 'str'},
            {'name': 'ty', 'value': '0', 'type': 'str'},
            {'name': 'tz', 'value': '0', 'type': 'str'},
            {'name': 'object1', 'value': '', 'type': 'object'},
            {'name': 'object2', 'value': '', 'type': 'object'},
            {'name': 'object3', 'value': '', 'type': 'object'},
            {'name': 'object4', 'value': '', 'type': 'object'},
            {'name': 'object5', 'value': '', 'type': 'object'},
            {'name': 'object6', 'value': '', 'type': 'object'},
            {'name': 'object7', 'value': '', 'type': 'object'},
            {'name': 'object8', 'value': '', 'type': 'object'}
            ]
    def getoutputplugs(self):
        return [{'name': 'object', 'value': '', 'type': 'object'}]

    def evaluate(self):
        tx = self.getinputplugvalue('tx')
        ty = self.getinputplugvalue('ty')
        tz = self.getinputplugvalue('tz')
        objs=''
        for i in range(1,8):
            s=self.getinputplugvalue('object'+str(i))
            if len(s)>0:
                objs=objs+self.modulecall(s)
        self.modulebegin(self.name,tx=tx,ty=ty,tz=tz)
        self.moduleaddcode('minkowski(){'+objs+'}')
        self.moduleend()
        self.setoutputplugvalue('object', self.modulename(self.name))
        return
