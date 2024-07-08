local l_Parent_0 = script.Parent;
local l_script_FirstAncestor_0 = script:FindFirstAncestor("AttenuationCurveEditor");
local v2 = require(l_script_FirstAncestor_0.Packages.React);
local l_useCallback_0 = v2.useCallback;
local l_useMemo_0 = v2.useMemo;
local l_useState_0 = v2.useState;
local l_useRef_0 = v2.useRef;
local l_Pane_0 = require(l_script_FirstAncestor_0.Packages.Framework).UI.Pane;
local v8 = require(l_script_FirstAncestor_0.Packages.Dash);
local _ = v8.join;
local _ = v8.map;
local v11 = require(l_Parent_0.CurveLine);
local v12 = require(l_Parent_0.GridLine);
local v13 = require(l_Parent_0.Keypoint);
local v14 = require(l_Parent_0.PlotRectUtil);
local _ = require(l_script_FirstAncestor_0.Src.Types);
local function v27(v16, v17)
    local v18 = {};
    local v19 = math.log10(v16.Width) - 0.3010299956639812;
    local v20 = 10 ^ math.floor(v19);
    local v21 = v20 / 10;
    for v22 = v16.Min.X - v16.Min.X % v20, v16.Max.X - v16.Max.X % v20, v20 do
        v18["GridLine_V_" .. v22] = v2.createElement(v12, {
            Position = v22, 
            PlotRect = v16, 
            PlotAbsoluteSize = v17, 
            PlotFramePadding = 50, 
            Orientation = "Vertical"
        });
        local v23 = math.clamp(1 - (v19 - math.floor(v19)) / 0.39794000867203766, 0, 1);
        if v23 > 0 then
            for v24 = 1, 9 do
                local v25 = v22 + v21 * v24;
                v18["GridLine_Inner_V_" .. v25] = v2.createElement(v12, {
                    Position = v25, 
                    PlotRect = v16, 
                    PlotAbsoluteSize = v17, 
                    PlotFramePadding = 50, 
                    Orientation = "Vertical", 
                    InnerAlpha = v23
                });
            end;
        end;
    end;
    for v26 = v16.Min.Y, v16.Max.Y, v16.Height / 5 do
        v18["GridLine_H_" .. v26] = v2.createElement(v12, {
            Position = v26, 
            PlotRect = v16, 
            PlotAbsoluteSize = v17, 
            PlotFramePadding = 50, 
            Orientation = "Horizontal"
        });
    end;
    return v18;
end;
return function(v28)
    local v29 = l_useRef_0(nil);
    local l_PlotAbsoluteSize_0 = v28.PlotAbsoluteSize;
    local l_CurveHook_0 = v28.CurveHook;
    local v32, v33 = l_useState_0(false);
    local v34 = 100;
    if #l_CurveHook_0.keypoints > 0 then
        v34 = math.max(100, l_CurveHook_0.keypoints[#l_CurveHook_0.keypoints].X * 1.1);
    end;
    local v35, v36 = l_useState_0(v34);
    local v37 = l_useMemo_0(function()
        return Rect.new(0, 0, v35, 1);
    end, {
        v35
    });
    local v39 = l_useCallback_0(function(v38)
        if not v32 then
            l_CurveHook_0.select(v38);
            return ;
        else
            return ;
        end;
    end, {
        l_CurveHook_0, 
        v32
    });
    local v40 = l_useCallback_0(function()
        v33(true);
    end, {});
    local v43 = l_useCallback_0(function(v41)
        if v29.current then
            local v42 = v14.mouseCoordsToPlotPosition(v41, v37, v29.current);
            l_CurveHook_0.update(Vector2.new(math.clamp(v42.X, v37.Min.X, v37.Max.X), (math.clamp(v42.Y, v37.Min.Y, v37.Max.Y))), false);
            return ;
        else
            return ;
        end;
    end, {
        v29, 
        v37, 
        l_CurveHook_0
    });
    local v45 = l_useCallback_0(function()
        local v44 = l_CurveHook_0.getSelectedKeypoint();
        if v44 then
            l_CurveHook_0.update(v44, true);
        end;
        v33(false);
        if v28.OnChanged then
            v28.OnChanged();
        end;
    end, {
        v28, 
        l_CurveHook_0
    });
    local v47 = l_useCallback_0(function(v46)
        if v29.current then
            if not (not (v46.UserInputType == Enum.UserInputType.MouseButton1) or not l_CurveHook_0.add((v14.mouseCoordsToPlotPosition(Vector2.new(v46.Position.X, v46.Position.Y), v37, v29.current)))) then
                v33(true);
            end;
            return ;
        else
            return ;
        end;
    end, {
        v29, 
        v37, 
        l_CurveHook_0
    });
    local v48 = l_useCallback_0(function()
        v33(false);
        l_CurveHook_0.remove();
        l_CurveHook_0.select(-1);
        if v28.OnChanged then
            v28.OnChanged();
        end;
    end, {
        v28, 
        l_CurveHook_0
    });
    local v50 = l_useCallback_0(function(v49)
        v36((math.clamp(v35 * 1.15 ^ v49, 1, 4294967296)));
    end, {
        v37
    });
    return v2.createElement(l_Pane_0, {
        Active = true, 
        LayoutOrder = 1, 
        Size = UDim2.new(1, 0, 1, -60), 
        [v2.Tag] = "Contrast X-Clip", 
        [v2.Event.InputChanged] = function(_, v52)
            if v52.UserInputType == Enum.UserInputType.MouseWheel then
                v50(v52.Position.Z);
            end;
        end
    }, {
        CurveContainer = v2.createElement(l_Pane_0, {
            Active = true, 
            LayoutOrder = 2, 
            Position = UDim2.new(0, 50, 0, 50), 
            Size = UDim2.new(1, -100, 1, -100), 
            BackgroundTransparency = 1, 
            ForwardRef = v29, 
            [v2.Change.AbsoluteSize] = v28.OnSizeChanged, 
            [v2.Event.InputBegan] = function(_, v54)
                if v54.UserInputType == Enum.UserInputType.MouseButton1 then
                    v47(v54);
                end;
            end
        }, (l_useMemo_0(function()
            local v55 = {};
            for v56, v57 in l_CurveHook_0.keypoints, nil, nil do
                local v58 = "Keypoint_" .. v56;
                local v59 = v56 == l_CurveHook_0.selectedIndex;
                v55[v58] = v2.createElement(v13, {
                    Position = v57, 
                    PlotRect = v37, 
                    Selected = v59, 
                    IsDragging = v32 and v59, 
                    OnHoverStart = function()
                        v39(v56);
                    end, 
                    OnDragStart = v40, 
                    OnMoved = v43, 
                    OnDragEnd = v45, 
                    OnRightClick = v48
                });
            end;
            for v60 = 1, #l_CurveHook_0.keypoints - 1 do
                v55["CurveLine_" .. v60 .. "_" .. v60 + 1] = v2.createElement(v11, {
                    StartPoint = l_CurveHook_0.keypoints[v60], 
                    EndPoint = l_CurveHook_0.keypoints[v60 + 1], 
                    PlotRect = v37, 
                    PlotAbsoluteSize = l_PlotAbsoluteSize_0, 
                    StartPointSelected = l_CurveHook_0.selectedIndex == v60, 
                    EndPointSelected = l_CurveHook_0.selectedIndex == v60 + 1
                });
            end;
            if #l_CurveHook_0.keypoints >= 1 then
                v55.EndLine_1 = v2.createElement(v11, {
                    StartPoint = l_CurveHook_0.keypoints[1], 
                    EndPoint = Vector2.new(v37.Min.X, l_CurveHook_0.keypoints[1].Y), 
                    PlotRect = v37, 
                    PlotAbsoluteSize = l_PlotAbsoluteSize_0, 
                    IsEndLine = true
                });
                v55.EndLine_2 = v2.createElement(v11, {
                    StartPoint = l_CurveHook_0.keypoints[#l_CurveHook_0.keypoints], 
                    EndPoint = Vector2.new(v37.Max.X, l_CurveHook_0.keypoints[#l_CurveHook_0.keypoints].Y), 
                    PlotRect = v37, 
                    PlotAbsoluteSize = l_PlotAbsoluteSize_0, 
                    IsEndLine = true
                });
            end;
            return v55;
        end, {
            l_CurveHook_0, 
            v37, 
            v28.PlotAbsoluteSize, 
            v32
        }))), 
        GridLineContainer = v2.createElement(l_Pane_0, {
            Active = true, 
            LayoutOrder = 1, 
            Position = UDim2.new(0, 0, 0, 0), 
            Size = UDim2.new(1, 0, 1, 0), 
            BackgroundTransparency = 1
        }, (l_useMemo_0(function()
            return (v27(v37, l_PlotAbsoluteSize_0));
        end, {
            v28.PlotAbsoluteSize, 
            v37
        })))
    });
end;
