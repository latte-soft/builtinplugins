local l_script_FirstAncestor_0 = script:FindFirstAncestor("AvatarCompatibilityPreviewer");
local v1 = require(l_script_FirstAncestor_0.Packages.Framework);
local v2 = require(l_script_FirstAncestor_0.Packages.React);
local v3 = require(l_script_FirstAncestor_0.Src.Components.AvatarScreenContext);
local _ = require(l_script_FirstAncestor_0.Src.Resources.Theme);
local v5 = require(l_script_FirstAncestor_0.Src.Hooks.useToggleState);
local v6 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagAvatarPreviewerSkinToneAlphaDetection);
local v7 = v6();
local l_UI_0 = v1.UI;
local l_Pane_0 = l_UI_0.Pane;
local l_Tooltip_0 = l_UI_0.Tooltip;
local l_Localization_0 = v1.ContextServices.Localization;
local l_Stylizer_0 = v1.ContextServices.Stylizer;
return function(v13)
    local v14 = nil;
    local v15 = nil;
    if v7 then
        v15 = l_Stylizer_0:use("SkinPreview");
        v14 = l_Localization_0:use();
    end;
    local v16 = nil;
    if v7 then
        v16 = v2.useContext(v3.Context);
    end;
    local v17 = v5(false);
    local l_Item_0 = v13.Item;
    if not (not v7 or v16.isColorable) then
        l_Item_0 = Color3.new(l_Item_0.R * v15.DisabledColorToBlend.R, l_Item_0.G * v15.DisabledColorToBlend.G, l_Item_0.B * v15.DisabledColorToBlend.B);
    end;
    if not v7 then
        v15 = l_Stylizer_0:use("SkinPreview");
    end;
    return v2.createElement(l_Pane_0, {
        BackgroundColor = l_Item_0, 
        OnClick = if not v7 or v16.isColorable then nil else function()
        end, 
        Style = "SkinPreview", 
        [v2.Event.MouseEnter] = v17.enable, 
        [v2.Event.MouseLeave] = v17.disable, 
        [v2.Tag] = "data-testid=SkinPreview"
    }, {
        Border = if not v13.Selected then if v17.enabled then v2.createElement("UIStroke", {
            Color = v15.HoveredBorderColor, 
            Thickness = v15.HoveredBorderThickness
        }) else nil else v2.createElement("UIStroke", {
            Color = v15.SelectedBorderColor, 
            Thickness = v15.SelectedBorderThickness
        }), 
        Tooltip = (v6() and not v16.isColorable) and v2.createElement(l_Tooltip_0, {
            Text = v14:getText("SkinPreview", "NoAlphaWarning")
        })
    });
end;
