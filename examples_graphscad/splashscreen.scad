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
module splashscreen()
{
 function node_text_matrix(i=0,j=0,k=0,l=0,m=0,n=0) = translate([0,0,0]);
 module node_text(i=0,j=0,k=0,l=0,m=0,n=0)
 {
  text(text="GRAPHSCAD",size=10,valign="center");
 }
 function node_linearextrude_matrix(i=0,j=0,k=0,l=0,m=0,n=0) = translate([0,0,0]);
 module node_linearextrude(i=0,j=0,k=0,l=0,m=0,n=0)
 {
  linear_extrude(height=2.5,center=true,convexity=1,twist=0,slices=1,scale=1)
  {
   node_text(i,j,k,l,m,n);
  }
 }
 function node_text0_matrix(i=0,j=0,k=0,l=0,m=0,n=0) = translate([0,0,0]);
 module node_text0(i=0,j=0,k=0,l=0,m=0,n=0)
 {
  text(text="Nodal Editor",size=8,valign="center");
 }
 function node_linearextrude0_matrix(i=0,j=0,k=0,l=0,m=0,n=0) = translate([0,0,0]);
 module node_linearextrude0(i=0,j=0,k=0,l=0,m=0,n=0)
 {
  linear_extrude(height=1,center=true,convexity=1,twist=0,slices=1,scale=1)
  {
   node_text0(i,j,k,l,m,n);
  }
 }
 function node_translate_matrix(i=0,j=0,k=0,l=0,m=0,n=0) = translate([8.9,-10,0])*node_linearextrude0_matrix(i=i,j=j,k=k,l=l,m=m,n=n);
 module node_translate(i=0,j=0,k=0,l=0,m=0,n=0)
 {
  translate([8.9,-10,0])node_linearextrude0(i,j,k,l,m,n);
 }
 function node_translate0_matrix(i=0,j=0,k=0,l=0,m=0,n=0) = translate([33.7,-20,0])*node_linearextrude000_matrix(i=i,j=j,k=k,l=l,m=m,n=n);
 module node_translate0(i=0,j=0,k=0,l=0,m=0,n=0)
 {
  translate([33.7,-20,0])node_linearextrude000(i,j,k,l,m,n);
 }
 function node_linearextrude000_matrix(i=0,j=0,k=0,l=0,m=0,n=0) = translate([0,0,0]);
 module node_linearextrude000(i=0,j=0,k=0,l=0,m=0,n=0)
 {
  linear_extrude(height=1,center=true,convexity=1,twist=0,slices=1,scale=1)
  {
   node_text001(i,j,k,l,m,n);
  }
 }
 function node_text001_matrix(i=0,j=0,k=0,l=0,m=0,n=0) = translate([0,0,0]);
 module node_text001(i=0,j=0,k=0,l=0,m=0,n=0)
 {
  text(text="for",size=8,valign="center");
 }
 function node_text0001_matrix(i=0,j=0,k=0,l=0,m=0,n=0) = translate([0,0,0]);
 module node_text0001(i=0,j=0,k=0,l=0,m=0,n=0)
 {
  text(text="OpenScad",size=8,valign="center");
 }
 function node_linearextrude0000_matrix(i=0,j=0,k=0,l=0,m=0,n=0) = translate([0,0,0]);
 module node_linearextrude0000(i=0,j=0,k=0,l=0,m=0,n=0)
 {
  linear_extrude(height=1,center=true,convexity=1,twist=0,slices=1,scale=1)
  {
   node_text0001(i,j,k,l,m,n);
  }
 }
 function node_translate000_matrix(i=0,j=0,k=0,l=0,m=0,n=0) = translate([12.5,-30,0])*node_linearextrude0000_matrix(i=i,j=j,k=k,l=l,m=m,n=n);
 module node_translate000(i=0,j=0,k=0,l=0,m=0,n=0)
 {
  translate([12.5,-30,0])node_linearextrude0000(i,j,k,l,m,n);
 }
 function node_rotate_matrix(i=0,j=0,k=0,l=0,m=0,n=0) = node_linearextrude_matrix(i=i,j=j,k=k,l=l,m=m,n=n)*rotate([33.2,0,0]);
 module node_rotate(i=0,j=0,k=0,l=0,m=0,n=0)
 {
  multmatrix(m=node_linearextrude_matrix(i=i,j=j,k=k,l=l,m=m,n=n)*rotate([33.2,0,0])*inv4x4(node_linearextrude_matrix(i=i,j=j,k=k,l=l,m=m,n=n)))node_linearextrude(i,j,k,l,m,n);
 }
 function node_translate1_matrix(i=0,j=0,k=0,l=0,m=0,n=0) = translate([0,0,6.4])*node_rotate_matrix(i=i,j=j,k=k,l=l,m=m,n=n);
 module node_translate1(i=0,j=0,k=0,l=0,m=0,n=0)
 {
  translate([0,0,6.4])node_rotate(i,j,k,l,m,n);
 }
 function node_boolean_matrix(i=0,j=0,k=0,l=0,m=0,n=0) = node_translate_matrix(i=i,j=j,k=k,l=l,m=m,n=n);
 module node_boolean(i=0,j=0,k=0,l=0,m=0,n=0)
 {
  union()
  {
   node_translate(i,j,k,l,m,n);
   node_translate0(i,j,k,l,m,n);
   node_translate000(i,j,k,l,m,n);
  }
 }
 function node_scale_matrix(i=0,j=0,k=0,l=0,m=0,n=0) = scale([0.5,0.5,0.5])*node_boolean_matrix(i=i,j=j,k=k,l=l,m=m,n=n);
 module node_scale(i=0,j=0,k=0,l=0,m=0,n=0)
 {
  scale([0.5,0.5,0.5])node_boolean(i,j,k,l,m,n);
 }
 function node_translate2_matrix(i=0,j=0,k=0,l=0,m=0,n=0) = translate([16.1,-5,0])*node_scale_matrix(i=i,j=j,k=k,l=l,m=m,n=n);
 module node_translate2(i=0,j=0,k=0,l=0,m=0,n=0)
 {
  translate([16.1,-5,0])node_scale(i,j,k,l,m,n);
 }
 node_translate1();
 node_translate2();
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
splashscreen();


/*BEGINGRAPHSCAD{
    "nodes": [
        {
            "name": "node_text",
            "inputplugs": [
                {
                    "type": "str",
                    "name": "text",
                    "value": "GRAPHSCAD"
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
                },
                {
                    "type": "str",
                    "name": "tz",
                    "value": "0"
                }
            ],
            "typename": "Node_text",
            "version": 1,
            "y": -665.7653771123257,
            "x": 57.79901623957872
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
                    "value": "2.5"
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
            "y": -649.8454945427803,
            "x": 241.8084618503409
        },
        {
            "name": "node_text0",
            "inputplugs": [
                {
                    "type": "str",
                    "name": "text",
                    "value": "Nodal Editor"
                },
                {
                    "type": "str",
                    "name": "font",
                    "value": ""
                },
                {
                    "type": "str",
                    "name": "size",
                    "value": "8"
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
                },
                {
                    "type": "str",
                    "name": "tz",
                    "value": "0"
                }
            ],
            "typename": "Node_text",
            "version": 1,
            "y": -436.74838720578384,
            "x": 44.51608539845736
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
                    "value": "1"
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
            "y": -434.19242538390176,
            "x": 246.77065998118212
        },
        {
            "name": "node_translate",
            "inputplugs": [
                {
                    "connection": "node_linearextrude0.object",
                    "type": "object",
                    "name": "object",
                    "value": ""
                },
                {
                    "type": "str",
                    "name": "tx",
                    "value": "8.9"
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
            "y": -433.17139851474275,
            "x": 482.8004683456679
        },
        {
            "name": "node_translate0",
            "inputplugs": [
                {
                    "connection": "node_linearextrude000.object",
                    "type": "object",
                    "name": "object",
                    "value": ""
                },
                {
                    "type": "str",
                    "name": "tx",
                    "value": "33.7"
                },
                {
                    "type": "str",
                    "name": "ty",
                    "value": "-20"
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
            "y": -187.87009267362134,
            "x": 464.683679794266
        },
        {
            "name": "node_linearextrude000",
            "inputplugs": [
                {
                    "connection": "node_text001.object2d",
                    "type": "object2d",
                    "name": "object2d",
                    "value": ""
                },
                {
                    "type": "str",
                    "name": "height",
                    "value": "1"
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
            "y": -193.67242538390175,
            "x": 249.73432353258397
        },
        {
            "name": "node_text001",
            "inputplugs": [
                {
                    "type": "str",
                    "name": "text",
                    "value": "for"
                },
                {
                    "type": "str",
                    "name": "font",
                    "value": ""
                },
                {
                    "type": "str",
                    "name": "size",
                    "value": "8"
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
                },
                {
                    "type": "str",
                    "name": "tz",
                    "value": "0"
                }
            ],
            "typename": "Node_text",
            "version": 1,
            "y": -209.19164011404558,
            "x": 35.65340151599014
        },
        {
            "name": "node_text0001",
            "inputplugs": [
                {
                    "type": "str",
                    "name": "text",
                    "value": "OpenScad"
                },
                {
                    "type": "str",
                    "name": "font",
                    "value": ""
                },
                {
                    "type": "str",
                    "name": "size",
                    "value": "8"
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
                },
                {
                    "type": "str",
                    "name": "tz",
                    "value": "0"
                }
            ],
            "typename": "Node_text",
            "version": 1,
            "y": 38.86162947608517,
            "x": 23.455007219765832
        },
        {
            "name": "node_linearextrude0000",
            "inputplugs": [
                {
                    "connection": "node_text0001.object2d",
                    "type": "object2d",
                    "name": "object2d",
                    "value": ""
                },
                {
                    "type": "str",
                    "name": "height",
                    "value": "1"
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
            "y": 33.39658396189273,
            "x": 207.67679829893905
        },
        {
            "name": "node_translate000",
            "inputplugs": [
                {
                    "connection": "node_linearextrude0000.object",
                    "type": "object",
                    "name": "object",
                    "value": ""
                },
                {
                    "type": "str",
                    "name": "tx",
                    "value": "12.5"
                },
                {
                    "type": "str",
                    "name": "ty",
                    "value": "-30"
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
            "y": 62.06010545721989,
            "x": 456.4669470839857
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
                    "value": "33.2"
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
                    "value": "object",
                    "combo": [
                        "world",
                        "object",
                        "local"
                    ]
                }
            ],
            "typename": "Node_rotate",
            "version": 1,
            "y": -656.3523253839016,
            "x": 490.8982223176307
        },
        {
            "name": "node_translate1",
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
                    "value": "6.4"
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
            "y": -636.5565076268925,
            "x": 759.7677799811827
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
                    "tip": "First object in boolean operation",
                    "connection": "node_translate.object",
                    "type": "object",
                    "name": "object1",
                    "value": ""
                },
                {
                    "tip": "a 3D object",
                    "connection": "node_translate0.object",
                    "type": "object",
                    "name": "object2",
                    "value": ""
                },
                {
                    "tip": "a 3D object",
                    "connection": "node_translate000.object",
                    "type": "object",
                    "name": "object3",
                    "value": ""
                },
                {
                    "tip": "a 3D object",
                    "type": "object",
                    "name": "object4",
                    "value": ""
                },
                {
                    "tip": "a 3D object",
                    "type": "object",
                    "name": "object5",
                    "value": ""
                },
                {
                    "tip": "a 3D object",
                    "type": "object",
                    "name": "object6",
                    "value": ""
                },
                {
                    "tip": "a 3D object",
                    "type": "object",
                    "name": "object7",
                    "value": ""
                },
                {
                    "tip": "a 3D object",
                    "type": "object",
                    "name": "object8",
                    "value": ""
                },
                {
                    "tip": "a 3D object",
                    "type": "object",
                    "name": "object9",
                    "value": ""
                },
                {
                    "tip": "a 3D object",
                    "type": "object",
                    "name": "object10",
                    "value": ""
                },
                {
                    "tip": "a 3D object",
                    "type": "object",
                    "name": "object11",
                    "value": ""
                },
                {
                    "tip": "a 3D object",
                    "type": "object",
                    "name": "object12",
                    "value": ""
                },
                {
                    "tip": "a 3D object",
                    "type": "object",
                    "name": "object13",
                    "value": ""
                },
                {
                    "tip": "a 3D object",
                    "type": "object",
                    "name": "object14",
                    "value": ""
                },
                {
                    "tip": "a 3D object",
                    "type": "object",
                    "name": "object15",
                    "value": ""
                },
                {
                    "tip": "a 3D object",
                    "type": "object",
                    "name": "object16",
                    "value": ""
                },
                {
                    "tip": "a 3D object",
                    "type": "object",
                    "name": "object17",
                    "value": ""
                },
                {
                    "tip": "a 3D object",
                    "type": "object",
                    "name": "object18",
                    "value": ""
                },
                {
                    "tip": "a 3D object",
                    "type": "object",
                    "name": "object19",
                    "value": ""
                },
                {
                    "tip": "a 3D object",
                    "type": "object",
                    "name": "object20",
                    "value": ""
                }
            ],
            "typename": "Node_boolean",
            "version": 1,
            "y": -271.88175622502365,
            "x": 755.3940760559483
        },
        {
            "name": "node_scale",
            "inputplugs": [
                {
                    "connection": "node_boolean.object",
                    "type": "object",
                    "name": "object",
                    "value": ""
                },
                {
                    "type": "str",
                    "name": "sx",
                    "value": "0.5"
                },
                {
                    "type": "str",
                    "name": "sy",
                    "value": "0.5"
                },
                {
                    "type": "str",
                    "name": "sz",
                    "value": "0.5"
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
            "y": -231.18056743997684,
            "x": 995.4695227849204
        },
        {
            "name": "node_translate2",
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
                    "value": "16.1"
                },
                {
                    "type": "str",
                    "name": "ty",
                    "value": "-5"
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
            "y": -221.61116183250016,
            "x": 1330.613821850341
        }
    ],
    "version": 2
}ENDGRAPHSCAD*/