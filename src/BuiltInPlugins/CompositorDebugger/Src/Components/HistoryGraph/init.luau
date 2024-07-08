local l_script_FirstAncestor_0 = script:FindFirstAncestor("CompositorDebugger");
local v1 = require(l_script_FirstAncestor_0.Packages.React);
local _ = require(l_script_FirstAncestor_0.Packages.RoactRodux);
local v3 = require(l_script_FirstAncestor_0.Packages.Framework);
local l_ContextServices_0 = v3.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_Analytics_0 = l_ContextServices_0.Analytics;
local l_Localization_0 = l_ContextServices_0.Localization;
local l_Stylizer_0 = v3.Style.Stylizer;
local _ = v3.Dash.join;
local l_UI_0 = v3.UI;
local _ = l_UI_0.Button;
local l_Pane_0 = l_UI_0.Pane;
local l_TextLabel_0 = l_UI_0.TextLabel;
local _ = l_script_FirstAncestor_0.Src.Actions;
local _ = l_script_FirstAncestor_0.Src.Components;
local _ = require(l_script_FirstAncestor_0.Src.Types);
local l_Util_0 = l_script_FirstAncestor_0.Src.Util;
local v18 = require(l_Util_0.Constants);
local v19 = require(l_Util_0.findInterval);
local _ = require(l_Util_0.getSafeName);
local v21 = require(script.Line);
local v22 = v1.PureComponent:extend("HistoryGraph");
local function v29(v23)
    local v24 = "";
    local l_ipairs_0 = ipairs;
    local v26 = v23 or {};
    for v27, v28 in l_ipairs_0(v26) do
        if type(v28) == "number" then
            v24 = v24 .. "[" .. tostring(v28) .. "]";
        else
            if v27 > 1 then
                v24 = v24 .. ".";
            end;
            v24 = v24 .. tostring(v28);
        end;
    end;
    return v24;
end;
v22.init = function(v30)
    v30.state = {
        min = math.huge, 
        max = -math.huge, 
        size = nil, 
        frameBufferSize = 0, 
        timespan = 0
    };
    v30.onCanvasAbsoluteSizeChanged = function(v31)
        local l_AbsoluteSize_0 = v31.AbsoluteSize;
        if not v30.state.size or l_AbsoluteSize_0 ~= v30.state.size then
            v30:setState({
                size = l_AbsoluteSize_0
            });
        end;
    end;
end;
local _ = function(v33, v34)
    local l_v33_0 = v33;
    for _, v37 in v34, nil, nil do
        if not l_v33_0 then
            l_v33_0 = nil;
        else
            l_v33_0 = l_v33_0[v37];
        end;
    end;
    return l_v33_0;
end;
v22.getFrameInfo = function(v39, v40)
    local l_props_0 = v39.props;
    local _ = v39.state;
    local l_HistoryField_0 = l_props_0.HistoryField;
    local v44 = l_props_0.FrameBuffer and l_props_0.FrameBuffer[v40];
    local v45 = (v44 and v44.layerMap) and v44.layerMap[l_HistoryField_0.id];
    local v46 = v45 and v45[l_HistoryField_0.section];
    local l_v46_0 = v46;
    if l_v46_0 then
        local l_field_0 = l_HistoryField_0.field;
        local l_v46_1 = v46;
        for _, v51 in l_field_0, nil, nil do
            if not l_v46_1 then
                l_v46_1 = nil;
            else
                l_v46_1 = l_v46_1[v51];
            end;
        end;
        l_v46_0 = l_v46_1;
    end;
    if l_v46_0 then
        local v52 = typeof(l_v46_0);
        local v53 = {};
        local v54 = {};
        if v52 == "number" then
            v53 = {
                l_v46_0
            };
        elseif v52 == "Vector2" then
            v53 = {
                l_v46_0.X, 
                l_v46_0.Y
            };
            v54 = {
                "X", 
                "Y"
            };
        elseif v52 == "Vector3" then
            v53 = {
                l_v46_0.X, 
                l_v46_0.Y, 
                l_v46_0.Z
            };
            v54 = {
                "X", 
                "Y", 
                "Z"
            };
        end;
        return v53, v54, v44.timestamp, v52;
    else
        return nil, {}, 0, nil;
    end;
end;
v22.calculateExtents = function(v55, v56)
    local _ = v55.props;
    local l_state_1 = v55.state;
    local v59 = nil;
    local v60 = nil;
    if not v56 then
        v59 = l_state_1.min;
        v60 = l_state_1.max;
    else
        v59 = math.huge;
        v60 = -math.huge;
    end;
    for v61 = 1, l_state_1.frameBufferSize do
        local v62 = v55:getFrameInfo(v61);
        if v62 ~= nil then
            for _, v64 in v62, nil, nil do
                v59 = math.min(v59, v64);
                v60 = math.max(v60, v64);
            end;
        end;
    end;
    if v59 == v60 then
        v59 = v59 - 0.5;
        v60 = v60 + 0.5;
    end;
    if not (v59 == l_state_1.min) or v60 ~= l_state_1.max then
        v55:setState({
            min = v59, 
            max = v60
        });
    end;
end;
v22.didMount = function(v65)
    v65:calculateExtents(true);
end;
v22.didUpdate = function(v66, v67, _)
    if v66.props.HistoryField ~= v67.HistoryField then
        v66:calculateExtents(true);
        return ;
    else
        if v66.props.FrameBuffer ~= v67.FrameBuffer then
            v66:calculateExtents(false);
        end;
        return ;
    end;
end;
v22.getDerivedStateFromProps = function(v69, v70)
    local v71 = v69.FrameBuffer:getSize();
    if v71 ~= v70.frameBufferSize then
        return {
            frameBufferSize = v71, 
            timespan = v71 / v18.FRAMERATE
        };
    else
        return ;
    end;
end;
v22.getLastTimestamp = function(v72)
    local l_FrameBuffer_0 = v72.props.FrameBuffer;
    return (not not l_FrameBuffer_0 and l_FrameBuffer_0.last) and l_FrameBuffer_0.last.timestamp or 0;
end;
v22.getRulers = function(v74)
    local l_props_2 = v74.props;
    local l_state_2 = v74.state;
    local l_Stylizer_1 = l_props_2.Stylizer;
    local l_MaxTicks_0 = l_Stylizer_1.Grid.MaxTicks;
    local l_Intervals_0 = l_Stylizer_1.Grid.Intervals;
    local l_timespan_0 = l_state_2.timespan;
    local _ = v74:getLastTimestamp();
    local v82 = {};
    local v83 = {};
    for v84 = 1, l_timespan_0 - 1 do
        v82["time" .. tostring(v84)] = v1.createElement(l_Pane_0, {
            Size = UDim2.new(0, 1, 1, 0), 
            Position = UDim2.fromScale(v84 / l_timespan_0, 0), 
            AnchorPoint = Vector2.new(0.5, 0), 
            BorderSizePixel = 0, 
            BackgroundColor = l_Stylizer_1.Grid.GridColor, 
            BackgroundTransparency = 0, 
            ZIndex = 2
        });
    end;
    if l_state_2.min ~= math.huge then
        local v85 = l_state_2.max - l_state_2.min;
        local v86 = l_state_2.min - l_Stylizer_1.Grid.Margin * v85;
        local v87 = l_state_2.max + l_Stylizer_1.Grid.Margin * v85;
        local v88 = v19(v85, l_MaxTicks_0, l_Intervals_0);
        local v89 = math.floor(v86 / v88) * v88;
        local v90 = math.ceil(v87 / v88) * v88;
        local v91 = 1;
        for v92 = v89, v90, v88 do
            local v93 = (1 - l_Stylizer_1.Grid.Margin) - ((1 - l_Stylizer_1.Grid.Margin * 2) * (v92 - l_state_2.min)) / v85;
            if v93 >= 0 and v93 <= 1 then
                v82["ruler" .. tostring(v91)] = v1.createElement(l_Pane_0, {
                    AnchorPoint = Vector2.new(0, 0.5), 
                    Size = UDim2.new(1, 0, 0, 1), 
                    Position = UDim2.fromScale(0, v93), 
                    BorderSizePixel = 0, 
                    BackgroundColor = if v92 == 0 then l_Stylizer_1.Grid.AxisColor else l_Stylizer_1.Grid.GridColor, 
                    BackgroundTransparency = 0, 
                    ZIndex = 2
                });
                v83["label" .. tostring(v91)] = v1.createElement(l_TextLabel_0, {
                    AnchorPoint = Vector2.new(0, 0.5), 
                    Text = tostring(v92), 
                    TextXAlignment = Enum.TextXAlignment.Left, 
                    TextYAlignment = Enum.TextYAlignment.Center, 
                    Position = UDim2.new(0, 3, v93, 0), 
                    Size = UDim2.fromScale(1, 1), 
                    ZIndex = 2
                });
                v91 = v91 + 1;
            end;
        end;
    end;
    return v82, v83;
end;
v22.makePos = function(v94, v95, v96)
    local l_props_3 = v94.props;
    local l_state_3 = v94.state;
    local l_Stylizer_2 = l_props_3.Stylizer;
    local l_min_0 = l_state_3.min;
    local l_max_0 = l_state_3.max;
    local l_size_0 = l_state_3.size;
    return Vector2.new(l_size_0.X * (v95 / l_state_3.frameBufferSize), l_size_0.Y * ((1 - l_Stylizer_2.Grid.Margin) - ((1 - l_Stylizer_2.Grid.Margin * 2) * (v96 - l_min_0)) / (l_max_0 - l_min_0)));
end;
v22.getHistoryGraph = function(v103)
    local l_props_4 = v103.props;
    local l_state_4 = v103.state;
    local l_Stylizer_3 = l_props_4.Stylizer;
    local v107 = {};
    local l_min_1 = l_state_4.min;
    local l_max_1 = l_state_4.max;
    local l_size_1 = l_state_4.size;
    if l_size_1 and l_min_1 ~= math.huge then
        local l_timespan_1 = l_state_4.timespan;
        local v112 = v103:getLastTimestamp();
        local v113 = {};
        local v114 = 0;
        local v115 = v112 - l_timespan_1;
        local function _(v116, v117)
            return Vector2.new(l_size_1.X * (1 + (v116 - v112) / l_timespan_1), l_size_1.Y * ((1 - l_Stylizer_3.Grid.Margin) - ((1 - l_Stylizer_3.Grid.Margin * 2) * (v117 - l_min_1)) / (l_max_1 - l_min_1)));
        end;
        for v119 = 1, l_state_4.frameBufferSize do
            local v120, _, v122, v123 = v103:getFrameInfo(v119);
            if not ((not (v122 and v115 < v122) or not v120) or not v113) then
                for v124, v125 in v120, nil, nil do
                    local v126 = v113[v124];
                    if v126 then
                        v107["line" .. tostring(v119) .. "-" .. tostring(v124)] = v1.createElement(v21, {
                            A = Vector2.new(l_size_1.X * (1 + (v114 - v112) / l_timespan_1), l_size_1.Y * ((1 - l_Stylizer_3.Grid.Margin) - ((1 - l_Stylizer_3.Grid.Margin * 2) * (v126 - l_min_1)) / (l_max_1 - l_min_1))), 
                            B = Vector2.new(l_size_1.X * (1 + (v122 - v112) / l_timespan_1), l_size_1.Y * ((1 - l_Stylizer_3.Grid.Margin) - ((1 - l_Stylizer_3.Grid.Margin * 2) * (v125 - l_min_1)) / (l_max_1 - l_min_1))), 
                            Color = l_Stylizer_3.GraphColors[v123][v124], 
                            Width = 2, 
                            ZIndex = 3 + v124
                        });
                    end;
                end;
            end;
            v113 = v120;
            v114 = v122;
        end;
    end;
    if not next(v107) then
        return nil;
    else
        return v107;
    end;
end;
v22.getLegendBar = function(v127)
    local l_Stylizer_4 = v127.props.Stylizer;
    local _, v130, _, v132 = v127:getFrameInfo(1);
    if #v130 <= 1 then
        return nil;
    else
        local v133 = {};
        for v134, v135 in v130, nil, nil do
            v133[v135] = v1.createElement(l_Pane_0, {
                Size = UDim2.fromScale(1 / #v130, 1), 
                LayoutOrder = v134
            }, {
                v1.createElement(l_TextLabel_0, {
                    Text = v135, 
                    TextColor = l_Stylizer_4.GraphColors[v132][v134]
                })
            });
        end;
        return v133;
    end;
end;
v22.render = function(v136)
    local _ = v136.state;
    local l_props_5 = v136.props;
    local l_Localization_1 = l_props_5.Localization;
    local l_Stylizer_5 = l_props_5.Stylizer;
    local v141 = v29(l_props_5.HistoryField.field);
    local v142 = v136:getHistoryGraph();
    local v143, v144 = v136:getRulers();
    local v145 = v136:getLegendBar();
    return v1.createElement(l_Pane_0, {
        Size = l_props_5.Size, 
        Position = l_props_5.Position, 
        Padding = {
            Left = l_Stylizer_5.Padding, 
            Right = l_Stylizer_5.Padding
        }
    }, {
        Title = v1.createElement(l_Pane_0, {
            Size = UDim2.new(1, -l_Stylizer_5.ScaleWidth, 0, l_Stylizer_5.FieldNameHeight)
        }, {
            FieldName = v1.createElement(l_TextLabel_0, {
                AnchorPoint = Vector2.new(0.5, 0.5), 
                AutomaticSize = Enum.AutomaticSize.X, 
                Position = UDim2.fromScale(0.5, 0.5), 
                TextXAlignment = Enum.TextXAlignment.Center, 
                TextYAlignment = Enum.TextYAlignment.Center, 
                Text = v141
            })
        }), 
        Graph = v1.createElement(l_Pane_0, {
            Size = UDim2.new(1, 0, 1, -(l_Stylizer_5.LegendHeight + l_Stylizer_5.FieldNameHeight)), 
            Position = UDim2.fromOffset(0, l_Stylizer_5.FieldNameHeight)
        }, {
            Border = v1.createElement(l_Pane_0, {
                Size = UDim2.new(1, -l_Stylizer_5.ScaleWidth, 1, 0), 
                BorderColor3 = l_Stylizer_5.BorderColor, 
                BorderSizePixel = 1, 
                BackgroundColor3 = l_Stylizer_5.BackgroundColor, 
                BackgroundTransparency = 0, 
                ZIndex = 1
            }), 
            Rulers = if v142 ~= nil then v1.createElement(l_Pane_0, {
                Size = UDim2.new(1, -l_Stylizer_5.ScaleWidth - 1, 1, -2), 
                Position = UDim2.fromOffset(1, 1), 
                ClipsDescendants = true, 
                BackgroundTransparency = 1, 
                ZIndex = 2
            }, v143) else nil, 
            Scale = if v142 ~= nil then v1.createElement(l_Pane_0, {
                Size = UDim2.new(0, l_Stylizer_5.ScaleWidth, 1, -2), 
                Position = UDim2.new(1, -l_Stylizer_5.ScaleWidth + 2, 0, 1), 
                BackgroundTransparency = 1, 
                ZIndex = 3
            }, v144) else nil, 
            Canvas = v1.createElement(l_Pane_0, {
                Size = UDim2.new(1, -l_Stylizer_5.ScaleWidth - 1, 1, -2), 
                Position = UDim2.fromOffset(1, 1), 
                BackgroundTransparency = 1, 
                ZIndex = 4, 
                [v1.Change.AbsoluteSize] = v136.onCanvasAbsoluteSizeChanged
            }, v142 or {
                NoHistoryData = v1.createElement(l_TextLabel_0, {
                    AnchorPoint = Vector2.new(0.5, 0.5), 
                    Position = UDim2.fromScale(0.5, 0.5), 
                    TextXAlignment = Enum.TextXAlignment.Center, 
                    TextYAlignment = Enum.TextYAlignment.Center, 
                    Text = l_Localization_1:getText("History", "NoHistoryData")
                })
            })
        }), 
        LegendBar = if not v145 then nil else v1.createElement(l_Pane_0, {
            AnchorPoint = Vector2.new(0, 1), 
            Size = UDim2.new(1, -l_Stylizer_5.ScaleWidth, 0, l_Stylizer_5.LegendHeight), 
            Position = UDim2.fromScale(0, 1), 
            Layout = Enum.FillDirection.Horizontal
        }, v145)
    });
end;
return (l_withContext_0({
    Analytics = l_Analytics_0, 
    Localization = l_Localization_0, 
    Stylizer = l_Stylizer_0
})(v22));
