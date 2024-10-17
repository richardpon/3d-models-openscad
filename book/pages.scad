$fn = $preview ? 32: 128;

overlap=.001;

// book dimentions
book_depth = 7;
book_height = 40;
book_width = 30;

cover_thickness = .5;
binding_width = 1;

//pages dimensions

pages_depth = book_depth - 2*cover_thickness +overlap;
pages_height = book_height - 2*cover_thickness + overlap;
pages_width = book_width - cover_thickness - binding_width+overlap;

page_depth_offset = pages_depth/2;
page_height_offset = pages_height/2;
page_width_offset = pages_width/2;




CubePoints = [
  [  0,  0,  0 ],  //0
  [ 10,  0,  0 ],  //1
  [ 10,  7,  0 ],  //2
  [  0,  7,  0 ],  //3
  [  0,  0,  5 ],  //4
  [ 10,  0,  5 ],  //5
  [ 10,  7,  5 ],  //6
  [  0,  7,  5 ]]; //7
  
CubeFaces = [
  [0,1,2,3],  // bottom
  [4,5,1,0],  // front
  [7,6,5,4],  // top
  [5,6,2,1],  // right
  [6,7,3,2],  // back
  [7,4,0,3]]; // left
  
//polyhedron(CubePoints, CubeFaces);


points = [
    // Top outer edge binding side
    [-page_width_offset, -page_depth_offset, page_height_offset], //0 (close)
    [-page_width_offset, page_depth_offset, page_height_offset], //1 (far)
    
    // top outer edge opposite binding
    [page_width_offset, -page_depth_offset, page_height_offset], //2 (close)
    [page_width_offset, page_depth_offset, page_height_offset], //3 (far)
    
    // bottom outer edge opposite binding
    [page_width_offset, -page_depth_offset, -page_height_offset], //4 (close)
    [page_width_offset, page_depth_offset, -page_height_offset], //5 (far)

    
    // bottom outer edge binding side
    [-page_width_offset, -page_depth_offset, -page_height_offset], //6 (close)
    [-page_width_offset, page_depth_offset, -page_height_offset], //7 (far

    
    // top inside triangle
    [-page_width_offset+page_depth_offset, 0, page_height_offset-page_depth_offset], //8 (left)
    [page_width_offset-page_depth_offset, 0, page_height_offset-page_depth_offset], //9 (right)
    
    // oppsite binding inside triangle
    [page_width_offset-page_depth_offset, 0, page_height_offset-page_depth_offset], //10 (top)
    [page_width_offset-page_depth_offset, 0, -page_height_offset+page_depth_offset], //11 (bottom)
    
    // bottom inside triange
    [-page_width_offset+page_depth_offset, 0, -page_height_offset+page_depth_offset], //12 (left)
    [page_width_offset-page_depth_offset, 0, -page_height_offset+page_depth_offset], //13 (right
    
    // Hook triangle top
    [-page_width_offset, page_depth_offset, page_height_offset-2*page_depth_offset], //14 (far)
    [-page_width_offset+page_depth_offset, 0, page_height_offset-2*page_depth_offset], //15 (middle)
    [-page_width_offset, -page_depth_offset, page_height_offset-2*page_depth_offset], //16 (close)

    // Hook triangle bottom
    [-page_width_offset, page_depth_offset, -page_height_offset+2*page_depth_offset], //17 (far)
    [-page_width_offset+page_depth_offset, 0, -page_height_offset+2*page_depth_offset], //18 (middle)
    [-page_width_offset, -page_depth_offset, -page_height_offset+2*page_depth_offset], //19 (close)    
];

faces = [
    [0,1,3,2], //top
    [2,3,5,4], // opposite binding edge
    [4,5,7,6], //bottom
    [3,1,8,9], //top far inner edge
    [2,0,8,9], //top close inner edge
    [5,3,10,11],//opposite binding inner far edge
    [2,4,11,10],//opposite binding inner close edge
    [7,5,13,12], //bottom far inner edge
    [4,6,12,13], //bottom closer inner edge

    // top hook
    [1,0,16,14],// (left)binding face
    [1,14,15,8], // far face
    [0,8,15,16], // close face
    [14,15,16], // bottom face
    
    //bottom hook
    [18,17,7,12],//far face
    [19,18,12,6],//close face
    [17,19,6,7], // left binding face
    [17,18,19],//top face
];

polyhedron(points, faces);