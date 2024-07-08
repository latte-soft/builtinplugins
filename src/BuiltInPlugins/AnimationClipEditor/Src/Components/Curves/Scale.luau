local l_script_FirstAncestor_0 = script:FindFirstAncestor("AnimationClipEditor");
local v1 = require(l_script_FirstAncestor_0.Packages.Roact);
local l_ContextServices_0 = require(l_script_FirstAncestor_0.Packages.Framework).ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local v4 = require(l_script_FirstAncestor_0.Src.Util.Constants);
local v5 = require(l_script_FirstAncestor_0.Src.Components.Curves.ScaleTick);
local v6 = v1.PureComponent:extend("Scale");
v6.init = function(v7)
    v7.state = {
        majorInterval = 1, 
        minorInterval = 1
    };
end;
v6.calculateInterval = function(v8)
    local v9 = (v4.SCALE_TICK_SPACING * ((v8.MaxValue - v8.MinValue) * (1 - math.min(v8.VerticalZoom, 0.99)))) / v8.ParentSize.Y;
    local v10 = math.pow(10, (math.floor((math.log10(v9)))));
    local v11 = v4.SCALE_NUM_TICKS * v10;
    if v9 < v11 then
        return v10;
    else
        return v11;
    end;
end;
v6.scale = function(v12, v13)
    local l_props_0 = v12.props;
    local l_MinValue_0 = l_props_0.MinValue;
    local l_MaxValue_0 = l_props_0.MaxValue;
    local l_VerticalScroll_0 = l_props_0.VerticalScroll;
    local v18 = math.min(l_props_0.VerticalZoom, 0.99);
    return ((((l_MaxValue_0 - v13) / (l_MaxValue_0 - l_MinValue_0) - l_VerticalScroll_0 * v18) * (1 / (1 - v18))) * l_props_0.ParentSize.Y) * (1 - 2 * v4.CURVE_CANVAS_PADDING) + l_props_0.ParentSize.Y * v4.CURVE_CANVAS_PADDING;
end;
v6.inverseScale = function(v19, v20)
    local l_props_1 = v19.props;
    local l_MinValue_1 = l_props_1.MinValue;
    local l_MaxValue_1 = l_props_1.MaxValue;
    local l_VerticalScroll_1 = l_props_1.VerticalScroll;
    local v25 = math.min(l_props_1.VerticalZoom, 0.99);
    return l_MaxValue_1 - (((v20 - l_props_1.ParentSize.Y * v4.CURVE_CANVAS_PADDING) / (l_props_1.ParentSize.Y * (1 - 2 * v4.CURVE_CANVAS_PADDING))) / (1 / (1 - v25)) + l_VerticalScroll_1 * v25) * (l_MaxValue_1 - l_MinValue_1);
end;
v6.getDerivedStateFromProps = function(v26, _)
    if v26.ParentSize.Y == 0 then
        return {};
    else
        local v28 = v6.calculateInterval(v26);
        return {
            majorInterval = v28, 
            minorInterval = v28 / v4.SCALE_NUM_TICKS
        };
    end;
end;
v6.renderTick = function(v29, v30, v31, v32, v33)
    local l_props_2 = v29.props;
    table.insert(v30, v1.createElement(v5, {
        Value = v32 or "", 
        Width = l_props_2.Width, 
        Position = UDim2.new(0, 0, 0, v29:scale(v31)), 
        TickWidthScale = v33, 
        ScaleType = l_props_2.ScaleType
    }));
end;
v6.formatLabel = function(v35, v36)
    if v35.props.ScaleType == v4.SCALE_TYPE.Angle then
        return string.format("%d\194\176", (math.floor(v36)));
    else
        return string.format("%0.3f", v36);
    end;
end;
v6.render = function(v37)
    local l_props_3 = v37.props;
    local l_Stylizer_0 = l_props_3.Stylizer;
    local l_timelineTheme_0 = l_Stylizer_0.timelineTheme;
    if l_props_3.ParentSize.Y == 0 then
        return ;
    else
        local v41 = {};
        for v42 = math.floor(v37:inverseScale(l_props_3.ParentSize.Y) / v37.state.majorInterval) * v37.state.majorInterval, math.ceil(v37:inverseScale(0) / v37.state.majorInterval) * v37.state.majorInterval, v37.state.majorInterval do
            v37:renderTick(v41, v42, v37:formatLabel(v42), l_props_3.TickWidthScale);
            for v43 = 1, 4 do
                v37:renderTick(v41, v42 + v43 * v37.state.minorInterval, "", l_props_3.SmallTickWidthScale);
            end;
        end;
        return v1.createElement("Frame", {
            Size = l_props_3.Size, 
            Position = l_props_3.Position, 
            BackgroundColor3 = l_timelineTheme_0.barColor, 
            BorderColor3 = l_Stylizer_0.borderColor, 
            BorderSizePixel = 1, 
            ZIndex = l_props_3.ZIndex
        }, v41);
    end;
end;
v6 = l_withContext_0({
    Stylizer = l_ContextServices_0.Stylizer
})(v6);
return v6;
