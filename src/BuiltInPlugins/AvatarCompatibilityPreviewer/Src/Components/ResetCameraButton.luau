local l_script_FirstAncestor_0 = script:FindFirstAncestor("AvatarCompatibilityPreviewer");
local v1 = require(l_script_FirstAncestor_0.Packages.Framework);
local v2 = require(l_script_FirstAncestor_0.Packages.React);
local v3 = require(l_script_FirstAncestor_0.Src.Components.AvatarScreenContext);
local v4 = require(l_script_FirstAncestor_0.Src.Util.DEPRECATED_AvatarScreenContext);
local v5 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagAvatarPreviewerSkinToneAlphaDetection);
local l_UI_0 = v1.UI;
local l_Button_0 = l_UI_0.Button;
local l_Image_0 = l_UI_0.Image;
local l_Tooltip_0 = l_UI_0.Tooltip;
local l_Stylizer_0 = v1.ContextServices.Stylizer;
local _ = require(l_script_FirstAncestor_0.Src.Resources.Theme);
return function(v12)
    local v13 = l_Stylizer_0:use("ResetCameraButton");
    local v14 = v2.useContext(if not v5() then v4 else v3.Context);
    local v15 = UDim.new(0, v13.Spacing);
    return v2.createElement(l_Button_0, {
        AnchorPoint = Vector2.new(1, 0), 
        LayoutOrder = v12.LayoutOrder, 
        OnClick = v14.resetCamera, 
        Style = "Round", 
        Size = v13.Size + UDim2.fromOffset(v13.Spacing, v13.Spacing), 
        ZIndex = 2
    }, {
        Spacing = v2.createElement("UIPadding", {
            PaddingLeft = v15, 
            PaddingRight = v15, 
            PaddingTop = v15, 
            PaddingBottom = v15
        }), 
        Icon = v2.createElement(l_Image_0, {
            Image = v13.Image
        }), 
        Tooltip = v2.createElement(l_Tooltip_0, {
            Text = "Reset Camera"
        })
    });
end;
