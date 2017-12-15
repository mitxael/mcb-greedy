%{
    ***************************************************************************************
    * Abstract:   Validate an Adjacency List of edges
    * Uses:       This file has been compiled using Matlab R2017b
    * Author:     Michael Vasquez Otazu
    * Email:      mitxael@hotmail.it
    * History:    V1.0 - Check consistency of an edge based on Adjancency Lists
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

function [m, n, newE] = Validation(E)

se = size(E);                                              % size of array E

%%% CHECK CONSISTENCY %%%
if (~isnumeric(E))
  error('The array E must be numeric!') 
end
if (~isreal(E))
  error('The array E must be real!') 
end
if (length(se)~=2)
  error('The array E must be 2D!') 
end
if ((se(2)<2))
  error('The array E must have 2 or 3 columns!'), 
end
if (~all(all(E(:,1:2)>0)))
  error('1st and 2nd columns of the array E must be positive!')
end
if (~all(all((E(:,1:2)==round(E(:,1:2))))))
  error('1st and 2nd columns of the array E must be integer!')
end
if (se(2)<3)                                               % weight not set
  E(:,3) = 1;                                              % all weights =1
end

%%% CALCULATE RETURN VALUES %%%
m = se(1);                                                 % number of nodes
newE = E(:,1:3);                                           % edges matrix (m,3)
n = max(max(newE(:,1:2)));                                 % number of vertexes

return