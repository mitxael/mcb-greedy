%{
    ***************************************************************************************
    * Abstract:   Determine Fundamental Cycle Basis of a Graph (weighted & undirected)
    * Uses:       This file has been compiled using Matlab R2017b
    * Author:     Michael Vasquez Otazu
    * Email:      mitxael@hotmail.it
    * History:    V1.0 - firt release
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

function FCB = FundamentalCycleBasis_v2(G)

%%Calculate FCB
t = minspantree(G, 'Type', 'forest');
nonTreeEdges = setdiff(G.Edges.EndNodes, t.Edges.EndNodes, 'rows');
FCB = cell(size(nonTreeEdges, 1), 1);
for ii=1:length(FCB)
	src = nonTreeEdges(ii, 1); tgt = nonTreeEdges(ii, 2);
    FCB{ii} = [tgt shortestpath(t, src, tgt)];
end

return

end