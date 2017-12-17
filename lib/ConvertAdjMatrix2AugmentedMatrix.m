%{
    ***************************************************************************************
    * Abstract:   Returns a Weight-augmented Matrix of edges from an AdjacencyMatrix
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

function AugMatrix = ConvertAdjMatrix2AugmentedMatrix(G, AdjMatrix)

%% PREPARE DATA
E = G.Edges{:, {'EndNodes','Weight'}};
En = [(1:G.numedges)',E]; 
[rows,cols] = size(AdjMatrix); 
AdjMatrix_weighted = [AdjMatrix (1:rows)'];

%% SET WEIGHTS
for i = 1:rows
    w = 0;
    for j = 1:cols
        if (AdjMatrix(i,j) > 0)
            idx = find( ((En(:,2)==j) & (En(:,3)==AdjMatrix(i,j))) | ((En(:,2)==AdjMatrix(i,j)) & (En(:,3)==j)) );
            w = w + En(idx,4); 
        end
    end
    AdjMatrix_weighted(i,j+1) = string(w);
end

%% SORT AUGMENTED MATRIX BY WEIGHT IN NON-INCREASING ORDER
AdjMatrix_sorted = sortrows(AdjMatrix_weighted, j+1);
%AugMatrix = CS_tmp(:,1:j); % Remove cycle weights
AugMatrix = AdjMatrix_sorted;

return

end