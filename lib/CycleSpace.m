%{
    ***************************************************************************************
    * Abstract:   Determine Cycle Space of a Graph (weighted & undirected)
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

function CS = CycleSpace(G, varargin)

global A B limit cycleCount;  

%% Convert graph to matrix
A = ConvertAdjLists2AdjMatrix(G);

%% Check consistency
if nargin<2, varargin = 1e-10; end
if ( isempty( A ) ), return; end

%% Set variables
nVert = G.numnodes;
B = zeros( 0, nVert );
limit = nVert;
cycleCount = zeros( 1, nVert );

%% Generate all unique triples of connected vertices which have
%   indices v1 < v2 < v3 and connections v2 - v1 - v3, then 
%   search for paths which connect v2 to v3
for ix = 1 : nVert - 2                      % v1
    for jx = ix + 1 : nVert - 1             % v2
        if ( A( ix, jx ) == 1 )             % there's an edge (v1,v2)
            pathV = [ zeros( 1, ix ), ones( 1, nVert - ix ) ]; % Initialize pathV, and block v1
            pathE = zeros( 1, nVert);
            pathV(jx) = 0;                  % block v2
            pathE(jx) = ix;                 % add edge (v2,v1)
            for kx = jx + 1 : nVert         % v3
                if ( A( kx, ix ) == 1 )     % there's an edge (v3,v1)
                    % initial path length = 2; now look for extensions
                    pathE(ix) = kx;         % add edge (v1,v3)
                    nextVert( pathV, pathE, 2, ix, jx, kx );  
                end
            end
        end
    end
end

CS = B;

end



%% Scope: Extend current path by one additional vertex
% - pathVrtx: Boolean vector of vertices:
%       1 = vertex available for extension
%       0 = vertex blocked (already in path or index lower than v1)
% - pathEdgs: Vector of edges (index=source; value=destination)
function nextVert( pathVrtx, pathEdgs, pathLength, root, v2, v3 )
    
    global A B limit cycleCount;
    pathLength = pathLength + 1;
    
    % get candidates for extension
    edgesV2 =  A( v2, : );          % extract all edges of v2
    pathVrtx_A = pathVrtx .* edgesV2;     % multiply (elem by elem) pathV and A (i.e. set to "0" all edges regarding blocked vertices)
    candS = find( pathVrtx_A );        % return col_indexes of non-zero values (i.e. non-blocked vertices with edges to v2)
    
    for mx = 1 : size( candS, 2 )
        cand = candS( mx );
        if ( cand == v3 )         % found a cycle!
            cycleCount( pathLength ) = cycleCount( pathLength ) + 1;
            pathVrtx(cand) = 0;  % add vertex into pathV
            pathEdgs(cand) = v2; % add edge (v3,v2)
            %pathE(v3) = root;
            %{
            fprintf( 'Cycle of %4d edges:\n', pathLength);
            %cycleDim = sum(pathV~=1,2);
            disp(pathV);
            %}
            cycleN = pathEdgs; % save the cycle
            %for idx = 1:root-1, cycleN(idx)=1; end % clean from old %"blocked" vertices % only if B is generated from pathV
            B = [B;cycleN]; % INSERT CYCLE into cycleSpace
            [rr,cc] = size(B);
            if (rr==17)
                disp('hello');
            end
        elseif ( pathLength < limit )      % extend again
            pathVrtx_new = pathVrtx;
            pathEdgs_new = pathEdgs;
            pathVrtx_new(cand) = 0;    % block vertex just added to path 
            pathEdgs_new(cand) = v2;   % Add edge (v3,v2)
            nextVert( pathVrtx_new, pathEdgs_new, pathLength, root, cand, v3 );
        end
    end
end