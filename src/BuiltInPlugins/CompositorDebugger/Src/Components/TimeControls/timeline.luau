local l_script_FirstAncestor_0 = script:FindFirstAncestor("CompositorDebugger");
local v1 = require(l_script_FirstAncestor_0.Packages.React);
local v2 = require(l_script_FirstAncestor_0.Packages.RoactRodux);
local v3 = require(l_script_FirstAncestor_0.Packages.Framework);
local l_ContextServices_0 = v3.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_join_0 = v3.Dash.join;
local l_UI_0 = v3.UI;
local l_DragListener_0 = l_UI_0.DragListener;
local l_Pane_0 = l_UI_0.Pane;
local _ = l_UI_0.TextLabel;
local _ = l_script_FirstAncestor_0.Src.Actions;
local v12 = require(l_script_FirstAncestor_0.Src.Components.TimeControls.timelineTick);
local v13 = require(l_script_FirstAncestor_0.Src.Thunks.SetScrubberOffset);
local _ = require(l_script_FirstAncestor_0.Src.Types);
local v15 = require(l_script_FirstAncestor_0.Src.Util.Constants);
local v16 = v1.PureComponent:extend("Timeline");
v16.init = function(v17)
    v17.state = {
        dragging = false
    };
    v17.onAbsoluteSizeChanged = function(v18)
        v17:setState({
            absoluteSize = v18.AbsoluteSize
        });
    end;
    v17.setScrubberPosition = function(v19)
        v17.props.SetScrubberOffset(math.clamp((v19 - 24) / v17.state.absoluteSize.X - 1, -1, 0) * v17.props.Timespan);
    end;
    v17.onDragStarted = function(_, v21)
        if v21.UserInputType == Enum.UserInputType.MouseButton1 then
            v17.setScrubberPosition(v21.Position.X);
            v17:setState({
                dragging = true
            });
        end;
    end;
    v17.onDragMoved = function(v22)
        if v17.state.dragging then
            v17.setScrubberPosition(v22.Position.X);
        end;
    end;
    v17.onDragEnded = function()
        v17:setState({
            dragging = false
        });
        v17.props.Analytics:report("onScrubbing");
    end;
end;
v16.renderTicks = function(v23, v24)
    local l_props_0 = v23.props;
    local l_Stylizer_0 = l_props_0.Stylizer;
    local l_Timespan_0 = l_props_0.Timespan;
    local v28 = l_Stylizer_0.Intervals[l_Timespan_0] or l_Stylizer_0.Intervals[v15.DEFAULT_TIMECONTROLS_INTERVAL];
    local l_Minor_0 = v28.Minor;
    local l_Medium_0 = v28.Medium;
    local l_Major_0 = v28.Major;
    for v32 = 0, l_Timespan_0, l_Minor_0 do
        local v33 = nil;
        v33 = if v32 == 0 then l_Stylizer_0.Tick.RBorder else if v32 == l_Timespan_0 then l_Stylizer_0.Tick.LBorder else if v32 % l_Major_0 == 0 then l_Stylizer_0.Tick.Major else if l_Medium_0 and v32 % l_Medium_0 == 0 then l_Stylizer_0.Tick.Medium else l_Stylizer_0.Tick.Minor;
        v24["Tick_" .. tostring(v32)] = v1.createElement(v12, {
            ZIndex = 1, 
            Position = UDim2.fromScale(1 - v32 / l_Timespan_0, 0), 
            Tick = v32, 
            Color = l_Stylizer_0.Tick.Color, 
            Width = v33.Width, 
            Height = v33.Height, 
            TextAlignment = v33.TextAlignment
        });
    end;
end;
v16.render = function(v34)
    local l_state_0 = v34.state;
    local l_props_1 = v34.props;
    local l_Style_0 = l_props_1.Style;
    local _ = l_props_1.Timespan;
    local v39 = l_join_0(l_props_1.children, {
        DragListener = if not l_state_0.dragging then nil else v1.createElement(l_DragListener_0, {
            OnDragMoved = v34.onDragMoved, 
            OnDragEnded = v34.onDragEnded
        })
    });
    v34:renderTicks(v39);
    return v1.createElement(l_Pane_0, {
        Size = l_props_1.Size
    }, {
        TimelineCanvas = v1.createElement(l_Pane_0, {
            LayoutOrder = l_props_1.LayoutOrder, 
            Size = UDim2.fromScale(1, 1), 
            BackgroundColor = l_Style_0.BackgroundColor, 
            [v1.Change.AbsoluteSize] = v34.onAbsoluteSizeChanged, 
            [v1.Event.InputBegan] = v34.onDragStarted
        }, v39)
    });
end;
return (v2.connect(function(_, _)
    return {};
end, function(v42)
    return {
        SetScrubberOffset = function(v43)
            v42(v13(v43));
        end
    };
end)((l_withContext_0({
    Analytics = l_ContextServices_0.Analytics, 
    Localization = l_ContextServices_0.Localization, 
    Stylizer = v3.Style.Stylizer
})(v16))));
