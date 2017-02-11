# coding: utf8
# from __future__ import unicode_literals

import core as gc


class Node_roundcube(gc.Dagnode):

    def getcomment(self):
        return 'this node is used to create a rounded cube'

    def getdisplaytype(self):
        return 'object'

    def getinputplugs(self):
        return [
                {'name': 'sizex', 'value': '1', 'type': 'str'},
                {'name': 'sizey', 'value': '1', 'type': 'str'},
                {'name': 'sizez', 'value': '1', 'type': 'str'},
                {'name': 'tx', 'value': '0', 'type': 'str'},
                {'name': 'ty', 'value': '0', 'type': 'str'},
                {'name': 'tz', 'value': '0', 'type': 'str'},
                {'name': 'rounding', 'value': '0.1', 'type': 'str'},
                {'name': '$fn', 'value': '16', 'type': 'str'},
                {'name': 'center', 'value': 'false', 'type': 'str','combo' : ['true','false']}
                ]

    def getoutputplugs(self):
        return [{'name': 'object', 'value': '', 'type': 'object'}]

    def evaluate(self):
        x = self.getinputplugvalue('sizex')
        y = self.getinputplugvalue('sizey')
        z = self.getinputplugvalue('sizez')
        tx = self.getinputplugvalue('tx')
        ty = self.getinputplugvalue('ty')
        tz = self.getinputplugvalue('tz')
        rounding = self.getinputplugvalue('rounding')
        fn = self.getinputplugvalue('$fn')
        center = self.getinputplugvalue('center')

        xx='((('+x+')/2))' 
        yy='((('+y+')/2))' 
        zz='((('+z+')/2))' 
   
        x='((('+x+')/2)-'+rounding+')'
        y='((('+y+')/2)-'+rounding+')'
        z='((('+z+')/2)-'+rounding+')'

        c=''
        c=c+'if('+rounding+'>0)'
        c=c+'{'
        if center=='false':
            c=c+'translate([ '+xx+', '+yy+', '+zz+'])'
        c=c+'{hull()'
        c=c+'{'        
        c=c+'translate([-'+x+',-'+y+',-'+z+']) sphere(r='+rounding+',$fn='+fn+');'
        c=c+'translate([-'+x+',-'+y+', '+z+']) sphere(r='+rounding+',$fn='+fn+');'
        c=c+'translate([-'+x+', '+y+',-'+z+']) sphere(r='+rounding+',$fn='+fn+');'
        c=c+'translate([-'+x+', '+y+', '+z+']) sphere(r='+rounding+',$fn='+fn+');'
        c=c+'translate([ '+x+',-'+y+',-'+z+']) sphere(r='+rounding+',$fn='+fn+');'
        c=c+'translate([ '+x+',-'+y+', '+z+']) sphere(r='+rounding+',$fn='+fn+');'
        c=c+'translate([ '+x+', '+y+',-'+z+']) sphere(r='+rounding+',$fn='+fn+');'
        c=c+'translate([ '+x+', '+y+', '+z+']) sphere(r='+rounding+',$fn='+fn+');'
        c=c+'}'
        c=c+'}'        
        c=c+'}'        
        c=c+'else'        
        c=c+'{'
        c=c+'translate([ '+self.getinputplugvalue('tx')+', '+self.getinputplugvalue('ty')+', '+self.getinputplugvalue('tx')+'])'
        c=c+'cube(['+self.getinputplugvalue('sizex')+','+self.getinputplugvalue('sizey')+','+self.getinputplugvalue('sizez')+'],center='+self.getinputplugvalue('center')+');'        
        c=c+'}'        
        

        self.modulebegin(self.name,tx=tx,ty=ty,tz=tz)
        self.moduleaddcode(c)
        self.moduleend()

        self.setoutputplugvalue('object', self.modulename(self.name))
        return
