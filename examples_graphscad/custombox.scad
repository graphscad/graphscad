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
module custombox(x=20,y=30,z=10,tickness=1,rounding=5)
{
 function node_box_matrix(i=0,j=0,k=0,l=0,m=0,n=0) = translate([0,0,0]);
 module node_box(i=0,j=0,k=0,l=0,m=0,n=0)
 {
  difference()
  {
   hull()
   {
    translate([-((((x)/2))-(rounding)),-((((y)/2))-(rounding)),0]) cylinder(r=rounding,h=(z),$fn=64);
    translate([-((((x)/2))-(rounding)), ((((y)/2))-(rounding)),0]) cylinder(r=rounding,h=(z),$fn=64);
    translate([ ((((x)/2))-(rounding)),-((((y)/2))-(rounding)),0]) cylinder(r=rounding,h=(z),$fn=64);
    translate([ ((((x)/2))-(rounding)), ((((y)/2))-(rounding)),0]) cylinder(r=rounding,h=(z),$fn=64);
   }
   translate([ 0,0,1])hull()
   {
    translate([-((((x)/2))-((rounding)+(tickness))),-((((y)/2))-((rounding)+(tickness))),0]) cylinder(r=rounding,h=(((z))-(1)+0.01),$fn=64);
    translate([-((((x)/2))-((rounding)+(tickness))), ((((y)/2))-((rounding)+(tickness))),0]) cylinder(r=rounding,h=(((z))-(1)+0.01),$fn=64);
    translate([ ((((x)/2))-((rounding)+(tickness))),-((((y)/2))-((rounding)+(tickness))),0]) cylinder(r=rounding,h=(((z))-(1)+0.01),$fn=64);
    translate([ ((((x)/2))-((rounding)+(tickness))), ((((y)/2))-((rounding)+(tickness))),0]) cylinder(r=rounding,h=(((z))-(1)+0.01),$fn=64);
   }
  }
 }
 function node_box0_matrix(i=0,j=0,k=0,l=0,m=0,n=0) = translate([0,y+2,tickness]);
 module node_box0(i=0,j=0,k=0,l=0,m=0,n=0)
 {
  translate([0,y+2,tickness])difference()
  {
   hull()
   {
    translate([-((((x-tickness*2-0.2)/2))-(rounding)),-((((y-tickness*2-0.2)/2))-(rounding)),0]) cylinder(r=rounding,h=(tickness*2),$fn=64);
    translate([-((((x-tickness*2-0.2)/2))-(rounding)), ((((y-tickness*2-0.2)/2))-(rounding)),0]) cylinder(r=rounding,h=(tickness*2),$fn=64);
    translate([ ((((x-tickness*2-0.2)/2))-(rounding)),-((((y-tickness*2-0.2)/2))-(rounding)),0]) cylinder(r=rounding,h=(tickness*2),$fn=64);
    translate([ ((((x-tickness*2-0.2)/2))-(rounding)), ((((y-tickness*2-0.2)/2))-(rounding)),0]) cylinder(r=rounding,h=(tickness*2),$fn=64);
   }
   translate([ 0,0,0])hull()
   {
    translate([-((((x-tickness*2-0.2)/2))-((rounding)+(tickness))),-((((y-tickness*2-0.2)/2))-((rounding)+(tickness))),0]) cylinder(r=rounding,h=(((tickness*2))-(0)+0.01),$fn=64);
    translate([-((((x-tickness*2-0.2)/2))-((rounding)+(tickness))), ((((y-tickness*2-0.2)/2))-((rounding)+(tickness))),0]) cylinder(r=rounding,h=(((tickness*2))-(0)+0.01),$fn=64);
    translate([ ((((x-tickness*2-0.2)/2))-((rounding)+(tickness))),-((((y-tickness*2-0.2)/2))-((rounding)+(tickness))),0]) cylinder(r=rounding,h=(((tickness*2))-(0)+0.01),$fn=64);
    translate([ ((((x-tickness*2-0.2)/2))-((rounding)+(tickness))), ((((y-tickness*2-0.2)/2))-((rounding)+(tickness))),0]) cylinder(r=rounding,h=(((tickness*2))-(0)+0.01),$fn=64);
   }
  }
 }
 function node_box1_matrix(i=0,j=0,k=0,l=0,m=0,n=0) = translate([0,y+2,0]);
 module node_box1(i=0,j=0,k=0,l=0,m=0,n=0)
 {
  translate([0,y+2,0])difference()
  {
   hull()
   {
    translate([-((((x)/2))-(rounding)),-((((y)/2))-(rounding)),0]) cylinder(r=rounding,h=(tickness),$fn=64);
    translate([-((((x)/2))-(rounding)), ((((y)/2))-(rounding)),0]) cylinder(r=rounding,h=(tickness),$fn=64);
    translate([ ((((x)/2))-(rounding)),-((((y)/2))-(rounding)),0]) cylinder(r=rounding,h=(tickness),$fn=64);
    translate([ ((((x)/2))-(rounding)), ((((y)/2))-(rounding)),0]) cylinder(r=rounding,h=(tickness),$fn=64);
   }
   translate([ 0,0,tickness])hull()
   {
    translate([-((((x)/2))-((rounding)+(tickness))),-((((y)/2))-((rounding)+(tickness))),0]) cylinder(r=rounding,h=(((tickness))-(tickness)+0.01),$fn=64);
    translate([-((((x)/2))-((rounding)+(tickness))), ((((y)/2))-((rounding)+(tickness))),0]) cylinder(r=rounding,h=(((tickness))-(tickness)+0.01),$fn=64);
    translate([ ((((x)/2))-((rounding)+(tickness))),-((((y)/2))-((rounding)+(tickness))),0]) cylinder(r=rounding,h=(((tickness))-(tickness)+0.01),$fn=64);
    translate([ ((((x)/2))-((rounding)+(tickness))), ((((y)/2))-((rounding)+(tickness))),0]) cylinder(r=rounding,h=(((tickness))-(tickness)+0.01),$fn=64);
   }
  }
 }
 function node_boolean_matrix(i=0,j=0,k=0,l=0,m=0,n=0) = node_box_matrix(i=i,j=j,k=k,l=l,m=m,n=n);
 module node_boolean(i=0,j=0,k=0,l=0,m=0,n=0)
 {
  union()
  {
   node_box(i,j,k,l,m,n);
   node_box1(i,j,k,l,m,n);
   node_box0(i,j,k,l,m,n);
  }
 }
 node_boolean();
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
custombox();


/*BEGINGRAPHSCAD{
    "nodes": [
        {
            "name": "node_box",
            "inputplugs": [
                {
                    "type": "str",
                    "name": "sizex",
                    "value": "x"
                },
                {
                    "type": "str",
                    "name": "sizey",
                    "value": "y"
                },
                {
                    "type": "str",
                    "name": "sizez",
                    "value": "z"
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
                    "name": "rounding",
                    "value": "rounding"
                },
                {
                    "type": "str",
                    "name": "tickness",
                    "value": "tickness"
                },
                {
                    "type": "str",
                    "name": "interiorheight",
                    "value": "1"
                },
                {
                    "type": "str",
                    "name": "$fn",
                    "value": "64"
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
            "typename": "Node_box",
            "version": 1,
            "y": -256.486,
            "x": -962.5500000000002
        },
        {
            "name": "node_box0",
            "inputplugs": [
                {
                    "type": "str",
                    "name": "sizex",
                    "value": "x-tickness*2-0.2"
                },
                {
                    "type": "str",
                    "name": "sizey",
                    "value": "y-tickness*2-0.2"
                },
                {
                    "type": "str",
                    "name": "sizez",
                    "value": "tickness*2"
                },
                {
                    "type": "str",
                    "name": "tx",
                    "value": "0"
                },
                {
                    "type": "str",
                    "name": "ty",
                    "value": "y+2"
                },
                {
                    "type": "str",
                    "name": "tz",
                    "value": "tickness"
                },
                {
                    "type": "str",
                    "name": "rounding",
                    "value": "rounding"
                },
                {
                    "type": "str",
                    "name": "tickness",
                    "value": "tickness"
                },
                {
                    "type": "str",
                    "name": "interiorheight",
                    "value": "0"
                },
                {
                    "type": "str",
                    "name": "$fn",
                    "value": "64"
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
            "typename": "Node_box",
            "version": 1,
            "y": 351.20264000000003,
            "x": -946.0540799999999
        },
        {
            "name": "node_box1",
            "inputplugs": [
                {
                    "type": "str",
                    "name": "sizex",
                    "value": "x"
                },
                {
                    "type": "str",
                    "name": "sizey",
                    "value": "y"
                },
                {
                    "type": "str",
                    "name": "sizez",
                    "value": "tickness"
                },
                {
                    "type": "str",
                    "name": "tx",
                    "value": "0"
                },
                {
                    "type": "str",
                    "name": "ty",
                    "value": "y+2"
                },
                {
                    "type": "str",
                    "name": "tz",
                    "value": "0"
                },
                {
                    "type": "str",
                    "name": "rounding",
                    "value": "rounding"
                },
                {
                    "type": "str",
                    "name": "tickness",
                    "value": "tickness"
                },
                {
                    "type": "str",
                    "name": "interiorheight",
                    "value": "tickness"
                },
                {
                    "type": "str",
                    "name": "$fn",
                    "value": "64"
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
            "typename": "Node_box",
            "version": 1,
            "y": 45.80064000000013,
            "x": -955.9440800000002
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
                    "connection": "node_box.object",
                    "type": "object",
                    "name": "object1",
                    "value": ""
                },
                {
                    "connection": "node_box1.object",
                    "type": "object",
                    "name": "object2",
                    "value": ""
                },
                {
                    "connection": "node_box0.object",
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
            "y": -26.03685999999996,
            "x": -629.0440800000001
        },
        {
            "name": "param_10",
            "inputplugs": [
                {
                    "type": "param",
                    "name": "previousparam",
                    "value": ""
                },
                {
                    "type": "str",
                    "name": "name",
                    "value": "x"
                },
                {
                    "type": "str",
                    "name": "string",
                    "value": "20"
                }
            ],
            "typename": "Node_param",
            "version": 1,
            "y": -322.0792578124998,
            "x": -1738.1237109375002
        },
        {
            "name": "node_param",
            "inputplugs": [
                {
                    "connection": "param_10.nextparam",
                    "type": "param",
                    "name": "previousparam",
                    "value": ""
                },
                {
                    "type": "str",
                    "name": "name",
                    "value": "y"
                },
                {
                    "type": "str",
                    "name": "string",
                    "value": "30"
                }
            ],
            "typename": "Node_param",
            "version": 1,
            "y": -163.7547999999999,
            "x": -1735.9660000000003
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
                    "value": "z"
                },
                {
                    "type": "str",
                    "name": "string",
                    "value": "10"
                }
            ],
            "typename": "Node_param",
            "version": 1,
            "y": -2.7819999999999325,
            "x": -1738.1412
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
                    "value": "tickness"
                },
                {
                    "type": "str",
                    "name": "string",
                    "value": "1"
                }
            ],
            "typename": "Node_param",
            "version": 1,
            "y": 160.95560000000012,
            "x": -1739.3700000000001
        },
        {
            "name": "node_param2",
            "inputplugs": [
                {
                    "type": "param",
                    "name": "previousparam",
                    "value": ""
                },
                {
                    "type": "str",
                    "name": "name",
                    "value": "rounding"
                },
                {
                    "type": "str",
                    "name": "string",
                    "value": "5"
                }
            ],
            "typename": "Node_param",
            "version": 1,
            "y": 325.7172,
            "x": -1734.4548
        },
        {
            "name": "node_comment",
            "inputplugs": [
                {
                    "type": "str",
                    "name": "comment",
                    "value": "Design of a custom box"
                }
            ],
            "typename": "Node_comment",
            "version": 1,
            "y": -328.6093749999997,
            "x": -1059.4999999999995
        },
        {
            "name": "node_comment0",
            "inputplugs": [
                {
                    "type": "str",
                    "name": "comment",
                    "value": "this chain of param nodes defines\nthe parameter list of this module.\n"
                }
            ],
            "typename": "Node_comment",
            "version": 1,
            "y": -172.35937499999974,
            "x": -1543.2499999999995
        }
    ],
    "version": 2
}ENDGRAPHSCAD*/