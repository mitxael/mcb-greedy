%{
    ***************************************************************************************
    * Abstract:   Plot a graph according in a customized way
    * Uses:       This file has been compiled using Matlab R2017b
    * Author:     Michael Vasquez Otazu
    * Email:      mitxael@hotmail.it
    * History:    V1.0 - Plot graph according to its number of nodes
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

function p = PlotGraph(G, opt, u, v)

%% GRAPH CUSTOM PLOT
p = plot(G);

if (opt == 0)
    [T,q] = minspantree(G);
else
    T = shortestpath(G, u, v, 'Method', 'positive');
    disp(T);
end

if (numnodes(G) <= 20)
    p.EdgeLabel = G.Edges.Weight;
    p.LineWidth = 1.00;
    p.NodeColor = [0.500, 0.001, 0.001];
    p.Marker = 'o';
    p.MarkerSize = 5;
    nl = p.NodeLabel;
    p.NodeLabel = '';
    xd = get(p, 'XData');
    yd = get(p, 'YData');
    text(xd, yd, nl, 'Color', [0.500, 0.001, 0.001], 'FontWeight', 'bold', ...
        'FontSize',9, 'HorizontalAlignment','Left', 'VerticalAlignment','Top');
    highlight(p,T,'EdgeColor','r','LineWidth',1.5);
elseif (numnodes(G) <= 40)
    p.EdgeLabel = G.Edges.Weight;
    p.LineWidth = 0.750;
    p.NodeColor = [0.500, 0.001, 0.001];
    p.Marker = 'o';
    p.MarkerSize = 3;   
    nl = p.NodeLabel;
    p.NodeLabel = '';
    xd = get(p, 'XData');
    yd = get(p, 'YData');
    text(xd, yd, nl, 'Color', [0.500, 0.001, 0.001], 'FontWeight', 'bold', ...
        'FontSize',7, 'HorizontalAlignment','Left', 'VerticalAlignment','Top');
    highlight(p,T,'EdgeColor','r','LineWidth',1);
else %(numnodes(G) > 40)
    p.LineWidth = 0.500;
    p.NodeColor = [0.500, 0.001, 0.001];
    p.Marker = 'o';
    p.MarkerSize = 1;   
    nl = p.NodeLabel;
    p.NodeLabel = '';
    xd = get(p, 'XData');
    yd = get(p, 'YData');
    text(xd, yd, nl, 'FontWeight', 'bold', 'FontSize',8, ...
        'HorizontalAlignment', 'Left', 'VerticalAlignment','Top');
    highlight(p,T,'EdgeColor','r','LineWidth',0.75);
end

return