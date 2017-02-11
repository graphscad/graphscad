# coding: utf8
# from __future__ import unicode_literals

import core as cdc


_DEBUG = True


class Node_minkowski2d(cdc.Dagnode):

    def getcomment(self):
        return 'Minkowski 2d operation (caution.... very slow)'

    def getdisplaytype(self):
        return 'operation2d'

    def getinputplugs(self):
        return [
            {'name': 'tx', 'value': '0', 'type': 'str'},
            {'name': 'ty', 'value': '0', 'type': 'str'},
            {'name': 'object2d1', 'value': '', 'type': 'object2d'},
            {'name': 'object2d2', 'value': '', 'type': 'object2d'},
            {'name': 'object2d3', 'value': '', 'type': 'object2d'},
            {'name': 'object2d4', 'value': '', 'type': 'object2d'},
            {'name': 'object2d5', 'value': '', 'type': 'object2d'},
            {'name': 'object2d6', 'value': '', 'type': 'object2d'},
            {'name': 'object2d7', 'value': '', 'type': 'object2d'},
            {'name': 'object2d8', 'value': '', 'type': 'object2d'}
            ]
    def getoutputplugs(self):
        return [{'name': 'object', 'value': '', 'type': 'object2d'}]

    def evaluate(self):
        tx = self.getinputplugvalue('tx')
        ty = self.getinputplugvalue('ty')
        objs=''
        for i in range(1,8):
            s=self.getinputplugvalue('object2d'+str(i))
            if len(s)>0:
                objs=objs+self.modulecall(s)
        self.modulebegin(self.name,tx=tx,ty=ty)
        self.moduleaddcode('minkowski(){'+objs+'}')
        self.moduleend()
        self.setoutputplugvalue('object2d', self.modulename(self.name))
        return
