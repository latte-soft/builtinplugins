local l_script_FirstAncestor_0 = script:FindFirstAncestor("AnimationClipEditor");
local v1 = require(l_script_FirstAncestor_0.Packages.Roact);
local l_ContextServices_0 = require(l_script_FirstAncestor_0.Packages.Framework).ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local v4 = require(l_script_FirstAncestor_0.Src.Util.Constants);
local v5 = require(l_script_FirstAncestor_0.Src.Util.KeyframeUtils);
local v6 = require(l_script_FirstAncestor_0.Src.Components.Curves.Line);
local v7 = require(l_script_FirstAncestor_0.Src.Components.Curves.Cubic);
local v8 = require(l_script_FirstAncestor_0.Src.Components.Curves.Keyframe);
local v9 = require(l_script_FirstAncestor_0.Src.Components.Curves.TangentControl);
local v10 = v1.PureComponent:extend("CurveCanvas");
v10.init = function(v11)
    v11.children = {};
end;
v10.renderXAxis = function(v12)
    table.insert(v12.children, v1.createElement("Frame", {
        Size = UDim2.new(1, 0, 0, 1), 
        Position = UDim2.new(0, 0, 0, v12:toCanvasSpace(Vector2.new()).Y), 
        BackgroundColor3 = v12.props.Stylizer.curveTheme.xAxis, 
        BorderSizePixel = 0
    }));
end;
v10.toCanvasSpace = function(v13, v14)
    local l_props_0 = v13.props;
    local l_MinValue_0 = l_props_0.MinValue;
    local l_MaxValue_0 = l_props_0.MaxValue;
    local l_VerticalScroll_0 = l_props_0.VerticalScroll;
    local v19 = math.min(l_props_0.VerticalZoom, 0.99);
    return Vector2.new(((v14.X - l_props_0.StartTick) * l_props_0.AbsoluteSize.X) / (l_props_0.EndTick - l_props_0.StartTick), l_props_0.AbsoluteSize.Y * v4.CURVE_CANVAS_PADDING + ((((l_MaxValue_0 - v14.Y) / (l_MaxValue_0 - l_MinValue_0) - l_VerticalScroll_0 * v19) * (1 / (1 - v19))) * l_props_0.AbsoluteSize.Y) * (1 - 2 * v4.CURVE_CANVAS_PADDING));
end;
v10.scaleSlope = function(v20, v21)
    local l_props_1 = v20.props;
    return (v21 * ((l_props_1.EndTick - l_props_1.StartTick) / l_props_1.AbsoluteSize.X)) / (((l_props_1.MinValue - l_props_1.MaxValue) * (1 - math.min(l_props_1.VerticalZoom, 0.99))) / (l_props_1.AbsoluteSize.Y * (1 - 2 * v4.CURVE_CANVAS_PADDING)));
end;
v10.renderCurve = function(v23, v24)
    local l_props_2 = v23.props;
    local l_Stylizer_0 = l_props_2.Stylizer;
    if v24.Keyframes then
        local v27 = v24.Path[#v24.Path];
        local v28 = table.concat(v24.Path, "_");
        local v29 = l_Stylizer_0.curveTheme[not not v4.TRACK_THEME_MAPPING[v24.Type] and v4.TRACK_THEME_MAPPING[v24.Type][v27] or "Default"];
        local v30 = nil;
        local v31 = nil;
        local v32 = nil;
        local v33 = nil;
        local v34 = nil;
        local v35 = nil;
        local v36 = l_props_2.AbsoluteSize.Y * v4.TANGENT_CONTROL_LENGTH;
        local l_SelectedKeyframes_0 = l_props_2.SelectedKeyframes;
        local l_ShowTooltips_0 = l_props_2.ShowTooltips;
        local l_Playhead_0 = v23.props.Playhead;
        local v40 = v5.getValue(v24, l_Playhead_0);
        if v24.Type == v4.TRACK_TYPES.Facs then
            v40 = math.clamp(v40, 0, 1);
        end;
        v23.children[string.format("%s_Scrubber", v28)] = v1.createElement(v8, {
            Position = v23:toCanvasSpace(Vector2.new(l_Playhead_0, v40)), 
            TrackName = "", 
            InterpolationMode = Enum.KeyInterpolationMode.Linear, 
            LeftSlope = nil, 
            LeftAuto = false, 
            RightSlope = nil, 
            RightAuto = false, 
            Color = l_Stylizer_0.scrubberTheme.backgroundColor, 
            ShowSlopes = false, 
            Width = v4.SCRUBBER_MARKER_WIDTH
        });
        local v41 = l_SelectedKeyframes_0[v24.Instance];
        for _, v43 in ipairs(v24.Path) do
            if v41 then
                v41 = not not v41.Components and v41.Components[v43] or v41[v43];
            else
                break;
            end;
        end;
        local v44 = nil;
        local v45 = nil;
        if v24.Type == v4.TRACK_TYPES.Facs then
            v44 = v23:toCanvasSpace(Vector2.new(0, 1)).Y;
            v45 = v23:toCanvasSpace(Vector2.new(0, 0)).Y;
        end;
        for v46, v47 in ipairs(v24.Keyframes) do
            local v48 = v24.Data[v47];
            if v48 ~= nil then
                local v49 = (v41 and v41.Selection) and v41.Selection[v47];
                if v24.Type == v4.TRACK_TYPES.Quaternion then
                    v30 = v23:toCanvasSpace(Vector2.new(v47, 1));
                    v31 = v23:toCanvasSpace(Vector2.new(v47, 0));
                else
                    v30 = v23:toCanvasSpace(Vector2.new(v47, v48.Value));
                end;
                local v50 = v35 or (v49 and v34) and v34.InterpolationMode ~= Enum.KeyInterpolationMode.Constant;
                local v51 = not not v50 and l_Stylizer_0.curveTheme.selected or v29;
                local v52 = string.format("%s_Curve_%d", v28, v46);
                if l_props_2.StartTick <= v47 and (not v33 or v33 <= l_props_2.EndTick) then
                    if not (not v34 or not v32) then
                        if v34.InterpolationMode == Enum.KeyInterpolationMode.Constant then
                            v23.children[v52] = v1.createElement(v6, {
                                A = v32, 
                                B = Vector2.new(v30.X, v32.Y), 
                                Color = v51, 
                                Width = if not v50 then v4.CURVE_WIDTH else v4.CURVE_WIDTH_SELECTED, 
                                ZIndex = 2
                            });
                        elseif v34.InterpolationMode == Enum.KeyInterpolationMode.Linear then
                            v23.children[v52] = v1.createElement(v6, {
                                A = v32, 
                                B = v30, 
                                Color = v51, 
                                Width = if not v50 then v4.CURVE_WIDTH else v4.CURVE_WIDTH_SELECTED, 
                                ZIndex = 2
                            });
                        else
                            local _, v54 = v5.getSlopes(v24, v33);
                            local v55, _ = v5.getSlopes(v24, v47);
                            if v54 then
                                v54 = v23:scaleSlope(v54);
                            end;
                            if v55 then
                                v55 = v23:scaleSlope(v55);
                            end;
                            v23.children[v52] = v1.createElement(v7, {
                                A = v32, 
                                ASlope = v54, 
                                B = v30, 
                                BSlope = v55, 
                                Color = v51, 
                                Width = if not v50 then v4.CURVE_WIDTH else v4.CURVE_WIDTH_SELECTED, 
                                FrameWidth = l_props_2.AbsoluteSize.X, 
                                ZIndex = 2, 
                                MinClamp = v44, 
                                MaxClamp = v45
                            });
                        end;
                    end;
                    local v57 = string.format("%s_Keyframe_%d", v28, v46);
                    if not (v24.Type == v4.TRACK_TYPES.Quaternion) or v46 > 1 then
                        v23.children[v57] = v1.createElement(v8, {
                            Position = v30, 
                            Path = v24.Path, 
                            InterpolationMode = v48.InterpolationMode, 
                            PrevInterpolationMode = if not v34 then nil else v34.InterpolationMode, 
                            LeftSlope = if v46 == 1 then nil else v48.LeftSlope, 
                            RightSlope = if v46 == #v24.Keyframes then nil else v48.RightSlope, 
                            Color = v29, 
                            ShowSlopes = false, 
                            ShowTooltip = l_ShowTooltips_0, 
                            Selected = v49, 
                            ZIndex = 4, 
                            OnRightClick = if not l_props_2.OnKeyRightClick then nil else function(_, _)
                                l_props_2.OnKeyRightClick(v24.Instance, v24.Path, v47, v49);
                            end, 
                            OnInputBegan = if not l_props_2.OnKeyInputBegan then nil else function(_, v61)
                                l_props_2.OnKeyInputBegan(v24.Instance, v24.Path, v47, v49, v61);
                            end, 
                            OnInputEnded = if not l_props_2.OnKeyInputEnded then nil else function(_, v63)
                                l_props_2.OnKeyInputEnded(v47, v48.Value, v49, v63);
                            end
                        });
                    end;
                    if v46 < #v24.Keyframes and v24.Type == v4.TRACK_TYPES.Quaternion then
                        v23.children[v57 .. "b"] = v1.createElement(v8, {
                            Position = v31, 
                            Path = v24.Path, 
                            InterpolationMode = v48.InterpolationMode, 
                            PrevInterpolationMode = if not v34 then nil else v34.InterpolationMode, 
                            LeftSlope = if v46 == 1 then nil else v48.LeftSlope, 
                            RightSlope = if v46 == #v24.Keyframes then nil else v48.RightSlope, 
                            Color = v29, 
                            ShowSlopes = false, 
                            ShowTooltip = l_ShowTooltips_0, 
                            Selected = v49, 
                            ZIndex = 4, 
                            OnRightClick = if not l_props_2.OnKeyRightClick then nil else function(_, _)
                                l_props_2.OnKeyRightClick(v24.Instance, v24.Path, v47, v49);
                            end, 
                            OnInputBegan = if not l_props_2.OnKeyInputBegan then nil else function(_, v67)
                                l_props_2.OnKeyInputBegan(v24.Instance, v24.Path, v47, v49, v67);
                            end, 
                            OnInputEnded = if not l_props_2.OnKeyInputEnded then nil else function(_, v69)
                                l_props_2.OnKeyInputEnded(v47, v48.Value, v49, v69);
                            end
                        });
                    end;
                    if v49 then
                        if v46 > 1 then
                            local v70 = v23:scaleSlope(v5.getSlope(v24, v47, v4.SLOPES.Left));
                            local v71 = string.format("%s_LeftTangent_%d", v28, v46);
                            local l_children_0 = v23.children;
                            local l_createElement_0 = v1.createElement;
                            local l_v9_0 = v9;
                            local v75 = {
                                Position = UDim2.new(0, v30.X, 0, v30.Y), 
                                Slope = v70
                            };
                            local v76;
                            if v34 then
                                v76 = true;
                                if not (v34.InterpolationMode == Enum.KeyInterpolationMode.Cubic) then
                                    goto label0;
                                end;
                            end;
                            v76 = v48.LeftSlope == nil;
                            ::label0::;
                            v75.Auto = v76;
                            v75.Length = v36;
                            v75.Side = v4.SLOPES.Left;
                            v75.ZIndex = 3;
                            v75.OnRightClick = if not l_props_2.OnTangentRightClick then nil else function(_, _)
                                l_props_2.OnTangentRightClick(v24.Instance, v24.Path, v47, v4.SLOPES.Left);
                            end;
                            v75.OnInputBegan = function(_, v80)
                                l_props_2.OnTangentInputBegan(v80);
                            end;
                            v75.OnInputEnded = function(_, v82)
                                l_props_2.OnTangentInputEnded(v24.Instance, v24.Path, v47, v4.SLOPES.Left, v82);
                            end;
                            l_children_0[v71] = l_createElement_0(l_v9_0, v75);
                        end;
                        if v46 < #v24.Keyframes then
                            local v83 = v23:scaleSlope(v5.getSlope(v24, v47, v4.SLOPES.Right));
                            local v84 = nil;
                            v84 = if v24.Type == v4.TRACK_TYPES.Quaternion then UDim2.new(0, v31.X, 0, v31.Y) else UDim2.new(0, v30.X, 0, v30.Y);
                            local v85 = string.format("%s_RightTangent_%d", v28, v46);
                            local l_children_1 = v23.children;
                            local l_createElement_1 = v1.createElement;
                            local l_v9_1 = v9;
                            local v89 = {
                                Position = v84, 
                                Slope = v83
                            };
                            local v90 = true;
                            if v48.InterpolationMode == Enum.KeyInterpolationMode.Cubic then
                                v90 = v48.RightSlope == nil;
                            end;
                            v89.Auto = v90;
                            v89.Length = v36;
                            v89.Side = v4.SLOPES.Right;
                            v89.ZIndex = 3;
                            v89.OnRightClick = if not l_props_2.OnTangentRightClick then nil else function(_, _)
                                l_props_2.OnTangentRightClick(v24.Instance, v24.Path, v47, v4.SLOPES.Right);
                            end;
                            v89.OnInputBegan = function(_, v94)
                                l_props_2.OnTangentInputBegan(v94);
                            end;
                            v89.OnInputEnded = function(_, v96)
                                l_props_2.OnTangentInputEnded(v24.Instance, v24.Path, v47, v4.SLOPES.Right, v96);
                            end;
                            l_children_1[v85] = l_createElement_1(l_v9_1, v89);
                        end;
                    end;
                end;
                v32 = if v24.Type == v4.TRACK_TYPES.Quaternion then v31 else v30;
                v33 = v47;
                v34 = v48;
                v35 = v49;
            end;
        end;
        return ;
    else
        return ;
    end;
end;
v10.render = function(v97)
    local l_props_3 = v97.props;
    local l_LayoutOrder_0 = l_props_3.LayoutOrder;
    local l_Position_0 = l_props_3.Position;
    local l_Size_0 = l_props_3.Size;
    local l_Tracks_0 = l_props_3.Tracks;
    v97.children = {};
    v97:renderXAxis();
    for _, v104 in ipairs(l_Tracks_0) do
        v97:renderCurve(v104);
    end;
    return v1.createElement("Frame", {
        Position = l_Position_0, 
        Size = l_Size_0, 
        BackgroundTransparency = 1, 
        LayoutOrder = l_LayoutOrder_0
    }, v97.children);
end;
return (l_withContext_0({
    Stylizer = l_ContextServices_0.Stylizer
})(v10));
