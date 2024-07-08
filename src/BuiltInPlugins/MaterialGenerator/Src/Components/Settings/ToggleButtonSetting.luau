local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Framework);
local v2 = require(l_Parent_0.Packages.React);
local l_withContext_0 = v1.ContextServices.withContext;
local l_Stylizer_0 = v1.Style.Stylizer;
local l_UI_0 = v1.UI;
local l_Checkbox_0 = l_UI_0.Checkbox;
local l_Pane_0 = l_UI_0.Pane;
local l_TextLabel_0 = l_UI_0.TextLabel;
local l_ToggleButton_0 = l_UI_0.ToggleButton;
local l_Util_0 = v1.Util;
local l_StyleModifier_0 = l_Util_0.StyleModifier;
local l_prioritize_0 = l_Util_0.prioritize;
local v13 = require(l_Parent_0.Src.Flags.getFFlagMaterialGeneratorNewUI);
local v14 = v2.PureComponent:extend("ToggleButtonSetting");
v14.defaultProps = {
    Disabled = false
};
v14.init = function(v15)
    v15.valueChanged = function()
        local l_props_0 = v15.props;
        if l_props_0.OnValueChanged then
            l_props_0.OnValueChanged();
        end;
    end;
end;
v14.render = function(v17)
    local l_props_1 = v17.props;
    local v19 = nil;
    v19 = if not v13() then l_props_1.Stylizer.Setting else {
        HorizontalSpacing = 16, 
        Size = UDim2.new(1, 0, 0, 30), 
        ValueLabelWidth = 30
    };
    local l_Disabled_0 = l_props_1.Disabled;
    local l_LabelWidth_0 = l_props_1.LabelWidth;
    local v22 = l_prioritize_0(l_props_1.Size, v19.Size);
    local v23 = if not l_Disabled_0 then nil else l_StyleModifier_0.Disabled;
    local l_Value_0 = l_props_1.Value;
    local _ = nil;
    return v2.createElement(l_Pane_0, {
        HorizontalAlignment = Enum.HorizontalAlignment.Left, 
        Layout = Enum.FillDirection.Horizontal, 
        LayoutOrder = l_props_1.LayoutOrder, 
        Size = v22, 
        Spacing = v19.HorizontalSpacing, 
        VerticalAlignment = Enum.VerticalAlignment.Center
    }, {
        Label = v2.createElement(l_TextLabel_0, {
            LayoutOrder = 1, 
            Size = UDim2.new(0, l_LabelWidth_0, 1, 0), 
            StyleModifier = v23, 
            Text = l_props_1.Text, 
            TextXAlignment = Enum.TextXAlignment.Left
        }), 
        Toggle = if not l_props_1.UseCheckbox then v2.createElement(l_ToggleButton_0, {
            Disabled = l_Disabled_0, 
            LayoutOrder = 2, 
            OnClick = v17.valueChanged, 
            Selected = l_Value_0
        }) else v2.createElement(l_Checkbox_0, {
            Checked = l_Value_0, 
            Disabled = l_Disabled_0, 
            LayoutOrder = 2, 
            OnClick = v17.valueChanged, 
            Text = l_props_1.CheckboxLabel
        })
    });
end;
return l_withContext_0({
    Stylizer = l_Stylizer_0
})(v14);
