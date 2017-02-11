//------------------------------------------------------------------------------------------
// THIS CODE WAS GENERATED WITH GRAPHSCAD
//------------------------------------------------------------------------------------------
// Graphscad is a graphical nodal editor to create .SCAD files
//
// More info : http://graphscad.free.fr
//
// Scad Files created with Graphscad can be edited by graphscad
// Scad Files created with Graphscad can be read by Openscad
//
//------------------------------------------------------------------------------------------
use <examples_graphscad/nacaprofile.scad>
module callnacamodule()
{
 function node_callmodule2d_matrix(i=0,j=0,k=0,l=0,m=0,n=0) = translate([0,0,0]);
 module node_callmodule2d(i=0,j=0,k=0,l=0,m=0,n=0)
 {
  nacaprofile(2412,150);
 }
 function node_square_matrix(i=0,j=0,k=0,l=0,m=0,n=0) = translate([50,0,0]);
 module node_square(i=0,j=0,k=0,l=0,m=0,n=0)
 {
  translate([50,0,0])square(size=[10,100],center=true);
 }
 function node_boolean2d_matrix(i=0,j=0,k=0,l=0,m=0,n=0) = translate([0,0,0]);
 module node_boolean2d(i=0,j=0,k=0,l=0,m=0,n=0)
 {
  intersection()
  {
   node_square(i,j,k,l,m,n);
   node_callmodule2d(i,j,k,l,m,n);
  }
 }
 function node_boolean2d0_matrix(i=0,j=0,k=0,l=0,m=0,n=0) = translate([0,0,0]);
 module node_boolean2d0(i=0,j=0,k=0,l=0,m=0,n=0)
 {
  union()
  {
   node_boolean2d(i,j,k,l,m,n);
   node_boolean2d1(i,j,k,l,m,n);
  }
 }
 function node_offset_matrix(i=0,j=0,k=0,l=0,m=0,n=0) = translate([0,0,0]);
 module node_offset(i=0,j=0,k=0,l=0,m=0,n=0)
 {
  offset(r=-1.0)
  {
   node_callmodule2d(i,j,k,l,m,n);
  }
 }
 function node_boolean2d1_matrix(i=0,j=0,k=0,l=0,m=0,n=0) = translate([0,0,0]);
 module node_boolean2d1(i=0,j=0,k=0,l=0,m=0,n=0)
 {
  difference()
  {
   node_callmodule2d(i,j,k,l,m,n);
   node_offset(i,j,k,l,m,n);
  }
 }
 function node_circle_matrix(i=0,j=0,k=0,l=0,m=0,n=0) = translate([50,2.0,0]);
 module node_circle(i=0,j=0,k=0,l=0,m=0,n=0)
 {
  translate([50,2.0,0])circle(r=2.5,$fn=(16+2.5*3.14116));
 }
 function node_boolean2d2_matrix(i=0,j=0,k=0,l=0,m=0,n=0) = translate([-100,0,0]);
 module node_boolean2d2(i=0,j=0,k=0,l=0,m=0,n=0)
 {
  translate([-100,0,0])difference()
  {
   node_boolean2d0(i,j,k,l,m,n);
   node_circle(i,j,k,l,m,n);
  }
 }
 function node_linearextrude_matrix(i=0,j=0,k=0,l=0,m=0,n=0) = translate([0,0,0]);
 module node_linearextrude(i=0,j=0,k=0,l=0,m=0,n=0)
 {
  linear_extrude(height=150,center=true,convexity=1,twist=0,slices=1,scale=0.6)
  {
   node_boolean2d2(i,j,k,l,m,n);
  }
 }
 node_linearextrude();
 /*--------------------------------------------------------------------------------------------------------
  Graphscad Utils functions
  This code is Used By Graphscad Nodal Editor to generate SCAD files
 --------------------------------------------------------------------------------------------------------*/
 function det4x4(a) =
 a[0][0]*a[1][1]*a[2][2]*a[3][3] + a[0][0]*a[1][2]*a[2][3]*a[3][1] + a[0][0]*a[1][3]*a[2][1]*a[3][2]
 + a[0][1]*a[1][0]*a[2][3]*a[3][2] + a[0][1]*a[1][2]*a[2][0]*a[3][3] + a[0][1]*a[1][3]*a[2][2]*a[3][0]
 + a[0][2]*a[1][0]*a[2][1]*a[3][3] + a[0][2]*a[1][1]*a[2][3]*a[3][0] + a[0][2]*a[1][3]*a[2][0]*a[3][1]
 + a[0][3]*a[1][0]*a[2][2]*a[3][1] + a[0][3]*a[1][1]*a[2][0]*a[3][2] + a[0][3]*a[1][2]*a[2][1]*a[3][0]
 - a[0][0]*a[1][1]*a[2][3]*a[3][2] - a[0][0]*a[1][2]*a[2][1]*a[3][3] - a[0][0]*a[1][3]*a[2][2]*a[3][1]
 - a[0][1]*a[1][0]*a[2][2]*a[3][3] - a[0][1]*a[1][2]*a[2][3]*a[3][0] - a[0][1]*a[1][3]*a[2][0]*a[3][2]
 - a[0][2]*a[1][0]*a[2][3]*a[3][1] - a[0][2]*a[1][1]*a[2][0]*a[3][3] - a[0][2]*a[1][3]*a[2][1]*a[3][0]
 - a[0][3]*a[1][0]*a[2][1]*a[3][2] - a[0][3]*a[1][1]*a[2][2]*a[3][0] - a[0][3]*a[1][2]*a[2][0]*a[3][1];
 function invb00(a) = a[1][1]*a[2][2]*a[3][3] + a[1][2]*a[2][3]*a[3][1] + a[1][3]*a[2][1]*a[3][2] - a[1][1]*a[2][3]*a[3][2] - a[1][2]*a[2][1]*a[3][3] - a[1][3]*a[2][2]*a[3][1];
 function invb01(a) = a[0][1]*a[2][3]*a[3][2] + a[0][2]*a[2][1]*a[3][3] + a[0][3]*a[2][2]*a[3][1] - a[0][1]*a[2][2]*a[3][3] - a[0][2]*a[2][3]*a[3][1] - a[0][3]*a[2][1]*a[3][2];
 function invb02(a) = a[0][1]*a[1][2]*a[3][3] + a[0][2]*a[1][3]*a[3][1] + a[0][3]*a[1][1]*a[3][2] - a[0][1]*a[1][3]*a[3][2] - a[0][2]*a[1][1]*a[3][3] - a[0][3]*a[1][2]*a[3][1];
 function invb03(a) = a[0][1]*a[1][3]*a[2][2] + a[0][2]*a[1][1]*a[2][3] + a[0][3]*a[1][2]*a[2][1] - a[0][1]*a[1][2]*a[2][3] - a[0][2]*a[1][3]*a[2][1] - a[0][3]*a[1][1]*a[2][2];
 function invb10(a) = a[1][0]*a[2][3]*a[3][2] + a[1][2]*a[2][0]*a[3][3] + a[1][3]*a[2][2]*a[3][0] - a[1][0]*a[2][2]*a[3][3] - a[1][2]*a[2][3]*a[3][0] - a[1][3]*a[2][0]*a[3][2];
 function invb11(a) = a[0][0]*a[2][2]*a[3][3] + a[0][2]*a[2][3]*a[3][0] + a[0][3]*a[2][0]*a[3][2] - a[0][0]*a[2][3]*a[3][2] - a[0][2]*a[2][0]*a[3][3] - a[0][3]*a[2][2]*a[3][0];
 function invb12(a) = a[0][0]*a[1][3]*a[3][2] + a[0][2]*a[1][0]*a[3][3] + a[0][3]*a[1][2]*a[3][0] - a[0][0]*a[1][2]*a[3][3] - a[0][2]*a[1][3]*a[3][0] - a[0][3]*a[1][0]*a[3][2];
 function invb13(a) = a[0][0]*a[1][2]*a[2][3] + a[0][2]*a[1][3]*a[2][0] + a[0][3]*a[1][0]*a[2][2] - a[0][0]*a[1][3]*a[2][2] - a[0][2]*a[1][0]*a[2][3] - a[0][3]*a[1][2]*a[2][0];
 function invb20(a) = a[1][0]*a[2][1]*a[3][3] + a[1][1]*a[2][3]*a[3][0] + a[1][3]*a[2][0]*a[3][1] - a[1][0]*a[2][3]*a[3][1] - a[1][1]*a[2][0]*a[3][3] - a[1][3]*a[2][1]*a[3][0];
 function invb21(a) = a[0][0]*a[2][3]*a[3][1] + a[0][1]*a[2][0]*a[3][3] + a[0][3]*a[2][1]*a[3][0] - a[0][0]*a[2][1]*a[3][3] - a[0][1]*a[2][3]*a[3][0] - a[0][3]*a[2][0]*a[3][1];
 function invb22(a) = a[0][0]*a[1][1]*a[3][3] + a[0][1]*a[1][3]*a[3][0] + a[0][3]*a[1][0]*a[3][1] - a[0][0]*a[1][3]*a[3][1] - a[0][1]*a[1][0]*a[3][3] - a[0][3]*a[1][1]*a[3][0];
 function invb23(a) = a[0][0]*a[1][3]*a[2][1] + a[0][1]*a[1][0]*a[2][3] + a[0][3]*a[1][1]*a[2][0] - a[0][0]*a[1][1]*a[2][3] - a[0][1]*a[1][3]*a[2][0] - a[0][3]*a[1][0]*a[2][1];
 function invb30(a) = a[1][0]*a[2][2]*a[3][1] + a[1][1]*a[2][0]*a[3][2] + a[1][2]*a[2][1]*a[3][0] - a[1][0]*a[2][1]*a[3][2] - a[1][1]*a[2][2]*a[3][0] - a[1][2]*a[2][0]*a[3][1];
 function invb31(a) = a[0][0]*a[2][1]*a[3][2] + a[0][1]*a[2][2]*a[3][0] + a[0][2]*a[2][0]*a[3][1] - a[0][0]*a[2][2]*a[3][1] - a[0][1]*a[2][0]*a[3][2] - a[0][2]*a[2][1]*a[3][0];
 function invb32(a) = a[0][0]*a[1][2]*a[3][1] + a[0][1]*a[1][0]*a[3][2] + a[0][2]*a[1][1]*a[3][0] - a[0][0]*a[1][1]*a[3][2] - a[0][1]*a[1][2]*a[3][0] - a[0][2]*a[1][0]*a[3][1];
 function invb33(a) = a[0][0]*a[1][1]*a[2][2] + a[0][1]*a[1][2]*a[2][0] + a[0][2]*a[1][0]*a[2][1] - a[0][0]*a[1][2]*a[2][1] - a[0][1]*a[1][0]*a[2][2] - a[0][2]*a[1][1]*a[2][0];
 function inv4x4(a)= (1/det4x4(a))*[
 [invb00(a),invb01(a),invb02(a),invb03(a)],
 [invb10(a),invb11(a),invb12(a),invb13(a)],
 [invb20(a),invb21(a),invb22(a),invb23(a)],
 [invb30(a),invb31(a),invb32(a),invb33(a)]];
 function onlytranslate(a)=  [
                        [1,0,0,a[0][3]],
                        [0,1,0,a[1][3]],
                        [0,0,1,a[2][3]],
                        [0,0,0,1]];
 function negonlytranslate(a)=[
                        [1,0,0,-a[0][3]],
                        [0,1,0,-a[1][3]],
                        [0,0,1,-a[2][3]],
                        [0,0,0,1]];
 function lookatvec(t,parentmat) = [t[0]-parentmat[0][3],
                                 t[1]-parentmat[1][3],
                                 t[2]-parentmat[2][3]];
 /*
              rx = '0'
              ry = 'acos('+tz+'/norm(['+tx+','+ty+','+tz+']))'
              rz = 'atan2('+ty+','+tx+')'
 */
 function lookatrot(t,parentmat) = [0,
                                 acos((t[2]-parentmat[2][3])/norm(lookatvec(t,parentmat))),
                                 atan2(t[1]-parentmat[1][3],t[0]-parentmat[0][3])];
 function gettranslation(m) = [m[0][3],m[1][3],m[2][3]];
 function vectormulmatrix(v,m) = m*v;
 function vectorlength(v) = norm(v);
 function vectorx(v) = v[0];
 function vectory(v) = v[1];
 function vectorz(v) = v[2];
 function vectoradd(a,b) = (a+b);
 function vectorsub(a,b) = (a-b);
 function vectormul(a,b) = (a*b);
 function vectordiv(a,b) = (a*(1/b));
 function scale(v)=[[v[0],0,0,0],
                    [0,v[1],0,0],
                    [0,0,v[2],0],
                    [0,0,0,1]];
 function rotatex(a)=[[1,0,0,0],
                      [0,cos(a),-sin(a),0],
                      [0,sin(a),cos(a),0],
                      [0,0,0,1]];
 function rotatey(a)=[[cos(a),0,sin(a),0],
                      [0,1,0,0],
                      [-sin(a),0,cos(a),0],
                      [0,0,0,1]];
 function rotatez(a)=[[cos(a),-sin(a),0,0],
                      [sin(a),cos(a),0,0],
                      [0,0,1,0],
                      [0,0,0,1]];
 function rotatea(c,s,l,m,n)=[[l*l*(1-c)+c,m*l*(1-c)-n*s,n*l*(1-c)+m*s,0],
                              [l*m*(1-c)+n*s,m*m*(1-c)+c,n*m*(1-c)-l*s,0],
                              [l*n*(1-c)-m*s,m*n*(1-c)+l*s,n*n*(1-c)+c,0],
                              [0,0,0,1]];
 function rotateanv(a,nv)=rotatea(cos(a),sin(a),nv[0],nv[1],nv[2]);
 function rotate(a,v, normV=true)=(v==undef)?rotatez(a[2])*rotatey(a[1])*rotatex(a[0]):
                      normV ? rotateanv(a,v/sqrt(v*v)) : rotateanv(a,v);
 function translate(v)=[[1,0,0,v[0]],
                        [0,1,0,v[1]],
                        [0,0,1,v[2]],
                        [0,0,0,1]];
 function mirrorabc(a,b,c)=[[1-2*a*a,-2*a*b,-2*a*c,0],
                            [-2*a*b,1-2*b*b,-2*b*c,0],
                            [-2*a*c,-2*b*c,1-2*c*c,0],
                            [0,0,0,1]];
 function mirrornv(nv)=mirrorabc(nv[0],nv[1],nv[2]);
 function mirror(v)=mirrornv(v/sqrt(v*v));
}
callnacamodule();


/*BEGINGRAPHSCAD{
    "nodes": [
        {
            "name": "node_callmodule2d",
            "inputplugs": [
                {
                    "tip": "filename of module (a graphscad file .scad)",
                    "type": "filename",
                    "name": "filename",
                    "value": "examples_graphscad/nacaprofile.scad"
                },
                {
                    "tip": "x translation of output object2d ",
                    "type": "str",
                    "name": "tx",
                    "value": "0"
                },
                {
                    "tip": "y translation of output object2d",
                    "type": "str",
                    "name": "ty",
                    "value": "0"
                },
                {
                    "tip": "z translation of output object2d",
                    "type": "str",
                    "name": "tz",
                    "value": "0"
                },
                {
                    "alias": "naca",
                    "type": "str",
                    "name": "param1",
                    "value": "2412"
                },
                {
                    "alias": "chord",
                    "type": "str",
                    "name": "param2",
                    "value": "150"
                },
                {
                    "alias": "samples",
                    "type": "str",
                    "name": "param3",
                    "value": ""
                },
                {
                    "alias": "open",
                    "type": "str",
                    "name": "param4",
                    "value": ""
                },
                {
                    "alias": "",
                    "type": "str",
                    "name": "param5",
                    "value": ""
                },
                {
                    "alias": "",
                    "type": "str",
                    "name": "param6",
                    "value": ""
                },
                {
                    "alias": "",
                    "type": "str",
                    "name": "param7",
                    "value": ""
                },
                {
                    "alias": "",
                    "type": "str",
                    "name": "param8",
                    "value": ""
                },
                {
                    "alias": "",
                    "type": "str",
                    "name": "param9",
                    "value": ""
                },
                {
                    "alias": "",
                    "type": "str",
                    "name": "param10",
                    "value": ""
                },
                {
                    "alias": "",
                    "type": "str",
                    "name": "param11",
                    "value": ""
                },
                {
                    "alias": "",
                    "type": "str",
                    "name": "param12",
                    "value": ""
                },
                {
                    "alias": "",
                    "type": "str",
                    "name": "param13",
                    "value": ""
                },
                {
                    "alias": "",
                    "type": "str",
                    "name": "param14",
                    "value": ""
                },
                {
                    "alias": "",
                    "type": "str",
                    "name": "param15",
                    "value": ""
                },
                {
                    "alias": "",
                    "type": "str",
                    "name": "param16",
                    "value": ""
                },
                {
                    "alias": "",
                    "type": "str",
                    "name": "param17",
                    "value": ""
                },
                {
                    "alias": "",
                    "type": "str",
                    "name": "param18",
                    "value": ""
                },
                {
                    "alias": "",
                    "type": "str",
                    "name": "param19",
                    "value": ""
                },
                {
                    "type": "str",
                    "name": "param20",
                    "value": ""
                }
            ],
            "typename": "Node_callmodule2d",
            "version": 1,
            "y": 40.40630084960637,
            "x": -615.465020369126
        },
        {
            "name": "node_square",
            "inputplugs": [
                {
                    "type": "str",
                    "name": "x",
                    "value": "10"
                },
                {
                    "type": "str",
                    "name": "y",
                    "value": "100"
                },
                {
                    "type": "str",
                    "name": "tx",
                    "value": "50"
                },
                {
                    "type": "str",
                    "name": "ty",
                    "value": "0"
                },
                {
                    "type": "str",
                    "name": "tz",
                    "value": "0"
                },
                {
                    "type": "str",
                    "name": "center",
                    "value": "true",
                    "combo": [
                        "true",
                        "false"
                    ]
                }
            ],
            "typename": "Node_square",
            "version": 1,
            "y": -255.04490727403552,
            "x": -598.2711103660008
        },
        {
            "name": "node_boolean2d",
            "inputplugs": [
                {
                    "type": "str",
                    "name": "op",
                    "value": "intersection",
                    "combo": [
                        "difference",
                        "union",
                        "intersection"
                    ]
                },
                {
                    "tip": "x translation of output object",
                    "type": "str",
                    "name": "tx",
                    "value": "0"
                },
                {
                    "tip": "y translation of output object",
                    "type": "str",
                    "name": "ty",
                    "value": "0"
                },
                {
                    "tip": "z translation of output object",
                    "type": "str",
                    "name": "tz",
                    "value": "0"
                },
                {
                    "tip": "First object of boolean operation",
                    "connection": "node_square.object2d",
                    "type": "object2d",
                    "name": "object2d1",
                    "value": ""
                },
                {
                    "tip": "a 2D object",
                    "connection": "node_callmodule2d.object2d",
                    "type": "object2d",
                    "name": "object2d2",
                    "value": ""
                },
                {
                    "tip": "a 2D object",
                    "type": "object2d",
                    "name": "object2d3",
                    "value": ""
                },
                {
                    "tip": "a 2D object",
                    "type": "object2d",
                    "name": "object2d4",
                    "value": ""
                },
                {
                    "tip": "a 2D object",
                    "type": "object2d",
                    "name": "object2d5",
                    "value": ""
                },
                {
                    "tip": "a 2D object",
                    "type": "object2d",
                    "name": "object2d6",
                    "value": ""
                },
                {
                    "tip": "a 2D object",
                    "type": "object2d",
                    "name": "object2d7",
                    "value": ""
                },
                {
                    "tip": "a 2D object",
                    "type": "object2d",
                    "name": "object2d8",
                    "value": ""
                },
                {
                    "tip": "a 2D object",
                    "type": "object2d",
                    "name": "object2d9",
                    "value": ""
                },
                {
                    "tip": "a 2D object",
                    "type": "object2d",
                    "name": "object2d10",
                    "value": ""
                },
                {
                    "tip": "a 2D object",
                    "type": "object2d",
                    "name": "object2d11",
                    "value": ""
                },
                {
                    "tip": "a 2D object",
                    "type": "object2d",
                    "name": "object2d12",
                    "value": ""
                },
                {
                    "tip": "a 2D object",
                    "type": "object2d",
                    "name": "object2d13",
                    "value": ""
                },
                {
                    "tip": "a 2D object",
                    "type": "object2d",
                    "name": "object2d14",
                    "value": ""
                },
                {
                    "tip": "a 2D object",
                    "type": "object2d",
                    "name": "object2d15",
                    "value": ""
                },
                {
                    "tip": "a 2D object",
                    "type": "object2d",
                    "name": "object2d16",
                    "value": ""
                },
                {
                    "tip": "a 2D object",
                    "type": "object2d",
                    "name": "object2d17",
                    "value": ""
                },
                {
                    "tip": "a 2D object",
                    "type": "object2d",
                    "name": "object2d18",
                    "value": ""
                },
                {
                    "tip": "a 2D object",
                    "type": "object2d",
                    "name": "object2d19",
                    "value": ""
                },
                {
                    "tip": "a 2D object",
                    "type": "object2d",
                    "name": "object2d20",
                    "value": ""
                }
            ],
            "typename": "Node_boolean2d",
            "version": 1,
            "y": -119.19603833254918,
            "x": -357.1805282344918
        },
        {
            "name": "node_boolean2d0",
            "inputplugs": [
                {
                    "type": "str",
                    "name": "op",
                    "value": "union",
                    "combo": [
                        "difference",
                        "union",
                        "intersection"
                    ]
                },
                {
                    "tip": "x translation of output object",
                    "type": "str",
                    "name": "tx",
                    "value": "0"
                },
                {
                    "tip": "y translation of output object",
                    "type": "str",
                    "name": "ty",
                    "value": "0"
                },
                {
                    "tip": "z translation of output object",
                    "type": "str",
                    "name": "tz",
                    "value": "0"
                },
                {
                    "tip": "First object of boolean operation",
                    "connection": "node_boolean2d.object2d",
                    "type": "object2d",
                    "name": "object2d1",
                    "value": ""
                },
                {
                    "tip": "a 2D object",
                    "connection": "node_boolean2d1.object2d",
                    "type": "object2d",
                    "name": "object2d2",
                    "value": ""
                },
                {
                    "tip": "a 2D object",
                    "type": "object2d",
                    "name": "object2d3",
                    "value": ""
                },
                {
                    "tip": "a 2D object",
                    "type": "object2d",
                    "name": "object2d4",
                    "value": ""
                },
                {
                    "tip": "a 2D object",
                    "type": "object2d",
                    "name": "object2d5",
                    "value": ""
                },
                {
                    "tip": "a 2D object",
                    "type": "object2d",
                    "name": "object2d6",
                    "value": ""
                },
                {
                    "tip": "a 2D object",
                    "type": "object2d",
                    "name": "object2d7",
                    "value": ""
                },
                {
                    "tip": "a 2D object",
                    "type": "object2d",
                    "name": "object2d8",
                    "value": ""
                },
                {
                    "tip": "a 2D object",
                    "type": "object2d",
                    "name": "object2d9",
                    "value": ""
                },
                {
                    "tip": "a 2D object",
                    "type": "object2d",
                    "name": "object2d10",
                    "value": ""
                },
                {
                    "tip": "a 2D object",
                    "type": "object2d",
                    "name": "object2d11",
                    "value": ""
                },
                {
                    "tip": "a 2D object",
                    "type": "object2d",
                    "name": "object2d12",
                    "value": ""
                },
                {
                    "tip": "a 2D object",
                    "type": "object2d",
                    "name": "object2d13",
                    "value": ""
                },
                {
                    "tip": "a 2D object",
                    "type": "object2d",
                    "name": "object2d14",
                    "value": ""
                },
                {
                    "tip": "a 2D object",
                    "type": "object2d",
                    "name": "object2d15",
                    "value": ""
                },
                {
                    "tip": "a 2D object",
                    "type": "object2d",
                    "name": "object2d16",
                    "value": ""
                },
                {
                    "tip": "a 2D object",
                    "type": "object2d",
                    "name": "object2d17",
                    "value": ""
                },
                {
                    "tip": "a 2D object",
                    "type": "object2d",
                    "name": "object2d18",
                    "value": ""
                },
                {
                    "tip": "a 2D object",
                    "type": "object2d",
                    "name": "object2d19",
                    "value": ""
                },
                {
                    "tip": "a 2D object",
                    "type": "object2d",
                    "name": "object2d20",
                    "value": ""
                }
            ],
            "typename": "Node_boolean2d",
            "version": 1,
            "y": -15.239327745579033,
            "x": -7.9810708548981495
        },
        {
            "name": "node_offset",
            "inputplugs": [
                {
                    "connection": "node_callmodule2d.object2d",
                    "type": "object2d",
                    "name": "object2d",
                    "value": ""
                },
                {
                    "type": "str",
                    "name": "op",
                    "value": "Round",
                    "combo": [
                        "Round",
                        "Delta"
                    ]
                },
                {
                    "type": "str",
                    "name": "value",
                    "value": "-1.0"
                },
                {
                    "type": "str",
                    "name": "chamfer",
                    "value": "false",
                    "combo": [
                        "true",
                        "false"
                    ]
                }
            ],
            "typename": "Node_offset",
            "version": 1,
            "y": 312.43633603288066,
            "x": -360.5536600675054
        },
        {
            "name": "node_boolean2d1",
            "inputplugs": [
                {
                    "type": "str",
                    "name": "op",
                    "value": "difference",
                    "combo": [
                        "difference",
                        "union",
                        "intersection"
                    ]
                },
                {
                    "tip": "x translation of output object",
                    "type": "str",
                    "name": "tx",
                    "value": "0"
                },
                {
                    "tip": "y translation of output object",
                    "type": "str",
                    "name": "ty",
                    "value": "0"
                },
                {
                    "tip": "z translation of output object",
                    "type": "str",
                    "name": "tz",
                    "value": "0"
                },
                {
                    "tip": "First object of boolean operation",
                    "connection": "node_callmodule2d.object2d",
                    "type": "object2d",
                    "name": "object2d1",
                    "value": ""
                },
                {
                    "tip": "a 2D object",
                    "connection": "node_offset.object2d",
                    "type": "object2d",
                    "name": "object2d2",
                    "value": ""
                },
                {
                    "tip": "a 2D object",
                    "type": "object2d",
                    "name": "object2d3",
                    "value": ""
                },
                {
                    "tip": "a 2D object",
                    "type": "object2d",
                    "name": "object2d4",
                    "value": ""
                },
                {
                    "tip": "a 2D object",
                    "type": "object2d",
                    "name": "object2d5",
                    "value": ""
                },
                {
                    "tip": "a 2D object",
                    "type": "object2d",
                    "name": "object2d6",
                    "value": ""
                },
                {
                    "tip": "a 2D object",
                    "type": "object2d",
                    "name": "object2d7",
                    "value": ""
                },
                {
                    "tip": "a 2D object",
                    "type": "object2d",
                    "name": "object2d8",
                    "value": ""
                },
                {
                    "tip": "a 2D object",
                    "type": "object2d",
                    "name": "object2d9",
                    "value": ""
                },
                {
                    "tip": "a 2D object",
                    "type": "object2d",
                    "name": "object2d10",
                    "value": ""
                },
                {
                    "tip": "a 2D object",
                    "type": "object2d",
                    "name": "object2d11",
                    "value": ""
                },
                {
                    "tip": "a 2D object",
                    "type": "object2d",
                    "name": "object2d12",
                    "value": ""
                },
                {
                    "tip": "a 2D object",
                    "type": "object2d",
                    "name": "object2d13",
                    "value": ""
                },
                {
                    "tip": "a 2D object",
                    "type": "object2d",
                    "name": "object2d14",
                    "value": ""
                },
                {
                    "tip": "a 2D object",
                    "type": "object2d",
                    "name": "object2d15",
                    "value": ""
                },
                {
                    "tip": "a 2D object",
                    "type": "object2d",
                    "name": "object2d16",
                    "value": ""
                },
                {
                    "tip": "a 2D object",
                    "type": "object2d",
                    "name": "object2d17",
                    "value": ""
                },
                {
                    "tip": "a 2D object",
                    "type": "object2d",
                    "name": "object2d18",
                    "value": ""
                },
                {
                    "tip": "a 2D object",
                    "type": "object2d",
                    "name": "object2d19",
                    "value": ""
                },
                {
                    "tip": "a 2D object",
                    "type": "object2d",
                    "name": "object2d20",
                    "value": ""
                }
            ],
            "typename": "Node_boolean2d",
            "version": 1,
            "y": 145.38599763601854,
            "x": -196.71582817827561
        },
        {
            "name": "node_circle",
            "inputplugs": [
                {
                    "tip": "radius of circle",
                    "type": "str",
                    "name": "radius",
                    "value": "2.5"
                },
                {
                    "tip": "x translation of circle",
                    "type": "str",
                    "name": "tx",
                    "value": "50"
                },
                {
                    "tip": "y translation of circle",
                    "type": "str",
                    "name": "ty",
                    "value": "2.0"
                },
                {
                    "tip": "z translation of circle",
                    "type": "str",
                    "name": "tz",
                    "value": "0"
                },
                {
                    "type": "str",
                    "name": "$fn",
                    "value": ""
                }
            ],
            "typename": "Node_circle",
            "version": 1,
            "y": 232.92679996898943,
            "x": 16.91585457924947
        },
        {
            "name": "node_boolean2d2",
            "inputplugs": [
                {
                    "type": "str",
                    "name": "op",
                    "value": "difference",
                    "combo": [
                        "difference",
                        "union",
                        "intersection"
                    ]
                },
                {
                    "tip": "x translation of output object",
                    "type": "str",
                    "name": "tx",
                    "value": "-100"
                },
                {
                    "tip": "y translation of output object",
                    "type": "str",
                    "name": "ty",
                    "value": "0"
                },
                {
                    "tip": "z translation of output object",
                    "type": "str",
                    "name": "tz",
                    "value": "0"
                },
                {
                    "tip": "First object of boolean operation",
                    "connection": "node_boolean2d0.object2d",
                    "type": "object2d",
                    "name": "object2d1",
                    "value": ""
                },
                {
                    "tip": "a 2D object",
                    "connection": "node_circle.object2d",
                    "type": "object2d",
                    "name": "object2d2",
                    "value": ""
                },
                {
                    "tip": "a 2D object",
                    "type": "object2d",
                    "name": "object2d3",
                    "value": ""
                },
                {
                    "tip": "a 2D object",
                    "type": "object2d",
                    "name": "object2d4",
                    "value": ""
                },
                {
                    "tip": "a 2D object",
                    "type": "object2d",
                    "name": "object2d5",
                    "value": ""
                },
                {
                    "tip": "a 2D object",
                    "type": "object2d",
                    "name": "object2d6",
                    "value": ""
                },
                {
                    "tip": "a 2D object",
                    "type": "object2d",
                    "name": "object2d7",
                    "value": ""
                },
                {
                    "tip": "a 2D object",
                    "type": "object2d",
                    "name": "object2d8",
                    "value": ""
                },
                {
                    "tip": "a 2D object",
                    "type": "object2d",
                    "name": "object2d9",
                    "value": ""
                },
                {
                    "tip": "a 2D object",
                    "type": "object2d",
                    "name": "object2d10",
                    "value": ""
                },
                {
                    "tip": "a 2D object",
                    "type": "object2d",
                    "name": "object2d11",
                    "value": ""
                },
                {
                    "tip": "a 2D object",
                    "type": "object2d",
                    "name": "object2d12",
                    "value": ""
                },
                {
                    "tip": "a 2D object",
                    "type": "object2d",
                    "name": "object2d13",
                    "value": ""
                },
                {
                    "tip": "a 2D object",
                    "type": "object2d",
                    "name": "object2d14",
                    "value": ""
                },
                {
                    "tip": "a 2D object",
                    "type": "object2d",
                    "name": "object2d15",
                    "value": ""
                },
                {
                    "tip": "a 2D object",
                    "type": "object2d",
                    "name": "object2d16",
                    "value": ""
                },
                {
                    "tip": "a 2D object",
                    "type": "object2d",
                    "name": "object2d17",
                    "value": ""
                },
                {
                    "tip": "a 2D object",
                    "type": "object2d",
                    "name": "object2d18",
                    "value": ""
                },
                {
                    "tip": "a 2D object",
                    "type": "object2d",
                    "name": "object2d19",
                    "value": ""
                },
                {
                    "tip": "a 2D object",
                    "type": "object2d",
                    "name": "object2d20",
                    "value": ""
                }
            ],
            "typename": "Node_boolean2d",
            "version": 1,
            "y": 98.8046532753554,
            "x": 256.2475893978301
        },
        {
            "name": "node_linearextrude",
            "inputplugs": [
                {
                    "connection": "node_boolean2d2.object2d",
                    "type": "object2d",
                    "name": "object2d",
                    "value": ""
                },
                {
                    "type": "str",
                    "name": "height",
                    "value": "150"
                },
                {
                    "type": "str",
                    "name": "center",
                    "value": "true",
                    "combo": [
                        "true",
                        "false"
                    ]
                },
                {
                    "type": "str",
                    "name": "convexity",
                    "value": "1"
                },
                {
                    "type": "str",
                    "name": "twist",
                    "value": "0"
                },
                {
                    "type": "str",
                    "name": "slices",
                    "value": "1"
                },
                {
                    "type": "str",
                    "name": "scale",
                    "value": "0.6"
                }
            ],
            "typename": "Node_linearextrude",
            "version": 1,
            "y": 126.11095859022697,
            "x": 519.6731230236505
        }
    ],
    "version": 2
}ENDGRAPHSCAD*/