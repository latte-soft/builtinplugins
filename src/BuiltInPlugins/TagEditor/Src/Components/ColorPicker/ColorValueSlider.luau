local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Roact);
local v2 = require(l_Parent_0.Packages.Framework);
local l_ContextServices_0 = v2.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_Analytics_0 = l_ContextServices_0.Analytics;
local l_Stylizer_0 = v2.Style.Stylizer;
local v7 = v1.PureComponent:extend("ColorValueSlider");
v7.init = function(v8)
    v8.state = {
        mouseDown = false
    };
    v8._rootRef = v1.createRef();
    v8.onMouseDown = function(_, _, _)
        v8:setState({
            MouseDown = true
        });
    end;
    v8.onInputChanged = function(_, v13)
        if v8.state.MouseDown and v13.UserInputType == Enum.UserInputType.MouseMovement then
            v8.props.updatePosition(v8:xToAlpha(v13.Position.X));
        end;
    end;
    v8.onInputEnded = function(_, v15)
        if not (not (v15.UserInputType == Enum.UserInputType.MouseButton1) or not v8.state.MouseDown) then
            v8:setState({
                MouseDown = false
            });
            v8.props.updatePosition(v8:xToAlpha(v15.Position.X));
        end;
    end;
end;
v7.xToAlpha = function(v16, v17)
    local l_current_0 = v16._rootRef.current;
    return (math.clamp((v17 - l_current_0.AbsolutePosition.X) / l_current_0.AbsoluteSize.X, 0, 1));
end;
v7.render = function(v19)
    local l_props_0 = v19.props;
    local l_ColorValueSlider_0 = l_props_0.Stylizer.ColorValueSlider;
    return v1.createElement("ImageButton", {
        LayoutOrder = l_props_0.LayoutOrder, 
        Size = l_ColorValueSlider_0.Size, 
        Image = l_ColorValueSlider_0.GradientImage, 
        ImageColor3 = Color3.fromHSV(l_props_0.Hue, l_props_0.Saturation, 1), 
        AutoButtonColor = false, 
        [v1.Ref] = v19._rootRef, 
        [v1.Event.MouseButton1Down] = v19.onMouseDown, 
        [v1.Event.InputEnded] = v19.onInputEnded, 
        [v1.Event.InputChanged] = v19.onInputChanged
    }, {
        PositionIndicator = v1.createElement("ImageLabel", {
            Size = l_ColorValueSlider_0.PositionIndicatorSize, 
            BackgroundTransparency = 1, 
            Position = UDim2.fromScale(l_props_0.Value, 0), 
            AnchorPoint = l_ColorValueSlider_0.PositionIndicatorAnchor, 
            Image = l_ColorValueSlider_0.PositionIndicatorImage, 
            ImageColor3 = l_ColorValueSlider_0.White
        })
    });
end;
return (l_withContext_0({
    Analytics = l_Analytics_0, 
    Stylizer = l_Stylizer_0
})(v7));
