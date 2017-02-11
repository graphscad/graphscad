# coding: utf8
# from __future__ import unicode_literals

import core as cdc


_DEBUG = True


class Node_mirror(cdc.Dagnode):

    def getcomment(self):
        return 'Mirror a 3D object'

    def getdisplaytype(self):
        return 'transform'

    def getinputplugs(self):
        return [
            {'name': 'object', 'value': '', 'type': 'object'},
            {'name': 'mx', 'value': '0', 'type': 'str'},
            {'name': 'my', 'value': '0', 'type': 'str'},
            {'name': 'mz', 'value': '0', 'type': 'str'},
            {'name': 'space', 'value': 'world', 'type': 'str', 'combo' : ['world','local']}
            ]

    def getoutputplugs(self):
        return [{'name': 'object', 'value': '', 'type': 'object'}]

    def evaluate(self):
        obj = self.getinputplugvalue('object')
        mx = self.getinputplugvalue('mx')
        my = self.getinputplugvalue('my')
        mz = self.getinputplugvalue('mz')
        space= self.getinputplugvalue('space')

        self.modulebegin(self.name,mx=mx,my=my,mz=mz,space=space)
        self.moduleaddcode(self.modulecall(obj))
        self.moduleend()
        self.setoutputplugvalue('object', self.modulename(self.name))
        return
