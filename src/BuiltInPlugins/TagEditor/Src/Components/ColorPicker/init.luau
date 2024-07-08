local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Roact);
local v2 = require(l_Parent_0.Packages.RoactRodux);
local v3 = require(l_Parent_0.Packages.Framework);
local l_ContextServices_0 = v3.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_Analytics_0 = l_ContextServices_0.Analytics;
local l_Localization_0 = l_ContextServices_0.Localization;
local l_Stylizer_0 = v3.Style.Stylizer;
local v9 = require(l_Parent_0.Src.TagManager);
local v10 = require(l_Parent_0.Src.Actions);
local l_UI_0 = v3.UI;
local l_ColorPicker_0 = l_UI_0.ColorPicker;
local l_Pane_0 = l_UI_0.Pane;
local l_LayoutOrderIterator_0 = v3.Util.LayoutOrderIterator;
local v15 = require(script.ColorPickerTopControls);
local v16 = require(script.ColorPropertiesPanel);
local v17 = require(script.ColorValueSlider);
local v18 = require(script.HueSaturationPicker);
local v19 = game:DefineFastFlag("TagEditorUseColorPicker", false);
local v20 = v1.PureComponent:extend("ColorPicker");
v20.init = function(v21)
    if v19 then
        v21.onColorChanged = function(v22)
            v21:setState({
                color = v22
            });
        end;
        v21.onSave = function()
            v9.Get():SetColor(v21.props.tagName, v21.state.color);
            v21.props.close();
        end;
        v21:setState({
            color = v21.props.tagColor
        });
        return ;
    else
        v21.state = {
            h = 0, 
            s = 0, 
            v = 0
        };
        v21.SetNewHSV = function(v23, v24, v25)
            v21:setState(function(v26)
                if not (v26.h == v23 and v26.s == v24) or v26.v ~= v25 then
                    return {
                        h = v23, 
                        s = v24, 
                        v = v25
                    };
                else
                    return nil;
                end;
            end);
        end;
        v21.onSave = function()
            v9.Get():SetColor(v21.props.tagName, Color3.fromHSV(v21.state.h, v21.state.s, v21.state.v));
            v21.props.close();
        end;
        v21.onTextChangedHex = function(v27)
            local v28, v29, v30 = v27:match("^%s*%#?(%x%x)(%x%x)(%x%x)%s*$");
            local v31, v32, v33 = Color3.fromRGB(tonumber(v28, 16), tonumber(v29, 16), (tonumber(v30, 16))):ToHSV();
            v21.SetNewHSV(v31, v32, v33);
        end;
        v21.onTextChangedRGB = function(v34)
            local v35, v36, v37 = v34:match("^%s*(%d+)%s*,%s*(%d+)%s*,%s*(%d+)%s*%s*$");
            local v38, v39, v40 = Color3.fromRGB(tonumber(v35), tonumber(v36), (tonumber(v37))):ToHSV();
            v21.SetNewHSV(v38, v39, v40);
        end;
        v21.onTextChangedHSV = function(v41)
            local v42, v43, v44 = v41:match("^%s*(%d+)%s*,%s*(%d+)%s*,%s*(%d+)%s*%s*$");
            v21.SetNewHSV(tonumber(v42) or 1, tonumber(v43) or 1, tonumber(v44) or 1);
        end;
        v21.onHueSaturationChanged = function(v45, v46)
            v21:setState({
                h = v45, 
                s = v46
            });
        end;
        v21.onColorValueChanged = function(v47)
            v21:setState({
                v = v47
            });
        end;
        return ;
    end;
end;
if not v19 then
    v20.getDerivedStateFromProps = function(v48, v49)
        if v48.tagColor == nil then
            return {
                h = 0, 
                s = 0, 
                v = 0
            };
        elseif v49.tagColor ~= v48.tagColor then
            v49.tagColor = v48.tagColor;
            local v50, v51, v52 = v48.tagColor:ToHSV();
            return {
                h = v50, 
                s = v51, 
                v = v52, 
                tagColor = v48.tagColor
            };
        else
            return nil;
        end;
    end;
end;
v20.render = function(v53)
    local l_props_0 = v53.props;
    local l_ColorPicker_1 = l_props_0.Stylizer.ColorPicker;
    local v56 = l_LayoutOrderIterator_0.new();
    local v57 = l_LayoutOrderIterator_0.new();
    local v58 = l_LayoutOrderIterator_0.new();
    local v59 = if not v19 then Color3.fromHSV(v53.state.h, v53.state.s, v53.state.v) else v53.state.color;
    return v1.createElement(l_Pane_0, {
        Layout = Enum.FillDirection.Vertical, 
        Padding = l_ColorPicker_1.Padding, 
        Spacing = l_ColorPicker_1.Spacing
    }, {
        TopControls = v1.createElement(v15, {
            LayoutOrder = v56:getNextOrder(), 
            TagName = l_props_0.tagName, 
            Color = v59, 
            Close = l_props_0.close, 
            Save = v53.onSave
        }), 
        Body = if v19 then nil else v1.createElement(l_Pane_0, {
            Size = l_ColorPicker_1.BodySize, 
            LayoutOrder = v56:getNextOrder(), 
            Layout = Enum.FillDirection.Horizontal, 
            Spacing = l_ColorPicker_1.BodySpacing
        }, {
            ColorPropertiesPanel = v1.createElement(v16, {
                LayoutOrder = v57:getNextOrder(), 
                Hue = v53.state.h, 
                Saturation = v53.state.s, 
                Value = v53.state.v, 
                Color = v59, 
                OnTextChangedHex = v53.onTextChangedHex, 
                OnTextChangedRGB = v53.onTextChangedRGB, 
                OnTextChangedHSV = v53.onTextChangedHSV
            }), 
            Picker = v1.createElement(l_Pane_0, {
                Size = l_ColorPicker_1.PickerSize, 
                Layout = Enum.FillDirection.Vertical, 
                LayoutOrder = v57:getNextOrder(), 
                VerticalAlignment = Enum.VerticalAlignment.Top
            }, {
                HueSaturationPicker = v1.createElement(v18, {
                    LayoutOrder = v58:getNextOrder(), 
                    Hue = v53.state.h, 
                    Value = v53.state.v, 
                    Saturation = v53.state.s, 
                    OnHueSaturationChanged = v53.onHueSaturationChanged
                }), 
                ColorValueSlider = v1.createElement(v17, {
                    LayoutOrder = v58:getNextOrder(), 
                    Hue = v53.state.h, 
                    Saturation = v53.state.s, 
                    Value = v53.state.v, 
                    updatePosition = v53.onColorValueChanged
                })
            })
        }), 
        ColorPickerComponent = if not v19 then nil else v1.createElement(l_ColorPicker_0, {
            LayoutOrder = v56:getNextOrder(), 
            Color = v59, 
            Size = l_ColorPicker_1.BodySize, 
            OnColorChanged = v53.onColorChanged
        })
    });
end;
return (v2.connect(function(v60)
    local l_ColorPicker_2 = v60.ColorPicker;
    local v62 = nil;
    local v63 = nil;
    for _, v65 in pairs(v60.TagData) do
        if v65.Name == l_ColorPicker_2 then
            v62 = v65.Icon;
            v63 = v65.Color;
            break;
        end;
    end;
    return {
        tagName = l_ColorPicker_2, 
        tagIcon = v62, 
        tagColor = v63
    };
end, function(v66)
    return {
        close = function()
            v66(v10.ToggleColorPicker(""));
        end
    };
end)((l_withContext_0({
    Analytics = l_Analytics_0, 
    Localization = l_Localization_0, 
    Stylizer = l_Stylizer_0
})(v20))));
