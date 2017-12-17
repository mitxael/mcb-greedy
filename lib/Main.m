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

%% CLEAR WORKSPACE AND IMPORT GRAPH
clear;
path='G:\DOCUMENTS\DEVELOPMENT\C++\Graph-library\resources\';
%filename='input_5_nonisometricA.txt';
%filename='input_6_isometric.txt';
%filename='input_6_depina.txt';
%filename='input_6_depina_de.txt';
filename='input_7_complex.txt';
%filename='input_10_amalditriangle.txt';
%filename='input_12_dodecahedron.txt';
%filename='input_250_medium.txt';
G = ImportGraph(path, filename);

%% PLOT GRAPH INCLUDING MST
p = PlotGraph(G,0,0,0);

%% PLOT GRAPH INCLUDING SP(u,v)
%%u = 1;
%%v = G.numnodes;
%%p = PlotGraph(G,1,u,v);

%% DETERMINE MCB
%CS = CycleSpace(G); 
%CS_show = ShowCS(G, CS);
MCB = MinimumCycleBasis(G);
[MCB_show, MCB_weight] = ShowMCB(G, MCB);

%% REMOVE UNNECESSARY WORKSPACE VARIABLES
clear filename p path