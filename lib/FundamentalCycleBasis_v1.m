%{
    ***************************************************************************************
    * Abstract:   Determine Fundamental Cycle Basis of a Graph (weighted & undirected)
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

function MCB = FundamentalCycleBasis_v1(G)

%% DATA PREPARATION
E = G.Edges{:, {'EndNodes','Weight'}};
MST = MinSpanningTree(E);
E = sort(E(:,1:2)')';                                   % sort by number of vertexes
m = size(E,1);                                          % number of edges
n = max(max(E));                                        % number of vertexes
Erest = E(setdiff([1:m],MST),:);                        % rested edges
nr = m-n+1;                                             % number of elements in cycle basis
MCB = zeros(m,nr);                                      % array for cycles

%% ADD CYCLES TO BASIS
for k1=1:nr                                             % we add one independent cycle
  Ecurr = [E(MST,:);Erest(k1,:)];                       % spanning tree + one edge
  A = zeros(n);
  A((Ecurr(:,1)-1)*n+Ecurr(:,2))=1;
  A = A+A';                                             % connectivity matrix
  p = sum(A);                                           % the vertexes power
  nv = [1:n];                                           % numbers of vertexes
  while any(p==1)                                       % Delete all tails
    nc = find(p>1);                                     % rested vertexes
    A = A(nc,nc);                                       % new connectivity matrix
    nv = nv(nc);                                        % rested numbers of vertexes
    p = sum(A);                                         % new powers
  end
  [i1,j1] = find(A);
  incedg = nv(unique(sort([i1 j1]')','rows'));          % included edges
  MCB(:,k1) = ismember(E,incedg,'rows');                % current column
end

return

end