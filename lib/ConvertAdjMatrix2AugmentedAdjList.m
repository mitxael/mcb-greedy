%{
    ***************************************************************************************
    * Abstract:   Returns Adjacency Lists from an Adjacency Matrix
    * Uses:       This file has been compiled using Matlab R2017b
    * Author:     Michael Vasquez Otazu
    * Email:      mitxael@hotmail.it
    * History:    V1.0 - first release
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

function AugAdjList = ConvertAdjMatrix2AugmentedAdjList(G, AdjMatrix)

%% NAIVE METHOD
%{
[ii, jj] = find(AdjMatrix); % row and col indices of connections
temp = accumarray(ii, jj , [], @(x){sort(x.')}); % get all nodes connected to each node, sorted.
AdjLists = temp;
%}

%% PREPARE DATA
E = G.Edges{:, {'EndNodes','Weight'}};
%En = [(1:G.numedges)',E]; 
[AM_rows,AM_cols] = size(AdjMatrix); 
AdjList = zeros(AM_rows,G.numedges+1);
[AL_rows,AL_cols] = size(AdjList); 

%% SET WEIGHTS
for i = 1:AM_rows
    w = 0;
    for j = 1:AM_cols
        if ( AdjMatrix(i,j) > 0 )
            u = j;
            v = AdjMatrix(i,j);
            idx = find( ((E(:,1)==u) & (E(:,2)==v)) | ((E(:,1)==v) & (E(:,2)==u)) );
            AdjList(i,idx) = 1;
            w = w + E(idx,3);
        end
    end
    AdjList(i,AL_cols) = w;
end

%% SORT AUGMENTED MATRIX BY WEIGHT IN NON-INCREASING ORDER
AdjList_sorted = sortrows(AdjList, AL_cols);
AugAdjList = AdjList_sorted;
return

end