# coding: utf8
# from __future__ import unicode_literals

import core as cdc

class Node_polygon(cdc.Dagnode):

    def getcomment(self):
        return 'this node is used to create a polygon (use a string node connected to points if you have many points)'

    def getdisplaytype(self):
        return 'object2d'

    def getinputplugs(self):
        return [
                {'name': 'points', 'value': '[[0,0],[0,1],[1,1],[1,0]]', 'type': 'str'},
                {'name': 'convexity', 'value': '3', 'type': 'str'}
                ]

    def getoutputplugs(self):
        return [{'name': 'object2d', 'value': '', 'type': 'object2d'}]

    def evaluate(self):
        points = self.getinputplugvalue('points')
        convexity = self.getinputplugvalue('convexity')

        
        self.modulebegin(self.name)
        self.moduleaddcode( 'polygon(points='+points+',convexity='+convexity+');')
        self.moduleend()
        
        self.setoutputplugvalue('object2d', self.modulename(self.name))
        return
