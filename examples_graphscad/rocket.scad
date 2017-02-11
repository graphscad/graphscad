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
module rocket(radius=6,tickness=2,coneheight=20,bodyheight=40)
{
 function node_emptysphere_inobject_matrix(i=0,j=0,k=0,l=0,m=0,n=0) = translate([0,0,0]);
 module node_emptysphere_inobject(i=0,j=0,k=0,l=0,m=0,n=0)
 {
  sphere(r=1-tickness,$fn=64);
 }
 function node_emptysphere_outobject_matrix(i=0,j=0,k=0,l=0,m=0,n=0) = translate([0,0,0]);
 module node_emptysphere_outobject(i=0,j=0,k=0,l=0,m=0,n=0)
 {
  sphere(r=1,$fn=64);
 }
 function node_emptysphere_matrix(i=0,j=0,k=0,l=0,m=0,n=0) = translate([0,0,0]);
 module node_emptysphere(i=0,j=0,k=0,l=0,m=0,n=0)
 {
  difference()
  {
   sphere(r=1,$fn=64);
   sphere(r=1-tickness,$fn=64);
  }
 }
 function node_cube_matrix(i=0,j=0,k=0,l=0,m=0,n=0) = translate([0,0,-radius-1]);
 module node_cube(i=0,j=0,k=0,l=0,m=0,n=0)
 {
  translate([0,0,-radius-1])cube([radius*2+2,radius*2+2,radius*2+1],center=true);
 }
 function node_boolean_matrix(i=0,j=0,k=0,l=0,m=0,n=0) = node_emptysphere0_matrix(i=i,j=j,k=k,l=l,m=m,n=n);
 module node_boolean(i=0,j=0,k=0,l=0,m=0,n=0)
 {
  difference()
  {
   node_emptysphere0(i,j,k,l,m,n);
   node_cube(i,j,k,l,m,n);
  }
 }
 function node_scale_matrix(i=0,j=0,k=0,l=0,m=0,n=0) = scale([1,1,coneheight/radius])*node_boolean_matrix(i=i,j=j,k=k,l=l,m=m,n=n);
 module node_scale(i=0,j=0,k=0,l=0,m=0,n=0)
 {
  scale([1,1,coneheight/radius])node_boolean(i,j,k,l,m,n);
 }
 function node_translate_matrix(i=0,j=0,k=0,l=0,m=0,n=0) = translate([0,0,bodyheight])*node_scale_matrix(i=i,j=j,k=k,l=l,m=m,n=n);
 module node_translate(i=0,j=0,k=0,l=0,m=0,n=0)
 {
  translate([0,0,bodyheight])node_scale(i,j,k,l,m,n);
 }
 function node_tube_inobject_matrix(i=0,j=0,k=0,l=0,m=0,n=0) = translate([0,0,0]);
 module node_tube_inobject(i=0,j=0,k=0,l=0,m=0,n=0)
 {
  translate([0,0,-0.001]) cylinder(r=radius-(tickness),r1=radius-radius/4-(tickness),h=bodyheight+0.002,$fn=(16+radius*3.14116));
 }
 function node_tube_outobject_matrix(i=0,j=0,k=0,l=0,m=0,n=0) = translate([0,0,0]);
 module node_tube_outobject(i=0,j=0,k=0,l=0,m=0,n=0)
 {
   cylinder(r=radius,r1=radius-radius/4,h=bodyheight,$fn=(16+radius*3.14116));
 }
 function node_tube_holeobject_matrix(i=0,j=0,k=0,l=0,m=0,n=0) = translate([0,0,0]);
 module node_tube_holeobject(i=0,j=0,k=0,l=0,m=0,n=0)
 {
  translate([0,0,-0.001]) cylinder(r=(radius)+(0)-(tickness),r1=(radius-radius/4)+(0)-(tickness),h=bodyheight+0.002,$fn=(16+radius*3.14116));
 }
 function node_tube_matrix(i=0,j=0,k=0,l=0,m=0,n=0) = translate([0,0,0]);
 module node_tube(i=0,j=0,k=0,l=0,m=0,n=0)
 {
  difference()
  {
    cylinder(r=radius,r1=radius-radius/4,h=bodyheight,$fn=(16+radius*3.14116));
   translate([0,0,-0.001]) cylinder(r=(radius)+(0)-(tickness),r1=(radius-radius/4)+(0)-(tickness),h=bodyheight+0.002,$fn=(16+radius*3.14116));
  }
 }
 function node_scale0_matrix(i=0,j=0,k=0,l=0,m=0,n=0) = scale([radius*2,bodyheight/20,0.75*bodyheight])*node_emptysphere_outobject_matrix(i=i,j=j,k=k,l=l,m=m,n=n);
 module node_scale0(i=0,j=0,k=0,l=0,m=0,n=0)
 {
  scale([radius*2,bodyheight/20,0.75*bodyheight])node_emptysphere_outobject(i,j,k,l,m,n);
 }
 function node_rotate_matrix(i=0,j=0,k=0,l=0,m=0,n=0) = rotate([0,0,90])*node_scale0_matrix(i=i,j=j,k=k,l=l,m=m,n=n);
 module node_rotate(i=0,j=0,k=0,l=0,m=0,n=0)
 {
  rotate([0,0,90])node_scale0(i,j,k,l,m,n);
 }
 function node_boolean0_matrix(i=0,j=0,k=0,l=0,m=0,n=0) = node_scale0_matrix(i=i,j=j,k=k,l=l,m=m,n=n);
 module node_boolean0(i=0,j=0,k=0,l=0,m=0,n=0)
 {
  union()
  {
   node_scale0(i,j,k,l,m,n);
   node_rotate(i,j,k,l,m,n);
   node_translate(i,j,k,l,m,n);
   node_tube(i,j,k,l,m,n);
  }
 }
 function node_cylinder_matrix(i=0,j=0,k=0,l=0,m=0,n=0) = translate([0,0,-100]);
 module node_cylinder(i=0,j=0,k=0,l=0,m=0,n=0)
 {
  translate([0,0,-100])cylinder(r=radius*4,r1=radius*4,h=100,center=false,$fn=(16+radius*4*3.14116));
 }
 function node_boolean1_matrix(i=0,j=0,k=0,l=0,m=0,n=0) = node_boolean0_matrix(i=i,j=j,k=k,l=l,m=m,n=n);
 module node_boolean1(i=0,j=0,k=0,l=0,m=0,n=0)
 {
  difference()
  {
   node_boolean0(i,j,k,l,m,n);
   node_cylinder(i,j,k,l,m,n);
   node_tube_inobject(i,j,k,l,m,n);
  }
 }
 function node_emptysphere0_inobject_matrix(i=0,j=0,k=0,l=0,m=0,n=0) = translate([0,0,0]);
 module node_emptysphere0_inobject(i=0,j=0,k=0,l=0,m=0,n=0)
 {
  sphere(r=radius-tickness,$fn=(16+radius*3.14116));
 }
 function node_emptysphere0_outobject_matrix(i=0,j=0,k=0,l=0,m=0,n=0) = translate([0,0,0]);
 module node_emptysphere0_outobject(i=0,j=0,k=0,l=0,m=0,n=0)
 {
  sphere(r=radius,$fn=(16+radius*3.14116));
 }
 function node_emptysphere0_matrix(i=0,j=0,k=0,l=0,m=0,n=0) = translate([0,0,0]);
 module node_emptysphere0(i=0,j=0,k=0,l=0,m=0,n=0)
 {
  difference()
  {
   sphere(r=radius,$fn=(16+radius*3.14116));
   sphere(r=radius-tickness,$fn=(16+radius*3.14116));
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
rocket();


/*BEGINGRAPHSCAD{
    "nodes": [
        {
            "name": "node_emptysphere",
            "inputplugs": [
                {
                    "type": "str",
                    "name": "radius",
                    "value": "1"
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
                    "value": "tickness"
                },
                {
                    "type": "str",
                    "name": "$fn",
                    "value": "64"
                }
            ],
            "typename": "Node_emptysphere",
            "version": 1,
            "y": 447.9931315612796,
            "x": -632.2147676658624
        },
        {
            "name": "node_cube",
            "inputplugs": [
                {
                    "type": "str",
                    "name": "sizex",
                    "value": "radius*2+2"
                },
                {
                    "type": "str",
                    "name": "sizey",
                    "value": "radius*2+2"
                },
                {
                    "type": "str",
                    "name": "sizez",
                    "value": "radius*2+1"
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
                    "value": "-radius-1"
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
            "y": 855.8948503112803,
            "x": -600.0028145408633
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
                    "connection": "node_emptysphere0.object",
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
            "y": 725.4154753112797,
            "x": -353.7490645408632
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
                    "value": "6"
                }
            ],
            "typename": "Node_param",
            "version": 1,
            "y": 401.02860031128,
            "x": -985.8196895408632
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
                    "value": "tickness"
                },
                {
                    "type": "str",
                    "name": "string",
                    "value": "2"
                }
            ],
            "typename": "Node_param",
            "version": 1,
            "y": 618.8829753112799,
            "x": -994.239064540863
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
                    "value": "1"
                },
                {
                    "type": "str",
                    "name": "sy",
                    "value": "1"
                },
                {
                    "type": "str",
                    "name": "sz",
                    "value": "coneheight/radius"
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
            "y": 749.6504753112797,
            "x": -92.72156454086328
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
                    "value": "coneheight"
                },
                {
                    "type": "str",
                    "name": "string",
                    "value": "20"
                }
            ],
            "typename": "Node_param",
            "version": 1,
            "y": 840.8161003112798,
            "x": -1010.4778145408634
        },
        {
            "name": "node_param2",
            "inputplugs": [
                {
                    "connection": "node_param1.nextparam",
                    "type": "param",
                    "name": "previousparam",
                    "value": "bodyheight"
                },
                {
                    "type": "str",
                    "name": "name",
                    "value": "bodyheight"
                },
                {
                    "type": "str",
                    "name": "string",
                    "value": "40"
                }
            ],
            "typename": "Node_param",
            "version": 1,
            "y": 1048.2317253112797,
            "x": -1015.4434395408632
        },
        {
            "name": "node_translate",
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
                    "value": "0"
                },
                {
                    "type": "str",
                    "name": "tz",
                    "value": "bodyheight"
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
            "y": 756.8504753112799,
            "x": 129.67843545913667
        },
        {
            "name": "node_tube",
            "inputplugs": [
                {
                    "type": "str",
                    "name": "radius",
                    "value": "radius"
                },
                {
                    "type": "str",
                    "name": "radius2",
                    "value": "radius-radius/4"
                },
                {
                    "type": "str",
                    "name": "height",
                    "value": "bodyheight"
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
                    "value": "tickness"
                },
                {
                    "type": "str",
                    "name": "holemargin",
                    "value": "0"
                },
                {
                    "type": "str",
                    "name": "$fn",
                    "value": ""
                }
            ],
            "typename": "Node_tube",
            "version": 1,
            "y": 1045.3297350119115,
            "x": 137.3760761444387
        },
        {
            "name": "node_scale0",
            "inputplugs": [
                {
                    "connection": "node_emptysphere.outobject",
                    "type": "object",
                    "name": "object",
                    "value": ""
                },
                {
                    "type": "str",
                    "name": "sx",
                    "value": "radius*2"
                },
                {
                    "type": "str",
                    "name": "sy",
                    "value": "bodyheight/20"
                },
                {
                    "type": "str",
                    "name": "sz",
                    "value": "0.75*bodyheight"
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
            "y": 421.2854753112802,
            "x": -301.6040645408634
        },
        {
            "name": "node_rotate",
            "inputplugs": [
                {
                    "connection": "node_scale0.object",
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
            "y": 557.9104753112802,
            "x": -97.29156454086342
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
                    "connection": "node_scale0.object",
                    "type": "object",
                    "name": "object1",
                    "value": ""
                },
                {
                    "connection": "node_rotate.object",
                    "type": "object",
                    "name": "object2",
                    "value": ""
                },
                {
                    "connection": "node_translate.object",
                    "type": "object",
                    "name": "object3",
                    "value": ""
                },
                {
                    "connection": "node_tube.object",
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
            "y": 515.5623159334623,
            "x": 823.5213925150429
        },
        {
            "name": "node_cylinder",
            "inputplugs": [
                {
                    "type": "str",
                    "name": "radius",
                    "value": "radius*4"
                },
                {
                    "type": "str",
                    "name": "radius2",
                    "value": ""
                },
                {
                    "type": "str",
                    "name": "height",
                    "value": "100"
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
                    "value": "-100"
                },
                {
                    "type": "str",
                    "name": "$fn",
                    "value": ""
                }
            ],
            "typename": "Node_cylinder",
            "version": 1,
            "y": 1301.2807086295854,
            "x": 738.6758018928604
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
                    "connection": "node_cylinder.object",
                    "type": "object",
                    "name": "object2",
                    "value": ""
                },
                {
                    "connection": "node_tube.inobject",
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
            "y": 919.4543842382418,
            "x": 1101.015506581769
        },
        {
            "name": "node_emptysphere0",
            "inputplugs": [
                {
                    "type": "str",
                    "name": "radius",
                    "value": "radius"
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
                    "value": "tickness"
                },
                {
                    "type": "str",
                    "name": "$fn",
                    "value": ""
                }
            ],
            "typename": "Node_emptysphere",
            "version": 1,
            "y": 652.9555456000004,
            "x": -632.8069747187487
        },
        {
            "name": "node_comment",
            "inputplugs": [
                {
                    "type": "str",
                    "name": "comment",
                    "value": "top of rocket"
                }
            ],
            "typename": "Node_comment",
            "version": 1,
            "y": 720.5145268767856,
            "x": 113.55694904015945
        },
        {
            "name": "node_comment0",
            "inputplugs": [
                {
                    "type": "str",
                    "name": "comment",
                    "value": "wings"
                }
            ],
            "typename": "Node_comment",
            "version": 1,
            "y": 456.34414084342234,
            "x": 808.8572620807362
        },
        {
            "name": "node_comment1",
            "inputplugs": [
                {
                    "type": "str",
                    "name": "comment",
                    "value": "Main Body"
                }
            ],
            "typename": "Node_comment",
            "version": 1,
            "y": 998.0857128109604,
            "x": 129.18995017090757
        },
        {
            "name": "node_comment2",
            "inputplugs": [
                {
                    "type": "str",
                    "name": "comment",
                    "value": "clamp rocket with gorund"
                }
            ],
            "typename": "Node_comment",
            "version": 1,
            "y": 877.2507380679485,
            "x": 1062.3183969752354
        }
    ],
    "version": 2
}ENDGRAPHSCAD*/