local l_script_FirstAncestor_0 = script:FindFirstAncestor("AnimationClipEditor");
local v1 = require(l_script_FirstAncestor_0.Packages.Roact);
local v2 = require(l_script_FirstAncestor_0.Packages.Cryo);
local v3 = require(l_script_FirstAncestor_0.Src.Components.SummaryTrack);
local v4 = require(l_script_FirstAncestor_0.Src.Components.DopeSheetTrack);
local v5 = require(l_script_FirstAncestor_0.Src.Components.BaseTrack);
local v6 = require(l_script_FirstAncestor_0.Src.Util.TrackUtils);
local v7 = require(l_script_FirstAncestor_0.Src.Util.Constants);
local v8 = v1.PureComponent:extend("DopeSheet");
v8.renderSummaryTrack = function(v9, v10, _, _, v13)
    local l_props_0 = v9.props;
    v10.SummaryTrack = v1.createElement(v3, {
        Tracks = l_props_0.Tracks, 
        SelectedKeyframes = l_props_0.SelectedKeyframes, 
        NamedKeyframes = l_props_0.NamedKeyframes, 
        LayoutOrder = 0, 
        Size = UDim2.new(1, 0, 0, l_props_0.SummaryTrackHeight), 
        Width = l_props_0.ParentSize.X - (l_props_0.Padding or 0), 
        StartTick = l_props_0.StartTick, 
        EndTick = l_props_0.EndTick, 
        ShowCluster = v13, 
        ZIndex = l_props_0.ZIndex, 
        OnKeyActivated = l_props_0.OnKeyActivated, 
        OnKeyRightClick = l_props_0.OnKeyRightClick, 
        OnKeyInputBegan = l_props_0.OnKeyInputBegan, 
        OnKeyInputEnded = l_props_0.OnKeyInputEnded
    });
end;
v8.renderTrackHierarchy = function(v15, v16, v17, v18, v19, v20)
    local l_props_1 = v15.props;
    local l_StartTick_0 = l_props_1.StartTick;
    local l_EndTick_0 = l_props_1.EndTick;
    local l_SelectedKeyframes_0 = l_props_1.SelectedKeyframes;
    local l_TrackHeight_0 = l_props_1.TrackHeight;
    local l_ZIndex_0 = l_props_1.ZIndex;
    local v27 = l_props_1.Padding or 0;
    local l_OnKeyActivated_0 = l_props_1.OnKeyActivated;
    local l_OnKeyRightClick_0 = l_props_1.OnKeyRightClick;
    local l_OnKeyInputBegan_0 = l_props_1.OnKeyInputBegan;
    local l_OnKeyInputEnded_0 = l_props_1.OnKeyInputEnded;
    local v32 = l_props_1.ParentSize.X - v27;
    v20 = v2.List.join(v20 or {}, {
        v17.Name
    });
    local v33 = "Track_" .. table.concat(v20, "_");
    v19 = v19 or 0;
    v16[v33] = v1.createElement(v4, {
        Track = v17, 
        Path = v20, 
        SelectedKeyframes = l_SelectedKeyframes_0, 
        LayoutOrder = v19, 
        Size = UDim2.new(1, 0, 0, l_TrackHeight_0), 
        Width = v32, 
        StartTick = l_StartTick_0, 
        EndTick = l_EndTick_0, 
        ShowCluster = v18, 
        ZIndex = l_ZIndex_0, 
        IsChannelAnimation = true, 
        OnKeyActivated = l_OnKeyActivated_0, 
        OnKeyRightClick = l_OnKeyRightClick_0, 
        OnKeyInputBegan = l_OnKeyInputBegan_0, 
        OnKeyInputEnded = l_OnKeyInputEnded_0
    });
    v19 = v19 + 1;
    if v17.Expanded then
        for _, v35 in ipairs(v7.COMPONENT_TRACK_TYPES[v17.Type]._Order) do
            v19 = v15:renderTrackHierarchy(v16, v17.Components[v35], v18, v19, v20);
        end;
    end;
    return v19;
end;
v8.renderTracks = function(v36, v37, v38, v39, v40)
    local l_props_2 = v36.props;
    local l_StartTick_1 = l_props_2.StartTick;
    local l_EndTick_1 = l_props_2.EndTick;
    local l_Tracks_0 = l_props_2.Tracks;
    local l_SelectedKeyframes_1 = l_props_2.SelectedKeyframes;
    local l_TrackHeight_1 = l_props_2.TrackHeight;
    local l_ZIndex_1 = l_props_2.ZIndex;
    local v48 = l_props_2.Padding or 0;
    local l_IsChannelAnimation_0 = l_props_2.IsChannelAnimation;
    local l_OnKeyActivated_1 = l_props_2.OnKeyActivated;
    local l_OnKeyRightClick_1 = l_props_2.OnKeyRightClick;
    local l_OnKeyInputBegan_1 = l_props_2.OnKeyInputBegan;
    local l_OnKeyInputEnded_1 = l_props_2.OnKeyInputEnded;
    local v54 = l_props_2.ParentSize.X - v48;
    local v55 = 1;
    local function _()
        v55 = v55 + 1;
    end;
    for v57, v58 in ipairs(l_Tracks_0) do
        if v38 <= v57 and v57 <= v39 then
            if not l_IsChannelAnimation_0 then
                v37["Track_" .. v58.Name] = v1.createElement(v4, {
                    Track = v58, 
                    IsChannelAnimation = false, 
                    SelectedKeyframes = l_SelectedKeyframes_1, 
                    LayoutOrder = v55, 
                    Size = UDim2.new(1, 0, 0, l_TrackHeight_1), 
                    Width = v54, 
                    StartTick = l_StartTick_1, 
                    EndTick = l_EndTick_1, 
                    ShowCluster = v40, 
                    ZIndex = l_ZIndex_1, 
                    OnKeyActivated = l_OnKeyActivated_1, 
                    OnKeyRightClick = l_OnKeyRightClick_1, 
                    OnKeyInputBegan = l_OnKeyInputBegan_1, 
                    OnKeyInputEnded = l_OnKeyInputEnded_1
                });
                v55 = v55 + 1;
                if v58.Expanded then
                    for v59 = 1, v6.getExpandedSize(v58) - 1 do
                        v37["Fill_" .. v58.Name .. "_" .. v59] = v1.createElement(v5, {
                            LayoutOrder = v55, 
                            Size = UDim2.new(1, 0, 0, l_TrackHeight_1), 
                            Width = v54, 
                            ZIndex = l_ZIndex_1
                        });
                        v55 = v55 + 1;
                    end;
                end;
            else
                v55 = v36:renderTrackHierarchy(v37, v58, v40, v55);
            end;
        end;
    end;
end;
v8.countKeyframes = function(v60, v61)
    local l_props_3 = v60.props;
    local l_StartTick_2 = l_props_3.StartTick;
    local l_EndTick_2 = l_props_3.EndTick;
    local l_Tracks_1 = l_props_3.Tracks;
    local l_TopTrackIndex_0 = l_props_3.TopTrackIndex;
    local v67 = 0;
    local l_l_TopTrackIndex_0_0 = l_TopTrackIndex_0;
    for v69, v70 in ipairs(l_Tracks_1) do
        local l_Keyframes_0 = v70.Keyframes;
        if ((l_Keyframes_0 and l_TopTrackIndex_0 <= v69) and v69 <= v61) and l_l_TopTrackIndex_0_0 <= v69 then
            v67 = v67 + v6.countVisibleKeyframes(l_Keyframes_0, l_StartTick_2, l_EndTick_2);
            if not l_Tracks_1[v69].Expanded then
                l_l_TopTrackIndex_0_0 = l_l_TopTrackIndex_0_0 + 1;
            else
                l_l_TopTrackIndex_0_0 = l_l_TopTrackIndex_0_0 + v6.getExpandedSize(v70);
            end;
        end;
    end;
    return v67;
end;
v8.render = function(v72)
    local l_props_4 = v72.props;
    local l_TopTrackIndex_1 = l_props_4.TopTrackIndex;
    local l_TrackHeight_2 = l_props_4.TrackHeight;
    local l_SummaryTrackHeight_0 = l_props_4.SummaryTrackHeight;
    local l_LayoutOrder_0 = l_props_4.LayoutOrder;
    local l_Position_0 = l_props_4.Position;
    local l_Size_0 = l_props_4.Size;
    local v80 = (l_TopTrackIndex_1 - 1) + math.ceil((l_props_4.ParentSize.Y - l_SummaryTrackHeight_0) / l_TrackHeight_2);
    local v81 = v7.MAX_VISIBLE_KEYFRAMES < v72:countKeyframes(v80);
    local v82 = {
        Layout = v1.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Vertical, 
            HorizontalAlignment = Enum.HorizontalAlignment.Left, 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            VerticalAlignment = Enum.VerticalAlignment.Top
        })
    };
    v72:renderSummaryTrack(v82, l_TopTrackIndex_1, v80, v81);
    v72:renderTracks(v82, l_TopTrackIndex_1, v80, v81);
    return v1.createElement("Frame", {
        Position = l_Position_0, 
        Size = l_Size_0, 
        BackgroundTransparency = 1, 
        LayoutOrder = l_LayoutOrder_0
    }, v82);
end;
return v8;
