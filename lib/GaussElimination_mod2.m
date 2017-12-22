%{
    ***************************************************************************************
    * Abstract:   Determine linear independence using Gaussian elimination modulo 2
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

function LinearIndependent = GaussElimination_mod2(A)

% Read the size of the original matrix A 
[n,m] = size(A);

% Work on all columns and all but last row
row = 1;
for (col = 1:m)
    if (row < n)
		%Look for column holding the first "1" in the "pivot" row
		i = find(A(row:n, col), 1); % finds the FIRST "1" in "col_pivot" column starting at row
        i = i + row - 1;
        if isempty(i) % no "1" found in column "row"
            continue
        else    
           % swap rows
            A([i, row], :) = A([row, i], :);
            %XOR the pivot "row" against all other rows
            % add "row" row to all following rows (i.e. i+1 onwards) that contain "1" in "row" column
            A_sub_nonzero_idx = find(A((i+1):n,col))'; % Indexes vector' of non-zero values in 
            for k = A_sub_nonzero_idx+i %for all rows containing a "1" in the "row" column
                A(k, :) = bitxor(A(k,:), A(row,:));
            end
            row = row + 1;	%row increases only when a "1" column was found and processed
        end
    end
end

last_row = sum(A(end,:));
if last_row > 0
    LinearIndependent = 1;
else
    LinearIndependent = 0;
end
 
return
end
 