# coding: utf8
from __future__ import unicode_literals

import core as cdc


class Node_string(cdc.Dagnode):

    def getcomment(self):
        return 'this node is used to create a string or expression. Multiline is possible'

    def getdisplaytype(self):
        return 'string'

    def getinputplugs(self):
        return [{'name': 'string', 'value': '1', 'type': 'str', 'multiline' : True}]

    def getoutputplugs(self):
        return [{'name': 'string', 'value': '1', 'type': 'str'}]

    def evaluate(self):
        s=self.getinputplugvalue('string')
        self.setoutputplugvalue('string',s)
        return

