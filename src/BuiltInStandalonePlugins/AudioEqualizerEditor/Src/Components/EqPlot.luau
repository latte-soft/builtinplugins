local l_Parent_0 = script.Parent;
local l_script_FirstAncestor_0 = script:FindFirstAncestor("AudioEqualizerEditor");
local v2 = require(l_script_FirstAncestor_0.Packages.React);
local l_useCallback_0 = v2.useCallback;
local l_useMemo_0 = v2.useMemo;
local l_useRef_0 = v2.useRef;
local l_useState_0 = v2.useState;
local l_Pane_0 = require(l_script_FirstAncestor_0.Packages.Framework).UI.Pane;
local _ = require(l_script_FirstAncestor_0.Src.Types);
local v9 = require(l_Parent_0.ControlPoint);
local _ = require(l_Parent_0.EqAnalyzerCurve);
local v11 = require(l_Parent_0.EqFullCurve);
local v12 = require(l_Parent_0.GridLine);
local v13 = require(l_script_FirstAncestor_0.Src.Util.PlotUtil);
return function(v14)
    local v15 = l_useRef_0(nil);
    local v16 = not v14.EqHook.bypass;
    local v17, v18 = l_useState_0(0);
    local v19, v20 = l_useState_0("");
    local v22 = l_useCallback_0(function(v21)
        v20(v21);
    end, {});
    local v23 = l_useCallback_0(function()
        v20("");
    end, {});
    return v2.createElement(l_Pane_0, {
        Active = true, 
        LayoutOrder = 1, 
        Size = UDim2.new(1, 0, 1, 0), 
        [v2.Tag] = "Contrast X-Clip"
    }, {
        CurveContainer = v2.createElement(l_Pane_0, {
            Active = true, 
            LayoutOrder = 2, 
            Position = UDim2.new(0, 50, 0, 50), 
            Size = UDim2.new(1, -100, 1, -100), 
            BackgroundTransparency = 1, 
            ForwardRef = v15, 
            [v2.Change.AbsoluteSize] = v14.OnSizeChanged
        }, (l_useMemo_0(function()
            local v24 = {
                FullCurve = v2.createElement(v11, {
                    EqHook = v14.EqHook, 
                    Enabled = v16, 
                    PlotAbsoluteSize = v14.PlotAbsoluteSize
                })
            };
            if v16 then
                v24["Control_" .. "L"] = v2.createElement(v9, {
                    Position = Vector2.new(v14.EqHook.lowThreshold, v14.EqHook.lowGain), 
                    Label = "L", 
                    DragTarget = v19, 
                    OnDragStart = v22, 
                    OnMoved = function(v25)
                        v25 = v13.mouseToPlot(v25, v15.current);
                        v14.EqHook.setLowGain(v25.Y);
                        v14.EqHook.setLowThreshold(v25.X);
                        if v14.EqHook.highThreshold < v25.X then
                            v14.EqHook.setHighThreshold(v25.X);
                        end;
                    end, 
                    OnDragEnd = v23
                });
                v24["Control_" .. "M"] = v2.createElement(v9, {
                    Position = Vector2.new(math.sqrt(v14.EqHook.lowThreshold * v14.EqHook.highThreshold), v14.EqHook.midGain), 
                    Label = "M", 
                    DragTarget = v19, 
                    OnDragStart = function(v26)
                        v18((math.sqrt(v14.EqHook.highThreshold / v14.EqHook.lowThreshold)));
                        v22(v26);
                    end, 
                    OnMoved = function(v27)
                        v27 = v13.mouseToPlot(v27, v15.current);
                        v14.EqHook.setMidGain(v27.Y);
                        local v28 = v27.X / v17;
                        local v29 = v27.X * v17;
                        v14.EqHook.setLowThreshold((math.max(v28, v13.X_MIN)));
                        v14.EqHook.setHighThreshold((math.min(v29, v13.X_MAX)));
                    end, 
                    OnDragEnd = v23
                });
                v24["Control_" .. "H"] = v2.createElement(v9, {
                    Position = Vector2.new(v14.EqHook.highThreshold, v14.EqHook.highGain), 
                    Label = "H", 
                    DragTarget = v19, 
                    OnDragStart = v22, 
                    OnMoved = function(v30)
                        v30 = v13.mouseToPlot(v30, v15.current);
                        v14.EqHook.setHighGain(v30.Y);
                        v14.EqHook.setHighThreshold(v30.X);
                        if v30.X < v14.EqHook.lowThreshold then
                            v14.EqHook.setLowThreshold(v30.X);
                        end;
                    end, 
                    OnDragEnd = v23
                });
            end;
            return v24;
        end, {
            v14.EqHook, 
            v14.PlotAbsoluteSize, 
            v15, 
            v19, 
            v22, 
            v23
        }))), 
        GridContainer = v2.createElement(l_Pane_0, {
            Active = true, 
            LayoutOrder = 1, 
            Position = UDim2.new(0, 0, 0, 0), 
            Size = UDim2.new(1, 0, 1, 0), 
            BackgroundTransparency = 1
        }, (l_useMemo_0(function()
            local v31 = {};
            for v32 = 2, 4 do
                for v33 = 1, 9 do
                    local v34 = v33 * 10 ^ v32;
                    if v34 >= v13.X_MIN and v13.X_MAX >= v34 then
                        local v35 = "GridLine_V_" .. v34;
                        local l_createElement_0 = v2.createElement;
                        local l_v12_0 = v12;
                        local v38 = {
                            Position = v34, 
                            PlotAbsoluteSize = v14.PlotAbsoluteSize, 
                            PlotFramePadding = 50, 
                            Orientation = "Vertical"
                        };
                        local v39 = true;
                        if v33 ~= 1 then
                            v39 = true;
                            if v34 ~= v13.X_MIN then
                                v39 = v34 == v13.X_MAX;
                            end;
                        end;
                        v38.IsMinor = not v39;
                        v31[v35] = l_createElement_0(l_v12_0, v38);
                    end;
                end;
            end;
            for _, v41 in {
                -80, 
                -40, 
                -20, 
                -10, 
                0, 
                5, 
                10
            }, nil, nil do
                v31["GridLine_H_" .. v41] = v2.createElement(v12, {
                    Position = v41, 
                    PlotAbsoluteSize = v14.PlotAbsoluteSize, 
                    PlotFramePadding = 50, 
                    Orientation = "Horizontal"
                });
            end;
            return v31;
        end, {
            v14.PlotAbsoluteSize
        })))
    });
end;
