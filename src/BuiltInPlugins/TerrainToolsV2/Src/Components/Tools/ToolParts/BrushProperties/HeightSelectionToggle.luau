local v0 = require(script.Parent.Parent.Parent.Parent.Parent.Parent.Packages.Roact);
local l_Parent_0 = script.Parent.Parent;
local v2 = require(l_Parent_0.LabeledElementPair);
local v3 = require(l_Parent_0.NumberTextInput);
local l_PickerButton_0 = require(l_Parent_0.ToggleButtons).PickerButton;
local v5 = v0.PureComponent:extend("HeightSelectionToggle");
v5.init = function(v6, _)
    v6.onFocused = function()
        if v6.props.setHeightPicker then
            v6.props.setHeightPicker(false);
        end;
    end;
    v6.onFocusLost = function(_, _, v10, v11)
        if v6.props.setHeightPicker then
            v6.props.setHeightPicker(false);
        end;
        local l_setPlanePositionY_0 = v6.props.setPlanePositionY;
        if not (not v11 or not l_setPlanePositionY_0) then
            spawn(function()
                l_setPlanePositionY_0(v10);
            end);
        end;
    end;
    v6.onValueChanged = function(_, v14, v15)
        if not (not v15 or not v6.props.setPlanePositionY) then
            v6.props.setPlanePositionY(v14);
        end;
    end;
end;
v5.render = function(v16)
    local l_props_0 = v16.props;
    return v0.createElement(v2, {
        LayoutOrder = l_props_0.LayoutOrder, 
        Size = UDim2.new(1, 0, 0, 22), 
        Text = l_props_0.Label, 
        Padding = UDim.new(0, 4), 
        SizeToContent = true, 
        ContentDirection = Enum.FillDirection.Horizontal
    }, {
        Input = v0.createElement(v3, {
            LayoutOrder = 1, 
            Width = UDim.new(0, 116), 
            Key = "Y", 
            Label = "Y", 
            Value = l_props_0.planePositionY, 
            Precision = 3, 
            OnFocused = v16.onFocused, 
            OnFocusLost = v16.onFocusLost, 
            OnValueChanged = v16.onValueChanged
        }), 
        HeightPickerContainer = v0.createElement("Frame", {
            LayoutOrder = 2, 
            BackgroundTransparency = 1, 
            Size = UDim2.new(0, 18, 0, 21)
        }, {
            HeightPicker = v0.createElement(l_PickerButton_0, {
                Position = UDim2.new(0, 0, 0, 3), 
                IsOn = l_props_0.heightPicker, 
                SetIsOn = l_props_0.setHeightPicker
            })
        })
    });
end;
return v5;
