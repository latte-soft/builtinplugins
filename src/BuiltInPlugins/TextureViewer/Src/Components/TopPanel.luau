local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.React);
local v2 = require(l_Parent_0.Packages.Framework);
local l_Pane_0 = v2.UI.Pane;
local l_IconButton_0 = v2.UI.IconButton;
local l_TextLabel_0 = v2.UI.TextLabel;
local l_Util_0 = l_Parent_0.Src.Util;
local v7 = require(l_Util_0.Utils);
local v8 = require(l_Util_0.Constants);
return function(v9, v10, v11)
    local l_props_0 = v9.props;
    local l_Localization_0 = l_props_0.Localization;
    local l_TopPanel_0 = l_props_0.Stylizer.TopPanel;
    return v1.createElement(l_Pane_0, {
        Size = l_TopPanel_0.Size, 
        Layout = Enum.FillDirection.Horizontal, 
        Padding = l_TopPanel_0.Padding, 
        LayoutOrder = 1
    }, {
        NumTextures = v1.createElement(l_TextLabel_0, {
            Text = "# " .. l_Localization_0:getText("TopPanel", "Textures") .. ": " .. v10, 
            Size = l_TopPanel_0.AggregateStats.NumTextures.Size, 
            TextXAlignment = Enum.TextXAlignment.Left, 
            LayoutOrder = 1
        }), 
        RefreshWrapper = v1.createElement(l_Pane_0, {
            Size = l_TopPanel_0.Refresh.Size, 
            AnchorPoint = l_TopPanel_0.Refresh.AnchorPoint, 
            Position = l_TopPanel_0.Refresh.Position, 
            LayoutOrder = 2
        }, {
            RefreshTextures = v1.createElement(l_IconButton_0, {
                Text = l_Localization_0:getText("TopPanel", "Refresh"), 
                TextXAlignment = Enum.TextXAlignment.Center, 
                LeftIcon = l_TopPanel_0.Refresh.Button.Icon, 
                Size = UDim2.fromScale(1, 1), 
                OnClick = function()
                    v9:refreshData();
                end
            })
        }), 
        TotalMemory = v1.createElement(l_TextLabel_0, {
            Text = l_Localization_0:getText("TopPanel", "Size") .. ": " .. v7.round(v11 / v8.BYTES_IN_MB, 2) .. " MB", 
            Size = l_TopPanel_0.AggregateStats.TotalMemory.Size, 
            TextXAlignment = Enum.TextXAlignment.Right, 
            LayoutOrder = 3
        })
    });
end;
