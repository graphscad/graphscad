# coding: utf8
from __future__ import unicode_literals

import core as gc


class Node_text(gc.Dagnode):

    def getcomment(self):
        return 'this node is used to create a 2D text'

    def getdisplaytype(self):
        return 'object2d'

    def getinputplugs(self):
        return [
            
                {'name': 'text', 'value': 'TEXT', 'type': 'str'},
                {'name': 'font', 'value': '', 'type': 'str'},
                {'name': 'size', 'value': '10', 'type': 'str'},
                {'name': 'valign', 'value': 'center', 'type': 'str','combo' : ['center','top','bottom']},
                {'name': 'tx', 'value': '0', 'type': 'str'},
                {'name': 'ty', 'value': '0', 'type': 'str'},
                {'name': 'tz', 'value': '0', 'type': 'str'}
                ]

    def getoutputplugs(self):
        return [{'name': 'object2d', 'value': '', 'type': 'object2d'}]

    def evaluate(self):
        text=self.getinputplugvalue('text')
        font=self.getinputplugvalue('font')
        size=self.getinputplugvalue('size')
        valign=self.getinputplugvalue('valign')

        tx = self.getinputplugvalue('tx')
        ty = self.getinputplugvalue('ty')
        tz = self.getinputplugvalue('tz')

        c=''
        c=c+'text('
        c=c+'text="'+text+'",'
        if len(font)>0:
            c=c+',font="'+font+'",'
        c=c+'size='+size+','
        c=c+'valign="'+valign+'");'
        
        self.modulebegin(self.name,tx=tx,ty=ty,tz=tz)
        self.moduleaddcode(c)
        self.moduleend()

        self.setoutputplugvalue('object2d', self.modulename(self.name))
        
        return

