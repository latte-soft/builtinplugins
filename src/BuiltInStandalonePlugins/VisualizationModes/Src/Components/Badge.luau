local l_script_FirstAncestor_0 = script:FindFirstAncestor("VisualizationModes");
local v1 = require(l_script_FirstAncestor_0.Packages.Framework);
local v2 = require(l_script_FirstAncestor_0.Packages.React);
local l_TextLabel_0 = v1.UI.TextLabel;
return function(v4)
    return v2.createElement("Frame", {
        LayoutOrder = v4.LayoutOrder, 
        [v2.Tag] = "VisualizationModes-Badge X-Fit X-Middle"
    }, {
        Label = v2.createElement(l_TextLabel_0, {
            [v2.Tag] = "X-Fit", 
            Text = v4.Text
        })
    });
end;
