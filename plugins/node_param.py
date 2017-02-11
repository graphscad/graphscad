# coding: utf8
# from __future__ import unicode_literals

import core as cdc


class Node_param(cdc.Dagnode):

    def getcomment(self):
        return 'this node is used to create global variable as parameter (will be used as module param)'

    def getdisplaytype(self):
        return 'declaration'

    def getinputplugs(self):
        return [
            {'name': 'previousparam', 'value': '', 'type': 'param'},
            {'name': 'name', 'value': 'paramname', 'type': 'str'},
            {'name': 'string', 'value': '0', 'type': 'str'}
            ]

    def getoutputplugs(self):
        return [
            {'name': 'nextparam', 'value': '', 'type': 'param'},
            ]


    def evaluate(self):
        p=self.getinputplugvalue('previousparam')
        n=self.getinputplugvalue('name')
        s=self.getinputplugvalue('string')
        c=n+'='+s
        if p!='':
            c=','+c
        self.setoutputplugvalue('nextparam',p+c)
        return

