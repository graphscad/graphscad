# coding: utf8
# from __future__ import unicode_literals

import core as gc


class Node_import(gc.Dagnode):

    def getcomment(self):
        return 'this node is used to import a file'

    def getdisplaytype(self):
        return 'object'

    def getinputplugs(self):
        return [
                {'name': 'filename', 'value': '', 'type': 'filename'},
                {'name': 'convexity', 'value': '3', 'type': 'str'},
                {'name': 'tx', 'value': '0', 'type': 'str'},
                {'name': 'ty', 'value': '0', 'type': 'str'},
                {'name': 'tz', 'value': '0', 'type': 'str'},
                ]

    def getoutputplugs(self):
        return [{'name': 'object', 'value': '', 'type': 'object'}]

    def evaluate(self):
        fname=self.getinputplugvalue('filename')
        convexity=self.getinputplugvalue('convexity')
        tx = self.getinputplugvalue('tx')
        ty = self.getinputplugvalue('ty')
        tz = self.getinputplugvalue('tz')

        c=''
        c=c+'import("'+fname+'",convexity='+convexity+');'

        self.modulebegin(self.name,tx=tx,ty=ty,tz=tz)
        self.moduleaddcode(c)
        self.moduleend()
        self.setoutputplugvalue('object', self.modulename(self.name))
        return

