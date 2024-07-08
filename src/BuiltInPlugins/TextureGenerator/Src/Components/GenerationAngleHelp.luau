local l_script_FirstAncestor_0 = script:FindFirstAncestor("TextureGenerator");
local v1 = require(l_script_FirstAncestor_0.Packages.Framework);
local v2 = require(l_script_FirstAncestor_0.Packages.React);
local l_ContextServices_0 = v1.ContextServices;
local l_Localization_0 = l_ContextServices_0.Localization;
local l_Stylizer_0 = l_ContextServices_0.Stylizer;
local l_UI_0 = v1.UI;
local l_Image_0 = l_UI_0.Image;
local l_Pane_0 = l_UI_0.Pane;
local l_TextLabel_0 = l_UI_0.TextLabel;
local l_Tooltip_0 = l_UI_0.Tooltip;
local l_LayoutOrderIterator_0 = v1.Util.LayoutOrderIterator;
local _ = require(l_script_FirstAncestor_0.Src.Resources.Theme);
return function(v13)
    local v14 = l_Stylizer_0:use("GenerationAngleHelp");
    local v15 = l_Localization_0:use();
    local v16 = l_LayoutOrderIterator_0.new();
    return v2.createElement(l_Tooltip_0, {
        AnchorPoint = v14.AnchorPoint, 
        LayoutOrder = v13.LayoutOrder, 
        Position = v14.Position, 
        Text = v15:getText("GenerationAngleHelp", "Tooltip"), 
        TextXAlignment = Enum.TextXAlignment.Left, 
        Child = v2.createElement(l_Pane_0, {
            AutomaticSize = Enum.AutomaticSize.X, 
            HorizontalAlignment = Enum.HorizontalAlignment.Left, 
            Layout = Enum.FillDirection.Horizontal, 
            Padding = v14.Padding, 
            Spacing = v14.Spacing, 
            VerticalAlignment = Enum.VerticalAlignment.Center, 
            ZIndex = v14.ZIndex
        }, {
            TextLabel = v2.createElement(l_TextLabel_0, {
                AutomaticSize = Enum.AutomaticSize.X, 
                LayoutOrder = v16:getNextOrder(), 
                Style = v14.TextStyle, 
                Text = v15:getText("GenerationAngleHelp", "Text")
            }), 
            Image = v2.createElement(l_Image_0, {
                LayoutOrder = v16:getNextOrder(), 
                Style = v14.HelpImage
            })
        })
    });
end;
