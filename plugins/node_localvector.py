# coding: utf8
# from __future__ import unicode_literals

import core as cdc


class Node_localvector(cdc.Dagnode):

    def getcomment(self):
        return 'this node extract current world translation of an object'

    def getdisplaytype(self):
        return 'math'

    def getinputplugs(self):
        return [
            {'name': 'object', 'value': '', 'type': 'object','tip':'input 3D object'},
    ]

    def getoutputplugs(self):
        return [
            {'name': 'vector', 'value': '[0,0,0]', 'type': 'vector','tip':'output a vector with world translation of 3D object'},
            {'name': 'x', 'value': '0', 'type': 'str','tip':'output x world translation of 3D object'},
            {'name': 'y', 'value': '0', 'type': 'str','tip':'output y world translation of 3D object'},
            {'name': 'z', 'value': '0', 'type': 'str','tip':'output z world translation of 3D object'}
            ]

    def evaluate(self):
        obj = self.getinputplugvalue('object')
        x=self.getnodelocalvector(obj,'0','0','0')+'[0]'
        y=self.getnodelocalvector(obj,'0','0','0')+'[1]'
        z=self.getnodelocalvector(obj,'0','0','0')+'[2]'
        self.setoutputplugvalue('vector', '['+x+','+y+','+z+']')
        self.setoutputplugvalue('x', x)
        self.setoutputplugvalue('y', y)
        self.setoutputplugvalue('z', z)
        return
