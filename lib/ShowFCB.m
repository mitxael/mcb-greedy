%{
    ***************************************************************************************
    * Abstract:   More detailed view of a Fundamental Cycle Basis
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

function [FCB_show, FCB_weight] = ShowFCB(G, A)

%% Augment matrix
E = G.Edges{:, {'EndNodes','Weight'}};
En = [(1:G.numedges)',E]; 
[rows,cols] = size(A); 
A_show = string([A;(1:cols)]);
A_weight = 0;
for j = 1:cols
    w = 0;
    for i = 1:rows
        if (A(i,j) == 1)
            A_show(i,j) = strcat( '(', num2str(En(i,2)), ',',num2str(En(i,3)), ',',num2str(En(i,4)),')');
            w = w + En(i,4);
        end
    end
	A_show(i+1,j) = string(w);
    A_weight = A_weight + w;
end

A_show = A_show';
%A_show = circshift(A_show, [0 -rows]);

FCB_show = A_show;
FCB_weight = A_weight;

return

end