
lc = 0.015;

// cilindro 
Point(11) = { 0.2,0.2, 0, lc};  
Point(12) = { 0.25, 0.2, 0, lc};
Point(13) = { 0.2, 0.25, 0, lc};
Point(15) = { 0.15, 0.2, 0, lc};
Point(16) = {0.2, 0.15, 0, lc};

Circle(17) = {12    , 11    , 13};
Circle(18) = {13   , 11    , 15};
Circle(19) = {15   , 11    , 16};
Circle(20) = {16   , 11    , 12};


// Creamos la superficie

Line Loop(21) = {17, 18, 19,20};


// Superficie exterior
Point(1) = {0, 0, 0, lc};
Point(2) = {1.2, 0,  0, lc};
Point(3) = {1.2, 0.4, 0, lc};
Point(4) = {0,  0.4, 0, lc};


Line(5) = {1, 2};
Line(6) = {2, 3};
Line(7) = {3, 4};
Line(8) = {4, 1};

Line Loop(9) = {5,6,7,8};

// creamos la superficie plata completa

Plane Surface(100) = {9, 21};  



//+
Extrude {0, 0, 0.1} {
  Surface{100}; Layers {1}; Recombine;
}

// Asignamos nombres a las superficies

Physical Surface("inlet", 143) = {125};
//+
Physical Surface("outlet", 144) = {117};
//+
Physical Surface("top", 145) = {121};
//+
Physical Surface("bottom", 146) = {113};
//+
Physical Surface("cylinder", 147) = {133, 137, 141, 129};
//+
Physical Surface("frontAndBack", 148) = {142, 100};
//+
Physical Volume("Volumen", 149) = {1};
