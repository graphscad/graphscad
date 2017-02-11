# coding: utf8
# from __future__ import unicode_literals

import core as cdc


class Node_rand(cdc.Dagnode):

    def getcomment(self):
        return 'this node is used to generate random number'

    def getdisplaytype(self):
        return 'math'

    def getinputplugs(self):
        return [
                {'name': 'min', 'value': '0', 'type': 'str'},
                {'name': 'max', 'value': '1', 'type': 'str'},
                {'name': 'seed', 'value': 'O', 'type': 'str'}
                ]

    def getoutputplugs(self):
        return [{'name': 'rand','value': '0', 'type': 'str'}]

    def evaluate(self):
        mmin = self.getinputplugvalue('min')
        mmax = self.getinputplugvalue('max')
        seed = self.getinputplugvalue('seed')
        self.setoutputplugvalue('rand', 'rands('+mmin+','+mmax+',1,'+seed+')[0]')
        return
