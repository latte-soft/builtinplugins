local l_script_FirstAncestor_0 = script:FindFirstAncestor("CompositorDebugger");
local v1 = require(l_script_FirstAncestor_0.Packages.React);
local v2 = require(l_script_FirstAncestor_0.Packages.RoactRodux);
local v3 = require(l_script_FirstAncestor_0.Packages.Framework);
local l_ContextServices_0 = v3.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_Analytics_0 = l_ContextServices_0.Analytics;
local l_Localization_0 = l_ContextServices_0.Localization;
local l_UI_0 = v3.UI;
local l_Pane_0 = l_UI_0.Pane;
local l_Tooltip_0 = l_UI_0.Tooltip;
local l_DragListener_0 = l_UI_0.DragListener;
local v12 = require(l_script_FirstAncestor_0.Src.Components.DragTooltip);
local v13 = require(l_script_FirstAncestor_0.Src.Thunks.SetOverride);
local v14 = require(l_script_FirstAncestor_0.Src.Util.findInterval);
local _ = require(l_script_FirstAncestor_0.Src.Types);
local v16 = v1.PureComponent:extend("BlendBase");
local function _(v17)
    if v17.LayerData then
        if not v17.Overrides or not v17.Overrides.targetPosition then
            if not v17.LayerData or not v17.LayerData.props then
                return nil;
            else
                return v17.LayerData.props.targetPosition;
            end;
        else
            return v17.Overrides.targetPosition;
        end;
    else
        return nil;
    end;
end;
v16.init = function(v19)
    v19.dragArea = v1.createRef();
    v19.cursor = v1.createRef();
    v19.state = {};
    v19.onAbsoluteSizeChanged = function(v20)
        v19.absoluteSize = v20.AbsoluteSize;
        v19.absolutePosition = v20.AbsolutePosition;
    end;
    v19.resetOverride = function()
        v19.props.SetOverride(v19.props.LayerData.id, {
            "targetPosition"
        }, nil);
    end;
    v19.onDragStarted = function(_, v22)
        local l_Stylizer_0 = v19.props.Stylizer;
        if v22.UserInputType == Enum.UserInputType.MouseButton1 then
            v19:setState({
                dragging = true, 
                delta = (v19.cursor.current.AbsolutePosition + 0.5 * Vector2.new(l_Stylizer_0.Dot.Size.X.Offset, l_Stylizer_0.Dot.Size.Y.Offset)) - Vector2.new(v22.Position.X, v22.Position.Y)
            });
        end;
    end;
    v19.onDragMoved = function(v24)
        local l_props_0 = v19.props;
        local l_state_0 = v19.state;
        local l_LayerData_0 = l_props_0.LayerData;
        local v28 = Vector2.new(v24.Position.X, v24.Position.Y) + v19.state.delta;
        local l_current_0 = v19.dragArea.current;
        local v30 = (v28 - l_current_0.AbsolutePosition) / l_current_0.AbsoluteSize;
        v30 = Vector2.new(math.clamp(v30.X, 0, 1), not v19.props.Show2D and 0.5 or math.clamp(v30.Y, 0, 1));
        v19.cursor.current.Position = UDim2.fromScale(v30.X, v30.Y);
        local v31 = l_state_0.min + Vector2.new(v30.X, 1 - v30.Y) * (l_state_0.max - l_state_0.min);
        l_props_0.SetOverride(l_LayerData_0.id, {
            "targetPosition"
        }, if not v19.props.Show2D then v31.X else v31);
    end;
    v19.onDragEnded = function()
        v19:setState({
            dragging = false
        });
    end;
    v19.make2dPosition = function(v32)
        if not v19.props.Show2D then
            if typeof(v32) == "number" then
                return Vector2.new(v32, 0.5);
            elseif not ((typeof(v32) ~= "Vector2" and typeof(v32) ~= "Vector3") and type(v32) ~= "userdata") or type(v32) == "table" then
                return Vector2.new(v32.X or 0, 0.5);
            else
                return Vector2.new(0, 0.5);
            end;
        elseif typeof(v32) == "number" then
            return Vector2.new(v32, 0);
        elseif typeof(v32) == "Vector2" then
            return v32;
        elseif not (typeof(v32) ~= "Vector3" and type(v32) ~= "userdata") or type(v32) == "table" then
            return Vector2.new(v32.X or 0, v32.Y or 0);
        else
            return Vector2.new();
        end;
    end;
    v19.updateMinMax = function(v33, v34, v35)
        local v36 = v19.make2dPosition(v33);
        return Vector2.new(math.min(v36.X, v34.X), (math.min(v36.Y, v34.Y))), Vector2.new(math.max(v36.X, v35.X), (math.max(v36.Y, v35.Y)));
    end;
    v19.makeTooltipText = function(v37, v38)
        local v39 = not v37 and "" or v37 .. "\n";
        if not v19.props.Show2D then
            return v39 .. string.format("(%.2f)", v38.X);
        else
            return v39 .. string.format("(%.2f, %.2f)", v38.X, v38.Y);
        end;
    end;
    v19.calculateGrid = function()
        local l_Grid_0 = v19.props.Stylizer.Grid;
        local l_state_1 = v19.state;
        local v42 = l_state_1.max - l_state_1.min;
        local l_MaxTicks_0 = l_Grid_0.MaxTicks;
        local l_Intervals_0 = l_Grid_0.Intervals;
        local v45 = Vector2.new(v14(v42.X, l_MaxTicks_0, l_Intervals_0), v14(v42.Y, l_MaxTicks_0, l_Intervals_0));
        return Vector2.new(math.floor(l_state_1.min.X / v45.X) * v45.X, math.floor(l_state_1.min.Y / v45.Y) * v45.Y), Vector2.new(math.ceil(l_state_1.max.X / v45.X) * v45.X, math.ceil(l_state_1.max.Y / v45.Y) * v45.Y), v45;
    end;
    v19:calculateExtents(true);
end;
v16.createDots = function(v46)
    local l_props_1 = v46.props;
    local l_state_2 = v46.state;
    local l_Stylizer_1 = l_props_1.Stylizer;
    local l_LayerData_1 = l_props_1.LayerData;
    local l_dragging_0 = l_state_2.dragging;
    local v52 = {};
    if l_LayerData_1 then
        local v53 = l_LayerData_1.children or {};
        for v54, v55 in v53, nil, nil do
            local v56 = "Dot_" .. (v55.name or tostring(v54));
            local v57 = if not not v55 and v55.linkData then v55.linkData.position else nil;
            if v57 then
                local v58 = v46.make2dPosition(v57);
                local v59 = (v58 - l_state_2.min) / (l_state_2.max - l_state_2.min);
                v52[v56] = v1.createElement("ImageButton", {
                    LayoutOrder = 4, 
                    Size = l_Stylizer_1.Dot.Size, 
                    Position = UDim2.fromScale(v59.X, 1 - v59.Y), 
                    AnchorPoint = Vector2.new(0.5, 0.5), 
                    BackgroundTransparency = 1, 
                    Image = l_Stylizer_1.Dot.Image, 
                    ImageColor3 = l_Stylizer_1.Dot.Color, 
                    ZIndex = 3
                }, {
                    Tooltip = if l_dragging_0 then nil else v1.createElement(l_Tooltip_0, {
                        Text = v46.makeTooltipText(v55.name, v58)
                    })
                });
            end;
        end;
        if not (not l_LayerData_1.props or not l_LayerData_1.props.targetPosition) then
            v53 = not not l_props_1.Overrides and l_props_1.Overrides.targetPosition or nil;
            local v60 = v46.make2dPosition(v53 or l_LayerData_1.props.targetPosition);
            local v61 = (v60 - l_state_2.min) / (l_state_2.max - l_state_2.min);
            v52.cursor = v1.createElement("ImageButton", {
                LayoutOrder = 4, 
                Size = l_Stylizer_1.Cursor.Size, 
                Position = UDim2.fromScale(v61.X, 1 - v61.Y), 
                AnchorPoint = Vector2.new(0.5, 0.5), 
                BackgroundTransparency = 1, 
                Image = l_Stylizer_1.Cursor.Image, 
                ImageColor3 = if not v53 then l_Stylizer_1.Cursor.Color else l_Stylizer_1.Cursor.Override, 
                ZIndex = 4, 
                ref = v46.cursor, 
                [v1.Event.InputBegan] = v46.onDragStarted
            }, if not l_dragging_0 then nil else {
                DragListener = v1.createElement(l_DragListener_0, {
                    OnDragMoved = v46.onDragMoved, 
                    OnDragEnded = v46.onDragEnded
                }), 
                Tooltip = v1.createElement(v12, {
                    Text = v46.makeTooltipText(nil, v60)
                })
            });
        end;
    end;
    return v52;
end;
v16.createAxes = function(v62)
    local l_props_2 = v62.props;
    local l_state_3 = v62.state;
    local l_Grid_1 = l_props_2.Stylizer.Grid;
    local v66 = {};
    local v67, v68, v69 = v62.calculateGrid();
    local v70 = 1;
    if l_props_2.Show2D then
        for v71 = v67.Y, v68.Y, v69.Y do
            local v72 = string.format("Y%d", v70);
            v70 = v70 + 1;
            v66[v72] = v1.createElement(l_Pane_0, {
                AnchorPoint = Vector2.new(0, 0.5), 
                Size = UDim2.new(1, 0, 0, 1), 
                Position = UDim2.fromScale(0, 1 - (v71 - l_state_3.min.Y) / (l_state_3.max.Y - l_state_3.min.Y)), 
                BackgroundColor = if v71 == 0 then l_Grid_1.AxisColor else l_Grid_1.GridColor, 
                BackgroundTransparency = 0, 
                ZIndex = v71 == 0 and 2 or 1
            });
        end;
    end;
    v70 = 1;
    for v73 = v67.X, v68.X, v69.X do
        local v74 = string.format("X%d", v70);
        v70 = v70 + 1;
        v66[v74] = v1.createElement(l_Pane_0, {
            AnchorPoint = Vector2.new(0.5, 0), 
            Size = UDim2.new(0, 1, 1, 0), 
            Position = UDim2.fromScale((v73 - l_state_3.min.X) / (l_state_3.max.X - l_state_3.min.X), 0), 
            BackgroundColor = if v73 == 0 then l_Grid_1.AxisColor else l_Grid_1.GridColor, 
            BackgroundTransparency = 0, 
            ZIndex = v73 == 0 and 2 or 1
        });
    end;
    return v66;
end;
v16.calculateExtents = function(v75, v76)
    local l_props_3 = v75.props;
    local l_LayerData_2 = l_props_3.LayerData;
    local v79 = not v76 and v75.state.min or Vector2.new(math.huge, not l_props_3.Show2D and 0 or math.huge);
    local v80 = not v76 and v75.state.max or Vector2.new(-math.huge, not l_props_3.Show2D and 1 or -math.huge);
    if l_LayerData_2 then
        local v81 = if l_props_3.LayerData then if l_props_3.Overrides and l_props_3.Overrides.targetPosition then l_props_3.Overrides.targetPosition else if l_props_3.LayerData and l_props_3.LayerData.props then l_props_3.LayerData.props.targetPosition else nil else nil;
        if v81 then
            local v82, v83 = v75.updateMinMax(v81, v79, v80);
            v79 = v82;
            v80 = v83;
        end;
        local v84 = l_LayerData_2.children or {};
        for _, v86 in v84, nil, nil do
            if not (not v86.linkData or not v86.linkData.position) then
                local v87, v88 = v75.updateMinMax(v86.linkData.position, v79, v80);
                v79 = v87;
                v80 = v88;
            end;
        end;
    end;
    if not (v79 == v75.state.min) or v80 ~= v75.state.max then
        v75:setState({
            min = v79, 
            max = v80
        });
    end;
end;
v16.didUpdate = function(v89, v90)
    local l_props_4 = v89.props;
    if l_props_4.LayerData ~= v90.LayerData then
        v89:calculateExtents(not v90.LayerData or l_props_4.LayerData and l_props_4.LayerData.id ~= v90.LayerData.id);
    end;
end;
v16.didMount = function(v92)
    v92:calculateExtents(true);
end;
v16.render = function(v93)
    local l_props_5 = v93.props;
    local l_Stylizer_2 = l_props_5.Stylizer;
    local l_Padding_0 = l_Stylizer_2.Padding;
    local v97 = v93:createDots();
    v97.Grid = v1.createElement(l_Pane_0, {
        Size = UDim2.new(1, 0, 1, 0), 
        ClipsDescendants = true, 
        ZIndex = 1
    }, v93:createAxes());
    if not (not l_props_5.Overrides or not l_props_5.Overrides.targetPosition) then
        v97.Reset = v1.createElement("ImageButton", {
            Size = l_Stylizer_2.Reset.Size, 
            Position = l_Stylizer_2.Reset.Position, 
            AnchorPoint = Vector2.new(1, 1), 
            BackgroundTransparency = 1, 
            Image = l_Stylizer_2.Reset.Image, 
            ImageColor3 = l_Stylizer_2.Reset.Color, 
            [v1.Event.Activated] = v93.resetOverride
        });
    end;
    return v1.createElement(l_Pane_0, {}, {
        v1.createElement(l_Pane_0, {
            Size = if not l_props_5.Show2D then UDim2.new(1, -l_Padding_0.Left - l_Padding_0.Right, 0, l_Stylizer_2.Dot.Size.Y.Offset) else UDim2.new(1, -l_Padding_0.Left - l_Padding_0.Right, 1, -l_Padding_0.Top - l_Padding_0.Bottom), 
            Position = if not l_props_5.Show2D then UDim2.new(0, l_Padding_0.Left, 0.5, 0) else UDim2.new(0, l_Padding_0.Left, 0, l_Padding_0.Top), 
            BorderColor3 = l_Stylizer_2.BorderColor, 
            BorderSizePixel = 1, 
            BackgroundColor3 = l_Stylizer_2.BackgroundColor, 
            BackgroundTransparency = 0, 
            [v1.Change.AbsoluteSize] = v93.onAbsoluteSizeChanged, 
            ref = v93.dragArea
        }, v97)
    });
end;
return (v2.connect(nil, function(v98)
    return {
        SetOverride = function(v99, v100, v101)
            v98(v13(v99, v100, v101));
        end
    };
end)((l_withContext_0({
    Analytics = l_Analytics_0, 
    Localization = l_Localization_0
})(v16))));
