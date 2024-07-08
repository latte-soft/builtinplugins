local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.React);
local v2 = require(l_Parent_0.Packages.Framework);
local l_ContextServices_0 = v2.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_Localization_0 = l_ContextServices_0.Localization;
local l_Stylizer_0 = v2.Style.Stylizer;
local l_UI_0 = v2.UI;
local l_Pane_0 = l_UI_0.Pane;
local l_Slider_0 = l_UI_0.Slider;
local l_TextLabel_0 = l_UI_0.TextLabel;
local v11 = require(script.Parent.ValueEditTextBox);
local v12 = require(l_Parent_0.Src.Util.AnalyticsGlobals);
local l_EnableWindControlRBXTelemetry_0 = game:GetFastFlag("EnableWindControlRBXTelemetry");
local _ = function()
    local _ = 0;
    if workspace.GlobalWind.Magnitude <= 1 then
        return -0.1;
    else
        return (math.min(math.log10(workspace.GlobalWind.Magnitude), 3));
    end;
end;
local function _(v16)
    if v16 < 0 then
        return 0;
    else
        return (math.pow(1000, v16 / 3));
    end;
end;
local v18 = v1.Component:extend("WindspeedDisplay");
v18.init = function(v19)
    v19:setState({
        isEditingText = false, 
        isChangingPitch = false, 
        isChangingYaw = false
    });
    v19.isHoldingSlider = false;
    v19.setisChangingPitch = function()
        v19.props.yawStateRequested();
    end;
    v19.setisChangingYaw = function()
        v19.props.pitchStateRequested();
    end;
    v19.setIsScaling = function()
        v19.props.speedStateRequested();
    end;
    v19.setWindSpeed = function(v20)
        workspace.GlobalWind = v19.props.WindDirection.Unit * math.max(0, v20);
    end;
    v19.setWindYaw = function(v21)
        local v22 = 1;
        local v23 = 0;
        local v24 = (0.5 - v21 / 180) * 3.141592653589793;
        if workspace.GlobalWind:Dot(workspace.GlobalWind) > 0 then
            v22 = workspace.GlobalWind.Magnitude;
            v23 = math.asin((math.clamp(workspace.GlobalWind.Unit.y, -1, 1)));
        end;
        workspace.GlobalWind = (CFrame.fromEulerAnglesYXZ(0, v24, 0) * CFrame.fromEulerAnglesYXZ(v23, 0, 0)).LookVector * v22;
    end;
    v19.setWindPitch = function(v25)
        local v26 = 1;
        local v27 = ((180 + v25) / 180) * 3.141592653589793;
        local v28 = -1.5707963267948966;
        if workspace.GlobalWind:Dot(workspace.GlobalWind) > 0 then
            v26 = workspace.GlobalWind.Magnitude;
            local l_Unit_0 = workspace.GlobalWind.Unit;
            local v30 = l_Unit_0.z < 0 and 3.141592653589793 or 0;
            v28 = if l_Unit_0.z ~= 0 then v30 + math.atan(l_Unit_0.x / l_Unit_0.z) else if l_Unit_0.x > 0 then v30 + 1.5707963267948966 else v30 - 1.5707963267948966;
        end;
        workspace.GlobalWind = (CFrame.fromEulerAnglesYXZ(0, v28, 0) * CFrame.fromEulerAnglesYXZ(v27, 0, 0)).LookVector * v26;
    end;
    v19.getWindPitch = function()
        if v19.props.WindDirection:Dot(v19.props.WindDirection) > 0 then
            local v31 = math.round(-90 + (180 * v19.props.WindDirection:Angle(Vector3.yAxis, Vector3.yAxis)) / 3.141592653589793);
            if v31 == nil then
                return 0;
            else
                return v31;
            end;
        else
            return 0;
        end;
    end;
    v19.getWindYaw = function()
        if v19.props.WindDirection:Dot(v19.props.WindDirection) > 0 then
            local v32 = math.round(180 + (180 * (v19.props.WindDirection * Vector3.new(1, 0, 1)):Angle(Vector3.xAxis, Vector3.yAxis)) / 3.141592653589793) % 360;
            if v32 == nil then
                return 0;
            else
                return v32;
            end;
        else
            return 0;
        end;
    end;
    v19.setCurrentValue = function(v33)
        if not v19.isChangingYaw then
            if not v19.isChangingPitch then
                v19.setWindSpeed(v33);
                return ;
            else
                v19.setWindPitch(v33);
                return ;
            end;
        else
            v19.setWindYaw(v33);
            return ;
        end;
    end;
    v19.getCurrentValueText = function()
        if not v19.isChangingYaw then
            if not v19.isChangingPitch then
                return v19.props.Localization:getText("WindspeedDisplay", "sps", {
                    string.format("%.1f", workspace.GlobalWind.Magnitude)
                });
            else
                return string.format("%d\194\176", v19.getWindPitch());
            end;
        else
            return string.format("%d\194\176", v19.getWindYaw());
        end;
    end;
    v19.getSliderMinValue = function()
        if not v19.isChangingYaw then
            if not v19.isChangingPitch then
                return -0.1;
            else
                return -90;
            end;
        else
            return 0;
        end;
    end;
    v19.getSliderMaxValue = function()
        if not v19.isChangingYaw then
            if not v19.isChangingPitch then
                return 3;
            else
                return 90;
            end;
        else
            return 359;
        end;
    end;
    v19.getSliderCurrentValue = function()
        if not v19.isChangingYaw then
            if not v19.isChangingPitch then
                local _ = 0;
                return workspace.GlobalWind.Magnitude <= 1 and -0.1 or math.min(math.log10(workspace.GlobalWind.Magnitude), 3);
            else
                return v19.getWindPitch();
            end;
        else
            return v19.getWindYaw();
        end;
    end;
end;
v18.render = function(v35)
    local l_props_0 = v35.props;
    local l_WindspeedDisplay_0 = l_props_0.Stylizer.WindspeedDisplay;
    local l_Localization_1 = l_props_0.Localization;
    v35.isChangingPitch = l_props_0.isChangingPitch;
    v35.isChangingYaw = l_props_0.isChangingYaw;
    local l_isEditingText_0 = v35.state.isEditingText;
    return v1.createElement(l_Pane_0, {
        Size = l_WindspeedDisplay_0.Size, 
        Position = l_WindspeedDisplay_0.Position
    }, {
        ButtonPanel = v1.createElement(l_Pane_0, {
            Layout = Enum.FillDirection.Vertical, 
            Size = UDim2.fromScale(0.5, 0.9), 
            Position = UDim2.fromScale(0, -0.45)
        }, {
            Button1 = v1.createElement(l_Pane_0, {
                LayoutOrder = 1, 
                Size = l_WindspeedDisplay_0.ButtonSize, 
                OnClick = v35.setIsScaling
            }, {
                TextLabel1 = v1.createElement(l_TextLabel_0, {
                    TextXAlignment = Enum.TextXAlignment.Left, 
                    Text = l_Localization_1:getText("WindspeedDisplay", "Speed"), 
                    TextSize = l_WindspeedDisplay_0.ButtonTextSize, 
                    TextColor = if l_props_0.isChangingYaw or l_props_0.isChangingPitch then l_WindspeedDisplay_0.inactiveLabelColor else l_WindspeedDisplay_0.activeLabelColor
                })
            }), 
            Button2 = v1.createElement(l_Pane_0, {
                LayoutOrder = 2, 
                Size = l_WindspeedDisplay_0.ButtonSize, 
                OnClick = v35.setisChangingYaw
            }, {
                TextLabel2 = v1.createElement(l_TextLabel_0, {
                    TextXAlignment = Enum.TextXAlignment.Left, 
                    Text = l_Localization_1:getText("WindspeedDisplay", "Yaw"), 
                    TextSize = l_WindspeedDisplay_0.ButtonTextSize, 
                    TextColor = if not l_props_0.isChangingYaw then l_WindspeedDisplay_0.inactiveLabelColor else l_WindspeedDisplay_0.activeLabelColor
                })
            }), 
            Button3 = v1.createElement(l_Pane_0, {
                LayoutOrder = 3, 
                Size = l_WindspeedDisplay_0.ButtonSize, 
                OnClick = v35.setisChangingPitch
            }, {
                TextLabel3 = v1.createElement(l_TextLabel_0, {
                    TextXAlignment = Enum.TextXAlignment.Left, 
                    Text = l_Localization_1:getText("WindspeedDisplay", "Pitch"), 
                    TextSize = l_WindspeedDisplay_0.ButtonTextSize, 
                    TextColor = if not l_props_0.isChangingPitch then l_WindspeedDisplay_0.inactiveLabelColor else l_WindspeedDisplay_0.activeLabelColor
                })
            })
        }), 
        Slider = v1.createElement(l_Slider_0, {
            Min = v35.getSliderMinValue(), 
            Max = v35.getSliderMaxValue(), 
            Value = v35.getSliderCurrentValue(), 
            Size = l_WindspeedDisplay_0.Slider.Size, 
            Position = l_WindspeedDisplay_0.Slider.Position, 
            OnValueChanged = function(v40)
                if not v35.isChangingYaw and not v35.isChangingPitch then
                    v35.setWindSpeed(v40 < 0 and 0 or math.pow(1000, v40 / 3));
                    return ;
                else
                    v35.setCurrentValue(v40);
                    return ;
                end;
            end, 
            OnChangeBegan = function()
                if l_EnableWindControlRBXTelemetry_0 then
                    local l_v12_0 = v12;
                    l_v12_0.sliderCount = l_v12_0.sliderCount + 1;
                end;
            end
        }), 
        Pane = v1.createElement(l_Pane_0, {
            Size = l_WindspeedDisplay_0.TextLabel.Size, 
            Position = l_WindspeedDisplay_0.TextLabel.Position, 
            OnClick = function()
                if not l_isEditingText_0 then
                    v35:setState({
                        isEditingText = true
                    });
                end;
            end
        }, {
            TextLabel = not l_isEditingText_0 and v1.createElement(l_TextLabel_0, {
                Text = v35.getCurrentValueText(), 
                Style = l_WindspeedDisplay_0.TextLabel.Style, 
                ref = v35.textLabelRef
            }), 
            ValueEditTextBox = l_isEditingText_0 and v1.createElement(v11, {
                Text = v35.getCurrentValueText(), 
                Size = UDim2.fromScale(1, 1), 
                OnTextConfirmed = function(v42)
                    v35:setState({
                        isEditingText = false
                    });
                    local v43 = tonumber(v42);
                    if v43 ~= nil then
                        v35.setCurrentValue(v43);
                    end;
                    if l_EnableWindControlRBXTelemetry_0 then
                        local l_v12_1 = v12;
                        l_v12_1.textFieldCount = l_v12_1.textFieldCount + 1;
                    end;
                end, 
                OnEditCanceled = function()
                    v35:setState({
                        isEditingText = false
                    });
                end
            })
        })
    });
end;
return (l_withContext_0({
    Stylizer = l_Stylizer_0, 
    Localization = l_Localization_0
})(v18));
