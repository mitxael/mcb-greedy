%{
    ***************************************************************************************
    * Abstract:   More detailed view of a Minimum Cycle Basis
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

function [MCB_show, MCB_weight] = ShowMCB(G, MCB)

%% Augment MCB matrix
AugMatrix = ConvertAdjMatrix2AugmentedMatrix(G, MCB);
MCB_show = AugMatrix;
MCB_weight = sum(AugMatrix(:,end));
%MCB_show = circshift(MCB_show, [0 -rows]); % move weights at first column

%% Add labels
rowNames = {};
colNames = {};
[rows,cols] = size(MCB_show);
rowNames = {}; for i = 1:rows, rowNames{end+1} = strcat('Cycle',num2str(i)); end;
colNames = {}; for j = 1:cols-1, colNames{end+1} = strcat('Edge',num2str(j)); end; colNames{end+1} = 'Weight';
MCB_show = array2table(MCB_show,'RowNames',rowNames,'VariableNames',colNames); % Add labels

return

end