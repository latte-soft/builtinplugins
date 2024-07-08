local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Framework);
local v2 = require(l_Parent_0.Packages.React);
local l_withContext_0 = v1.ContextServices.withContext;
local l_Stylizer_0 = v1.Style.Stylizer;
local l_UI_0 = v1.UI;
local l_Pane_0 = l_UI_0.Pane;
local l_SelectInput_0 = l_UI_0.SelectInput;
local l_TextLabel_0 = l_UI_0.TextLabel;
local l_Util_0 = v1.Util;
local l_StyleModifier_0 = l_Util_0.StyleModifier;
local l_prioritize_0 = l_Util_0.prioritize;
local v12 = require(l_Parent_0.Src.Flags.getFFlagMaterialGeneratorNewUI);
local v13 = v2.PureComponent:extend("SelectInputSetting");
v13.defaultProps = {
    Disabled = false
};
v13.init = function(v14)
    v14.itemActivated = function(v15)
        local l_props_0 = v14.props;
        if l_props_0.OnValueChanged then
            l_props_0.OnValueChanged(v15);
        end;
    end;
end;
v13.render = function(v17)
    local l_props_1 = v17.props;
    local v19 = nil;
    v19 = if not v12() then l_props_1.Stylizer.Setting else {
        HorizontalSpacing = 16, 
        Size = UDim2.new(1, 0, 0, 30), 
        ValueLabelWidth = 30
    };
    local l_HorizontalSpacing_0 = v19.HorizontalSpacing;
    local l_Disabled_0 = l_props_1.Disabled;
    local l_Items_0 = l_props_1.Items;
    local l_LabelWidth_0 = l_props_1.LabelWidth;
    local v24 = l_prioritize_0(l_props_1.Size, v19.Size);
    local v25 = if not l_Disabled_0 then nil else l_StyleModifier_0.Disabled;
    local l_Value_0 = l_props_1.Value;
    local v27 = nil;
    for v28, v29 in l_Items_0, nil, nil do
        if v29 == l_Value_0 then
            v27 = v28;
            break;
        end;
    end;
    return v2.createElement(l_Pane_0, {
        HorizontalAlignment = Enum.HorizontalAlignment.Left, 
        Layout = Enum.FillDirection.Horizontal, 
        LayoutOrder = l_props_1.LayoutOrder, 
        Size = v24, 
        Spacing = l_HorizontalSpacing_0, 
        VerticalAlignment = Enum.VerticalAlignment.Top
    }, {
        Label = v2.createElement(l_TextLabel_0, {
            LayoutOrder = 1, 
            Size = UDim2.new(0, l_LabelWidth_0, 1, 0), 
            StyleModifier = v25, 
            Text = l_props_1.Text, 
            TextXAlignment = Enum.TextXAlignment.Left
        }), 
        SelectInput = v2.createElement(l_SelectInput_0, {
            Enabled = not l_Disabled_0, 
            ErrorText = l_props_1.ErrorText, 
            Icons = l_props_1.Icons, 
            Items = l_props_1.Items, 
            LayoutOrder = 2, 
            OnItemActivated = v17.itemActivated, 
            PlaceholderText = l_props_1.PlaceholderText, 
            SelectedIndex = v27, 
            Size = UDim2.new(1, -(l_LabelWidth_0 + l_HorizontalSpacing_0), 1, 0)
        })
    });
end;
return l_withContext_0({
    Stylizer = l_Stylizer_0
})(v13);
