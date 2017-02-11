# coding: utf8
# from __future__ import unicode_literals

import core as gc


class Node_emptycube(gc.Dagnode):

    def getcomment(self):
        return 'this node is used to create an empty cube'

    def getdisplaytype(self):
        return 'object'

    def getinputplugs(self):
        return [
                {'name': 'sizex', 'value': '3', 'type': 'str'},
                {'name': 'sizey', 'value': '3', 'type': 'str'},
                {'name': 'sizez', 'value': '3', 'type': 'str'},
                {'name': 'tx', 'value': '0', 'type': 'str','tip':'x translation'},
                {'name': 'ty', 'value': '0', 'type': 'str','tip':'y translation'},
                {'name': 'tz', 'value': '0', 'type': 'str','tip':'z translation'},
                {'name': 'xtickness', 'value': '1', 'type': 'str','alias':'x thickness','tip':'thickness of walls on x axis'},
                {'name': 'ytickness', 'value': '1', 'type': 'str','alias':'y thickness','tip':'thickness of walls on y axis'},
                {'name': 'ztickness', 'value': '1', 'type': 'str','alias':'z thickness','tip':'thickness of walls on z axis'},
                {'name': 'center', 'value': 'false', 'type': 'str','combo' : ['true','false']}
                ]

    def getoutputplugs(self):
        return [
            {'name': 'object', 'value': '', 'type': 'object','tip':'output empty cube (a cube with a hole inside)'},
            {'name': 'outobject', 'value': '', 'type': 'object','tip':'this is the cube object without hole'},
            {'name': 'inobject', 'value': '', 'type': 'object','tip':'this is the internal cube used to make cube empty'}
                ]

    def evaluate(self):
        x = self.getinputplugvalue('sizex')
        y = self.getinputplugvalue('sizey')
        z = self.getinputplugvalue('sizez')
        tx = self.getinputplugvalue('tx')
        ty = self.getinputplugvalue('ty')
        tz = self.getinputplugvalue('tz')
        xtickness = self.getinputplugvalue('xtickness')
        ytickness = self.getinputplugvalue('ytickness')
        ztickness = self.getinputplugvalue('ztickness')
        center = self.getinputplugvalue('center')

        self.modulebegin(self.name+'_outobject',tx,ty,tz)
        outobject='cube(['+x+','+ y+','+z+'],center='+center+');'
        self.moduleaddcode(outobject)
        self.moduleend()

        self.modulebegin(self.name+'_inobject',tx,ty,tz)
        inobject=''
        if center=='false':
            inobject=inobject+'translate(['+xtickness+','+ytickness+','+ztickness+'])'
        inobject=inobject+'cube(['+x+'-2*('+xtickness+'),'+y+'-2*('+ytickness+'),'+z+'-2*('+ztickness+')],center='+center+');'
        self.moduleaddcode(inobject)
        self.moduleend()
        
        self.modulebegin(self.name,tx=tx,ty=ty,tz=tz)
        self.moduleaddcode('difference(){'+outobject+inobject+'}')
        self.moduleend()

        self.setoutputplugvalue('object', self.modulename(self.name))
        self.setoutputplugvalue('inobject', self.modulename(self.name+'_inobject'))
        self.setoutputplugvalue('outobject', self.modulename(self.name+'_outobject'))
                
        return

