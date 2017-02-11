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
module nacaprofile(naca=2412,chord=200,samples=100.0,open=false)
{
 function naca_datas(naca,L,N,open)=  let(Na = len(naca)!=3?naca_id(naca):naca)
   let(A = [.2969, -0.126, -.3516, .2843, open?-0.1015:-0.1036])
   [for (b=[-180:360/(N):179.99])
     let (x = (1-cos(b))/2)
     let(yt = sign(b)*Na[2]/.2*(A*[sqrt(x), x, x*x, x*x*x, x*x*x*x]))
     Na[0]==0?L*[x, yt]:L*naca_camber(x, yt, Na[0], Na[1], sign(b))] ;
 function naca_id(naca)= let (M = floor(naca/1000))
   let (P = floor((naca-M*1000)/100))
   [M/100, P/10, floor(naca-M*1000-P*100)/100];
 function naca_camber(x,y,M,P,upper)=  let(yc = (x<P)?M/P/P*(2*P*x-x*x): M/(1-P)/(1-P)*(1 - 2*P + 2*P*x -x*x))
   let(dy = (x<P)?2*M/P/P*(P-x):2*M/(1-P)/(1-P)*(P-x))
   let(th = atan(dy))
   [upper ? x - y*sin(th):x + y*sin(th), upper ? yc + y*cos(th):yc - y*cos(th)];
 function node_polygon_matrix(i=0,j=0,k=0,l=0,m=0,n=0) = translate([0,0,0]);
 module node_polygon(i=0,j=0,k=0,l=0,m=0,n=0)
 {
  polygon(points=naca_datas(naca,chord,samples,open),convexity=1);
 }
 node_polygon();
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
nacaprofile();


/*BEGINGRAPHSCAD{
    "nodes": [
        {
            "name": "node_function",
            "inputplugs": [
                {
                    "alias": "function name",
                    "tip": "name of function (will be usable in expressions)",
                    "type": "str",
                    "name": "name",
                    "value": "naca_datas"
                },
                {
                    "tip": "expression of function",
                    "connection": "node_string.string",
                    "type": "str",
                    "name": "expression",
                    "value": ""
                },
                {
                    "tip": "",
                    "type": "str",
                    "name": "paramname1",
                    "value": "naca"
                },
                {
                    "tip": "",
                    "type": "str",
                    "name": "paramname2",
                    "value": "L"
                },
                {
                    "tip": "",
                    "type": "str",
                    "name": "paramname3",
                    "value": "N"
                },
                {
                    "tip": "",
                    "type": "str",
                    "name": "paramname4",
                    "value": "open"
                },
                {
                    "tip": "",
                    "type": "str",
                    "name": "paramname5",
                    "value": ""
                },
                {
                    "tip": "",
                    "type": "str",
                    "name": "paramname6",
                    "value": ""
                },
                {
                    "tip": "",
                    "type": "str",
                    "name": "paramname7",
                    "value": ""
                },
                {
                    "tip": "",
                    "type": "str",
                    "name": "paramname8",
                    "value": ""
                },
                {
                    "tip": "",
                    "type": "str",
                    "name": "paramname9",
                    "value": ""
                },
                {
                    "tip": "",
                    "type": "str",
                    "name": "paramname10",
                    "value": ""
                },
                {
                    "tip": "",
                    "type": "str",
                    "name": "paramname11",
                    "value": ""
                },
                {
                    "tip": "",
                    "type": "str",
                    "name": "paramname12",
                    "value": ""
                },
                {
                    "tip": "",
                    "type": "str",
                    "name": "paramname13",
                    "value": ""
                },
                {
                    "tip": "",
                    "type": "str",
                    "name": "paramname14",
                    "value": ""
                },
                {
                    "tip": "",
                    "type": "str",
                    "name": "paramname15",
                    "value": ""
                },
                {
                    "tip": "",
                    "type": "str",
                    "name": "paramname16",
                    "value": ""
                },
                {
                    "tip": "",
                    "type": "str",
                    "name": "paramname17",
                    "value": ""
                },
                {
                    "tip": "",
                    "type": "str",
                    "name": "paramname18",
                    "value": ""
                },
                {
                    "tip": "",
                    "type": "str",
                    "name": "paramname19",
                    "value": ""
                },
                {
                    "tip": "",
                    "type": "str",
                    "name": "paramname20",
                    "value": ""
                }
            ],
            "typename": "Node_function",
            "version": 1,
            "y": 242.03266941525385,
            "x": -255.16354273451418
        },
        {
            "name": "node_string",
            "inputplugs": [
                {
                    "multiline": true,
                    "type": "str",
                    "name": "string",
                    "value": "  let(Na = len(naca)!=3?naca_id(naca):naca)\n  let(A = [.2969, -0.126, -.3516, .2843, open?-0.1015:-0.1036])\n  [for (b=[-180:360/(N):179.99]) \n    let (x = (1-cos(b))/2)  \n    let(yt = sign(b)*Na[2]/.2*(A*[sqrt(x), x, x*x, x*x*x, x*x*x*x])) \n    Na[0]==0?L*[x, yt]:L*naca_camber(x, yt, Na[0], Na[1], sign(b))] "
                }
            ],
            "typename": "Node_string",
            "version": 1,
            "y": 291.373046125098,
            "x": -463.3653440578853
        },
        {
            "name": "node_function0",
            "inputplugs": [
                {
                    "alias": "function name",
                    "tip": "name of function (will be usable in expressions)",
                    "type": "str",
                    "name": "name",
                    "value": "naca_id"
                },
                {
                    "tip": "expression of function",
                    "connection": "node_string0.string",
                    "type": "str",
                    "name": "expression",
                    "value": ""
                },
                {
                    "tip": "",
                    "type": "str",
                    "name": "paramname1",
                    "value": "naca"
                },
                {
                    "tip": "",
                    "type": "str",
                    "name": "paramname2",
                    "value": ""
                },
                {
                    "tip": "",
                    "type": "str",
                    "name": "paramname3",
                    "value": ""
                },
                {
                    "tip": "",
                    "type": "str",
                    "name": "paramname4",
                    "value": ""
                },
                {
                    "tip": "",
                    "type": "str",
                    "name": "paramname5",
                    "value": ""
                },
                {
                    "tip": "",
                    "type": "str",
                    "name": "paramname6",
                    "value": ""
                },
                {
                    "tip": "",
                    "type": "str",
                    "name": "paramname7",
                    "value": ""
                },
                {
                    "tip": "",
                    "type": "str",
                    "name": "paramname8",
                    "value": ""
                },
                {
                    "tip": "",
                    "type": "str",
                    "name": "paramname9",
                    "value": ""
                },
                {
                    "tip": "",
                    "type": "str",
                    "name": "paramname10",
                    "value": ""
                },
                {
                    "tip": "",
                    "type": "str",
                    "name": "paramname11",
                    "value": ""
                },
                {
                    "tip": "",
                    "type": "str",
                    "name": "paramname12",
                    "value": ""
                },
                {
                    "tip": "",
                    "type": "str",
                    "name": "paramname13",
                    "value": ""
                },
                {
                    "tip": "",
                    "type": "str",
                    "name": "paramname14",
                    "value": ""
                },
                {
                    "tip": "",
                    "type": "str",
                    "name": "paramname15",
                    "value": ""
                },
                {
                    "tip": "",
                    "type": "str",
                    "name": "paramname16",
                    "value": ""
                },
                {
                    "tip": "",
                    "type": "str",
                    "name": "paramname17",
                    "value": ""
                },
                {
                    "tip": "",
                    "type": "str",
                    "name": "paramname18",
                    "value": ""
                },
                {
                    "tip": "",
                    "type": "str",
                    "name": "paramname19",
                    "value": ""
                },
                {
                    "tip": "",
                    "type": "str",
                    "name": "paramname20",
                    "value": ""
                }
            ],
            "typename": "Node_function",
            "version": 1,
            "y": -14.23597206789691,
            "x": 102.74761484171722
        },
        {
            "name": "node_string0",
            "inputplugs": [
                {
                    "multiline": true,
                    "type": "str",
                    "name": "string",
                    "value": " let (M = floor(naca/1000))\n  let (P = floor((naca-M*1000)/100)) \n  [M/100, P/10, floor(naca-M*1000-P*100)/100]"
                }
            ],
            "typename": "Node_string",
            "version": 1,
            "y": 32.20386523607971,
            "x": -449.21488340466055
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
                    "value": "naca"
                },
                {
                    "type": "str",
                    "name": "string",
                    "value": "2412"
                }
            ],
            "typename": "Node_param",
            "version": 1,
            "y": 472.6066782353977,
            "x": -762.1429111906575
        },
        {
            "name": "node_function1",
            "inputplugs": [
                {
                    "alias": "function name",
                    "tip": "name of function (will be usable in expressions)",
                    "type": "str",
                    "name": "name",
                    "value": "naca_camber"
                },
                {
                    "tip": "expression of function",
                    "connection": "node_string1.string",
                    "type": "str",
                    "name": "expression",
                    "value": ""
                },
                {
                    "tip": "",
                    "type": "str",
                    "name": "paramname1",
                    "value": "x"
                },
                {
                    "tip": "",
                    "type": "str",
                    "name": "paramname2",
                    "value": "y"
                },
                {
                    "tip": "",
                    "type": "str",
                    "name": "paramname3",
                    "value": "M"
                },
                {
                    "tip": "",
                    "type": "str",
                    "name": "paramname4",
                    "value": "P"
                },
                {
                    "tip": "",
                    "type": "str",
                    "name": "paramname5",
                    "value": "upper"
                },
                {
                    "tip": "",
                    "type": "str",
                    "name": "paramname6",
                    "value": ""
                },
                {
                    "tip": "",
                    "type": "str",
                    "name": "paramname7",
                    "value": ""
                },
                {
                    "tip": "",
                    "type": "str",
                    "name": "paramname8",
                    "value": ""
                },
                {
                    "tip": "",
                    "type": "str",
                    "name": "paramname9",
                    "value": ""
                },
                {
                    "tip": "",
                    "type": "str",
                    "name": "paramname10",
                    "value": ""
                },
                {
                    "tip": "",
                    "type": "str",
                    "name": "paramname11",
                    "value": ""
                },
                {
                    "tip": "",
                    "type": "str",
                    "name": "paramname12",
                    "value": ""
                },
                {
                    "tip": "",
                    "type": "str",
                    "name": "paramname13",
                    "value": ""
                },
                {
                    "tip": "",
                    "type": "str",
                    "name": "paramname14",
                    "value": ""
                },
                {
                    "tip": "",
                    "type": "str",
                    "name": "paramname15",
                    "value": ""
                },
                {
                    "tip": "",
                    "type": "str",
                    "name": "paramname16",
                    "value": ""
                },
                {
                    "tip": "",
                    "type": "str",
                    "name": "paramname17",
                    "value": ""
                },
                {
                    "tip": "",
                    "type": "str",
                    "name": "paramname18",
                    "value": ""
                },
                {
                    "tip": "",
                    "type": "str",
                    "name": "paramname19",
                    "value": ""
                },
                {
                    "tip": "",
                    "type": "str",
                    "name": "paramname20",
                    "value": ""
                }
            ],
            "typename": "Node_function",
            "version": 1,
            "y": 108.3569343176298,
            "x": -64.17185638490969
        },
        {
            "name": "node_string1",
            "inputplugs": [
                {
                    "multiline": true,
                    "type": "str",
                    "name": "string",
                    "value": "  let(yc = (x<P)?M/P/P*(2*P*x-x*x): M/(1-P)/(1-P)*(1 - 2*P + 2*P*x -x*x))\n  let(dy = (x<P)?2*M/P/P*(P-x):2*M/(1-P)/(1-P)*(P-x))\n  let(th = atan(dy))\n  [upper ? x - y*sin(th):x + y*sin(th), upper ? yc + y*cos(th):yc - y*cos(th)]"
                }
            ],
            "typename": "Node_string",
            "version": 1,
            "y": 165.32560536129202,
            "x": -440.6176717628741
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
                    "value": "chord"
                },
                {
                    "type": "str",
                    "name": "string",
                    "value": "200"
                }
            ],
            "typename": "Node_param",
            "version": 1,
            "y": 474.5050346145107,
            "x": -523.1819288969807
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
                    "value": "samples"
                },
                {
                    "type": "str",
                    "name": "string",
                    "value": "100.0"
                }
            ],
            "typename": "Node_param",
            "version": 1,
            "y": 485.665726554364,
            "x": -275.22989743012795
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
                    "value": "open"
                },
                {
                    "type": "str",
                    "name": "string",
                    "value": "false"
                }
            ],
            "typename": "Node_param",
            "version": 1,
            "y": 486.8266582401035,
            "x": -51.20883314352045
        },
        {
            "name": "node_polygon",
            "inputplugs": [
                {
                    "type": "str",
                    "name": "points",
                    "value": "naca_datas(naca,chord,samples,open)"
                },
                {
                    "type": "str",
                    "name": "convexity",
                    "value": "1"
                }
            ],
            "typename": "Node_polygon",
            "version": 1,
            "y": 344.59024528115003,
            "x": 76.71186066752921
        }
    ],
    "version": 2
}ENDGRAPHSCAD*/