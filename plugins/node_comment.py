# coding: utf8
# from __future__ import unicode_literals

import core as gc


class Node_comment(gc.Dagnode):

    def getcomment(self):
        return "this node is used to add comments in your graph"

    def getdisplaytype(self):
        return 'comment'

    def getinputplugs(self):
        return [
                {'name': 'comment', 'value': 'Enter your comment here', 'type': 'str','tip':'comment string to display on background'},
                ]

    def getoutputplugs(self):
        return []

    def evaluate(self):
        return
