local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Framework);
local v2 = require(l_Parent_0.Packages.React);
local l_withContext_0 = v1.ContextServices.withContext;
local l_Stylizer_0 = v1.Style.Stylizer;
local l_UI_0 = v1.UI;
local l_Pane_0 = l_UI_0.Pane;
local l_PropertyCell_0 = l_UI_0.PropertyCell;
local l_Slider_0 = l_UI_0.Slider;
local l_TextLabel_0 = l_UI_0.TextLabel;
local l_Util_0 = v1.Util;
local l_StyleModifier_0 = l_Util_0.StyleModifier;
local l_prioritize_0 = l_Util_0.prioritize;
local v13 = require(l_Parent_0.Src.Flags.getFFlagMaterialGeneratorNewUI);
local v14 = v2.PureComponent:extend("SliderSetting");
v14.defaultProps = {
    Disabled = false, 
    ShowValueLabel = true, 
    SnapIncrement = 1
};
v14.init = function(v15)
    v15.formatValue = function(v16)
        if not v15.props.OnFormatValue then
            return (tostring(v16));
        else
            return v15.props.OnFormatValue(v16);
        end;
    end;
    v15.valueChanged = function(v17)
        v15.props.OnValueChanged(v17);
    end;
end;
v14.render = function(v18)
    local l_props_0 = v18.props;
    local v20 = nil;
    v20 = if not v13() then l_props_0.Stylizer.Setting else {
        HorizontalSpacing = 16, 
        Size = UDim2.new(1, 0, 0, 30), 
        ValueLabelWidth = 30
    };
    local l_HorizontalSpacing_0 = v20.HorizontalSpacing;
    local v22 = v20.ValueLabelWidth or 0;
    local l_Disabled_0 = l_props_0.Disabled;
    local v24 = l_props_0.LabelWidth or 0;
    local v25 = l_prioritize_0(l_props_0.Size, v20.Size);
    local v26 = if not l_Disabled_0 then nil else l_StyleModifier_0.Disabled;
    local l_Value_0 = l_props_0.Value;
    local v28 = v18.formatValue(l_Value_0);
    local v29 = UDim2.new(0, v24, 1, 0);
    local v30 = v24 + l_HorizontalSpacing_0;
    if l_props_0.ShowValueLabel then
        v30 = v30 + (v22 + l_HorizontalSpacing_0);
    end;
    local v31 = UDim2.new(1, -v30, 1, 0);
    return v2.createElement(l_Pane_0, {
        HorizontalAlignment = Enum.HorizontalAlignment.Left, 
        Layout = Enum.FillDirection.Horizontal, 
        LayoutOrder = l_props_0.LayoutOrder, 
        Size = v25, 
        Spacing = l_HorizontalSpacing_0, 
        VerticalAlignment = Enum.VerticalAlignment.Center
    }, {
        Label = v2.createElement(l_TextLabel_0, {
            LayoutOrder = 1, 
            Size = v29, 
            StyleModifier = v26, 
            Text = l_props_0.Text, 
            TextXAlignment = Enum.TextXAlignment.Left
        }), 
        ValueSlider = if not v13() then v2.createElement(l_Slider_0, {
            Disabled = l_Disabled_0, 
            LayoutOrder = 2, 
            Min = l_props_0.Min, 
            Max = l_props_0.Max, 
            OnValueChanged = v18.valueChanged, 
            Size = v31, 
            SnapIncrement = l_props_0.SnapIncrement, 
            Tooltip = v28, 
            Value = l_Value_0, 
            VerticalDragTolerance = 20
        }) else v2.createElement(l_PropertyCell_0, {
            Disabled = l_Disabled_0, 
            LayoutOrder = 2, 
            OnChanged = v18.valueChanged, 
            Schema = {
                Type = "Slider", 
                Min = l_props_0.Min, 
                Max = l_props_0.Max, 
                SnapIncrement = l_props_0.SnapIncrement, 
                ShowInput = true
            }, 
            Size = v31, 
            Value = l_Value_0
        }), 
        ValueLabel = if not l_props_0.ShowValueLabel then nil else v2.createElement(l_TextLabel_0, {
            LayoutOrder = 3, 
            Size = UDim2.new(0, v22, 1, 0), 
            StyleModifier = v26, 
            Style = "SubText", 
            Text = v28, 
            TextXAlignment = Enum.TextXAlignment.Left
        })
    });
end;
return l_withContext_0({
    Stylizer = l_Stylizer_0
})(v14);
