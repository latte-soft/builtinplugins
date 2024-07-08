local l_script_FirstAncestor_0 = script:FindFirstAncestor("AnimationClipEditor");
local v1 = require(l_script_FirstAncestor_0.Packages.Roact);
local v2 = require(l_script_FirstAncestor_0.Packages.Cryo);
local l_ContextServices_0 = require(l_script_FirstAncestor_0.Packages.Framework).ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local v5 = require(l_script_FirstAncestor_0.Src.Util.TrackUtils);
local v6 = require(l_script_FirstAncestor_0.Src.Util.PathUtils);
local v7 = require(l_script_FirstAncestor_0.Src.Util.Constants);
local v8 = require(l_script_FirstAncestor_0.Src.Util.StringUtils);
local v9 = require(l_script_FirstAncestor_0.Src.Components.ScaleControls.ScaleHandle);
local v10 = require(l_script_FirstAncestor_0.Src.Components.ScaleControls.TimeTag);
local v11 = v1.PureComponent:extend("PureComponent");
local v12 = require(l_script_FirstAncestor_0.LuaFlags.GetFFlagTimelineUnitSeconds);
local v13 = UDim2.new(0, 30, 0, 18);
v11.init = function(v14)
    v14.leftScaleHandleDragStart = function()
        if v14.props.OnScaleHandleDragStart then
            v14.props.OnScaleHandleDragStart(v14.getSelectionData().latestKeyframe);
        end;
    end;
    v14.rightScaleHandleDragStart = function()
        if v14.props.OnScaleHandleDragStart then
            v14.props.OnScaleHandleDragStart(v14.getSelectionData().earliestKeyframe);
        end;
    end;
    v14.getSelectionChannelExtents = function(v15)
        local l_props_0 = v14.props;
        local l_Tracks_0 = l_props_0.Tracks;
        local l_TopTrackIndex_0 = l_props_0.TopTrackIndex;
        local v19 = 1;
        local l_topSelectedChannelIndex_0 = v15.topSelectedChannelIndex;
        local l_bottomSelectedChannelIndex_0 = v15.bottomSelectedChannelIndex;
        local v22 = nil;
        local v23 = nil;
        local l_l_TopTrackIndex_0_0 = l_TopTrackIndex_0;
        while l_l_TopTrackIndex_0_0 <= #l_Tracks_0 do
            local v25 = l_Tracks_0[l_l_TopTrackIndex_0_0];
            local function v26(v27, v28)
                local v29 = l_l_TopTrackIndex_0_0 + v6.getPathValue(v28);
                if l_topSelectedChannelIndex_0 <= v29 and v22 == nil then
                    v22 = v19;
                end;
                if v29 <= l_bottomSelectedChannelIndex_0 then
                    v23 = v19;
                end;
                if not v27.Expanded then
                    v19 = v19 + 1;
                    return ;
                elseif not v14.props.IsChannelAnimation then
                    v19 = v19 + v5.getExpandedSize(v27);
                    return ;
                else
                    v19 = v19 + 1;
                    for _, v31 in ipairs(v7.COMPONENT_TRACK_TYPES[v27.Type]._Order) do
                        local v32 = v27.Components and v27.Components[v31];
                        if v32 then
                            v26(v32, v2.List.join(v28, {
                                v31
                            }));
                        end;
                    end;
                    return ;
                end;
            end;
            v26(v25, {});
            l_l_TopTrackIndex_0_0 = l_l_TopTrackIndex_0_0 + 1;
        end;
        return v22, v23;
    end;
    v14.calculateScaleHandleExtents = function(v33)
        local l_props_1 = v14.props;
        local l_StartTick_0 = l_props_1.StartTick;
        local l_EndTick_0 = l_props_1.EndTick;
        local l_DopeSheetWidth_0 = l_props_1.DopeSheetWidth;
        if not l_props_1.UseFullHeight then
            local v38, v39 = v14.getSelectionChannelExtents(v33);
            if not v38 or not v39 then
                return nil;
            else
                return {
                    top = v7.SUMMARY_TRACK_HEIGHT + (v38 - 1) * v7.TRACK_HEIGHT, 
                    bottom = v7.SUMMARY_TRACK_HEIGHT + v39 * v7.TRACK_HEIGHT, 
                    left = v5.getScaledKeyframePosition(v33.earliestKeyframe, l_StartTick_0, l_EndTick_0, l_DopeSheetWidth_0), 
                    right = v5.getScaledKeyframePosition(v33.latestKeyframe, l_StartTick_0, l_EndTick_0, l_DopeSheetWidth_0)
                };
            end;
        else
            return {
                left = v5.getScaledKeyframePosition(v33.earliestKeyframe, l_StartTick_0, l_EndTick_0, l_DopeSheetWidth_0), 
                right = v5.getScaledKeyframePosition(v33.latestKeyframe, l_StartTick_0, l_EndTick_0, l_DopeSheetWidth_0)
            };
        end;
    end;
    v14.getSelectionData = function()
        local v40 = v14.props.EndTick + 1;
        local v41 = 0;
        local l_SelectedKeyframes_0 = v14.props.SelectedKeyframes;
        local v43 = nil;
        local v44 = nil;
        local function v45(v46, v47, v48)
            if v46.Selection then
                if not v14.props.UseFullHeight then
                    local v49 = v47 + v6.getPathValue(v48);
                    if v43 == nil then
                        v43 = v49;
                        v44 = v49;
                    else
                        v43 = math.min(v43, v49);
                        v44 = math.max(v44, v49);
                    end;
                end;
                local l_pairs_0 = pairs;
                local v51 = v46.Selection or {};
                for v52, _ in l_pairs_0(v51) do
                    v40 = math.min(v40, v52);
                    v41 = math.max(v41, v52);
                end;
            end;
            local l_pairs_1 = pairs;
            local v55 = v46.Components or {};
            for v56, v57 in l_pairs_1(v55) do
                v45(v57, v47, (v2.List.join(v48, {
                    v56
                })));
            end;
        end;
        for _, v59 in pairs(l_SelectedKeyframes_0) do
            for v60, v61 in pairs(v59) do
                if v14.props.UseFullHeight then
                    v45(v61, nil, {});
                else
                    local v62 = v5.getTrackIndex(v14.props.Tracks, v60);
                    if v62 then
                        v45(v61, v62, {});
                    end;
                end;
            end;
        end;
        return {
            earliestKeyframe = v40, 
            latestKeyframe = v41, 
            topSelectedChannelIndex = v43 or nil, 
            bottomSelectedChannelIndex = v44 or nil
        };
    end;
end;
v11.render = function(v63)
    local l_props_2 = v63.props;
    local l_Stylizer_0 = l_props_2.Stylizer;
    local l_ShowSelectionArea_0 = l_props_2.ShowSelectionArea;
    local v67 = if not v12() then l_props_2.ShowAsSeconds else nil;
    local l_TimelineUnit_0 = l_props_2.TimelineUnit;
    local l_Dragging_0 = l_props_2.Dragging;
    local l_FrameRate_0 = l_props_2.FrameRate;
    local l_UseFullHeight_0 = l_props_2.UseFullHeight;
    local l_ZIndex_0 = l_props_2.ZIndex;
    local l_OnScaleHandleDragMoved_0 = l_props_2.OnScaleHandleDragMoved;
    local l_OnScaleHandleDragEnd_0 = l_props_2.OnScaleHandleDragEnd;
    local v75 = v63.getSelectionData();
    local v76 = v63.calculateScaleHandleExtents(v75);
    if v76 then
        local l_earliestKeyframe_0 = v75.earliestKeyframe;
        local l_latestKeyframe_0 = v75.latestKeyframe;
        local v79 = UDim.new(0, (v76.right - v76.left) + 24);
        local v80 = UDim.new(not l_UseFullHeight_0 and 0 or 1, if not l_UseFullHeight_0 then v76.bottom - v76.top else 0);
        local v81 = nil;
        v81 = if not l_UseFullHeight_0 then (v7.SUMMARY_TRACK_HEIGHT - v76.top) + (v7.SUMMARY_TRACK_HEIGHT - 18) / 2 else v7.SUMMARY_TRACK_HEIGHT + (v7.SUMMARY_TRACK_HEIGHT - 18) / 2;
        return v1.createElement("Frame", {
            BackgroundColor3 = l_Stylizer_0.selectionBox, 
            BackgroundTransparency = not l_ShowSelectionArea_0 and 1 or 0.8, 
            Position = UDim2.new(0, (l_props_2.TrackPadding / 2 + v76.left) - 12, 0, if not l_UseFullHeight_0 then v76.top else 0), 
            Size = UDim2.new(v79, v80), 
            ZIndex = l_ZIndex_0
        }, {
            LeftHandle = v1.createElement(v9, {
                Position = UDim2.new(0, -3, 0, 0), 
                Size = UDim2.new(UDim.new(0, 6), v80), 
                ZIndex = l_ZIndex_0, 
                OnScaleHandleDragStart = v63.leftScaleHandleDragStart, 
                OnScaleHandleDragMoved = l_OnScaleHandleDragMoved_0, 
                OnScaleHandleDragEnd = l_OnScaleHandleDragEnd_0
            }), 
            RightHandle = v1.createElement(v9, {
                Position = UDim2.new(1, -3, 0, 0), 
                Size = UDim2.new(UDim.new(0, 6), v80), 
                ZIndex = l_ZIndex_0, 
                OnScaleHandleDragStart = v63.rightScaleHandleDragStart, 
                OnScaleHandleDragMoved = l_OnScaleHandleDragMoved_0, 
                OnScaleHandleDragEnd = l_OnScaleHandleDragEnd_0
            }), 
            LeftTimeTag = l_Dragging_0 and v1.createElement(v10, {
                Position = UDim2.new(0, 0, 0, v81), 
                Size = v13, 
                AnchorPoint = Vector2.new(1, 1), 
                Time = if not v12() then v8.formatTime_DEPRECATED(l_earliestKeyframe_0, l_FrameRate_0, v67) else v8.formatTime(l_earliestKeyframe_0, l_FrameRate_0, l_TimelineUnit_0), 
                ZIndex = l_ZIndex_0
            }), 
            RightTimeTag = l_Dragging_0 and v1.createElement(v10, {
                Position = UDim2.new(1, 0, 0, v81), 
                Size = v13, 
                AnchorPoint = Vector2.new(0, 1), 
                Time = if not v12() then v8.formatTime_DEPRECATED(l_latestKeyframe_0, l_FrameRate_0, v67) else v8.formatTime(l_latestKeyframe_0, l_FrameRate_0, l_TimelineUnit_0), 
                ZIndex = l_ZIndex_0
            })
        });
    else
        return ;
    end;
end;
return (l_withContext_0({
    Stylizer = l_ContextServices_0.Stylizer
})(v11));
