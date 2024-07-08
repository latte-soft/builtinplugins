local v0 = require(script:FindFirstAncestor("VisualizationModes").Packages.React);
return function(v1)
    return v0.createElement("Frame", {
        [v0.Tag] = "VisualizationModes-Bottom-Divider", 
        LayoutOrder = v1.LayoutOrder, 
        Visible = v1.Visible
    }, {
        DividerRender = v0.createElement("Frame")
    });
end;
