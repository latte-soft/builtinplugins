local l_script_FirstAncestor_0 = script:FindFirstAncestor("AvatarCompatibilityPreviewer");
local v1 = require(l_script_FirstAncestor_0.Packages.Framework);
local v2 = require(l_script_FirstAncestor_0.Packages.React);
local _ = require(l_script_FirstAncestor_0.Src.Resources.Theme);
local l_UI_0 = v1.UI;
local l_Image_0 = l_UI_0.Image;
local l_Pane_0 = l_UI_0.Pane;
local l_Tooltip_0 = l_UI_0.Tooltip;
local l_Stylizer_0 = v1.ContextServices.Stylizer;
return function(v9)
    local v10 = l_Stylizer_0:use("UGCValidationStatusIcon", v9);
    return v2.createElement(l_Pane_0, {
        Position = v10.Position, 
        Size = v10.Size, 
        OnClick = v9.OnClick
    }, {
        UIAspectRatioConstraint = v2.createElement("UIAspectRatioConstraint"), 
        Image = v2.createElement(l_Image_0, {
            Image = v10.Image, 
            ImageColor3 = v10.Color
        }), 
        Tooltip = v2.createElement(l_Tooltip_0, {
            Text = v9.TooltipText
        })
    });
end;
