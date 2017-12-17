%{
    ***************************************************************************************
    * Abstract:   Generate a Minimum Spanning Tree for a Graph
    * Uses:       This file has been compiled using Matlab R2017b
    * Author:     Michael Vasquez Otazu
    * Email:      mitxael@hotmail.it
    * History:    V1.0 - Generate MST from Edges represented as Adjancency Lists
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

function MST = MinSpanningTree(E)

%% DATA VALIDATION
if nargin < 1
  error('There is no input data!')
end
[m, n, E] = Validation(E);              % new "validated" E

%% DATA PREPARATION
En = [(1:m)',E];                        % add the numbers
En(:,2:3) = sort(En(:,2:3)')';          % edges on increase order
ln = find(En(:,2)==En(:,3));            % the loops numbers
En = En(setdiff([1:size(En,1)]',ln),:); % remove the loops
[w,iw] = sort(En(:,4));                 % sort by weight in non-increasing order
Ens = En(iw,:);                         % sorted edges

%% BUILD GREEDY MST
Emst = Ens(1,:);                        % 1st edge include to minimal spanning tree
Ens = Ens(2:end,:);                     % rested edges
while (size(Emst,1)<n-1)&&(~isempty(Ens))
  Emst = [Emst;Ens(1,:)];               % add next edge to spanning tree
  Ens = Ens(2:end,:);                   % rested edges
  if any((Emst(end,2)== Emst(1:end-1,2))&(Emst(end,3)== Emst(1:end-1,3)))...
         | (IsCycle(Emst(:,2:3)))      % the multiple edge or cycle
    Emst = Emst(1:end-1,:);             % Remove the last added edge
  end
end
MST = Emst(:,1);                        % vector of numbers of edges
return

end

%% IsCycle?
function ic = IsCycle(E)                % true, if graph E have cycle
n = max(max(E));                        % number of vertexes
A = zeros(n);
A((E(:,1)-1)*n+E(:,2))=1;
A = A+A';                               % connectivity matrix
p = sum(A);                             % vertexes power
ic = false;
while any(p <= 1)                       % remove all tails
  nc = find(p > 1);                     % rested vertexes
  if isempty(nc)
    return
  end
  A = A(nc,nc);                         % new connectivity matrix
  p = sum(A);                           % new powers
end
ic = true;
return
end