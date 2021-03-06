%{
    ***************************************************************************************
    * Abstract:   Determine Minimum Cycle Basis of a Graph (weighted & undirected)
    * Uses:       This file has been compiled using Matlab R2017b
    * Author:     Michael Vasquez Otazu
    * Email:      mitxael@hotmail.it
    * History:    V1.0 - Determine the MCB from Edges represented as Adjacency Lists
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

function MCB = MinimumCycleBasis(G)

%% Determine CycleSpace
CS = CycleSpace(G);
AugAdjList = ConvertAdjMatrix2AugmentedAdjList(G, CS);

% Determine the minimal linear-independent set of cycles
N = G.numedges - G.numnodes + 1;
[CS_row,CS_col] = size(AugAdjList);
MCB = zeros(0,CS_col);
[MCB_row,MCB_col] = size(MCB);

while MCB_row < N
    candidate = AugAdjList(1,:);
    MCB = [MCB; candidate]
    MCB_row = MCB_row + 1;
    AugAdjList(1,:) = [];
    test = MCB>=1;
    test(:,end) = [];
        
    if (GaussElimination_mod2(test) == 0)
        MCB(end,:) = [];
        MCB_row = MCB_row - 1;
    end
end

return