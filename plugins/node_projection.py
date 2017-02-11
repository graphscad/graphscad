# coding: utf8
# from __future__ import unicode_literals

import core as cdc


_DEBUG = True


class Node_projection(cdc.Dagnode):

    def getcomment(self):
        return 'Project a 3D object in 2D object (proection on x,y plane)'

    def getdisplaytype(self):
        return 'operation'

    def getinputplugs(self):
        return [
            {'name': 'object', 'value': '', 'type': 'object'},
            {'name': 'cut',  'value': 'false', 'type': 'str','combo' : ['true','false']}
            ]
    def getoutputplugs(self):
        return [{'name': 'object2d', 'value': '', 'type': 'object2d'}]

    def evaluate(self):
        obj=self.getinputplugvalue('object')
        cut=self.getinputplugvalue('cut')
        
        c=''
        c=c+'{'
        c=c+'projection(cut='+cut+')'
        c=c+'{'
        c=c+self.modulecall(obj)
        c=c+'}'
        c=c+'}'
        
        self.modulebegin(self.name)
        self.moduleaddcode( c)
        self.moduleend()
        
        self.setoutputplugvalue('object2d', self.modulename(self.name))
        return

