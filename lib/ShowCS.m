%{
    ***************************************************************************************
    * Abstract:   More detailed view of a cycle Space
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

function CS_show = Show(G, CS)

%% Augment CS
CS_show = ConvertAdjMatrix2AugmentedMatrix(G, CS);

%CS_show = circshift(CS_show, [0 -rows]); % move weights at first column
%CS_show = array2table(temp,'Cycle',{'r'+1:rows},'Vertex',{'c'+1:cols+1}); % Add labels

return

end