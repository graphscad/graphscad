# coding: utf8
from __future__ import unicode_literals

import core as cdc


_DEBUG = True


class Node_stringformat(cdc.Dagnode):

    def getcomment(self):
        return 'This node is used to format a string (format string can contain $1...$n)'

    def getdisplaytype(self):
        return 'string'

    def getinputplugs(self):
        return [
            {'name': 'format', 'value': '', 'type': 'str'},
            {'name': '$1', 'value': '', 'type': 'str'},
            {'name': '$2', 'value': '', 'type': 'str'},
            {'name': '$3', 'value': '', 'type': 'str'},
            {'name': '$4', 'value': '', 'type': 'str'},
            {'name': '$5', 'value': '', 'type': 'str'},
            {'name': '$6', 'value': '', 'type': 'str'},
            {'name': '$7', 'value': '', 'type': 'str'},
            {'name': '$8', 'value': '', 'type': 'str'},
            {'name': '$9', 'value': '', 'type': 'str'},
            {'name': '$10', 'value': '', 'type': 'str'},
            {'name': '$11', 'value': '', 'type': 'str'},
            {'name': '$12', 'value': '', 'type': 'str'},
            {'name': '$13', 'value': '', 'type': 'str'},
            {'name': '$14', 'value': '', 'type': 'str'},
            {'name': '$15', 'value': '', 'type': 'str'},
            {'name': '$16', 'value': '', 'type': 'str'},
            {'name': '$17', 'value': '', 'type': 'str'},
            {'name': '$18', 'value': '', 'type': 'str'},
            {'name': '$19', 'value': '', 'type': 'str'},
            {'name': '$20', 'value': '', 'type': 'str'}
            ]
    def getoutputplugs(self):
        return [{'name': 'string', 'value': '', 'type': 'str'}]

    def evaluate(self):
        f=self.getinputplugvalue('format')
        for i in range(1,20):
            vs=self.getinputplugvalue('$'+str(i))
            f=f.replace('$'+str(i),vs)
        self.setoutputplugvalue('string',f)
        return
