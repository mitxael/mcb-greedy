%{
    ***************************************************************************************
    * Abstract:   Get a linearly independent set of columns from a matrix X
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

function [Xsub,Xidx] = GaussElimination_std(G, X, tol)
 
%% Check if X has no non-zeros and hence no independent columns
if ~nnz(X)
     Xsub=[]; Xidx=[];
     return
 end
 
%%  Set tol, the rank estimation tolerance (default=1e-10)
if nargin<3, tol=1e-10; end

%% Orthogonal-triangular-decomposition so that  X*E = Q*R
% Unitary Q, Upper-triangular R, Permutation E
[Q, R, E] = qr(X,0); 

%% Set the dimension "v" of the Cycle Basis
v = G.numedges - G.numnodes + 1;
% This value can be also calculated as the "rank of the independent set"
%{
if ~isvector(R)
	diagr = abs(diag(R)); % Diagonal matrix of R (with ABSolute values)
else
	diagr = R(1);   
end
r = [find(diagr >= tol*diagr(1), 1, 'last')] -1 ;
%}

%% Select linearly-independent columns
[X_rows, X_cols] = size(X);
[R_rows, R_cols] = size(R);
elemN = 0;
idx = 1;
Xsub = zeros(X_rows,0);
Xidx = [];
while (elemN < v & idx < X_cols)
    if R(R_rows, idx) == 0
        tmp = X(:,idx);
        Xsub = [Xsub tmp];
        Xidx = [Xidx idx];
        elemN = elemN + 1;
    end
    idx = idx + 1;
end

%Xidx = sort(E(1:r));
%Xsub = X(:,Xidx);

return

end