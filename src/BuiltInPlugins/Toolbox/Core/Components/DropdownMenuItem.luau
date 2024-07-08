local l_Parent_0 = script.Parent.Parent.Parent;
local l_Packages_0 = l_Parent_0.Packages;
local v2 = require(l_Packages_0.Roact);
local v3 = require(l_Packages_0.Framework);
local l_ContextServices_0 = v3.ContextServices;
local l_Button_0 = v3.UI.Button;
local l_Separator_0 = v3.UI.Separator;
local v7 = v2.PureComponent:extend("DropdownMenuItem");
local l_withContext_0 = l_ContextServices_0.withContext;
local v9 = require(l_Parent_0.Core.Util.SharedFlags.getFFlagToolboxAddRecentSearchesToAutoComplete);
v7.defaultProps = {
    Size = UDim2.new(0, 200, 0, 25)
};
local function _(v10)
    return v10:gsub("[</>]", "");
end;
local function v16(v12, v13)
    local v14 = string.find(v12:lower():gsub("[</>]", ""), v13:lower():gsub("[</>]", ""), 1, true);
    local _ = nil;
    return "<b>" .. if v14 ~= nil then string.sub(v12, 0, v14 - 1) .. "</b>" .. string.sub(v12, v14, (v14 + string.len(v13)) - 1) .. "<b>" .. string.sub(v12, v14 + string.len(v13), (string.len(v12))) else v12 .. "</b>";
end;
v7.render = function(v17)
    local l_props_0 = v17.props;
    local l_Stylizer_0 = l_props_0.Stylizer;
    local l_TextSize_0 = l_Stylizer_0.TextSize;
    local v21 = nil;
    v21 = if l_props_0.FocusedText ~= nil then v16(l_props_0.Text, l_props_0.FocusedText) else l_props_0.Text;
    return v2.createElement(l_Button_0, {
        AutomaticSize = Enum.AutomaticSize.Y, 
        OnClick = l_props_0.OnClick, 
        Position = l_props_0.Position, 
        Size = l_props_0.Size, 
        LayoutOrder = l_props_0.LayoutOrder, 
        Style = if not v9() then nil else l_props_0.DropdownMenuItemButtonStyle, 
        DisableHover = if not v9() then nil else l_props_0.DisableHover, 
        OnMouseEnter = if not v9() then nil else l_props_0.OnMouseEnter, 
        OnMouseLeave = if not v9() then nil else l_props_0.OnMouseLeave
    }, {
        Layout = v2.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Vertical, 
            SortOrder = Enum.SortOrder.LayoutOrder
        }), 
        ItemLabel = if not not v9() and v17.props.ItemButtonContentOverride then v2.createElement("Frame", {
            BackgroundTransparency = 1, 
            Size = UDim2.fromScale(1, 1)
        }, {
            ItemLabel = v2.createElement("TextLabel", {
                BackgroundTransparency = 1, 
                ClipsDescendants = true, 
                Font = l_Stylizer_0.Font, 
                LayoutOrder = 1, 
                RichText = true, 
                Size = UDim2.new(1, -40, 1, 0), 
                Text = v21, 
                TextColor3 = l_Stylizer_0.TextColor, 
                TextSize = l_TextSize_0, 
                TextTruncate = Enum.TextTruncate.AtEnd, 
                TextXAlignment = Enum.TextXAlignment.Left, 
                TextYAlignment = Enum.TextYAlignment.Center
            }, {
                Padding = v2.createElement("UIPadding", {
                    PaddingLeft = UDim.new(0, 10)
                })
            }), 
            ButtonComponent = v17.props.ItemButtonContentOverride
        }) else v2.createElement("TextLabel", {
            BackgroundTransparency = 1, 
            ClipsDescendants = true, 
            Font = l_Stylizer_0.Font, 
            LayoutOrder = 1, 
            RichText = true, 
            Size = l_props_0.Size, 
            Text = v21, 
            TextColor3 = l_Stylizer_0.TextColor, 
            TextSize = l_TextSize_0, 
            TextTruncate = Enum.TextTruncate.AtEnd, 
            TextXAlignment = Enum.TextXAlignment.Left, 
            TextYAlignment = Enum.TextYAlignment.Center
        }, {
            Padding = v2.createElement("UIPadding", {
                PaddingLeft = UDim.new(0, 10)
            })
        }), 
        Separator = not l_props_0.HideSeparator and v2.createElement(l_Separator_0, {
            DominantAxis = Enum.DominantAxis.Width, 
            LayoutOrder = 2
        })
    });
end;
return (l_withContext_0({
    Stylizer = l_ContextServices_0.Stylizer
})(v7));
