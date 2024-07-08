local l_script_FirstAncestor_0 = script:FindFirstAncestor("Toolbox");
local l_Packages_0 = l_script_FirstAncestor_0.Packages;
local v2 = require(l_Packages_0.Roact);
local v3 = require(l_Packages_0.Framework);
local l_LinkText_0 = v3.UI.LinkText;
local l_Pane_0 = v3.UI.Pane;
local l_TextLabel_0 = v3.UI.TextLabel;
local l_TextLabelWithRobloxLinks_0 = v3.UI.TextLabelWithRobloxLinks;
local l_GetTextSize_0 = v3.Util.GetTextSize;
local l_Util_0 = l_script_FirstAncestor_0.Core.Util;
local v10 = require(l_Util_0.Constants);
local v11 = require(l_Util_0.LayoutOrderIterator);
local l_ContextServices_0 = v3.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local v14 = require(l_script_FirstAncestor_0.Core.Util.SharedFlags.getFFlagToolboxEnableAssetRows);
local v15 = v2.PureComponent:extend("ItemRowMetadataMetadata");
v15.render = function(v16)
    local l_props_0 = v16.props;
    local l_itemRow_0 = l_props_0.Stylizer.itemRow;
    local l_HeaderText_0 = l_props_0.HeaderText;
    local l_LayoutOrder_0 = l_props_0.LayoutOrder;
    local l_MaxLinesOfText_0 = l_props_0.MaxLinesOfText;
    local l_Padding_0 = l_props_0.Padding;
    local l_Size_0 = l_props_0.Size;
    local l_Text_0 = l_props_0.Text;
    local l_OnClick_0 = l_props_0.OnClick;
    local v26 = v11.new();
    local v27 = 0;
    if l_MaxLinesOfText_0 then
        v27 = l_GetTextSize_0("A", l_itemRow_0.textSize, v10.FONT, Vector2.new(0, 0)).Y * l_MaxLinesOfText_0;
    end;
    return v2.createElement(l_Pane_0, {
        AutomaticSize = Enum.AutomaticSize.Y, 
        HorizontalAlignment = Enum.HorizontalAlignment.Left, 
        Layout = Enum.FillDirection.Vertical, 
        LayoutOrder = l_LayoutOrder_0, 
        Padding = if not v14() then nil else l_Padding_0, 
        Size = l_Size_0, 
        Spacing = 2, 
        VerticalAlignment = Enum.VerticalAlignment.Top
    }, {
        Header = v2.createElement(l_TextLabel_0, {
            AutomaticSize = Enum.AutomaticSize.Y, 
            LayoutOrder = v26:getNextOrder(), 
            Style = "ToolboxItemRowHeader", 
            Text = l_HeaderText_0, 
            TextColor = l_itemRow_0.headerTextColor, 
            TextXAlignment = Enum.TextXAlignment.Left, 
            Size = UDim2.new(1, 0, 0, 0)
        }), 
        Text = if not l_OnClick_0 then v2.createElement(l_TextLabelWithRobloxLinks_0, {
            LayoutOrder = v26:getNextOrder(), 
            AutomaticSize = if not l_MaxLinesOfText_0 then Enum.AutomaticSize.Y else Enum.AutomaticSize.None, 
            ClipsDescendants = true, 
            Size = UDim2.new(1, 0, 0, v27), 
            Style = "ToolboxItemRowInnerText", 
            Text = l_Text_0 or "", 
            TextSize = l_itemRow_0.textSize, 
            TextWrapped = true, 
            TextXAlignment = Enum.TextXAlignment.Left, 
            TextYAlignment = Enum.TextYAlignment.Top, 
            VerticalAlignment = Enum.VerticalAlignment.Top
        }) else v2.createElement(l_LinkText_0, {
            LayoutOrder = v26:getNextOrder(), 
            OnClick = l_OnClick_0, 
            Size = UDim2.new(1, 0, 0, v27), 
            Style = "ToolboxItemRowInnerLink", 
            Text = l_Text_0 or "", 
            TextSize = l_itemRow_0.textSize, 
            TextWrapped = true, 
            TextXAlignment = Enum.TextXAlignment.Left, 
            TextYAlignment = Enum.TextYAlignment.Top
        })
    });
end;
return (l_withContext_0({
    Stylizer = l_ContextServices_0.Stylizer
})(v15));
