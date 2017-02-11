# coding: utf8
# from __future__ import unicode_literals

import core as cdc
import os

class Node_callmodule2d(cdc.Dagnode):

    def prerefresh(self):
        filename=self.getinputplugvalue('filename')
        filename=os.path.normpath(filename)
        if os.path.isfile(filename):
            txt=''
            try:
                with open(filename, 'r') as f:
                    txt=f.read()
                    modulename=os.path.splitext(os.path.basename(filename))[0]
                    i=txt.find(modulename)
                    if i>=0:
                        txt=txt[i:]
                        i=txt.find('(')
                        if i>=0:
                            txt=txt[i+1:]
                            i=txt.find('\n')
                            if i>=0:
                                txt=txt[:i]
                            sp=txt.split(',')
                            print sp
                            if len(sp)==1:
                                if sp[0]==')':
                                    sp=[]
                            for i in range(0,19):
                                if i<len(sp):
                                    pname=sp[i].split('=')[0]
                                    self.setinputplugalias('param'+str(i+1),pname)
                                else:
                                    self.setinputplugalias('param'+str(i+1),'')
            except:
                pass
                        
                

    def getcomment(self):
        return 'this node is used to call an external module that output object 2D'

    def getdisplaytype(self):
        return 'control statement'

    def getinputplugs(self):
        return [
                {'name': 'filename', 'value': '', 'type': 'filename','tip':'filename of module (a graphscad file .scad)'},
                {'name': 'tx', 'value': '0', 'type': 'str','tip':'x translation of output object2d '},
                {'name': 'ty', 'value': '0', 'type': 'str','tip':'y translation of output object2d'},
                {'name': 'tz', 'value': '0', 'type': 'str','tip':'z translation of output object2d'},
                {'name': 'param1', 'value': '', 'type': 'str'},
                {'name': 'param2', 'value': '', 'type': 'str'},
                {'name': 'param3', 'value': '', 'type': 'str'},
                {'name': 'param4', 'value': '', 'type': 'str'},
                {'name': 'param5', 'value': '', 'type': 'str'},
                {'name': 'param6', 'value': '', 'type': 'str'},
                {'name': 'param7', 'value': '', 'type': 'str'},
                {'name': 'param8', 'value': '', 'type': 'str'},
                {'name': 'param9', 'value': '', 'type': 'str'},
                {'name': 'param10', 'value': '', 'type': 'str'},
                {'name': 'param11', 'value': '', 'type': 'str'},
                {'name': 'param12', 'value': '', 'type': 'str'},
                {'name': 'param13', 'value': '', 'type': 'str'},
                {'name': 'param14', 'value': '', 'type': 'str'},
                {'name': 'param15', 'value': '', 'type': 'str'},
                {'name': 'param16', 'value': '', 'type': 'str'},
                {'name': 'param17', 'value': '', 'type': 'str'},
                {'name': 'param18', 'value': '', 'type': 'str'},
                {'name': 'param19', 'value': '', 'type': 'str'},
                {'name': 'param20', 'value': '', 'type': 'str'}
                ]

    def getoutputplugs(self):
        return [
                {'name': 'object2d', 'value': '', 'type': 'object2d','tip':'output 2d object'}
                ]

    def getheader(self):
        filename=self.getinputplugvalue('filename')
        c='use <'+filename+'>\n'
        return c
        
    def evaluate(self):

        tx=self.getinputplugvalue('tx')
        ty=self.getinputplugvalue('ty')
        tz=self.getinputplugvalue('tz')
        filename=self.getinputplugvalue('filename')
        modulename=os.path.splitext(os.path.basename(filename))[0]
        code=modulename+'('
        params=''
        for i in range(1,20):
            s=self.getinputplugvalue('param'+str(i))
            if (s is not None) and len(s)>0:
                if len(params)>0:
                    params=params+','
                params=params+s
        code=code+params+');'
        self.modulebegin(self.name,tx=tx,ty=ty,tz=tz)
        self.moduleaddcode(code)
        self.moduleend()
        self.setoutputplugvalue('object2d', self.modulename(self.name))
        
        return
