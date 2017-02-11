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
module graphscadlogo()
{
 function node_text_matrix(i=0,j=0,k=0,l=0,m=0,n=0) = translate([0,0,]);
 module node_text(i=0,j=0,k=0,l=0,m=0,n=0)
 {
  translate([0,0,])text(text="G",size=10,valign="center");
 }
 function node_linearextrude_matrix(i=0,j=0,k=0,l=0,m=0,n=0) = translate([0,0,0]);
 module node_linearextrude(i=0,j=0,k=0,l=0,m=0,n=0)
 {
  linear_extrude(height=17,center=true,convexity=1,twist=0,slices=1,scale=1)
  {
   node_text(i,j,k,l,m,n);
  }
 }
 function node_rotate_matrix(i=0,j=0,k=0,l=0,m=0,n=0) = rotate([90,0,0])*node_linearextrude_matrix(i=i,j=j,k=k,l=l,m=m,n=n);
 module node_rotate(i=0,j=0,k=0,l=0,m=0,n=0)
 {
  rotate([90,0,0])node_linearextrude(i,j,k,l,m,n);
 }
 function node_translate_matrix(i=0,j=0,k=0,l=0,m=0,n=0) = onlytranslate(node_rotate_matrix(i=i,j=j,k=k,l=l,m=m,n=n))*translate([-5.2,0,-0.1])*negonlytranslate(node_rotate_matrix(i=i,j=j,k=k,l=l,m=m,n=n))*node_rotate_matrix(i=i,j=j,k=k,l=l,m=m,n=n);
 module node_translate(i=0,j=0,k=0,l=0,m=0,n=0)
 {
  multmatrix(m=onlytranslate(node_rotate_matrix(i=i,j=j,k=k,l=l,m=m,n=n))*translate([-5.2,0,-0.1])*negonlytranslate(node_rotate_matrix(i=i,j=j,k=k,l=l,m=m,n=n)))node_rotate(i,j,k,l,m,n);
 }
 function node_text0_matrix(i=0,j=0,k=0,l=0,m=0,n=0) = translate([0,0,]);
 module node_text0(i=0,j=0,k=0,l=0,m=0,n=0)
 {
  translate([0,0,])text(text="S",size=10,valign="center");
 }
 function node_linearextrude0_matrix(i=0,j=0,k=0,l=0,m=0,n=0) = translate([0,0,0]);
 module node_linearextrude0(i=0,j=0,k=0,l=0,m=0,n=0)
 {
  linear_extrude(height=17,center=true,convexity=1,twist=0,slices=1,scale=1)
  {
   node_text0(i,j,k,l,m,n);
  }
 }
 function node_rotate0_matrix(i=0,j=0,k=0,l=0,m=0,n=0) = rotate([90,0,90])*node_linearextrude0_matrix(i=i,j=j,k=k,l=l,m=m,n=n);
 module node_rotate0(i=0,j=0,k=0,l=0,m=0,n=0)
 {
  rotate([90,0,90])node_linearextrude0(i,j,k,l,m,n);
 }
 function node_translate0_matrix(i=0,j=0,k=0,l=0,m=0,n=0) = translate([0,-5.2,-0.1])*node_rotate0_matrix(i=i,j=j,k=k,l=l,m=m,n=n);
 module node_translate0(i=0,j=0,k=0,l=0,m=0,n=0)
 {
  translate([0,-5.2,-0.1])node_rotate0(i,j,k,l,m,n);
 }
 function node_boolean_matrix(i=0,j=0,k=0,l=0,m=0,n=0) = node_translate_matrix(i=i,j=j,k=k,l=l,m=m,n=n);
 module node_boolean(i=0,j=0,k=0,l=0,m=0,n=0)
 {
  union()
  {
   node_translate(i,j,k,l,m,n);
   node_translate0(i,j,k,l,m,n);
  }
 }
 function node_scale_matrix(i=0,j=0,k=0,l=0,m=0,n=0) = scale([1,0.1,1])*node_translate_matrix(i=i,j=j,k=k,l=l,m=m,n=n);
 module node_scale(i=0,j=0,k=0,l=0,m=0,n=0)
 {
  scale([1,0.1,1])node_translate(i,j,k,l,m,n);
 }
 function node_translate1_matrix(i=0,j=0,k=0,l=0,m=0,n=0) = translate([0,-10,0])*node_scale_matrix(i=i,j=j,k=k,l=l,m=m,n=n);
 module node_translate1(i=0,j=0,k=0,l=0,m=0,n=0)
 {
  translate([0,-10,0])node_scale(i,j,k,l,m,n);
 }
 function node_color_matrix(i=0,j=0,k=0,l=0,m=0,n=0) = node_translate1_matrix(i=i,j=j,k=k,l=l,m=m,n=n);
 module node_color(i=0,j=0,k=0,l=0,m=0,n=0)
 {
  {
   color([1,0,0,1])node_translate1(i,j,k,l,m,n);
  }
 }
 function node_scale0_matrix(i=0,j=0,k=0,l=0,m=0,n=0) = scale([0.1,1,1])*node_translate0_matrix(i=i,j=j,k=k,l=l,m=m,n=n);
 module node_scale0(i=0,j=0,k=0,l=0,m=0,n=0)
 {
  scale([0.1,1,1])node_translate0(i,j,k,l,m,n);
 }
 function node_translate2_matrix(i=0,j=0,k=0,l=0,m=0,n=0) = translate([10,0,0])*node_scale0_matrix(i=i,j=j,k=k,l=l,m=m,n=n);
 module node_translate2(i=0,j=0,k=0,l=0,m=0,n=0)
 {
  translate([10,0,0])node_scale0(i,j,k,l,m,n);
 }
 function node_color0_matrix(i=0,j=0,k=0,l=0,m=0,n=0) = node_translate2_matrix(i=i,j=j,k=k,l=l,m=m,n=n);
 module node_color0(i=0,j=0,k=0,l=0,m=0,n=0)
 {
  {
   color([1,0,0,1])node_translate2(i,j,k,l,m,n);
  }
 }
 function node_sphere_matrix(i=0,j=0,k=0,l=0,m=0,n=0) = translate([0,0,0]);
 module node_sphere(i=0,j=0,k=0,l=0,m=0,n=0)
 {
   sphere(r=8,$fn=100);
 }
 function node_boolean0_matrix(i=0,j=0,k=0,l=0,m=0,n=0) = translate([0,0,0]);
 module node_boolean0(i=0,j=0,k=0,l=0,m=0,n=0)
 {
  difference()
  {
   node_boolean(i,j,k,l,m,n);
  }
 }
 node_color();
 node_color0();
 node_sphere();
 node_boolean0();
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
graphscadlogo();


/*BEGINGRAPHSCAD{
    "nodes": [
        {
            "name": "node_text",
            "inputplugs": [
                {
                    "type": "str",
                    "name": "text",
                    "value": "G"
                },
                {
                    "type": "str",
                    "name": "font",
                    "value": ""
                },
                {
                    "type": "str",
                    "name": "size",
                    "value": "10"
                },
                {
                    "type": "str",
                    "name": "valign",
                    "value": "center",
                    "combo": [
                        "center",
                        "top",
                        "bottom"
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
                }
            ],
            "typename": "Node_text",
            "version": 1,
            "y": -309.70463876158715,
            "x": -1569.7132224768254
        },
        {
            "name": "node_linearextrude",
            "inputplugs": [
                {
                    "connection": "node_text.object2d",
                    "type": "object2d",
                    "name": "object2d",
                    "value": ""
                },
                {
                    "type": "str",
                    "name": "height",
                    "value": "17"
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
                    "value": "1"
                }
            ],
            "typename": "Node_linearextrude",
            "version": 1,
            "y": -307.9916950472499,
            "x": -1338.7936871433728
        },
        {
            "name": "node_rotate",
            "inputplugs": [
                {
                    "connection": "node_linearextrude.object",
                    "type": "object",
                    "name": "object",
                    "value": ""
                },
                {
                    "type": "str",
                    "name": "rx",
                    "value": "90"
                },
                {
                    "type": "str",
                    "name": "ry",
                    "value": "0"
                },
                {
                    "type": "str",
                    "name": "rz",
                    "value": "0"
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
            "y": -277.0834555233545,
            "x": -1072.4717925240752
        },
        {
            "name": "node_translate",
            "inputplugs": [
                {
                    "connection": "node_rotate.object",
                    "type": "object",
                    "name": "object",
                    "value": ""
                },
                {
                    "type": "str",
                    "name": "tx",
                    "value": "-5.2"
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
                    "name": "space",
                    "value": "local",
                    "combo": [
                        "world",
                        "object",
                        "local"
                    ]
                }
            ],
            "typename": "Node_translate",
            "version": 1,
            "y": -267.6622938569884,
            "x": -840.409658380883
        },
        {
            "name": "node_text0",
            "inputplugs": [
                {
                    "type": "str",
                    "name": "text",
                    "value": "S"
                },
                {
                    "type": "str",
                    "name": "font",
                    "value": ""
                },
                {
                    "type": "str",
                    "name": "size",
                    "value": "10"
                },
                {
                    "type": "str",
                    "name": "valign",
                    "value": "center",
                    "combo": [
                        "center",
                        "top",
                        "bottom"
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
                }
            ],
            "typename": "Node_text",
            "version": 1,
            "y": -6.459737571325718,
            "x": -1566.7964548100988
        },
        {
            "name": "node_linearextrude0",
            "inputplugs": [
                {
                    "connection": "node_text0.object2d",
                    "type": "object2d",
                    "name": "object2d",
                    "value": ""
                },
                {
                    "type": "str",
                    "name": "height",
                    "value": "17"
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
                    "value": "1"
                }
            ],
            "typename": "Node_linearextrude",
            "version": 1,
            "y": -5.8065261902617635,
            "x": -1322.16917995275
        },
        {
            "name": "node_rotate0",
            "inputplugs": [
                {
                    "connection": "node_linearextrude0.object",
                    "type": "object",
                    "name": "object",
                    "value": ""
                },
                {
                    "type": "str",
                    "name": "rx",
                    "value": "90"
                },
                {
                    "type": "str",
                    "name": "ry",
                    "value": "0"
                },
                {
                    "type": "str",
                    "name": "rz",
                    "value": "90"
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
            "y": 2.681001952569744,
            "x": -1052.053412286023
        },
        {
            "name": "node_translate0",
            "inputplugs": [
                {
                    "connection": "node_rotate0.object",
                    "type": "object",
                    "name": "object",
                    "value": ""
                },
                {
                    "type": "str",
                    "name": "tx",
                    "value": "0"
                },
                {
                    "type": "str",
                    "name": "ty",
                    "value": "-5.2"
                },
                {
                    "type": "str",
                    "name": "tz",
                    "value": "-0.1"
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
            "typename": "Node_translate",
            "version": 1,
            "y": 7.633473809738462,
            "x": -819.9310530001799
        },
        {
            "name": "node_boolean",
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
                    "connection": "node_translate.object",
                    "type": "object",
                    "name": "object1",
                    "value": ""
                },
                {
                    "connection": "node_translate0.object",
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
            "y": -250.36148437500023,
            "x": -34.650656249999884
        },
        {
            "name": "node_scale",
            "inputplugs": [
                {
                    "connection": "node_translate.object",
                    "type": "object",
                    "name": "object",
                    "value": ""
                },
                {
                    "type": "str",
                    "name": "sx",
                    "value": "1"
                },
                {
                    "type": "str",
                    "name": "sy",
                    "value": "0.1"
                },
                {
                    "type": "str",
                    "name": "sz",
                    "value": "1"
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
            "typename": "Node_scale",
            "version": 1,
            "y": -483.74320312500095,
            "x": -653.6456562499995
        },
        {
            "name": "node_translate1",
            "inputplugs": [
                {
                    "connection": "node_scale.object",
                    "type": "object",
                    "name": "object",
                    "value": ""
                },
                {
                    "type": "str",
                    "name": "tx",
                    "value": "0"
                },
                {
                    "type": "str",
                    "name": "ty",
                    "value": "-10"
                },
                {
                    "type": "str",
                    "name": "tz",
                    "value": "0"
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
            "typename": "Node_translate",
            "version": 1,
            "y": -466.1432031250009,
            "x": -452.04565624999975
        },
        {
            "name": "node_color",
            "inputplugs": [
                {
                    "connection": "node_translate1.object",
                    "type": "object",
                    "name": "object",
                    "value": ""
                },
                {
                    "type": "str",
                    "name": "r",
                    "value": "1"
                },
                {
                    "type": "str",
                    "name": "g",
                    "value": "0"
                },
                {
                    "type": "str",
                    "name": "b",
                    "value": "0"
                },
                {
                    "type": "str",
                    "name": "a",
                    "value": "1"
                }
            ],
            "typename": "Node_color",
            "version": 1,
            "y": -469.34320312500097,
            "x": -155.24565624999968
        },
        {
            "name": "node_scale0",
            "inputplugs": [
                {
                    "connection": "node_translate0.object",
                    "type": "object",
                    "name": "object",
                    "value": ""
                },
                {
                    "type": "str",
                    "name": "sx",
                    "value": "0.1"
                },
                {
                    "type": "str",
                    "name": "sy",
                    "value": "1"
                },
                {
                    "type": "str",
                    "name": "sz",
                    "value": "1"
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
            "typename": "Node_scale",
            "version": 1,
            "y": 62.65679687499903,
            "x": -530.4456562499996
        },
        {
            "name": "node_translate2",
            "inputplugs": [
                {
                    "connection": "node_scale0.object",
                    "type": "object",
                    "name": "object",
                    "value": ""
                },
                {
                    "type": "str",
                    "name": "tx",
                    "value": "10"
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
                    "name": "space",
                    "value": "world",
                    "combo": [
                        "world",
                        "object",
                        "local"
                    ]
                }
            ],
            "typename": "Node_translate",
            "version": 1,
            "y": 41.85679687499905,
            "x": -304.04565624999964
        },
        {
            "name": "node_color0",
            "inputplugs": [
                {
                    "connection": "node_translate2.object",
                    "type": "object",
                    "name": "object",
                    "value": ""
                },
                {
                    "type": "str",
                    "name": "r",
                    "value": "1"
                },
                {
                    "type": "str",
                    "name": "g",
                    "value": "0"
                },
                {
                    "type": "str",
                    "name": "b",
                    "value": "0"
                },
                {
                    "type": "str",
                    "name": "a",
                    "value": "1"
                }
            ],
            "typename": "Node_color",
            "version": 1,
            "y": 17.85679687499905,
            "x": -65.64565624999967
        },
        {
            "name": "node_sphere",
            "inputplugs": [
                {
                    "type": "str",
                    "name": "radius",
                    "value": "8"
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
                    "value": "100"
                }
            ],
            "typename": "Node_sphere",
            "version": 1,
            "y": -510.1432031250008,
            "x": 47.954343750000334
        },
        {
            "name": "node_boolean0",
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
                    "type": "object",
                    "name": "object1",
                    "value": ""
                },
                {
                    "connection": "node_boolean.object",
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
            "y": -279.74320312500095,
            "x": 400.7543437500002
        }
    ],
    "version": 2
}ENDGRAPHSCAD*/