local v0 = require(script.Parent.Parent.Parent.Parent.Parent.Packages.Roact);
local v1 = require(script.Parent.LabeledTextInput);
local v2 = Rect.new(3, 0, 4, 6);
local v3 = UDim2.new(0, 140, 0, 22);
local v4 = UDim2.new(0, 94, 0, 4);
local v5 = UDim2.new(0, 13, 0, 13);
local v6 = UDim2.new(0, 34, 0, 22);
local v7 = Color3.fromRGB(151, 151, 151);
local v8 = v0.PureComponent:extend("Slider");
v8.init = function(v9)
    v9.state = {
        darkTheme = settings().Studio.Theme.Name == "Dark", 
        pressed = false
    };
    v9.sliderFrameRef = v0.createRef();
    v9.getOffset = function()
        local v10 = v9.props.Min or 0;
        local v11 = v9.props.Max or 100;
        assert(v10 <= v11, "Expected min to be smaller or equal to max");
        local v12 = v9.props.Value or 0;
        local v13 = v11 - v10;
        if v13 == 0 then
            return 0;
        else
            return (v12 - v10) / v13;
        end;
    end;
    v9.getSnappedValue = function(v14)
        local v15 = v9.props.Min or 0;
        local v16 = v9.props.Max or 100;
        assert(v15 <= v16, "Expected min to be smaller or equal to max");
        local v17 = v9.props.SnapIncrement or 0;
        if v17 > 0.001 then
            local v18 = math.max(v17 * math.floor(v14 / v17), v15);
            local v19 = math.min(v18 + v17, v16);
            v14 = math.abs(v18 - v14) < math.abs(v19 - v14) and v18 or v19;
        end;
        return (math.min(v16, (math.max(v15, v14))));
    end;
    v9.getMouseClickValue = function(v20)
        local v21 = v9.props.Min or 0;
        local v22 = v9.props.Max or 100;
        assert(v21 <= v22, "Expected min to be smaller or equal to max");
        return v9.getSnappedValue(v21 + math.max(0, (math.min(1, (v20.Position.X - v9.sliderFrameRef.current.AbsolutePosition.X) / v9.sliderFrameRef.current.AbsoluteSize.X))) * (v22 - v21));
    end;
    v9.setValueFromInput = function(v23)
        v9.props.SetValue((v9.getMouseClickValue(v23)));
    end;
    v9.setValue = function(v24)
        v9.props.SetValue((v9.getSnappedValue(v24)));
    end;
    v9.isEnabled = function()
        if not v9.props.Enabled then
            if v9.props.Enabled == nil then
                return true;
            else
                return false;
            end;
        else
            return true;
        end;
    end;
    v9.onInputBegan = function(_, v26)
        if v9.isEnabled() and v26.UserInputType == Enum.UserInputType.MouseButton1 then
            v9:setState({
                pressed = true
            });
            v9.setValueFromInput(v26);
        end;
    end;
    v9.onInputChanged = function(_, v28)
        if not (not v9.isEnabled() or not v9.state.pressed) and v28.UserInputType == Enum.UserInputType.MouseMovement then
            v9.setValueFromInput(v28);
        end;
    end;
    v9.onInputEnded = function(_, v30)
        if v9.isEnabled() and v30.UserInputType == Enum.UserInputType.MouseButton1 then
            v9:setState({
                pressed = false
            });
        end;
    end;
    v9.onInputFocusLost = function(_, v32)
        local v33 = tonumber((string.reverse((string.match(string.reverse(v32), "[0-9]*[%.]?[0-9]*[%-]?")))));
        if not v33 then
            v9.props.SetValue(v9.props.Value or 0);
            return v9.props.Value or 0;
        else
            local v34 = v9.getSnappedValue(v33);
            v9.props.SetValue(v34);
            return v34;
        end;
    end;
    v9.validateInputText = function(v35)
        return (string.gsub(v35, "[^0-9%-%.%+]*", ""));
    end;
    v9.setValue(v9.props.Value or 0);
end;
v8.didMount = function(v36)
    v36.themeChanged = settings().Studio.ThemeChanged:Connect(function()
        v36:setState({
            darkTheme = settings().Studio.Theme.Name == "Dark"
        });
    end);
end;
v8.willUnmount = function(v37)
    if v37.themeChanged then
        v37.themeChanged:Disconnect();
        v37.themeChanged = nil;
    end;
end;
v8.render = function(v38)
    local v39 = v38.props.Value or 0;
    local _ = v38.props.Min or 0;
    local _ = v38.props.Max or 100;
    local v42 = v38.isEnabled();
    local l_ShowInput_0 = v38.props.ShowInput;
    if l_ShowInput_0 == nil then
        l_ShowInput_0 = true;
    end;
    local v44 = v38.props.Size or v3;
    local v45 = v38.props.SliderSize or v4;
    local v46 = v38.props.HandleSize or v5;
    local v47 = v38.props.InputSize or v6;
    if not v38.props.TextColor then
        local _ = v7;
    end;
    local _ = v38.props.TextSize or 15;
    local _ = v38.props.TextLabelHeight or 15;
    local v51 = (v44.Height.Offset - v46.Height.Offset) / 2;
    local v52 = v45.Width.Offset + 12;
    local _ = (v51 + v46.Height.Offset / 2) + 2;
    local v54 = v45.Height.Offset * 2;
    local l_darkTheme_0 = v38.state.darkTheme;
    return v0.createElement("Frame", {
        BackgroundTransparency = 1, 
        BorderSizePixel = 0, 
        Size = v44
    }, {
        SliderFrame = v0.createElement("Frame", {
            BackgroundTransparency = 1, 
            BorderSizePixel = 0, 
            Size = UDim2.new(0, v45.Width.Offset, 0, v46.Height.Offset), 
            Position = UDim2.new(0, 0, 0, v51), 
            [v0.Ref] = v38.sliderFrameRef
        }, {
            ClickHandler = v0.createElement("ImageButton", {
                Size = UDim2.new(1, v46.Width.Offset, 1, not not v38.state.pressed and v54 or 0), 
                Position = UDim2.new(0.5, 0, 0.5, 0), 
                AnchorPoint = Vector2.new(0.5, 0.5), 
                BackgroundTransparency = 1, 
                ZIndex = 4, 
                [v0.Event.InputBegan] = v38.onInputBegan, 
                [v0.Event.InputChanged] = v38.onInputChanged, 
                [v0.Event.InputEnded] = v38.onInputEnded
            }), 
            HoverHandler = v0.createElement("Frame", {
                Size = UDim2.new(1, v46.Width.Offset, 1, 0), 
                Position = UDim2.new(0.5, 0, 0.5, 0), 
                AnchorPoint = Vector2.new(0.5, 0.5), 
                BackgroundTransparency = 1
            }), 
            SliderHandle = v0.createElement("ImageLabel", {
                BackgroundTransparency = 1, 
                Size = v46, 
                AnchorPoint = Vector2.new(0.5, 0), 
                Position = UDim2.new(v38.getOffset(), 0, 0, 0), 
                Image = not l_darkTheme_0 and "rbxasset://textures/RoactStudioWidgets/slider_handle_light.png" or "rbxasset://textures/RoactStudioWidgets/slider_handle_dark.png", 
                Visible = v42, 
                ZIndex = 3
            }), 
            BackgroundBar = v0.createElement("ImageLabel", {
                BackgroundTransparency = 1, 
                Size = v45, 
                Image = not l_darkTheme_0 and "rbxasset://textures/RoactStudioWidgets/slider_bar_background_light.png" or "rbxasset://textures/RoactStudioWidgets/slider_bar_background_dark.png", 
                ScaleType = Enum.ScaleType.Slice, 
                SliceCenter = v2, 
                AnchorPoint = Vector2.new(0, 0.5), 
                Position = UDim2.new(0, 0, 0.5, 0)
            }), 
            ForegroundBar = v0.createElement("ImageLabel", {
                BackgroundTransparency = 1, 
                Size = UDim2.new(v38.getOffset(), 0, 0, v45.Height.Offset), 
                Image = not l_darkTheme_0 and "rbxasset://textures/RoactStudioWidgets/slider_bar_light.png" or "rbxasset://textures/RoactStudioWidgets/slider_bar_dark.png", 
                ScaleType = Enum.ScaleType.Slice, 
                SliceCenter = v2, 
                AnchorPoint = Vector2.new(0, 0.5), 
                Position = UDim2.new(0, 0, 0.5, 0), 
                Visible = v42, 
                ZIndex = 2
            })
        }), 
        Input = l_ShowInput_0 and v0.createElement(v1, {
            Width = v47.Width, 
            Position = UDim2.new(0, v52, 0, 0), 
            Text = tostring(v39), 
            OnFocusLost = v38.onInputFocusLost, 
            ValidateText = v38.validateInputText
        })
    });
end;
return v8;
