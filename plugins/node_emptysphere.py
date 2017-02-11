# coding: utf8
# from __future__ import unicode_literals

import core as cdc


class Node_emptysphere(cdc.Dagnode):

    def getcomment(self):
        return 'this node is used to create an empty sphere'

    def getdisplaytype(self):
        return 'object'

    def getinputplugs(self):
        return [
                {'name': 'radius', 'value': '1', 'type': 'str','tip':'radius of sphere'},
                {'name': 'tx', 'value': '0', 'type': 'str','tip':'x translation of output object'},
                {'name': 'ty', 'value': '0', 'type': 'str','tip':'y translation of output object'},
                {'name': 'tz', 'value': '0', 'type': 'str','tip':'z translation of output object'},
                {'name': 'tickness', 'value': '0.1', 'type': 'str','tip':'thickness of empty sphere'},
                {'name': '$fn', 'value': '', 'type': 'str','tip':''}
                ]

    def getoutputplugs(self):
        return [
                {'name': 'object', 'value': '', 'type': 'object','tip':'output empty sphere'},
                {'name': 'outobject', 'value': '', 'type': 'object','tip':'sphere object without hole inside'},
                {'name': 'inobject', 'value': '', 'type': 'object','tip':'internal sphere object to make inside hole'}
                ]

    def evaluate(self):
        radius = self.getinputplugvalue('radius')
        fn = self.getinputplugvalue('$fn')
        if fn=='':
            fn='(16+'+radius+'*3.14116)'
        tx = self.getinputplugvalue('tx')
        ty = self.getinputplugvalue('ty')
        tz = self.getinputplugvalue('tz')
        tickness = self.getinputplugvalue('tickness')
        
        inobject='sphere(r='+radius+'-'+tickness+',$fn='+fn+');'
        outobject='sphere(r='+radius+',$fn='+fn+');'
           
        self.modulebegin(self.name+'_inobject',tx,ty,tz)
        self.moduleaddcode(inobject)
        self.moduleend()

        self.modulebegin(self.name+'_outobject',tx,ty,tz)
        self.moduleaddcode(outobject)
        self.moduleend()

        self.modulebegin(self.name,tx=tx,ty=ty,tz=tz)
        self.moduleaddcode('difference(){'+outobject+inobject+'}')
        self.moduleend()
    
        self.setoutputplugvalue('object', self.modulename(self.name))
        self.setoutputplugvalue('outobject', self.modulename(self.name+'_outobject'))
        self.setoutputplugvalue('inobject', self.modulename(self.name+'_inobject'))

        return
