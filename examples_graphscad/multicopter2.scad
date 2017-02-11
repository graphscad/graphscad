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
module multicopter2(arm_count=4,arm_width=50,arm_height=4,base_xsize=50,base_ysize=30,motor_radius=8.6/2,motor_angle=0)
{
 module hexgrid(
     grid_width=50,
     grid_lenght=60,
     grid_height=5,
     hex_radius=5,
     hex_border_width=1,
     center=true)
 {
      ystep=2*sqrt(3/4*hex_radius*hex_radius);
      xstep=3*hex_radius/2;
      grid_width=round(grid_width/(xstep*2))*(2*xstep);
      grid_lenght=round(grid_lenght/(ystep*2))*(2*ystep);
      ox = center ? -grid_width/2  : 0;
      oy = center ? -grid_lenght/2 : 0;
      for (xi=[0:xstep:grid_width])
          for(yi=[0:ystep:grid_lenght])
  {
               x=xi+ox;
               y=((((xi/xstep)%2)==0)?0:ystep/2)+yi+oy;
               translate([x,y,0]) cylinder(r=(hex_radius-hex_border_width/2), h=grid_height, $fn=6);
  }
 }
 ;
 function node_cylinder_matrix(i=0,j=0,k=0,l=0,m=0,n=0) = translate([arm_width,0,0]);
 module node_cylinder(i=0,j=0,k=0,l=0,m=0,n=0)
 {
  translate([arm_width,0,0])cylinder(r=motor_radius+2,r1=motor_radius+2,h=arm_height,center=false,$fn=16);
 }
 function node_hull_matrix(i=0,j=0,k=0,l=0,m=0,n=0) = node_cylinder_matrix(i=i,j=j,k=k,l=l,m=m,n=n);
 module node_hull(i=0,j=0,k=0,l=0,m=0,n=0)
 {
  hull()
  {
   node_cylinder(i,j,k,l,m,n);
   node_cylinder0(i,j,k,l,m,n);
  }
 }
 function node_for_matrix(i=0,j=0,k=0,l=0,m=0,n=0) = node_rotate_matrix(i=i,j=j,k=k,l=l,m=m,n=n);
 module node_for(i=0,j=0,k=0,l=0,m=0,n=0)
 {
  for(i=[-180/arm_count:360/arm_count:360-(180/arm_count)])
  {
   node_rotate(i,j,k,l,m,n);
  }
 }
 function node_rotate_matrix(i=0,j=0,k=0,l=0,m=0,n=0) = rotate([0,0,i])*node_hull_matrix(i=i,j=j,k=k,l=l,m=m,n=n);
 module node_rotate(i=0,j=0,k=0,l=0,m=0,n=0)
 {
  rotate([0,0,i])node_hull(i,j,k,l,m,n);
 }
 function node_cylinder0_matrix(i=0,j=0,k=0,l=0,m=0,n=0) = translate([0,0,0]);
 module node_cylinder0(i=0,j=0,k=0,l=0,m=0,n=0)
 {
  cylinder(r=motor_radius+6,r1=motor_radius+6,h=arm_height,center=false,$fn=16);
 }
 function node_cylinder1_matrix(i=0,j=0,k=0,l=0,m=0,n=0) = translate([arm_width-motor_radius*3.5,0,-1]);
 module node_cylinder1(i=0,j=0,k=0,l=0,m=0,n=0)
 {
  translate([arm_width-motor_radius*3.5,0,-1])cylinder(r=motor_radius,r1=motor_radius,h=50,center=false,$fn=16);
 }
 function node_cylinder2_matrix(i=0,j=0,k=0,l=0,m=0,n=0) = translate([0,0,-1]);
 module node_cylinder2(i=0,j=0,k=0,l=0,m=0,n=0)
 {
  translate([0,0,-1])cylinder(r=motor_radius+2,r1=motor_radius+2,h=50,center=false,$fn=16);
 }
 function node_hull0_matrix(i=0,j=0,k=0,l=0,m=0,n=0) = node_cylinder1_matrix(i=i,j=j,k=k,l=l,m=m,n=n);
 module node_hull0(i=0,j=0,k=0,l=0,m=0,n=0)
 {
  hull()
  {
   node_cylinder1(i,j,k,l,m,n);
   node_cylinder2(i,j,k,l,m,n);
  }
 }
 function node_cylinder3_matrix(i=0,j=0,k=0,l=0,m=0,n=0) = translate([arm_width,0,0]);
 module node_cylinder3(i=0,j=0,k=0,l=0,m=0,n=0)
 {
  translate([arm_width,0,0])cylinder(r=motor_radius+1,r1=motor_radius+2,h=15,center=false,$fn=(16+motor_radius+1*3.14116));
 }
 function node_cylinder4_matrix(i=0,j=0,k=0,l=0,m=0,n=0) = translate([arm_width,0,-1]);
 module node_cylinder4(i=0,j=0,k=0,l=0,m=0,n=0)
 {
  translate([arm_width,0,-1])cylinder(r=motor_radius,r1=motor_radius,h=100,center=false,$fn=(16+motor_radius*3.14116));
 }
 function node_for0_matrix(i=0,j=0,k=0,l=0,m=0,n=0) = node_rotate0_matrix(i=i,j=j,k=k,l=l,m=m,n=n);
 module node_for0(i=0,j=0,k=0,l=0,m=0,n=0)
 {
  for(i=[-180/arm_count:360/arm_count:360-(180/arm_count)])
  {
   node_rotate0(i,j,k,l,m,n);
  }
 }
 function node_rotate0_matrix(i=0,j=0,k=0,l=0,m=0,n=0) = rotate([0,0,i])*node_hull0_matrix(i=i,j=j,k=k,l=l,m=m,n=n);
 module node_rotate0(i=0,j=0,k=0,l=0,m=0,n=0)
 {
  rotate([0,0,i])node_hull0(i,j,k,l,m,n);
 }
 function node_hexgrid_matrix(i=0,j=0,k=0,l=0,m=0,n=0) = translate([0,0,-3]);
 module node_hexgrid(i=0,j=0,k=0,l=0,m=0,n=0)
 {
  translate([0,0,-3])hexgrid(grid_width=arm_width*2+motor_radius,grid_lenght=arm_width*2+motor_radius,grid_height=100,hex_radius=3,hex_border_width=0.5,center=true);
 }
 function node_for1_matrix(i=0,j=0,k=0,l=0,m=0,n=0) = node_rotate6_matrix(i=i,j=j,k=k,l=l,m=m,n=n);
 module node_for1(i=0,j=0,k=0,l=0,m=0,n=0)
 {
  for(i=[-180/arm_count:360/arm_count:360-(180/arm_count)])
  {
   node_rotate6(i,j,k,l,m,n);
  }
 }
 function node_rotate1_matrix(i=0,j=0,k=0,l=0,m=0,n=0) = rotate([0,0,i])*node_cylinder4_matrix(i=i,j=j,k=k,l=l,m=m,n=n);
 module node_rotate1(i=0,j=0,k=0,l=0,m=0,n=0)
 {
  rotate([0,0,i])node_cylinder4(i,j,k,l,m,n);
 }
 function node_clamp_matrix(i=0,j=0,k=0,l=0,m=0,n=0) = node_boolean5_matrix(i=i,j=j,k=k,l=l,m=m,n=n);
 module node_clamp(i=0,j=0,k=0,l=0,m=0,n=0)
 {
  intersection()
  {
   {
    node_boolean5(i,j,k,l,m,n);
   }
   translate([0,0,0.5])cube([1000,1000,1],center=true);
  }
 }
 function node_cube_matrix(i=0,j=0,k=0,l=0,m=0,n=0) = translate([0,0,arm_height/2]);
 module node_cube(i=0,j=0,k=0,l=0,m=0,n=0)
 {
  translate([0,0,arm_height/2])cube([base_xsize,base_ysize,arm_height],center=true);
 }
 function node_cube0_matrix(i=0,j=0,k=0,l=0,m=0,n=0) = translate([0,0,0]);
 module node_cube0(i=0,j=0,k=0,l=0,m=0,n=0)
 {
  cube([base_xsize-6,base_ysize-6,100],center=true);
 }
 function node_tube_inobject_matrix(i=0,j=0,k=0,l=0,m=0,n=0) = translate([arm_width,0,0]);
 module node_tube_inobject(i=0,j=0,k=0,l=0,m=0,n=0)
 {
  translate([arm_width,0,0])translate([0,0,-0.001]) cylinder(r=motor_radius+3-(2),r1=motor_radius+3-(2),h=arm_height+0.002,$fn=(16+motor_radius+3*3.14116));
 }
 function node_tube_outobject_matrix(i=0,j=0,k=0,l=0,m=0,n=0) = translate([arm_width,0,0]);
 module node_tube_outobject(i=0,j=0,k=0,l=0,m=0,n=0)
 {
  translate([arm_width,0,0]) cylinder(r=motor_radius+3,r1=motor_radius+3,h=arm_height,$fn=(16+motor_radius+3*3.14116));
 }
 function node_tube_holeobject_matrix(i=0,j=0,k=0,l=0,m=0,n=0) = translate([arm_width,0,0]);
 module node_tube_holeobject(i=0,j=0,k=0,l=0,m=0,n=0)
 {
  translate([arm_width,0,0])translate([0,0,-0.001]) cylinder(r=(motor_radius+3)+(0)-(2),r1=(motor_radius+3)+(0)-(2),h=arm_height+0.002,$fn=(16+motor_radius+3*3.14116));
 }
 function node_tube_matrix(i=0,j=0,k=0,l=0,m=0,n=0) = translate([arm_width,0,0]);
 module node_tube(i=0,j=0,k=0,l=0,m=0,n=0)
 {
  translate([arm_width,0,0])difference()
  {
    cylinder(r=motor_radius+3,r1=motor_radius+3,h=arm_height,$fn=(16+motor_radius+3*3.14116));
   translate([0,0,-0.001]) cylinder(r=(motor_radius+3)+(0)-(2),r1=(motor_radius+3)+(0)-(2),h=arm_height+0.002,$fn=(16+motor_radius+3*3.14116));
  }
 }
 function node_rotate2_matrix(i=0,j=0,k=0,l=0,m=0,n=0) = rotate([0,0,i])*node_tube_matrix(i=i,j=j,k=k,l=l,m=m,n=n);
 module node_rotate2(i=0,j=0,k=0,l=0,m=0,n=0)
 {
  rotate([0,0,i])node_tube(i,j,k,l,m,n);
 }
 function node_for2_matrix(i=0,j=0,k=0,l=0,m=0,n=0) = node_rotate2_matrix(i=i,j=j,k=k,l=l,m=m,n=n);
 module node_for2(i=0,j=0,k=0,l=0,m=0,n=0)
 {
  for(i=[-(180/arm_count):360/arm_count:360-(180/arm_count)-1])
  {
   node_rotate2(i,j,k,l,m,n);
  }
 }
 function node_rotate3_matrix(i=0,j=0,k=0,l=0,m=0,n=0) = rotate([0,0,i])*node_boolean10_matrix(i=i,j=j,k=k,l=l,m=m,n=n);
 module node_rotate3(i=0,j=0,k=0,l=0,m=0,n=0)
 {
  rotate([0,0,i])node_boolean10(i,j,k,l,m,n);
 }
 function node_for3_matrix(i=0,j=0,k=0,l=0,m=0,n=0) = node_rotate5_matrix(i=i,j=j,k=k,l=l,m=m,n=n);
 module node_for3(i=0,j=0,k=0,l=0,m=0,n=0)
 {
  for(i=[-180/arm_count:360/arm_count:360-(180/arm_count)-1])
  {
   node_rotate5(i,j,k,l,m,n);
  }
 }
 function node_cube1_matrix(i=0,j=0,k=0,l=0,m=0,n=0) = translate([arm_width-motor_radius,0,50/2-2]);
 module node_cube1(i=0,j=0,k=0,l=0,m=0,n=0)
 {
  translate([arm_width-motor_radius,0,50/2-2])cube([6,4,50],center=true);
 }
 function node_rotate4_matrix(i=0,j=0,k=0,l=0,m=0,n=0) = rotate([0,0,l])*node_boolean13_matrix(i=i,j=j,k=k,l=l,m=m,n=n);
 module node_rotate4(i=0,j=0,k=0,l=0,m=0,n=0)
 {
  rotate([0,0,l])node_boolean13(i,j,k,l,m,n);
 }
 function node_for4_matrix(i=0,j=0,k=0,l=0,m=0,n=0) = node_rotate4_matrix(i=i,j=j,k=k,l=l,m=m,n=n);
 module node_for4(i=0,j=0,k=0,l=0,m=0,n=0)
 {
  for(l=[-180/arm_count:360/arm_count:360-(180/arm_count)])
  {
   node_rotate4(i,j,k,l,m,n);
  }
 }
 function node_cube2_matrix(i=0,j=0,k=0,l=0,m=0,n=0) = translate([arm_width-motor_radius-4,0,50/2+2]);
 module node_cube2(i=0,j=0,k=0,l=0,m=0,n=0)
 {
  translate([arm_width-motor_radius-4,0,50/2+2])cube([8+motor_radius,4,50],center=true);
 }
 function node_rotate5_matrix(i=0,j=0,k=0,l=0,m=0,n=0) = onlytranslate(node_rotate3_matrix(i=i,j=j,k=k,l=l,m=m,n=n))*rotate([0,motor_angle,0])*negonlytranslate(node_rotate3_matrix(i=i,j=j,k=k,l=l,m=m,n=n))*node_rotate3_matrix(i=i,j=j,k=k,l=l,m=m,n=n);
 module node_rotate5(i=0,j=0,k=0,l=0,m=0,n=0)
 {
  multmatrix(m=onlytranslate(node_rotate3_matrix(i=i,j=j,k=k,l=l,m=m,n=n))*rotate([0,motor_angle,0])*negonlytranslate(node_rotate3_matrix(i=i,j=j,k=k,l=l,m=m,n=n)))node_rotate3(i,j,k,l,m,n);
 }
 function node_rotate6_matrix(i=0,j=0,k=0,l=0,m=0,n=0) = onlytranslate(node_rotate1_matrix(i=i,j=j,k=k,l=l,m=m,n=n))*rotate([0,motor_angle,0])*negonlytranslate(node_rotate1_matrix(i=i,j=j,k=k,l=l,m=m,n=n))*node_rotate1_matrix(i=i,j=j,k=k,l=l,m=m,n=n);
 module node_rotate6(i=0,j=0,k=0,l=0,m=0,n=0)
 {
  multmatrix(m=onlytranslate(node_rotate1_matrix(i=i,j=j,k=k,l=l,m=m,n=n))*rotate([0,motor_angle,0])*negonlytranslate(node_rotate1_matrix(i=i,j=j,k=k,l=l,m=m,n=n)))node_rotate1(i,j,k,l,m,n);
 }
 function node_tube0_inobject_matrix(i=0,j=0,k=0,l=0,m=0,n=0) = translate([-base_xsize/2,base_ysize/2,0]);
 module node_tube0_inobject(i=0,j=0,k=0,l=0,m=0,n=0)
 {
  translate([-base_xsize/2,base_ysize/2,0])translate([0,0,-0.001]) cylinder(r=4-(2),r1=4-(2),h=arm_height+0.002,$fn=(16+4*3.14116));
 }
 function node_tube0_outobject_matrix(i=0,j=0,k=0,l=0,m=0,n=0) = translate([-base_xsize/2,base_ysize/2,0]);
 module node_tube0_outobject(i=0,j=0,k=0,l=0,m=0,n=0)
 {
  translate([-base_xsize/2,base_ysize/2,0]) cylinder(r=4,r1=4,h=arm_height,$fn=(16+4*3.14116));
 }
 function node_tube0_holeobject_matrix(i=0,j=0,k=0,l=0,m=0,n=0) = translate([-base_xsize/2,base_ysize/2,0]);
 module node_tube0_holeobject(i=0,j=0,k=0,l=0,m=0,n=0)
 {
  translate([-base_xsize/2,base_ysize/2,0])translate([0,0,-0.001]) cylinder(r=(4)+(0)-(2),r1=(4)+(0)-(2),h=arm_height+0.002,$fn=(16+4*3.14116));
 }
 function node_tube0_matrix(i=0,j=0,k=0,l=0,m=0,n=0) = translate([-base_xsize/2,base_ysize/2,0]);
 module node_tube0(i=0,j=0,k=0,l=0,m=0,n=0)
 {
  translate([-base_xsize/2,base_ysize/2,0])difference()
  {
    cylinder(r=4,r1=4,h=arm_height,$fn=(16+4*3.14116));
   translate([0,0,-0.001]) cylinder(r=(4)+(0)-(2),r1=(4)+(0)-(2),h=arm_height+0.002,$fn=(16+4*3.14116));
  }
 }
 function node_tube000_inobject_matrix(i=0,j=0,k=0,l=0,m=0,n=0) = translate([base_xsize/2,base_ysize/2,0]);
 module node_tube000_inobject(i=0,j=0,k=0,l=0,m=0,n=0)
 {
  translate([base_xsize/2,base_ysize/2,0])translate([0,0,-0.001]) cylinder(r=4-(2),r1=4-(2),h=arm_height+0.002,$fn=(16+4*3.14116));
 }
 function node_tube000_outobject_matrix(i=0,j=0,k=0,l=0,m=0,n=0) = translate([base_xsize/2,base_ysize/2,0]);
 module node_tube000_outobject(i=0,j=0,k=0,l=0,m=0,n=0)
 {
  translate([base_xsize/2,base_ysize/2,0]) cylinder(r=4,r1=4,h=arm_height,$fn=(16+4*3.14116));
 }
 function node_tube000_holeobject_matrix(i=0,j=0,k=0,l=0,m=0,n=0) = translate([base_xsize/2,base_ysize/2,0]);
 module node_tube000_holeobject(i=0,j=0,k=0,l=0,m=0,n=0)
 {
  translate([base_xsize/2,base_ysize/2,0])translate([0,0,-0.001]) cylinder(r=(4)+(0)-(2),r1=(4)+(0)-(2),h=arm_height+0.002,$fn=(16+4*3.14116));
 }
 function node_tube000_matrix(i=0,j=0,k=0,l=0,m=0,n=0) = translate([base_xsize/2,base_ysize/2,0]);
 module node_tube000(i=0,j=0,k=0,l=0,m=0,n=0)
 {
  translate([base_xsize/2,base_ysize/2,0])difference()
  {
    cylinder(r=4,r1=4,h=arm_height,$fn=(16+4*3.14116));
   translate([0,0,-0.001]) cylinder(r=(4)+(0)-(2),r1=(4)+(0)-(2),h=arm_height+0.002,$fn=(16+4*3.14116));
  }
 }
 function node_tube010_inobject_matrix(i=0,j=0,k=0,l=0,m=0,n=0) = translate([-base_xsize/2,-base_ysize/2,0]);
 module node_tube010_inobject(i=0,j=0,k=0,l=0,m=0,n=0)
 {
  translate([-base_xsize/2,-base_ysize/2,0])translate([0,0,-0.001]) cylinder(r=4-(2),r1=4-(2),h=arm_height+0.002,$fn=(16+4*3.14116));
 }
 function node_tube010_outobject_matrix(i=0,j=0,k=0,l=0,m=0,n=0) = translate([-base_xsize/2,-base_ysize/2,0]);
 module node_tube010_outobject(i=0,j=0,k=0,l=0,m=0,n=0)
 {
  translate([-base_xsize/2,-base_ysize/2,0]) cylinder(r=4,r1=4,h=arm_height,$fn=(16+4*3.14116));
 }
 function node_tube010_holeobject_matrix(i=0,j=0,k=0,l=0,m=0,n=0) = translate([-base_xsize/2,-base_ysize/2,0]);
 module node_tube010_holeobject(i=0,j=0,k=0,l=0,m=0,n=0)
 {
  translate([-base_xsize/2,-base_ysize/2,0])translate([0,0,-0.001]) cylinder(r=(4)+(0)-(2),r1=(4)+(0)-(2),h=arm_height+0.002,$fn=(16+4*3.14116));
 }
 function node_tube010_matrix(i=0,j=0,k=0,l=0,m=0,n=0) = translate([-base_xsize/2,-base_ysize/2,0]);
 module node_tube010(i=0,j=0,k=0,l=0,m=0,n=0)
 {
  translate([-base_xsize/2,-base_ysize/2,0])difference()
  {
    cylinder(r=4,r1=4,h=arm_height,$fn=(16+4*3.14116));
   translate([0,0,-0.001]) cylinder(r=(4)+(0)-(2),r1=(4)+(0)-(2),h=arm_height+0.002,$fn=(16+4*3.14116));
  }
 }
 function node_tube0101_inobject_matrix(i=0,j=0,k=0,l=0,m=0,n=0) = translate([base_xsize/2,-base_ysize/2,0]);
 module node_tube0101_inobject(i=0,j=0,k=0,l=0,m=0,n=0)
 {
  translate([base_xsize/2,-base_ysize/2,0])translate([0,0,-0.001]) cylinder(r=4-(2),r1=4-(2),h=arm_height+0.002,$fn=(16+4*3.14116));
 }
 function node_tube0101_outobject_matrix(i=0,j=0,k=0,l=0,m=0,n=0) = translate([base_xsize/2,-base_ysize/2,0]);
 module node_tube0101_outobject(i=0,j=0,k=0,l=0,m=0,n=0)
 {
  translate([base_xsize/2,-base_ysize/2,0]) cylinder(r=4,r1=4,h=arm_height,$fn=(16+4*3.14116));
 }
 function node_tube0101_holeobject_matrix(i=0,j=0,k=0,l=0,m=0,n=0) = translate([base_xsize/2,-base_ysize/2,0]);
 module node_tube0101_holeobject(i=0,j=0,k=0,l=0,m=0,n=0)
 {
  translate([base_xsize/2,-base_ysize/2,0])translate([0,0,-0.001]) cylinder(r=(4)+(0)-(2),r1=(4)+(0)-(2),h=arm_height+0.002,$fn=(16+4*3.14116));
 }
 function node_tube0101_matrix(i=0,j=0,k=0,l=0,m=0,n=0) = translate([base_xsize/2,-base_ysize/2,0]);
 module node_tube0101(i=0,j=0,k=0,l=0,m=0,n=0)
 {
  translate([base_xsize/2,-base_ysize/2,0])difference()
  {
    cylinder(r=4,r1=4,h=arm_height,$fn=(16+4*3.14116));
   translate([0,0,-0.001]) cylinder(r=(4)+(0)-(2),r1=(4)+(0)-(2),h=arm_height+0.002,$fn=(16+4*3.14116));
  }
 }
 function node_boolean_matrix(i=0,j=0,k=0,l=0,m=0,n=0) = node_tube010_outobject_matrix(i=i,j=j,k=k,l=l,m=m,n=n);
 module node_boolean(i=0,j=0,k=0,l=0,m=0,n=0)
 {
  union()
  {
   node_tube010_outobject(i,j,k,l,m,n);
   node_tube0_outobject(i,j,k,l,m,n);
   node_tube000_outobject(i,j,k,l,m,n);
   node_tube0101_outobject(i,j,k,l,m,n);
  }
 }
 function node_boolean0_matrix(i=0,j=0,k=0,l=0,m=0,n=0) = node_tube010_holeobject_matrix(i=i,j=j,k=k,l=l,m=m,n=n);
 module node_boolean0(i=0,j=0,k=0,l=0,m=0,n=0)
 {
  union()
  {
   node_tube010_holeobject(i,j,k,l,m,n);
   node_tube0_holeobject(i,j,k,l,m,n);
   node_tube000_holeobject(i,j,k,l,m,n);
   node_tube0101_holeobject(i,j,k,l,m,n);
  }
 }
 function node_boolean3_matrix(i=0,j=0,k=0,l=0,m=0,n=0) = node_for1_matrix(i=i,j=j,k=k,l=l,m=m,n=n);
 module node_boolean3(i=0,j=0,k=0,l=0,m=0,n=0)
 {
  union()
  {
   node_for1(i,j,k,l,m,n);
   node_for4(i,j,k,l,m,n);
  }
 }
 function node_boolean4_matrix(i=0,j=0,k=0,l=0,m=0,n=0) = node_boolean1_matrix(i=i,j=j,k=k,l=l,m=m,n=n);
 module node_boolean4(i=0,j=0,k=0,l=0,m=0,n=0)
 {
  union()
  {
   node_boolean1(i,j,k,l,m,n);
   node_boolean11(i,j,k,l,m,n);
  }
 }
 function node_resize_matrix(i=0,j=0,k=0,l=0,m=0,n=0) = node_boolean0_matrix(i=i,j=j,k=k,l=l,m=m,n=n);
 module node_resize(i=0,j=0,k=0,l=0,m=0,n=0)
 {
  resize([0,0,10+arm_height])
  {
   node_boolean0(i,j,k,l,m,n);
  }
 }
 function node_resize0_matrix(i=0,j=0,k=0,l=0,m=0,n=0) = node_boolean_matrix(i=i,j=j,k=k,l=l,m=m,n=n);
 module node_resize0(i=0,j=0,k=0,l=0,m=0,n=0)
 {
  resize([0,0,1])
  {
   node_boolean(i,j,k,l,m,n);
  }
 }
 function node_boolean1_matrix(i=0,j=0,k=0,l=0,m=0,n=0) = translate([0,60,0])*node_resize1_matrix(i=i,j=j,k=k,l=l,m=m,n=n);
 module node_boolean1(i=0,j=0,k=0,l=0,m=0,n=0)
 {
  translate([0,60,0])union()
  {
   node_resize1(i,j,k,l,m,n);
   node_resize(i,j,k,l,m,n);
   node_resize0(i,j,k,l,m,n);
   node_cube3(i,j,k,l,m,n);
  }
 }
 function node_hull1_matrix(i=0,j=0,k=0,l=0,m=0,n=0) = node_tube010_outobject_matrix(i=i,j=j,k=k,l=l,m=m,n=n);
 module node_hull1(i=0,j=0,k=0,l=0,m=0,n=0)
 {
  hull()
  {
   node_tube010_outobject(i,j,k,l,m,n);
   node_tube0_outobject(i,j,k,l,m,n);
  }
 }
 function node_hull2_matrix(i=0,j=0,k=0,l=0,m=0,n=0) = node_tube000_outobject_matrix(i=i,j=j,k=k,l=l,m=m,n=n);
 module node_hull2(i=0,j=0,k=0,l=0,m=0,n=0)
 {
  hull()
  {
   node_tube000_outobject(i,j,k,l,m,n);
   node_tube0101_outobject(i,j,k,l,m,n);
  }
 }
 function node_boolean2_matrix(i=0,j=0,k=0,l=0,m=0,n=0) = node_hull1_matrix(i=i,j=j,k=k,l=l,m=m,n=n);
 module node_boolean2(i=0,j=0,k=0,l=0,m=0,n=0)
 {
  union()
  {
   node_hull1(i,j,k,l,m,n);
   node_hull2(i,j,k,l,m,n);
  }
 }
 function node_resize1_matrix(i=0,j=0,k=0,l=0,m=0,n=0) = node_boolean2_matrix(i=i,j=j,k=k,l=l,m=m,n=n);
 module node_resize1(i=0,j=0,k=0,l=0,m=0,n=0)
 {
  resize([0,0,1])
  {
   node_boolean2(i,j,k,l,m,n);
  }
 }
 function node_cube3_matrix(i=0,j=0,k=0,l=0,m=0,n=0) = translate([10,0,0.5]);
 module node_cube3(i=0,j=0,k=0,l=0,m=0,n=0)
 {
  translate([10,0,0.5])cube([75,20,1],center=true);
 }
 function node_boolean5_matrix(i=0,j=0,k=0,l=0,m=0,n=0) = node_boolean9_matrix(i=i,j=j,k=k,l=l,m=m,n=n);
 module node_boolean5(i=0,j=0,k=0,l=0,m=0,n=0)
 {
  difference()
  {
   node_boolean9(i,j,k,l,m,n);
   node_hexgrid(i,j,k,l,m,n);
  }
 }
 function node_boolean6_matrix(i=0,j=0,k=0,l=0,m=0,n=0) = node_for_matrix(i=i,j=j,k=k,l=l,m=m,n=n);
 module node_boolean6(i=0,j=0,k=0,l=0,m=0,n=0)
 {
  union()
  {
   node_for(i,j,k,l,m,n);
   node_for3(i,j,k,l,m,n);
   node_for2(i,j,k,l,m,n);
  }
 }
 function node_boolean7_matrix(i=0,j=0,k=0,l=0,m=0,n=0) = node_boolean6_matrix(i=i,j=j,k=k,l=l,m=m,n=n);
 module node_boolean7(i=0,j=0,k=0,l=0,m=0,n=0)
 {
  difference()
  {
   node_boolean6(i,j,k,l,m,n);
   node_boolean9(i,j,k,l,m,n);
  }
 }
 function node_boolean8_matrix(i=0,j=0,k=0,l=0,m=0,n=0) = node_cube_matrix(i=i,j=j,k=k,l=l,m=m,n=n);
 module node_boolean8(i=0,j=0,k=0,l=0,m=0,n=0)
 {
  difference()
  {
   node_cube(i,j,k,l,m,n);
   node_cube0(i,j,k,l,m,n);
  }
 }
 function node_boolean9_matrix(i=0,j=0,k=0,l=0,m=0,n=0) = translate([0,0,-5])*node_cube0_matrix(i=i,j=j,k=k,l=l,m=m,n=n);
 module node_boolean9(i=0,j=0,k=0,l=0,m=0,n=0)
 {
  translate([0,0,-5])union()
  {
   node_cube0(i,j,k,l,m,n);
   node_for0(i,j,k,l,m,n);
  }
 }
 function node_boolean10_matrix(i=0,j=0,k=0,l=0,m=0,n=0) = node_cylinder3_matrix(i=i,j=j,k=k,l=l,m=m,n=n);
 module node_boolean10(i=0,j=0,k=0,l=0,m=0,n=0)
 {
  union()
  {
   node_cylinder3(i,j,k,l,m,n);
  }
 }
 function node_boolean11_matrix(i=0,j=0,k=0,l=0,m=0,n=0) = node_boolean12_matrix(i=i,j=j,k=k,l=l,m=m,n=n);
 module node_boolean11(i=0,j=0,k=0,l=0,m=0,n=0)
 {
  difference()
  {
   node_boolean12(i,j,k,l,m,n);
   node_boolean3(i,j,k,l,m,n);
   node_boolean0(i,j,k,l,m,n);
  }
 }
 function node_boolean12_matrix(i=0,j=0,k=0,l=0,m=0,n=0) = node_boolean7_matrix(i=i,j=j,k=k,l=l,m=m,n=n);
 module node_boolean12(i=0,j=0,k=0,l=0,m=0,n=0)
 {
  union()
  {
   node_boolean7(i,j,k,l,m,n);
   node_clamp(i,j,k,l,m,n);
   node_boolean8(i,j,k,l,m,n);
   node_boolean(i,j,k,l,m,n);
  }
 }
 function node_boolean13_matrix(i=0,j=0,k=0,l=0,m=0,n=0) = node_cube1_matrix(i=i,j=j,k=k,l=l,m=m,n=n);
 module node_boolean13(i=0,j=0,k=0,l=0,m=0,n=0)
 {
  union()
  {
   node_cube1(i,j,k,l,m,n);
   node_cube2(i,j,k,l,m,n);
  }
 }
 node_boolean4();
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
multicopter2();


/*BEGINGRAPHSCAD{
    "nodes": [
        {
            "name": "node_cylinder",
            "inputplugs": [
                {
                    "alias": "top radius",
                    "tip": "top radius of cynlinder",
                    "type": "str",
                    "name": "radius",
                    "value": "motor_radius+2"
                },
                {
                    "alias": "bottom radius",
                    "tip": "bottom radius of cynlinder",
                    "type": "str",
                    "name": "radius2",
                    "value": ""
                },
                {
                    "tip": "height of cylinder",
                    "type": "str",
                    "name": "height",
                    "value": "arm_height"
                },
                {
                    "tip": "centering of cylinder (on Z axis)",
                    "type": "str",
                    "name": "center",
                    "value": "false",
                    "combo": [
                        "true",
                        "false"
                    ]
                },
                {
                    "tip": "x translation of output object",
                    "type": "str",
                    "name": "tx",
                    "value": "arm_width"
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
                    "tip": "",
                    "type": "str",
                    "name": "$fn",
                    "value": "16"
                }
            ],
            "typename": "Node_cylinder",
            "version": 1,
            "y": -719.9089864244952,
            "x": 572.1877764977457
        },
        {
            "name": "node_hull",
            "inputplugs": [
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
                    "tip": "first object used in hull operation",
                    "connection": "node_cylinder.object",
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
                },
                {
                    "type": "object",
                    "name": "object9",
                    "value": ""
                },
                {
                    "type": "object",
                    "name": "object10",
                    "value": ""
                },
                {
                    "type": "object",
                    "name": "object11",
                    "value": ""
                },
                {
                    "type": "object",
                    "name": "object12",
                    "value": ""
                },
                {
                    "type": "object",
                    "name": "object13",
                    "value": ""
                },
                {
                    "type": "object",
                    "name": "object14",
                    "value": ""
                },
                {
                    "type": "object",
                    "name": "object15",
                    "value": ""
                },
                {
                    "type": "object",
                    "name": "object16",
                    "value": ""
                },
                {
                    "type": "object",
                    "name": "object17",
                    "value": ""
                },
                {
                    "type": "object",
                    "name": "object18",
                    "value": ""
                },
                {
                    "type": "object",
                    "name": "object19",
                    "value": ""
                },
                {
                    "type": "object",
                    "name": "object20",
                    "value": ""
                }
            ],
            "typename": "Node_hull",
            "version": 1,
            "y": -445.05346532376325,
            "x": 990.7446804798124
        },
        {
            "name": "node_for",
            "inputplugs": [
                {
                    "tip": "input object",
                    "connection": "node_rotate.object",
                    "type": "object",
                    "name": "object",
                    "value": ""
                },
                {
                    "tip": "name of variable that will change during loop",
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
                    "tip": "start value of variable used in loop",
                    "type": "str",
                    "name": "start",
                    "value": "-180/arm_count"
                },
                {
                    "tip": "target value of variable used in loop",
                    "type": "str",
                    "name": "end",
                    "value": "360-(180/arm_count)"
                },
                {
                    "tip": "increment of variable for each loop",
                    "type": "str",
                    "name": "step",
                    "value": "360/arm_count"
                }
            ],
            "typename": "Node_for",
            "version": 1,
            "y": -439.55784030812686,
            "x": 1518.2953027185904
        },
        {
            "name": "node_rotate",
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
            "y": -437.91025371724777,
            "x": 1235.3797501077438
        },
        {
            "name": "node_cylinder0",
            "inputplugs": [
                {
                    "alias": "top radius",
                    "tip": "top radius of cynlinder",
                    "type": "str",
                    "name": "radius",
                    "value": "motor_radius+6"
                },
                {
                    "alias": "bottom radius",
                    "tip": "bottom radius of cynlinder",
                    "type": "str",
                    "name": "radius2",
                    "value": ""
                },
                {
                    "tip": "height of cylinder",
                    "type": "str",
                    "name": "height",
                    "value": "arm_height"
                },
                {
                    "tip": "centering of cylinder (on Z axis)",
                    "type": "str",
                    "name": "center",
                    "value": "false",
                    "combo": [
                        "true",
                        "false"
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
                    "tip": "",
                    "type": "str",
                    "name": "$fn",
                    "value": "16"
                }
            ],
            "typename": "Node_cylinder",
            "version": 1,
            "y": -465.3993929104106,
            "x": 598.016554088792
        },
        {
            "name": "node_cylinder1",
            "inputplugs": [
                {
                    "alias": "top radius",
                    "tip": "top radius of cynlinder",
                    "type": "str",
                    "name": "radius",
                    "value": "motor_radius"
                },
                {
                    "alias": "bottom radius",
                    "tip": "bottom radius of cynlinder",
                    "type": "str",
                    "name": "radius2",
                    "value": ""
                },
                {
                    "tip": "height of cylinder",
                    "type": "str",
                    "name": "height",
                    "value": "50"
                },
                {
                    "tip": "centering of cylinder (on Z axis)",
                    "type": "str",
                    "name": "center",
                    "value": "false",
                    "combo": [
                        "true",
                        "false"
                    ]
                },
                {
                    "tip": "x translation of output object",
                    "type": "str",
                    "name": "tx",
                    "value": "arm_width-motor_radius*3.5"
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
                    "value": "-1"
                },
                {
                    "tip": "",
                    "type": "str",
                    "name": "$fn",
                    "value": "16"
                }
            ],
            "typename": "Node_cylinder",
            "version": 1,
            "y": 446.0034180372652,
            "x": 534.8823634375804
        },
        {
            "name": "node_cylinder2",
            "inputplugs": [
                {
                    "alias": "top radius",
                    "tip": "top radius of cynlinder",
                    "type": "str",
                    "name": "radius",
                    "value": "motor_radius+2"
                },
                {
                    "alias": "bottom radius",
                    "tip": "bottom radius of cynlinder",
                    "type": "str",
                    "name": "radius2",
                    "value": ""
                },
                {
                    "tip": "height of cylinder",
                    "type": "str",
                    "name": "height",
                    "value": "50"
                },
                {
                    "tip": "centering of cylinder (on Z axis)",
                    "type": "str",
                    "name": "center",
                    "value": "false",
                    "combo": [
                        "true",
                        "false"
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
                    "value": "-1"
                },
                {
                    "tip": "",
                    "type": "str",
                    "name": "$fn",
                    "value": "16"
                }
            ],
            "typename": "Node_cylinder",
            "version": 1,
            "y": 788.0210706393168,
            "x": 531.2924784179759
        },
        {
            "name": "node_hull0",
            "inputplugs": [
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
                    "tip": "first object used in hull operation",
                    "connection": "node_cylinder1.object",
                    "type": "object",
                    "name": "object1",
                    "value": ""
                },
                {
                    "connection": "node_cylinder2.object",
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
                },
                {
                    "type": "object",
                    "name": "object9",
                    "value": ""
                },
                {
                    "type": "object",
                    "name": "object10",
                    "value": ""
                },
                {
                    "type": "object",
                    "name": "object11",
                    "value": ""
                },
                {
                    "type": "object",
                    "name": "object12",
                    "value": ""
                },
                {
                    "type": "object",
                    "name": "object13",
                    "value": ""
                },
                {
                    "type": "object",
                    "name": "object14",
                    "value": ""
                },
                {
                    "type": "object",
                    "name": "object15",
                    "value": ""
                },
                {
                    "type": "object",
                    "name": "object16",
                    "value": ""
                },
                {
                    "type": "object",
                    "name": "object17",
                    "value": ""
                },
                {
                    "type": "object",
                    "name": "object18",
                    "value": ""
                },
                {
                    "type": "object",
                    "name": "object19",
                    "value": ""
                },
                {
                    "type": "object",
                    "name": "object20",
                    "value": ""
                }
            ],
            "typename": "Node_hull",
            "version": 1,
            "y": 601.8282045361973,
            "x": 781.0505729729239
        },
        {
            "name": "node_cylinder3",
            "inputplugs": [
                {
                    "alias": "top radius",
                    "tip": "top radius of cynlinder",
                    "type": "str",
                    "name": "radius",
                    "value": "motor_radius+1"
                },
                {
                    "alias": "bottom radius",
                    "tip": "bottom radius of cynlinder",
                    "type": "str",
                    "name": "radius2",
                    "value": "motor_radius+2"
                },
                {
                    "tip": "height of cylinder",
                    "type": "str",
                    "name": "height",
                    "value": "15"
                },
                {
                    "tip": "centering of cylinder (on Z axis)",
                    "type": "str",
                    "name": "center",
                    "value": "false",
                    "combo": [
                        "true",
                        "false"
                    ]
                },
                {
                    "tip": "x translation of output object",
                    "type": "str",
                    "name": "tx",
                    "value": "arm_width"
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
                    "tip": "",
                    "type": "str",
                    "name": "$fn",
                    "value": ""
                }
            ],
            "typename": "Node_cylinder",
            "version": 1,
            "y": 41.29520363860661,
            "x": 597.5008968710099
        },
        {
            "name": "node_cylinder4",
            "inputplugs": [
                {
                    "alias": "top radius",
                    "tip": "top radius of cynlinder",
                    "type": "str",
                    "name": "radius",
                    "value": "motor_radius"
                },
                {
                    "alias": "bottom radius",
                    "tip": "bottom radius of cynlinder",
                    "type": "str",
                    "name": "radius2",
                    "value": ""
                },
                {
                    "tip": "height of cylinder",
                    "type": "str",
                    "name": "height",
                    "value": "100"
                },
                {
                    "tip": "centering of cylinder (on Z axis)",
                    "type": "str",
                    "name": "center",
                    "value": "false",
                    "combo": [
                        "true",
                        "false"
                    ]
                },
                {
                    "tip": "x translation of output object",
                    "type": "str",
                    "name": "tx",
                    "value": "arm_width"
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
                    "value": "-1"
                },
                {
                    "tip": "",
                    "type": "str",
                    "name": "$fn",
                    "value": ""
                }
            ],
            "typename": "Node_cylinder",
            "version": 1,
            "y": 1147.26859663189,
            "x": 1778.0422646730026
        },
        {
            "name": "node_for0",
            "inputplugs": [
                {
                    "tip": "input object",
                    "connection": "node_rotate0.object",
                    "type": "object",
                    "name": "object",
                    "value": ""
                },
                {
                    "tip": "name of variable that will change during loop",
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
                    "tip": "start value of variable used in loop",
                    "type": "str",
                    "name": "start",
                    "value": "-180/arm_count"
                },
                {
                    "tip": "target value of variable used in loop",
                    "type": "str",
                    "name": "end",
                    "value": "360-(180/arm_count)"
                },
                {
                    "tip": "increment of variable for each loop",
                    "type": "str",
                    "name": "step",
                    "value": "360/arm_count"
                }
            ],
            "typename": "Node_for",
            "version": 1,
            "y": 858.0915540719545,
            "x": 1246.5680371968137
        },
        {
            "name": "node_rotate0",
            "inputplugs": [
                {
                    "connection": "node_hull0.object",
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
            "y": 860.3317165189649,
            "x": 985.1579771057995
        },
        {
            "name": "node_hexgrid",
            "inputplugs": [
                {
                    "tip": "x size of grid",
                    "type": "str",
                    "name": "grid_width",
                    "value": "arm_width*2+motor_radius"
                },
                {
                    "tip": "y size of grid",
                    "type": "str",
                    "name": "grid_lenght",
                    "value": "arm_width*2+motor_radius"
                },
                {
                    "tip": "height of hexagons",
                    "type": "str",
                    "name": "grid_height",
                    "value": "100"
                },
                {
                    "tip": "radius of hexagons",
                    "type": "str",
                    "name": "hex_radius",
                    "value": "3"
                },
                {
                    "tip": "space between hexagons",
                    "type": "str",
                    "name": "hex_border_width",
                    "value": "0.5"
                },
                {
                    "tip": "centering of grid",
                    "type": "str",
                    "name": "center",
                    "value": "true",
                    "combo": [
                        "true",
                        "false"
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
                    "value": "-3"
                }
            ],
            "typename": "Node_hexgrid",
            "version": 1,
            "y": 1046.0755481783658,
            "x": 1514.1199751757958
        },
        {
            "name": "node_for1",
            "inputplugs": [
                {
                    "tip": "input object",
                    "connection": "node_rotate6.object",
                    "type": "object",
                    "name": "object",
                    "value": ""
                },
                {
                    "tip": "name of variable that will change during loop",
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
                    "tip": "start value of variable used in loop",
                    "type": "str",
                    "name": "start",
                    "value": "-180/arm_count"
                },
                {
                    "tip": "target value of variable used in loop",
                    "type": "str",
                    "name": "end",
                    "value": "360-(180/arm_count)"
                },
                {
                    "tip": "increment of variable for each loop",
                    "type": "str",
                    "name": "step",
                    "value": "360/arm_count"
                }
            ],
            "typename": "Node_for",
            "version": 1,
            "y": 1049.3742522088187,
            "x": 2626.2264272182792
        },
        {
            "name": "node_rotate1",
            "inputplugs": [
                {
                    "connection": "node_cylinder4.object",
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
            "y": 1113.5590843587952,
            "x": 2044.1875388617823
        },
        {
            "name": "node_clamp",
            "inputplugs": [
                {
                    "tip": "input 3D object to clamp",
                    "connection": "node_boolean5.object",
                    "type": "object",
                    "name": "object",
                    "value": ""
                },
                {
                    "tip": "x size of clamping cube",
                    "type": "str",
                    "name": "x",
                    "value": "1000"
                },
                {
                    "tip": "y size of clamping cube",
                    "type": "str",
                    "name": "y",
                    "value": "1000"
                },
                {
                    "tip": "z size of clamping cube",
                    "type": "str",
                    "name": "z",
                    "value": "1"
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
                    "value": "0.5"
                },
                {
                    "tip": "centering of clamping cube",
                    "type": "str",
                    "name": "center",
                    "value": "true"
                }
            ],
            "typename": "Node_clamp",
            "version": 1,
            "y": 878.0605597633382,
            "x": 2483.148928277924
        },
        {
            "name": "node_cube",
            "inputplugs": [
                {
                    "tip": "x size of cube",
                    "type": "str",
                    "name": "sizex",
                    "value": "base_xsize"
                },
                {
                    "tip": "y size of cube",
                    "type": "str",
                    "name": "sizey",
                    "value": "base_ysize"
                },
                {
                    "tip": "z size of cube",
                    "type": "str",
                    "name": "sizez",
                    "value": "arm_height"
                },
                {
                    "tip": "x translation of output object",
                    "connection": "base_xoffest.string",
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
                    "value": "arm_height/2"
                },
                {
                    "tip": "centering of cube",
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
            "y": 309.22839984146367,
            "x": 1246.2264819655065
        },
        {
            "name": "node_cube0",
            "inputplugs": [
                {
                    "tip": "x size of cube",
                    "type": "str",
                    "name": "sizex",
                    "value": "base_xsize-6"
                },
                {
                    "tip": "y size of cube",
                    "type": "str",
                    "name": "sizey",
                    "value": "base_ysize-6"
                },
                {
                    "tip": "z size of cube",
                    "type": "str",
                    "name": "sizez",
                    "value": "100"
                },
                {
                    "tip": "x translation of output object",
                    "connection": "base_xoffest.string",
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
                    "tip": "centering of cube",
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
            "y": 559.7321647188451,
            "x": 1261.5406918676285
        },
        {
            "name": "node_tube",
            "inputplugs": [
                {
                    "type": "str",
                    "name": "radius",
                    "value": "motor_radius+3"
                },
                {
                    "type": "str",
                    "name": "radius2",
                    "value": ""
                },
                {
                    "type": "str",
                    "name": "height",
                    "value": "arm_height"
                },
                {
                    "type": "str",
                    "name": "tx",
                    "value": "arm_width"
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
                    "alias": "thickness",
                    "type": "str",
                    "name": "tickness",
                    "value": "2"
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
            "y": -1.1769579056382327,
            "x": 985.225472434854
        },
        {
            "name": "node_rotate2",
            "inputplugs": [
                {
                    "connection": "node_tube.object",
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
            "y": -23.843325743192395,
            "x": 1244.3455260169753
        },
        {
            "name": "node_for2",
            "inputplugs": [
                {
                    "tip": "input object",
                    "connection": "node_rotate2.object",
                    "type": "object",
                    "name": "object",
                    "value": ""
                },
                {
                    "tip": "name of variable that will change during loop",
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
                    "tip": "start value of variable used in loop",
                    "type": "str",
                    "name": "start",
                    "value": "-(180/arm_count)"
                },
                {
                    "tip": "target value of variable used in loop",
                    "type": "str",
                    "name": "end",
                    "value": "360-(180/arm_count)-1"
                },
                {
                    "tip": "increment of variable for each loop",
                    "type": "str",
                    "name": "step",
                    "value": "360/arm_count"
                }
            ],
            "typename": "Node_for",
            "version": 1,
            "y": -13.811193852882695,
            "x": 1516.6561941740983
        },
        {
            "name": "base_xoffest",
            "inputplugs": [
                {
                    "multiline": true,
                    "type": "str",
                    "name": "string",
                    "value": "0"
                }
            ],
            "typename": "Node_string",
            "version": 1,
            "y": 409.9913265451403,
            "x": 877.5993939377727
        },
        {
            "name": "arm_width",
            "inputplugs": [
                {
                    "connection": "arm_count.nextparam",
                    "type": "param",
                    "name": "previousparam",
                    "value": ""
                },
                {
                    "type": "str",
                    "name": "name",
                    "value": "arm_width"
                },
                {
                    "connection": "motor_distance.string",
                    "type": "str",
                    "name": "string",
                    "value": "60"
                }
            ],
            "typename": "Node_param",
            "version": 1,
            "y": -79.84187388154237,
            "x": -110.21943181677216
        },
        {
            "name": "base_xsize",
            "inputplugs": [
                {
                    "connection": "arm_height.nextparam",
                    "type": "param",
                    "name": "previousparam",
                    "value": ""
                },
                {
                    "type": "str",
                    "name": "name",
                    "value": "base_xsize"
                },
                {
                    "type": "str",
                    "name": "string",
                    "value": "50"
                }
            ],
            "typename": "Node_param",
            "version": 1,
            "y": 349.7155350541361,
            "x": -103.91103712362474
        },
        {
            "name": "base_ysize",
            "inputplugs": [
                {
                    "connection": "base_xsize.nextparam",
                    "type": "param",
                    "name": "previousparam",
                    "value": ""
                },
                {
                    "type": "str",
                    "name": "name",
                    "value": "base_ysize"
                },
                {
                    "type": "str",
                    "name": "string",
                    "value": "30"
                }
            ],
            "typename": "Node_param",
            "version": 1,
            "y": 561.2914306736693,
            "x": -91.50284219703462
        },
        {
            "name": "motor_radius",
            "inputplugs": [
                {
                    "connection": "base_ysize.nextparam",
                    "type": "param",
                    "name": "previousparam",
                    "value": ""
                },
                {
                    "type": "str",
                    "name": "name",
                    "value": "motor_radius"
                },
                {
                    "type": "str",
                    "name": "string",
                    "value": "8.6/2"
                }
            ],
            "typename": "Node_param",
            "version": 1,
            "y": 766.1664019709297,
            "x": -78.6441312833258
        },
        {
            "name": "arm_count",
            "inputplugs": [
                {
                    "type": "param",
                    "name": "previousparam",
                    "value": ""
                },
                {
                    "type": "str",
                    "name": "name",
                    "value": "arm_count"
                },
                {
                    "connection": "node_string.string",
                    "type": "str",
                    "name": "string",
                    "value": "6"
                }
            ],
            "typename": "Node_param",
            "version": 1,
            "y": -283.6426790393234,
            "x": -122.07077280633439
        },
        {
            "name": "arm_height",
            "inputplugs": [
                {
                    "connection": "arm_width.nextparam",
                    "type": "param",
                    "name": "previousparam",
                    "value": ""
                },
                {
                    "type": "str",
                    "name": "name",
                    "value": "arm_height"
                },
                {
                    "type": "str",
                    "name": "string",
                    "value": "4"
                }
            ],
            "typename": "Node_param",
            "version": 1,
            "y": 137.52622196690777,
            "x": -115.22034850112232
        },
        {
            "name": "motor_distance",
            "inputplugs": [
                {
                    "multiline": true,
                    "type": "str",
                    "name": "string",
                    "value": "50"
                }
            ],
            "typename": "Node_string",
            "version": 1,
            "y": -17.61360404926404,
            "x": -333.0478634869305
        },
        {
            "name": "node_rotate3",
            "inputplugs": [
                {
                    "connection": "node_boolean10.object",
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
            "y": -211.42777312052255,
            "x": 981.1109715803614
        },
        {
            "name": "node_for3",
            "inputplugs": [
                {
                    "tip": "input object",
                    "connection": "node_rotate5.object",
                    "type": "object",
                    "name": "object",
                    "value": ""
                },
                {
                    "tip": "name of variable that will change during loop",
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
                    "tip": "start value of variable used in loop",
                    "type": "str",
                    "name": "start",
                    "value": "-180/arm_count"
                },
                {
                    "tip": "target value of variable used in loop",
                    "type": "str",
                    "name": "end",
                    "value": "360-(180/arm_count)-1"
                },
                {
                    "tip": "increment of variable for each loop",
                    "type": "str",
                    "name": "step",
                    "value": "360/arm_count"
                }
            ],
            "typename": "Node_for",
            "version": 1,
            "y": -217.72937779720507,
            "x": 1511.4514911630158
        },
        {
            "name": "node_cube1",
            "inputplugs": [
                {
                    "tip": "x size of cube",
                    "type": "str",
                    "name": "sizex",
                    "value": "6"
                },
                {
                    "tip": "y size of cube",
                    "type": "str",
                    "name": "sizey",
                    "value": "4"
                },
                {
                    "tip": "z size of cube",
                    "type": "str",
                    "name": "sizez",
                    "value": "50"
                },
                {
                    "tip": "x translation of output object",
                    "type": "str",
                    "name": "tx",
                    "value": "arm_width-motor_radius"
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
                    "value": "50/2-2"
                },
                {
                    "tip": "centering of cube",
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
            "y": 1390.3545528078653,
            "x": 1666.0502560224759
        },
        {
            "name": "node_rotate4",
            "inputplugs": [
                {
                    "connection": "node_boolean13.object",
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
                    "value": "l"
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
            "y": 1265.3024114744994,
            "x": 2325.635017377708
        },
        {
            "name": "node_for4",
            "inputplugs": [
                {
                    "tip": "input object",
                    "connection": "node_rotate4.object",
                    "type": "object",
                    "name": "object",
                    "value": ""
                },
                {
                    "tip": "name of variable that will change during loop",
                    "type": "str",
                    "name": "variablename",
                    "value": "l",
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
                    "tip": "start value of variable used in loop",
                    "type": "str",
                    "name": "start",
                    "value": "-180/arm_count"
                },
                {
                    "tip": "target value of variable used in loop",
                    "type": "str",
                    "name": "end",
                    "value": "360-(180/arm_count)"
                },
                {
                    "tip": "increment of variable for each loop",
                    "type": "str",
                    "name": "step",
                    "value": "360/arm_count"
                }
            ],
            "typename": "Node_for",
            "version": 1,
            "y": 1239.0530837361605,
            "x": 2630.4902848690485
        },
        {
            "name": "node_cube2",
            "inputplugs": [
                {
                    "tip": "x size of cube",
                    "type": "str",
                    "name": "sizex",
                    "value": "8+motor_radius"
                },
                {
                    "tip": "y size of cube",
                    "type": "str",
                    "name": "sizey",
                    "value": "4"
                },
                {
                    "tip": "z size of cube",
                    "type": "str",
                    "name": "sizez",
                    "value": "50"
                },
                {
                    "tip": "x translation of output object",
                    "type": "str",
                    "name": "tx",
                    "value": "arm_width-motor_radius-4"
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
                    "value": "50/2+2"
                },
                {
                    "tip": "centering of cube",
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
            "y": 1490.4940591087695,
            "x": 1886.5123575109901
        },
        {
            "name": "node_string",
            "inputplugs": [
                {
                    "multiline": true,
                    "type": "str",
                    "name": "string",
                    "value": "4"
                }
            ],
            "typename": "Node_string",
            "version": 1,
            "y": -224.49831380133037,
            "x": -347.7024427288152
        },
        {
            "name": "node_rotate5",
            "inputplugs": [
                {
                    "connection": "node_rotate3.object",
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
                    "value": "motor_angle"
                },
                {
                    "type": "str",
                    "name": "rz",
                    "value": "0"
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
            "typename": "Node_rotate",
            "version": 1,
            "y": -223.57089630633988,
            "x": 1245.070128774527
        },
        {
            "name": "motor_angle",
            "inputplugs": [
                {
                    "connection": "motor_radius.nextparam",
                    "type": "param",
                    "name": "previousparam",
                    "value": ""
                },
                {
                    "type": "str",
                    "name": "name",
                    "value": "motor_angle"
                },
                {
                    "type": "str",
                    "name": "string",
                    "value": "0"
                }
            ],
            "typename": "Node_param",
            "version": 1,
            "y": 970.2886729495237,
            "x": -82.91664655851059
        },
        {
            "name": "node_rotate6",
            "inputplugs": [
                {
                    "connection": "node_rotate1.object",
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
                    "value": "motor_angle"
                },
                {
                    "type": "str",
                    "name": "rz",
                    "value": "0"
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
            "typename": "Node_rotate",
            "version": 1,
            "y": 1061.0737579234092,
            "x": 2317.6662517326704
        },
        {
            "name": "node_tube0",
            "inputplugs": [
                {
                    "type": "str",
                    "name": "radius",
                    "value": "4"
                },
                {
                    "type": "str",
                    "name": "radius2",
                    "value": ""
                },
                {
                    "type": "str",
                    "name": "height",
                    "value": "arm_height"
                },
                {
                    "type": "str",
                    "name": "tx",
                    "value": "-base_xsize/2"
                },
                {
                    "type": "str",
                    "name": "ty",
                    "value": "base_ysize/2"
                },
                {
                    "type": "str",
                    "name": "tz",
                    "value": "0"
                },
                {
                    "alias": "thickness",
                    "type": "str",
                    "name": "tickness",
                    "value": "2"
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
            "y": -486.57192425309745,
            "x": 2215.14791093692
        },
        {
            "name": "node_tube000",
            "inputplugs": [
                {
                    "type": "str",
                    "name": "radius",
                    "value": "4"
                },
                {
                    "type": "str",
                    "name": "radius2",
                    "value": ""
                },
                {
                    "type": "str",
                    "name": "height",
                    "value": "arm_height"
                },
                {
                    "type": "str",
                    "name": "tx",
                    "value": "base_xsize/2"
                },
                {
                    "type": "str",
                    "name": "ty",
                    "value": "base_ysize/2"
                },
                {
                    "type": "str",
                    "name": "tz",
                    "value": "0"
                },
                {
                    "alias": "thickness",
                    "type": "str",
                    "name": "tickness",
                    "value": "2"
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
            "y": -218.6791918134909,
            "x": 2230.0958446438763
        },
        {
            "name": "node_tube010",
            "inputplugs": [
                {
                    "type": "str",
                    "name": "radius",
                    "value": "4"
                },
                {
                    "type": "str",
                    "name": "radius2",
                    "value": ""
                },
                {
                    "type": "str",
                    "name": "height",
                    "value": "arm_height"
                },
                {
                    "type": "str",
                    "name": "tx",
                    "value": "-base_xsize/2"
                },
                {
                    "type": "str",
                    "name": "ty",
                    "value": "-base_ysize/2"
                },
                {
                    "type": "str",
                    "name": "tz",
                    "value": "0"
                },
                {
                    "alias": "thickness",
                    "type": "str",
                    "name": "tickness",
                    "value": "2"
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
            "y": -749.5700963939873,
            "x": 2210.5875003044393
        },
        {
            "name": "node_tube0101",
            "inputplugs": [
                {
                    "type": "str",
                    "name": "radius",
                    "value": "4"
                },
                {
                    "type": "str",
                    "name": "radius2",
                    "value": ""
                },
                {
                    "type": "str",
                    "name": "height",
                    "value": "arm_height"
                },
                {
                    "type": "str",
                    "name": "tx",
                    "value": "base_xsize/2"
                },
                {
                    "type": "str",
                    "name": "ty",
                    "value": "-base_ysize/2"
                },
                {
                    "type": "str",
                    "name": "tz",
                    "value": "0"
                },
                {
                    "alias": "thickness",
                    "type": "str",
                    "name": "tickness",
                    "value": "2"
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
            "y": 47.70847973800636,
            "x": 2236.804600498079
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
                    "connection": "node_tube010.outobject",
                    "type": "object",
                    "name": "object1",
                    "value": ""
                },
                {
                    "tip": "a 3D object",
                    "connection": "node_tube0.outobject",
                    "type": "object",
                    "name": "object2",
                    "value": ""
                },
                {
                    "tip": "a 3D object",
                    "connection": "node_tube000.outobject",
                    "type": "object",
                    "name": "object3",
                    "value": ""
                },
                {
                    "tip": "a 3D object",
                    "connection": "node_tube0101.outobject",
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
            "y": 161.29594914625022,
            "x": 2671.5953794298675
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
                    "connection": "node_tube010.holeobject",
                    "type": "object",
                    "name": "object1",
                    "value": ""
                },
                {
                    "tip": "a 3D object",
                    "connection": "node_tube0.holeobject",
                    "type": "object",
                    "name": "object2",
                    "value": ""
                },
                {
                    "tip": "a 3D object",
                    "connection": "node_tube000.holeobject",
                    "type": "object",
                    "name": "object3",
                    "value": ""
                },
                {
                    "tip": "a 3D object",
                    "connection": "node_tube0101.holeobject",
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
            "y": -120.01241728644084,
            "x": 2660.7640470243723
        },
        {
            "name": "node_boolean3",
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
                    "connection": "node_for1.object",
                    "type": "object",
                    "name": "object1",
                    "value": ""
                },
                {
                    "tip": "a 3D object",
                    "connection": "node_for4.object",
                    "type": "object",
                    "name": "object2",
                    "value": ""
                },
                {
                    "tip": "a 3D object",
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
            "y": 881.6765799326288,
            "x": 2820.7026759777436
        },
        {
            "name": "node_boolean4",
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
                    "connection": "node_boolean1.object",
                    "type": "object",
                    "name": "object1",
                    "value": ""
                },
                {
                    "tip": "a 3D object",
                    "connection": "node_boolean11.object",
                    "type": "object",
                    "name": "object2",
                    "value": ""
                },
                {
                    "tip": "a 3D object",
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
            "y": 32.32563344668381,
            "x": 3471.6535808707904
        },
        {
            "name": "node_resize",
            "inputplugs": [
                {
                    "connection": "node_boolean0.object",
                    "type": "object",
                    "name": "object",
                    "value": ""
                },
                {
                    "type": "str",
                    "name": "x",
                    "value": "0"
                },
                {
                    "type": "str",
                    "name": "y",
                    "value": "0"
                },
                {
                    "type": "str",
                    "name": "z",
                    "value": "10+arm_height"
                }
            ],
            "typename": "Node_resize",
            "version": 1,
            "y": -293.0674345718909,
            "x": 3052.0956747116543
        },
        {
            "name": "node_resize0",
            "inputplugs": [
                {
                    "connection": "node_boolean.object",
                    "type": "object",
                    "name": "object",
                    "value": ""
                },
                {
                    "type": "str",
                    "name": "x",
                    "value": "0"
                },
                {
                    "type": "str",
                    "name": "y",
                    "value": "0"
                },
                {
                    "type": "str",
                    "name": "z",
                    "value": "1"
                }
            ],
            "typename": "Node_resize",
            "version": 1,
            "y": -69.04490508151912,
            "x": 3047.5320037476686
        },
        {
            "name": "node_boolean1",
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
                    "value": "60"
                },
                {
                    "tip": "z translation of output object",
                    "type": "str",
                    "name": "tz",
                    "value": "0"
                },
                {
                    "tip": "First object in boolean operation",
                    "connection": "node_resize1.object",
                    "type": "object",
                    "name": "object1",
                    "value": ""
                },
                {
                    "tip": "a 3D object",
                    "connection": "node_resize.object",
                    "type": "object",
                    "name": "object2",
                    "value": ""
                },
                {
                    "tip": "a 3D object",
                    "connection": "node_resize0.object",
                    "type": "object",
                    "name": "object3",
                    "value": ""
                },
                {
                    "tip": "a 3D object",
                    "connection": "node_cube3.object",
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
            "y": -246.95535559430039,
            "x": 3306.611012229653
        },
        {
            "name": "node_hull1",
            "inputplugs": [
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
                    "tip": "first object used in hull operation",
                    "connection": "node_tube010.outobject",
                    "type": "object",
                    "name": "object1",
                    "value": ""
                },
                {
                    "connection": "node_tube0.outobject",
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
                },
                {
                    "type": "object",
                    "name": "object9",
                    "value": ""
                },
                {
                    "type": "object",
                    "name": "object10",
                    "value": ""
                },
                {
                    "type": "object",
                    "name": "object11",
                    "value": ""
                },
                {
                    "type": "object",
                    "name": "object12",
                    "value": ""
                },
                {
                    "type": "object",
                    "name": "object13",
                    "value": ""
                },
                {
                    "type": "object",
                    "name": "object14",
                    "value": ""
                },
                {
                    "type": "object",
                    "name": "object15",
                    "value": ""
                },
                {
                    "type": "object",
                    "name": "object16",
                    "value": ""
                },
                {
                    "type": "object",
                    "name": "object17",
                    "value": ""
                },
                {
                    "type": "object",
                    "name": "object18",
                    "value": ""
                },
                {
                    "type": "object",
                    "name": "object19",
                    "value": ""
                },
                {
                    "type": "object",
                    "name": "object20",
                    "value": ""
                }
            ],
            "typename": "Node_hull",
            "version": 1,
            "y": -561.5313351556258,
            "x": 2665.4306944301507
        },
        {
            "name": "node_hull2",
            "inputplugs": [
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
                    "tip": "first object used in hull operation",
                    "connection": "node_tube000.outobject",
                    "type": "object",
                    "name": "object1",
                    "value": ""
                },
                {
                    "connection": "node_tube0101.outobject",
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
                },
                {
                    "type": "object",
                    "name": "object9",
                    "value": ""
                },
                {
                    "type": "object",
                    "name": "object10",
                    "value": ""
                },
                {
                    "type": "object",
                    "name": "object11",
                    "value": ""
                },
                {
                    "type": "object",
                    "name": "object12",
                    "value": ""
                },
                {
                    "type": "object",
                    "name": "object13",
                    "value": ""
                },
                {
                    "type": "object",
                    "name": "object14",
                    "value": ""
                },
                {
                    "type": "object",
                    "name": "object15",
                    "value": ""
                },
                {
                    "type": "object",
                    "name": "object16",
                    "value": ""
                },
                {
                    "type": "object",
                    "name": "object17",
                    "value": ""
                },
                {
                    "type": "object",
                    "name": "object18",
                    "value": ""
                },
                {
                    "type": "object",
                    "name": "object19",
                    "value": ""
                },
                {
                    "type": "object",
                    "name": "object20",
                    "value": ""
                }
            ],
            "typename": "Node_hull",
            "version": 1,
            "y": -325.94709971352165,
            "x": 2659.5049633478693
        },
        {
            "name": "node_boolean2",
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
                    "connection": "node_hull1.object",
                    "type": "object",
                    "name": "object1",
                    "value": ""
                },
                {
                    "tip": "a 3D object",
                    "connection": "node_hull2.object",
                    "type": "object",
                    "name": "object2",
                    "value": ""
                },
                {
                    "tip": "a 3D object",
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
            "y": -500.391336267087,
            "x": 2895.285980149569
        },
        {
            "name": "node_resize1",
            "inputplugs": [
                {
                    "connection": "node_boolean2.object",
                    "type": "object",
                    "name": "object",
                    "value": ""
                },
                {
                    "type": "str",
                    "name": "x",
                    "value": "0"
                },
                {
                    "type": "str",
                    "name": "y",
                    "value": "0"
                },
                {
                    "type": "str",
                    "name": "z",
                    "value": "1"
                }
            ],
            "typename": "Node_resize",
            "version": 1,
            "y": -486.5743374433266,
            "x": 3084.779418408055
        },
        {
            "name": "node_cube3",
            "inputplugs": [
                {
                    "tip": "x size of cube",
                    "type": "str",
                    "name": "sizex",
                    "value": "75"
                },
                {
                    "tip": "y size of cube",
                    "type": "str",
                    "name": "sizey",
                    "value": "20"
                },
                {
                    "tip": "z size of cube",
                    "type": "str",
                    "name": "sizez",
                    "value": "1"
                },
                {
                    "tip": "x translation of output object",
                    "type": "str",
                    "name": "tx",
                    "value": "10"
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
                    "value": "0.5"
                },
                {
                    "tip": "centering of cube",
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
            "y": 119.08861416705304,
            "x": 3137.91435348116
        },
        {
            "name": "node_boolean5",
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
                    "tip": "First object in boolean operation",
                    "connection": "node_boolean9.object",
                    "type": "object",
                    "name": "object1",
                    "value": ""
                },
                {
                    "tip": "a 3D object",
                    "connection": "node_hexgrid.object",
                    "type": "object",
                    "name": "object2",
                    "value": ""
                },
                {
                    "tip": "a 3D object",
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
            "y": 887.8662732428186,
            "x": 2167.2146197611737
        },
        {
            "name": "node_boolean6",
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
                    "connection": "node_for.object",
                    "type": "object",
                    "name": "object1",
                    "value": ""
                },
                {
                    "tip": "a 3D object",
                    "connection": "node_for3.object",
                    "type": "object",
                    "name": "object2",
                    "value": ""
                },
                {
                    "tip": "a 3D object",
                    "connection": "node_for2.object",
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
            "y": -237.30903232249386,
            "x": 1777.0824705883751
        },
        {
            "name": "node_boolean7",
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
                    "tip": "First object in boolean operation",
                    "connection": "node_boolean6.object",
                    "type": "object",
                    "name": "object1",
                    "value": ""
                },
                {
                    "tip": "a 3D object",
                    "connection": "node_boolean9.object",
                    "type": "object",
                    "name": "object2",
                    "value": ""
                },
                {
                    "tip": "a 3D object",
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
            "y": 313.2224891812941,
            "x": 2228.5833830958327
        },
        {
            "name": "node_boolean8",
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
                    "tip": "First object in boolean operation",
                    "connection": "node_cube.object",
                    "type": "object",
                    "name": "object1",
                    "value": ""
                },
                {
                    "tip": "a 3D object",
                    "connection": "node_cube0.object",
                    "type": "object",
                    "name": "object2",
                    "value": ""
                },
                {
                    "tip": "a 3D object",
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
            "y": 390.5348900953659,
            "x": 1499.9338766871688
        },
        {
            "name": "node_boolean9",
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
                    "value": "-5"
                },
                {
                    "tip": "First object in boolean operation",
                    "connection": "node_cube0.object",
                    "type": "object",
                    "name": "object1",
                    "value": ""
                },
                {
                    "tip": "a 3D object",
                    "connection": "node_for0.object",
                    "type": "object",
                    "name": "object2",
                    "value": ""
                },
                {
                    "tip": "a 3D object",
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
            "y": 633.8922771338569,
            "x": 1484.5562625247976
        },
        {
            "name": "node_boolean10",
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
                    "connection": "node_cylinder3.object",
                    "type": "object",
                    "name": "object1",
                    "value": ""
                },
                {
                    "tip": "a 3D object",
                    "type": "object",
                    "name": "object2",
                    "value": ""
                },
                {
                    "tip": "a 3D object",
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
            "y": -227.2390849364956,
            "x": 589.8000428489768
        },
        {
            "name": "node_boolean11",
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
                    "tip": "First object in boolean operation",
                    "connection": "node_boolean12.object",
                    "type": "object",
                    "name": "object1",
                    "value": ""
                },
                {
                    "tip": "a 3D object",
                    "connection": "node_boolean3.object",
                    "type": "object",
                    "name": "object2",
                    "value": ""
                },
                {
                    "tip": "a 3D object",
                    "connection": "node_boolean0.object",
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
            "y": 351.0969822623456,
            "x": 3236.6707809422833
        },
        {
            "name": "node_boolean12",
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
                    "connection": "node_boolean7.object",
                    "type": "object",
                    "name": "object1",
                    "value": ""
                },
                {
                    "tip": "a 3D object",
                    "connection": "node_clamp.object",
                    "type": "object",
                    "name": "object2",
                    "value": ""
                },
                {
                    "tip": "a 3D object",
                    "connection": "node_boolean8.object",
                    "type": "object",
                    "name": "object3",
                    "value": ""
                },
                {
                    "tip": "a 3D object",
                    "connection": "node_boolean.object",
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
            "y": 487.84657856003787,
            "x": 2973.472939772415
        },
        {
            "name": "node_boolean13",
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
                    "connection": "node_cube1.object",
                    "type": "object",
                    "name": "object1",
                    "value": ""
                },
                {
                    "tip": "a 3D object",
                    "connection": "node_cube2.object",
                    "type": "object",
                    "name": "object2",
                    "value": ""
                },
                {
                    "tip": "a 3D object",
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
            "y": 1303.000821323717,
            "x": 2044.55818419962
        },
        {
            "name": "node_comment",
            "inputplugs": [
                {
                    "tip": "comment string to display on background",
                    "type": "str",
                    "name": "comment",
                    "value": "structure from\n the bottom \nplate"
                }
            ],
            "typename": "Node_comment",
            "version": 1,
            "y": -336.504990159294,
            "x": 3307.1040214242876
        }
    ],
    "version": 2
}ENDGRAPHSCAD*/