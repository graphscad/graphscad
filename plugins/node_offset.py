# coding: utf8
# from __future__ import unicode_literals

import core as cdc


_DEBUG = True


class Node_offset(cdc.Dagnode):

    def getcomment(self):
        return ''

    def getdisplaytype(self):
        return 'operation2d'

    def getinputplugs(self):
        return [
            {'name': 'object2d', 'value': '', 'type': 'object2d'},
            {'name': 'op', 'value': 'Round', 'type': 'str','combo' : ['Round','Delta']},
            {'name': 'value', 'value': '1', 'type': 'str'},
            {'name': 'chamfer', 'value': 'false', 'type': 'str','combo' : ['true','false']}
            ]

    def getoutputplugs(self):
        return [{'name': 'object2d', 'value': '', 'type': 'object2d'}]

    def evaluate(self):
        obj = self.getinputplugvalue('object2d')
        op = self.getinputplugvalue('op')
        value = self.getinputplugvalue('value')
        chamfer = self.getinputplugvalue('chamfer')
        
        self.modulebegin(self.name)
        if op=='Round':
            self.moduleaddcode('offset(r='+value+'){'+self.modulecall(obj)+'}')
        if op=='Delta':
            self.moduleaddcode('offset(delta='+value+',chamfer='+chamfer+'){'+self.modulecall(obj)+'}')
        self.moduleend()
        self.setoutputplugvalue('object2d', self.modulename(self.name))
        return
