%{
    ***************************************************************************************
    * Abstract:   Import Graph from a text file using Matlab
    * Uses:       This file has been compiled using Matlab R2017b
    * Author:     Michael Vasquez Otazu
    * Email:      mitxael@hotmail.it
    * History:    V1.0 - Import a graph (undirected and weighted) from a text file 
                  containing an adjacency list from the third line onwards.
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

function G = ImportGraph(path, filename)

G = graph(zeros(0,0));                                          % create empty graph

%%% READ FROM FILE %%%
fid = fopen(strcat(path,filename));

m = fgets(fid);                                                 % number of nodes
n = fgets(fid);                                                 % number of edges

while ~feof(fid)                                                % read and add edges to G
    edge = textscan(fid,'%d %d %f *[^\n]','Delimiter','\b');
    u = edge{1}+1;
    v = edge{2}+1;
    w = edge{3}*100;
    G = addedge(G, u, v, w);
end

fclose(fid);

return