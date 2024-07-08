local l_script_FirstAncestor_0 = script:FindFirstAncestor("AvatarCompatibilityPreviewer");
local v1 = require(l_script_FirstAncestor_0.Packages.Framework);
local v2 = require(l_script_FirstAncestor_0.Packages.React);
local v3 = require(l_script_FirstAncestor_0.Src.Components.ItemDataPreview.ItemDataPreviewModel);
local _ = require(l_script_FirstAncestor_0.Src.Resources.Theme);
local l_UI_0 = v1.UI;
local l_Pane_0 = l_UI_0.Pane;
local l_TextLabel_0 = l_UI_0.TextLabel;
local l_LayoutOrderIterator_0 = v1.Util.LayoutOrderIterator;
local l_Stylizer_0 = v1.ContextServices.Stylizer;
return function(v10)
    local v11 = l_LayoutOrderIterator_0.new();
    local v12 = l_Stylizer_0:use("DisambiguationMenu");
    local v13, v14 = v2.useState(0);
    return v2.createElement(l_Pane_0, {
        AutomaticSize = Enum.AutomaticSize.Y, 
        LayoutOrder = v10.LayoutOrder, 
        Layout = Enum.FillDirection.Horizontal, 
        Spacing = v12.HorizontalSpacing
    }, {
        ItemIcon = v2.createElement(l_Pane_0, {
            BackgroundColor3 = v12.IconBackground, 
            LayoutOrder = v11:getNextOrder(), 
            Size = v12.IconSize
        }, {
            ItemDataPreviewModel = v2.createElement(v3, {
                Instance = v10.Instance
            })
        }), 
        ItemNames = v2.createElement(l_Pane_0, {
            AutomaticSize = Enum.AutomaticSize.Y, 
            LayoutOrder = v11:getNextOrder(), 
            Layout = Enum.FillDirection.Vertical, 
            Spacing = v12.TextSpacing, 
            Size = UDim2.new(1, -((v12.IconSize.X.Offset + v12.HorizontalSpacing) + v13), 0, 0)
        }, {
            ItemName = v2.createElement(l_TextLabel_0, {
                AutomaticSize = Enum.AutomaticSize.Y, 
                LayoutOrder = v11:getNextOrder(), 
                Size = UDim2.fromScale(1, 0), 
                Text = v10.Name, 
                TextXAlignment = Enum.TextXAlignment.Left, 
                TextTruncate = Enum.TextTruncate.AtEnd
            }), 
            Subtitle = v10.Subtitle and v2.createElement(l_TextLabel_0, {
                AutomaticSize = Enum.AutomaticSize.Y, 
                LayoutOrder = v11:getNextOrder(), 
                Style = "SubText", 
                Size = UDim2.fromScale(1, 0), 
                Text = v10.Subtitle, 
                TextXAlignment = Enum.TextXAlignment.Left, 
                TextTruncate = Enum.TextTruncate.AtEnd
            }), 
            Warning = v10.WarningText and v2.createElement(l_TextLabel_0, {
                AutomaticSize = Enum.AutomaticSize.Y, 
                LayoutOrder = v11:getNextOrder(), 
                Style = "Warning", 
                Size = UDim2.fromScale(1, 0), 
                Text = v10.WarningText, 
                TextXAlignment = Enum.TextXAlignment.Left, 
                TextWrapped = true
            })
        }), 
        Children = v2.createElement(l_Pane_0, {
            AutomaticSize = Enum.AutomaticSize.XY, 
            LayoutOrder = v11:getNextOrder(), 
            ref = v2.useRef(nil), 
            [v2.Change.AbsoluteSize] = function(v15)
                v14(v15.AbsoluteSize.X);
            end
        }, v10.children)
    });
end;
