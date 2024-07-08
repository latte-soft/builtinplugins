local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Roact);
local v2 = require(l_Parent_0.Packages.Framework);
local v3 = require(l_Parent_0.Packages.Cryo);
local l_ContextServices_0 = v2.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local v6 = require(l_Parent_0.Src.Util.DEPRECATED_Constants);
local l_UI_0 = v2.UI;
local l_Checkbox_0 = l_UI_0.Checkbox;
local l_TitledFrame_0 = l_UI_0.TitledFrame;
local v10 = v1.PureComponent:extend("CheckBoxSet");
v10.render = function(v11)
    local l_props_0 = v11.props;
    local l_Stylizer_0 = l_props_0.Stylizer;
    local l_Boxes_0 = l_props_0.Boxes;
    local v15 = #l_Boxes_0;
    local v16 = l_props_0.ErrorMessage ~= nil;
    local v17 = {
        Layout = v1.createElement("UIListLayout", {
            Padding = UDim.new(0, v6.CHECKBOX_PADDING), 
            SortOrder = Enum.SortOrder.LayoutOrder
        })
    };
    for v18, v19 in ipairs(l_Boxes_0) do
        local l_v17_0 = v17;
        local l_createElement_0 = v1.createElement;
        local l_l_Checkbox_0_0 = l_Checkbox_0;
        local v23 = {};
        local v24 = false;
        if v19.Selected ~= nil then
            v24 = v19.Selected;
        end;
        v23.Checked = v24;
        v23.Disabled = not l_props_0.Enabled;
        v23.Key = v19.Id;
        v23.LayoutOrder = v18;
        v23.OnClick = function()
            l_props_0.EntryClicked(v19);
        end;
        v23.Text = v19.Title;
        table.insert(l_v17_0, l_createElement_0(l_l_Checkbox_0_0, v23, {
            Link = v19.LinkTextFrame
        }));
    end;
    if v16 then
        v17.Error = v1.createElement("TextLabel", v3.Dictionary.join(l_Stylizer_0.fontStyle.SmallError, {
            LayoutOrder = v15 + 1, 
            Size = UDim2.new(1, 0, 0, v6.CHECKBOX_SIZE), 
            BackgroundTransparency = 1, 
            Text = l_props_0.ErrorMessage, 
            TextXAlignment = Enum.TextXAlignment.Left, 
            TextYAlignment = Enum.TextYAlignment.Center
        }));
    end;
    local v25 = v15 * v6.CHECKBOX_SIZE + v15 * v6.CHECKBOX_PADDING;
    if l_props_0.ShowWarning then
        v25 = v25 * 3;
    end;
    return v1.createElement(l_TitledFrame_0, {
        LayoutOrder = l_props_0.LayoutOrder or 1, 
        Title = l_props_0.Title
    }, v17);
end;
return (l_withContext_0({
    Stylizer = l_ContextServices_0.Stylizer
})(v10));
