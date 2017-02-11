# coding: utf8
# from __future__ import unicode_literals

import core as cdc

class Node_function(cdc.Dagnode):

    def getcomment(self):
        return 'this node is used to create a named math function'

    def getdisplaytype(self):
        return 'declaration'

    def getinputplugs(self):
        return [
                {'name': 'name', 'value': 'myfunc', 'type': 'str','alias':'function name','tip':'name of function (will be usable in expressions)'},
                {'name': 'expression', 'value': 'a+b', 'type': 'str','tip':'expression of function'},
                {'name': 'paramname1', 'value': 'a', 'type': 'str','tip':''},
                {'name': 'paramname2', 'value': 'b', 'type': 'str','tip':''},
                {'name': 'paramname3', 'value': '', 'type': 'str','tip':''},
                {'name': 'paramname4', 'value': '', 'type': 'str','tip':''},
                {'name': 'paramname5', 'value': '', 'type': 'str','tip':''},
                {'name': 'paramname6', 'value': '', 'type': 'str','tip':''},
                {'name': 'paramname7', 'value': '', 'type': 'str','tip':''},
                {'name': 'paramname8', 'value': '', 'type': 'str','tip':''},
                {'name': 'paramname9', 'value': '', 'type': 'str','tip':''},
                {'name': 'paramname10', 'value': '', 'type': 'str','tip':''},
                {'name': 'paramname11', 'value': '', 'type': 'str','tip':''},
                {'name': 'paramname12', 'value': '', 'type': 'str','tip':''},
                {'name': 'paramname13', 'value': '', 'type': 'str','tip':''},
                {'name': 'paramname14', 'value': '', 'type': 'str','tip':''},
                {'name': 'paramname15', 'value': '', 'type': 'str','tip':''},
                {'name': 'paramname16', 'value': '', 'type': 'str','tip':''},
                {'name': 'paramname17', 'value': '', 'type': 'str','tip':''},
                {'name': 'paramname18', 'value': '', 'type': 'str','tip':''},
                {'name': 'paramname19', 'value': '', 'type': 'str','tip':''},
                {'name': 'paramname20', 'value': '', 'type': 'str','tip':''}
                ]

    def getoutputplugs(self):
        return [
                ]

    def getheader(self):
        code=''
        code=code+'function '+self.getinputplugvalue('name')+'('
        params=''
        for i in range(1,20):
            s=self.getinputplugvalue('paramname'+str(i))
            if len(s)>0:
                if i>1:
                    params=params+','
                params=params+s
        code=code+params+')='
        code=code+self.getinputplugvalue('expression')
        code=code+';\n'
        return code

        
    def evaluate(self):
        return
