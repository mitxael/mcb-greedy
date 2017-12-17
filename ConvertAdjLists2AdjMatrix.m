%{
    ***************************************************************************************
    * Abstract:   Returns an Adjacency Matrix from Adjacency Lists
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

function AdjMatrix = ConvertAdjLists2AdjMatrix(G)

%% Convert to Adjacency Matrix
edgeList = G.Edges{:, {'EndNodes','Weight'}};
nEdge = G.numedges;
nVert = G.numnodes;
AdjMatrix = zeros( nVert, nVert );

for ix = 1 : nEdge
	vert1 = edgeList( ix, 1 );
    vert2 = edgeList( ix, 2 );
    AdjMatrix( vert1, vert2 ) = 1;
	AdjMatrix( vert2, vert1 ) = 1;
end

return

end