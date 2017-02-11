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
module robotwheel(radius=26.0,height=5.0,centerradius=6.0,outtickness=1.0,armcount=10.0,armtickness=0.5,axisradius=2.0,gripcount=16.0,griptickness=4.0,gripsize=4.0)
{
 function node_cube_matrix(i=0,j=0,k=0,l=0,m=0,n=0) = translate([-radius,0,-1]);
 module node_cube(i=0,j=0,k=0,l=0,m=0,n=0)
 {
  translate([-radius,0,-1])cube([(radius-outtickness)*2-centerradius/2,radius+2,height+2],center=false);
 }
 function node_boolean_matrix(i=0,j=0,k=0,l=0,m=0,n=0) = translate([(radius+centerradius)/2-armtickness/2,0,0])*node_tube_matrix(i=i,j=j,k=k,l=l,m=m,n=n);
 module node_boolean(i=0,j=0,k=0,l=0,m=0,n=0)
 {
  translate([(radius+centerradius)/2-armtickness/2,0,0])difference()
  {
   node_tube(i,j,k,l,m,n);
   node_cube(i,j,k,l,m,n);
  }
 }
 function node_tube_inobject_matrix(i=0,j=0,k=0,l=0,m=0,n=0) = translate([0,0,0]);
 module node_tube_inobject(i=0,j=0,k=0,l=0,m=0,n=0)
 {
  translate([0,0,-0.001]) cylinder(r=radius/2-centerradius/2+armtickness/2-(armtickness),r1=radius/2-centerradius/2+armtickness/2-(armtickness),h=height+0.002,$fn=64);
 }
 function node_tube_outobject_matrix(i=0,j=0,k=0,l=0,m=0,n=0) = translate([0,0,0]);
 module node_tube_outobject(i=0,j=0,k=0,l=0,m=0,n=0)
 {
   cylinder(r=radius/2-centerradius/2+armtickness/2,r1=radius/2-centerradius/2+armtickness/2,h=height,$fn=64);
 }
 function node_tube_holeobject_matrix(i=0,j=0,k=0,l=0,m=0,n=0) = translate([0,0,0]);
 module node_tube_holeobject(i=0,j=0,k=0,l=0,m=0,n=0)
 {
  translate([0,0,-0.001]) cylinder(r=(radius/2-centerradius/2+armtickness/2)+(0)-(armtickness),r1=(radius/2-centerradius/2+armtickness/2)+(0)-(armtickness),h=height+0.002,$fn=64);
 }
 function node_tube_matrix(i=0,j=0,k=0,l=0,m=0,n=0) = translate([0,0,0]);
 module node_tube(i=0,j=0,k=0,l=0,m=0,n=0)
 {
  difference()
  {
    cylinder(r=radius/2-centerradius/2+armtickness/2,r1=radius/2-centerradius/2+armtickness/2,h=height,$fn=64);
   translate([0,0,-0.001]) cylinder(r=(radius/2-centerradius/2+armtickness/2)+(0)-(armtickness),r1=(radius/2-centerradius/2+armtickness/2)+(0)-(armtickness),h=height+0.002,$fn=64);
  }
 }
 function node_tube0_inobject_matrix(i=0,j=0,k=0,l=0,m=0,n=0) = translate([0,0,0]);
 module node_tube0_inobject(i=0,j=0,k=0,l=0,m=0,n=0)
 {
  translate([0,0,-0.001]) cylinder(r=radius-(outtickness),r1=radius-(outtickness),h=height+0.002,$fn=128);
 }
 function node_tube0_outobject_matrix(i=0,j=0,k=0,l=0,m=0,n=0) = translate([0,0,0]);
 module node_tube0_outobject(i=0,j=0,k=0,l=0,m=0,n=0)
 {
   cylinder(r=radius,r1=radius,h=height,$fn=128);
 }
 function node_tube0_holeobject_matrix(i=0,j=0,k=0,l=0,m=0,n=0) = translate([0,0,0]);
 module node_tube0_holeobject(i=0,j=0,k=0,l=0,m=0,n=0)
 {
  translate([0,0,-0.001]) cylinder(r=(radius)+(0)-(outtickness),r1=(radius)+(0)-(outtickness),h=height+0.002,$fn=128);
 }
 function node_tube0_matrix(i=0,j=0,k=0,l=0,m=0,n=0) = translate([0,0,0]);
 module node_tube0(i=0,j=0,k=0,l=0,m=0,n=0)
 {
  difference()
  {
    cylinder(r=radius,r1=radius,h=height,$fn=128);
   translate([0,0,-0.001]) cylinder(r=(radius)+(0)-(outtickness),r1=(radius)+(0)-(outtickness),h=height+0.002,$fn=128);
  }
 }
 function node_for_matrix(i=0,j=0,k=0,l=0,m=0,n=0) = node_rotate_matrix(i=i,j=j,k=k,l=l,m=m,n=n);
 module node_for(i=0,j=0,k=0,l=0,m=0,n=0)
 {
  for(i=[0:360/armcount:360])
  {
   node_rotate(i,j,k,l,m,n);
  }
 }
 function node_rotate_matrix(i=0,j=0,k=0,l=0,m=0,n=0) = rotate([0,0,i])*node_boolean_matrix(i=i,j=j,k=k,l=l,m=m,n=n);
 module node_rotate(i=0,j=0,k=0,l=0,m=0,n=0)
 {
  rotate([0,0,i])node_boolean(i,j,k,l,m,n);
 }
 function node_boolean0_matrix(i=0,j=0,k=0,l=0,m=0,n=0) = node_for_matrix(i=i,j=j,k=k,l=l,m=m,n=n);
 module node_boolean0(i=0,j=0,k=0,l=0,m=0,n=0)
 {
  union()
  {
   node_for(i,j,k,l,m,n);
   node_tube0(i,j,k,l,m,n);
   node_cylinder(i,j,k,l,m,n);
   node_for0(i,j,k,l,m,n);
  }
 }
 function node_cube0_matrix(i=0,j=0,k=0,l=0,m=0,n=0) = translate([radius-0.1,0,height/2]);
 module node_cube0(i=0,j=0,k=0,l=0,m=0,n=0)
 {
  translate([radius-0.1,0,height/2])cube([0.1,griptickness,height],center=true);
 }
 function node_for0_matrix(i=0,j=0,k=0,l=0,m=0,n=0) = node_rotate0_matrix(i=i,j=j,k=k,l=l,m=m,n=n);
 module node_for0(i=0,j=0,k=0,l=0,m=0,n=0)
 {
  for(i=[0:360/gripcount:360])
  {
   node_rotate0(i,j,k,l,m,n);
  }
 }
 function node_rotate0_matrix(i=0,j=0,k=0,l=0,m=0,n=0) = rotate([0,0,i])*node_hull_matrix(i=i,j=j,k=k,l=l,m=m,n=n);
 module node_rotate0(i=0,j=0,k=0,l=0,m=0,n=0)
 {
  rotate([0,0,i])node_hull(i,j,k,l,m,n);
 }
 function node_cube1_matrix(i=0,j=0,k=0,l=0,m=0,n=0) = translate([radius+gripsize,0,0]);
 module node_cube1(i=0,j=0,k=0,l=0,m=0,n=0)
 {
  translate([radius+gripsize,0,0])cube([0.1,0.1,0.1],center=false);
 }
 function node_hull_matrix(i=0,j=0,k=0,l=0,m=0,n=0) = node_cube0_matrix(i=i,j=j,k=k,l=l,m=m,n=n);
 module node_hull(i=0,j=0,k=0,l=0,m=0,n=0)
 {
  hull()
  {
   node_cube0(i,j,k,l,m,n);
   node_cube1(i,j,k,l,m,n);
  }
 }
 function node_cylinder_matrix(i=0,j=0,k=0,l=0,m=0,n=0) = translate([0,0,0]);
 module node_cylinder(i=0,j=0,k=0,l=0,m=0,n=0)
 {
  cylinder(r=centerradius,r1=centerradius,h=height,center=false,$fn=(16+centerradius*3.14116));
 }
 function node_cylinder0_matrix(i=0,j=0,k=0,l=0,m=0,n=0) = translate([0,0,-0.1]);
 module node_cylinder0(i=0,j=0,k=0,l=0,m=0,n=0)
 {
  translate([0,0,-0.1])cylinder(r=axisradius,r1=axisradius,h=height+0.2,center=false,$fn=(16+axisradius*3.14116));
 }
 function node_boolean1_matrix(i=0,j=0,k=0,l=0,m=0,n=0) = node_boolean0_matrix(i=i,j=j,k=k,l=l,m=m,n=n);
 module node_boolean1(i=0,j=0,k=0,l=0,m=0,n=0)
 {
  difference()
  {
   node_boolean0(i,j,k,l,m,n);
   node_cylinder0(i,j,k,l,m,n);
  }
 }
 node_boolean1();
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
robotwheel();


/*BEGINGRAPHSCAD{
    "nodes": [
        {
            "name": "node_cube",
            "inputplugs": [
                {
                    "type": "str",
                    "name": "sizex",
                    "value": "(radius-outtickness)*2-centerradius/2"
                },
                {
                    "type": "str",
                    "name": "sizey",
                    "value": "radius+2"
                },
                {
                    "type": "str",
                    "name": "sizez",
                    "value": "height+2"
                },
                {
                    "type": "str",
                    "name": "tx",
                    "value": "-radius"
                },
                {
                    "type": "str",
                    "name": "ty",
                    "value": "0"
                },
                {
                    "type": "str",
                    "name": "tz",
                    "value": "-1"
                },
                {
                    "type": "str",
                    "name": "center",
                    "value": "false",
                    "combo": [
                        "true",
                        "false"
                    ]
                }
            ],
            "typename": "Node_cube",
            "version": 1,
            "y": -179.88914603160515,
            "x": -768.5579254941285
        },
        {
            "name": "node_boolean",
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
                    "type": "str",
                    "name": "tx",
                    "value": "(radius+centerradius)/2-armtickness/2"
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
                    "connection": "node_tube.object",
                    "type": "object",
                    "name": "object1",
                    "value": ""
                },
                {
                    "connection": "node_cube.object",
                    "type": "object",
                    "name": "object2",
                    "value": ""
                },
                {
                    "type": "object",
                    "name": "object3",
                    "value": ""
                },
                {
                    "type": "object",
                    "name": "object4",
                    "value": ""
                },
                {
                    "type": "object",
                    "name": "object5",
                    "value": ""
                },
                {
                    "type": "object",
                    "name": "object6",
                    "value": ""
                },
                {
                    "type": "object",
                    "name": "object7",
                    "value": ""
                },
                {
                    "type": "object",
                    "name": "object8",
                    "value": ""
                }
            ],
            "typename": "Node_boolean",
            "version": 1,
            "y": -485.0367832031264,
            "x": -364.936504237814
        },
        {
            "name": "node_tube",
            "inputplugs": [
                {
                    "type": "str",
                    "name": "radius",
                    "value": "radius/2-centerradius/2+armtickness/2"
                },
                {
                    "type": "str",
                    "name": "radius2",
                    "value": ""
                },
                {
                    "type": "str",
                    "name": "height",
                    "value": "height"
                },
                {
                    "type": "str",
                    "name": "tx",
                    "value": "0"
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
                    "name": "tickness",
                    "value": "armtickness"
                },
                {
                    "type": "str",
                    "name": "holemargin",
                    "value": "0"
                },
                {
                    "type": "str",
                    "name": "$fn",
                    "value": "64"
                }
            ],
            "typename": "Node_tube",
            "version": 1,
            "y": -444.81055198148874,
            "x": -778.6005115973345
        },
        {
            "name": "node_tube0",
            "inputplugs": [
                {
                    "type": "str",
                    "name": "radius",
                    "value": "radius"
                },
                {
                    "type": "str",
                    "name": "radius2",
                    "value": ""
                },
                {
                    "type": "str",
                    "name": "height",
                    "value": "height"
                },
                {
                    "type": "str",
                    "name": "tx",
                    "value": "0"
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
                    "name": "tickness",
                    "value": "outtickness"
                },
                {
                    "type": "str",
                    "name": "holemargin",
                    "value": "0"
                },
                {
                    "type": "str",
                    "name": "$fn",
                    "value": "128"
                }
            ],
            "typename": "Node_tube",
            "version": 1,
            "y": -226.99678320312637,
            "x": -179.08959374999938
        },
        {
            "name": "node_for",
            "inputplugs": [
                {
                    "connection": "node_rotate.object",
                    "type": "object",
                    "name": "object",
                    "value": ""
                },
                {
                    "type": "str",
                    "name": "variablename",
                    "value": "i",
                    "combo": [
                        "i",
                        "j",
                        "k",
                        "l",
                        "m",
                        "n"
                    ]
                },
                {
                    "type": "str",
                    "name": "start",
                    "value": "0"
                },
                {
                    "type": "str",
                    "name": "end",
                    "value": "360"
                },
                {
                    "type": "str",
                    "name": "step",
                    "value": "360/armcount"
                }
            ],
            "typename": "Node_for",
            "version": 1,
            "y": -422.9467832031263,
            "x": 57.16040625000062
        },
        {
            "name": "node_rotate",
            "inputplugs": [
                {
                    "connection": "node_boolean.object",
                    "type": "object",
                    "name": "object",
                    "value": ""
                },
                {
                    "type": "str",
                    "name": "rx",
                    "value": "0"
                },
                {
                    "type": "str",
                    "name": "ry",
                    "value": "0"
                },
                {
                    "type": "str",
                    "name": "rz",
                    "value": "i"
                },
                {
                    "type": "str",
                    "name": "space",
                    "value": "world",
                    "combo": [
                        "world",
                        "object",
                        "local"
                    ]
                }
            ],
            "typename": "Node_rotate",
            "version": 1,
            "y": -445.6967832031263,
            "x": -152.13959374999968
        },
        {
            "name": "node_param",
            "inputplugs": [
                {
                    "type": "param",
                    "name": "previousparam",
                    "value": ""
                },
                {
                    "type": "str",
                    "name": "name",
                    "value": "radius"
                },
                {
                    "type": "str",
                    "name": "string",
                    "value": "26.0"
                }
            ],
            "typename": "Node_param",
            "version": 1,
            "y": -747.8776920938535,
            "x": -1097.4151963476356
        },
        {
            "name": "node_param0",
            "inputplugs": [
                {
                    "connection": "node_param.nextparam",
                    "type": "param",
                    "name": "previousparam",
                    "value": ""
                },
                {
                    "type": "str",
                    "name": "name",
                    "value": "height"
                },
                {
                    "type": "str",
                    "name": "string",
                    "value": "5.0"
                }
            ],
            "typename": "Node_param",
            "version": 1,
            "y": -734.914755056581,
            "x": -822.3232602358175
        },
        {
            "name": "node_param1",
            "inputplugs": [
                {
                    "connection": "node_param0.nextparam",
                    "type": "param",
                    "name": "previousparam",
                    "value": ""
                },
                {
                    "type": "str",
                    "name": "name",
                    "value": "centerradius"
                },
                {
                    "type": "str",
                    "name": "string",
                    "value": "6.0"
                }
            ],
            "typename": "Node_param",
            "version": 1,
            "y": -715.1895386075133,
            "x": -540.214389715777
        },
        {
            "name": "node_param2",
            "inputplugs": [
                {
                    "connection": "node_param1.nextparam",
                    "type": "param",
                    "name": "previousparam",
                    "value": ""
                },
                {
                    "type": "str",
                    "name": "name",
                    "value": "outtickness"
                },
                {
                    "type": "str",
                    "name": "string",
                    "value": "1.0"
                }
            ],
            "typename": "Node_param",
            "version": 1,
            "y": -703.0620208339628,
            "x": -266.57040768437616
        },
        {
            "name": "node_param3",
            "inputplugs": [
                {
                    "connection": "node_param8.nextparam",
                    "type": "param",
                    "name": "previousparam",
                    "value": ""
                },
                {
                    "type": "str",
                    "name": "name",
                    "value": "armtickness"
                },
                {
                    "type": "str",
                    "name": "string",
                    "value": "0.5"
                }
            ],
            "typename": "Node_param",
            "version": 1,
            "y": -705.2538829394261,
            "x": 173.6546100399636
        },
        {
            "name": "node_boolean0",
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
                    "type": "str",
                    "name": "tx",
                    "value": "0"
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
                    "connection": "node_for.object",
                    "type": "object",
                    "name": "object1",
                    "value": ""
                },
                {
                    "connection": "node_tube0.object",
                    "type": "object",
                    "name": "object2",
                    "value": ""
                },
                {
                    "connection": "node_cylinder.object",
                    "type": "object",
                    "name": "object3",
                    "value": ""
                },
                {
                    "connection": "node_for0.object",
                    "type": "object",
                    "name": "object4",
                    "value": ""
                },
                {
                    "type": "object",
                    "name": "object5",
                    "value": ""
                },
                {
                    "type": "object",
                    "name": "object6",
                    "value": ""
                },
                {
                    "type": "object",
                    "name": "object7",
                    "value": ""
                },
                {
                    "type": "object",
                    "name": "object8",
                    "value": ""
                }
            ],
            "typename": "Node_boolean",
            "version": 1,
            "y": -330.95428320312635,
            "x": 478.1479062500007
        },
        {
            "name": "node_param4",
            "inputplugs": [
                {
                    "connection": "node_param3.nextparam",
                    "type": "param",
                    "name": "previousparam",
                    "value": ""
                },
                {
                    "type": "str",
                    "name": "name",
                    "value": "axisradius"
                },
                {
                    "type": "str",
                    "name": "string",
                    "value": "2.0"
                }
            ],
            "typename": "Node_param",
            "version": 1,
            "y": -695.9596121087113,
            "x": 376.5866143245805
        },
        {
            "name": "node_param5",
            "inputplugs": [
                {
                    "connection": "node_param4.nextparam",
                    "type": "param",
                    "name": "previousparam",
                    "value": ""
                },
                {
                    "type": "str",
                    "name": "name",
                    "value": "gripcount"
                },
                {
                    "type": "str",
                    "name": "string",
                    "value": "16.0"
                }
            ],
            "typename": "Node_param",
            "version": 1,
            "y": -689.2126993334373,
            "x": 634.1047843501382
        },
        {
            "name": "node_param6",
            "inputplugs": [
                {
                    "connection": "node_param5.nextparam",
                    "type": "param",
                    "name": "previousparam",
                    "value": ""
                },
                {
                    "type": "str",
                    "name": "name",
                    "value": "griptickness"
                },
                {
                    "type": "str",
                    "name": "string",
                    "value": "4.0"
                }
            ],
            "typename": "Node_param",
            "version": 1,
            "y": -684.3855332031262,
            "x": 885.5073055352237
        },
        {
            "name": "node_cube0",
            "inputplugs": [
                {
                    "type": "str",
                    "name": "sizex",
                    "value": "0.1"
                },
                {
                    "type": "str",
                    "name": "sizey",
                    "value": "griptickness"
                },
                {
                    "type": "str",
                    "name": "sizez",
                    "value": "height"
                },
                {
                    "type": "str",
                    "name": "tx",
                    "value": "radius-0.1"
                },
                {
                    "type": "str",
                    "name": "ty",
                    "value": "0"
                },
                {
                    "type": "str",
                    "name": "tz",
                    "value": "height/2"
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
            "typename": "Node_cube",
            "version": 1,
            "y": 63.92807011535865,
            "x": -632.5710794064476
        },
        {
            "name": "node_for0",
            "inputplugs": [
                {
                    "connection": "node_rotate0.object",
                    "type": "object",
                    "name": "object",
                    "value": ""
                },
                {
                    "type": "str",
                    "name": "variablename",
                    "value": "i",
                    "combo": [
                        "i",
                        "j",
                        "k",
                        "l",
                        "m",
                        "n"
                    ]
                },
                {
                    "type": "str",
                    "name": "start",
                    "value": "0"
                },
                {
                    "type": "str",
                    "name": "end",
                    "value": "360"
                },
                {
                    "type": "str",
                    "name": "step",
                    "value": "360/gripcount"
                }
            ],
            "typename": "Node_for",
            "version": 1,
            "y": 265.4558730468732,
            "x": 142.29321874999977
        },
        {
            "name": "node_rotate0",
            "inputplugs": [
                {
                    "connection": "node_hull.object",
                    "type": "object",
                    "name": "object",
                    "value": ""
                },
                {
                    "type": "str",
                    "name": "rx",
                    "value": "0"
                },
                {
                    "type": "str",
                    "name": "ry",
                    "value": "0"
                },
                {
                    "type": "str",
                    "name": "rz",
                    "value": "i"
                },
                {
                    "type": "str",
                    "name": "space",
                    "value": "world",
                    "combo": [
                        "world",
                        "object",
                        "local"
                    ]
                }
            ],
            "typename": "Node_rotate",
            "version": 1,
            "y": 223.12581278521895,
            "x": -158.8920500436384
        },
        {
            "name": "node_cube1",
            "inputplugs": [
                {
                    "type": "str",
                    "name": "sizex",
                    "value": "0.1"
                },
                {
                    "type": "str",
                    "name": "sizey",
                    "value": "0.1"
                },
                {
                    "type": "str",
                    "name": "sizez",
                    "value": "0.1"
                },
                {
                    "type": "str",
                    "name": "tx",
                    "value": "radius+gripsize"
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
                    "value": "false",
                    "combo": [
                        "true",
                        "false"
                    ]
                }
            ],
            "typename": "Node_cube",
            "version": 1,
            "y": 293.9713331938508,
            "x": -629.157880908399
        },
        {
            "name": "node_hull",
            "inputplugs": [
                {
                    "type": "str",
                    "name": "tx",
                    "value": "0"
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
                    "connection": "node_cube0.object",
                    "type": "object",
                    "name": "object1",
                    "value": ""
                },
                {
                    "connection": "node_cube1.object",
                    "type": "object",
                    "name": "object2",
                    "value": ""
                },
                {
                    "type": "object",
                    "name": "object3",
                    "value": ""
                },
                {
                    "type": "object",
                    "name": "object4",
                    "value": ""
                },
                {
                    "type": "object",
                    "name": "object5",
                    "value": ""
                },
                {
                    "type": "object",
                    "name": "object6",
                    "value": ""
                },
                {
                    "type": "object",
                    "name": "object7",
                    "value": ""
                },
                {
                    "type": "object",
                    "name": "object8",
                    "value": ""
                }
            ],
            "typename": "Node_hull",
            "version": 1,
            "y": 177.399033188457,
            "x": -388.3719170635936
        },
        {
            "name": "node_param7",
            "inputplugs": [
                {
                    "connection": "node_param6.nextparam",
                    "type": "param",
                    "name": "previousparam",
                    "value": ""
                },
                {
                    "type": "str",
                    "name": "name",
                    "value": "gripsize"
                },
                {
                    "type": "str",
                    "name": "string",
                    "value": "4.0"
                }
            ],
            "typename": "Node_param",
            "version": 1,
            "y": -679.6836459917721,
            "x": 1133.5329097272047
        },
        {
            "name": "node_cylinder",
            "inputplugs": [
                {
                    "type": "str",
                    "name": "radius",
                    "value": "centerradius"
                },
                {
                    "type": "str",
                    "name": "radius2",
                    "value": ""
                },
                {
                    "type": "str",
                    "name": "height",
                    "value": "height"
                },
                {
                    "type": "str",
                    "name": "center",
                    "value": "false",
                    "combo": [
                        "true",
                        "false"
                    ]
                },
                {
                    "type": "str",
                    "name": "tx",
                    "value": "0"
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
                    "name": "$fn",
                    "value": ""
                }
            ],
            "typename": "Node_cylinder",
            "version": 1,
            "y": -59.71309739616447,
            "x": 66.74726509139748
        },
        {
            "name": "node_cylinder0",
            "inputplugs": [
                {
                    "type": "str",
                    "name": "radius",
                    "value": "axisradius"
                },
                {
                    "type": "str",
                    "name": "radius2",
                    "value": ""
                },
                {
                    "type": "str",
                    "name": "height",
                    "value": "height+0.2"
                },
                {
                    "type": "str",
                    "name": "center",
                    "value": "false",
                    "combo": [
                        "true",
                        "false"
                    ]
                },
                {
                    "type": "str",
                    "name": "tx",
                    "value": "0"
                },
                {
                    "type": "str",
                    "name": "ty",
                    "value": "0"
                },
                {
                    "type": "str",
                    "name": "tz",
                    "value": "-0.1"
                },
                {
                    "type": "str",
                    "name": "$fn",
                    "value": ""
                }
            ],
            "typename": "Node_cylinder",
            "version": 1,
            "y": -31.479002121744543,
            "x": 490.5440188957583
        },
        {
            "name": "node_boolean1",
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
                    "type": "str",
                    "name": "tx",
                    "value": "0"
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
                    "connection": "node_boolean0.object",
                    "type": "object",
                    "name": "object1",
                    "value": ""
                },
                {
                    "connection": "node_cylinder0.object",
                    "type": "object",
                    "name": "object2",
                    "value": ""
                },
                {
                    "type": "object",
                    "name": "object3",
                    "value": ""
                },
                {
                    "type": "object",
                    "name": "object4",
                    "value": ""
                },
                {
                    "type": "object",
                    "name": "object5",
                    "value": ""
                },
                {
                    "type": "object",
                    "name": "object6",
                    "value": ""
                },
                {
                    "type": "object",
                    "name": "object7",
                    "value": ""
                },
                {
                    "type": "object",
                    "name": "object8",
                    "value": ""
                }
            ],
            "typename": "Node_boolean",
            "version": 1,
            "y": -187.0348281104893,
            "x": 791.2626559023986
        },
        {
            "name": "node_param8",
            "inputplugs": [
                {
                    "connection": "node_param2.nextparam",
                    "type": "param",
                    "name": "previousparam",
                    "value": ""
                },
                {
                    "type": "str",
                    "name": "name",
                    "value": "armcount"
                },
                {
                    "type": "str",
                    "name": "string",
                    "value": "10.0"
                }
            ],
            "typename": "Node_param",
            "version": 1,
            "y": -724.1403072157696,
            "x": -27.07277022280971
        }
    ],
    "version": 2
}ENDGRAPHSCAD*/