# coding: utf8
# from __future__ import unicode_literals

import core as gc


class Node_color(gc.Dagnode):

    def getcomment(self):
        return 'change color of an object'

    def getdisplaytype(self):
        return 'operation'

    def getinputplugs(self):
        return [
                {'name': 'object', 'value': '', 'type': 'object','tip':'input 3D object'},
                {'name': 'r', 'value': '1', 'type': 'str','alias':'red'  ,'tip':'red  (expression or string from 0 to 1)'},
                {'name': 'g', 'value': '1', 'type': 'str','alias':'green','tip':'green  (expression or string from 0 to 1)'},
                {'name': 'b', 'value': '0', 'type': 'str','alias':'blue' ,'tip':'blue  (expression or string from 0 to 1)'},
                {'name': 'a', 'value': '1', 'type': 'str','alias':'alpha','tip':'alpha (expression or string from 0 to 1)'}
                ]

    def getoutputplugs(self):
        return [{'name': 'object', 'value': '', 'type': 'object','tip':'output 3D object'}]

    def evaluate(self):
        
        obj = self.getinputplugvalue('object')
        
        r=self.getinputplugvalue('r')
        g=self.getinputplugvalue('g')
        b=self.getinputplugvalue('b')
        a=self.getinputplugvalue('a')
        
        c=''
        c=c+'{'
        c=c+self.modulecall(obj,"color(["+r+","+g+","+b+","+a+"])")
        c=c+'}'

        self.modulebegin(self.name)
        self.moduleaddcode(c)
        self.moduleend()
        
        self.setoutputplugvalue('object', self.modulename(self.name))
        return

