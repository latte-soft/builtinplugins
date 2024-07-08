local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.React);
local v2 = require(l_Parent_0.Packages.Framework);
local l_Pane_0 = v2.UI.Pane;
local l_TextLabel_0 = v2.UI.TextLabel;
local l_Image_0 = v2.UI.Image;
local v6 = require(l_Parent_0.Src.Resources.ModernIcons);
local v7 = require(l_Parent_0.Src.Util.MenuHelpers);
local function _(v8)
    local l_v8_Attribute_0 = v8:GetAttribute("StyleCategory");
    if l_v8_Attribute_0 == "Themes" then
        return v6.Standard.ThemeSheet();
    elseif l_v8_Attribute_0 == "Tokens" then
        return v6.Standard.TokenSheet();
    else
        return v7.getClassIcon(v8.ClassName) or "";
    end;
end;
return function(v11)
    local l_createElement_0 = v1.createElement;
    local l_l_Pane_0_0 = l_Pane_0;
    local v14 = {
        LayoutOrder = v11.LayoutOrder, 
        [v1.Tag] = "X-Fit X-RowS X-Middle TokenSource"
    };
    local v15 = {};
    local l_createElement_1 = v1.createElement;
    local l_l_Image_0_0 = l_Image_0;
    local v18 = {};
    local l_Source_0 = v11.Source;
    local l_l_Source_0_Attribute_0 = l_Source_0:GetAttribute("StyleCategory");
    v18.Image = if l_l_Source_0_Attribute_0 == "Themes" then v6.Standard.ThemeSheet() else if l_l_Source_0_Attribute_0 == "Tokens" then v6.Standard.TokenSheet() else v7.getClassIcon(l_Source_0.ClassName) or "";
    v18.LayoutOrder = 1;
    v18[v1.Tag] = "TokenSourceIcon";
    v15.Icon = l_createElement_1(l_l_Image_0_0, v18);
    v15.NameLabel = v1.createElement(l_TextLabel_0, {
        LayoutOrder = 2, 
        Text = v11.Source.Name, 
        [v1.Tag] = "X-Fit"
    });
    return l_createElement_0(l_l_Pane_0_0, v14, v15);
end;
