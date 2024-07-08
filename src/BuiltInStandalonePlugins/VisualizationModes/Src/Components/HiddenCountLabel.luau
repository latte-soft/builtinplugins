local l_script_FirstAncestor_0 = script:FindFirstAncestor("VisualizationModes");
local v1 = require(l_script_FirstAncestor_0.Packages.React);
local l_ContextServices_0 = require(l_script_FirstAncestor_0.Packages.Framework).ContextServices;
return function(v3)
    return v1.createElement("TextLabel", {
        [v1.Tag] = "VisualizationModes-HiddenCountLabel", 
        LayoutOrder = v3.LayoutOrder, 
        Visible = v3.Visible, 
        Text = l_ContextServices_0.Localization:use():getText(not v3.AllHidden and "HiddenCount" or "AllHiddenCount", "Text", {
            hidden = v3.HiddenCount
        })
    });
end;
