%{
    ***************************************************************************************
    * Abstract:   Determine Minimal Cycle Basis of an imported Graph
    * Uses:       This file has been compiled using Matlab R2017b
    * Author:     Michael Vasquez Otazu
    * Email:      mitxael@hotmail.it
    * History:    V1.0 - Determine the MCB from a graph imported from a text file
    ********************************* START LICENSE BLOCK *********************************
    * The MIT License (MIT)
    * Copyright (C) 2017 Michael Vasquez Otazu
    *
    * Permission is hereby granted, free of charge, to any person obtaining a copy of this 
    * software and associated documentation files (the "Software"), to deal in the Software 
    * without restriction, including without limitation the rights to use, copy, modify, merge, 
    * publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons 
    * to whom the Software is furnished to do so, subject to the following conditions:
    * 
    * The above Copyright notice and this Permission Notice shall be included in all copies 
    * or substantial portions of the Software.
    ********************************** END LICENSE BLOCK **********************************
%}

clear;

path='G:\DOCUMENTS\DEVELOPMENT\C++\Graph\resources\';
%filename='input_5_nonisometricA.txt';
%filename='input_6_isometric.txt';
%filename='input_6_depina.txt';
%filename='input_6_depina_de.txt';
filename='input_7_complex.txt';
%filename='input_10_amalditriangle.txt';
%filename='input_12_dodecahedron.txt';
%filename='input_250_medium.txt';

G = ImportGraph(path, filename);
p = PlotGraph(G);

%E = G.Edges{:, {'EndNodes','Weight'}};
%MST = MinSpanningTree(E)';
%MST_ = [MST(:,1:19) 2];

%MCB = CycleBasis(E, MST)';

%path = shortestpath(G, findnode(G,1) , findnode(G,numnodes(G)),'Method','positive');
%highlight(p, MST_, 'EdgeColor', 'g');