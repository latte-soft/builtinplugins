local l_script_FirstAncestor_0 = script:FindFirstAncestor("Ribbon");
local v1 = require(l_script_FirstAncestor_0.Packages.React);
local v2 = require(l_script_FirstAncestor_0.Packages.Framework);
local l_Localization_0 = v2.ContextServices.Localization;
local l_UI_0 = v2.UI;
local l_Pane_0 = l_UI_0.Pane;
local l_TextLabel_0 = l_UI_0.TextLabel;
return function(_)
    return v1.createElement(l_Pane_0, {
        [v1.Tag] = "X-Fit X-PadL"
    }, {
        Text = v1.createElement(l_TextLabel_0, {
            Text = l_Localization_0.use():getText("Plugin", "Text"), 
            [v1.Tag] = "Title X-Fit"
        })
    });
end;
