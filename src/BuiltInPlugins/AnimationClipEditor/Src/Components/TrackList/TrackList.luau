local l_script_FirstAncestor_0 = script:FindFirstAncestor("AnimationClipEditor");
local v1 = require(l_script_FirstAncestor_0.Packages.Roact);
local v2 = require(l_script_FirstAncestor_0.Packages.Cryo);
local v3 = require(l_script_FirstAncestor_0.Packages.RoactRodux);
local v4 = require(l_script_FirstAncestor_0.Src.Util.TrackUtils);
local v5 = require(l_script_FirstAncestor_0.Src.Util.StringUtils);
local v6 = require(l_script_FirstAncestor_0.Src.Context.Signals);
local l_ContextServices_0 = require(l_script_FirstAncestor_0.Packages.Framework).ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local v9 = require(l_script_FirstAncestor_0.Src.Util.Constants);
local v10 = require(l_script_FirstAncestor_0.Src.Util.isEmpty);
local v11 = require(l_script_FirstAncestor_0.Src.Util.PathUtils);
local v12 = require(l_script_FirstAncestor_0.Src.Components.TrackList.SummaryTrack);
local v13 = require(l_script_FirstAncestor_0.Src.Components.TrackList.TrackListEntry);
local v14 = require(l_script_FirstAncestor_0.Src.Components.TrackList.Track);
local v15 = require(l_script_FirstAncestor_0.Src.Components.TrackList.WideScrollingFrame);
local v16 = v1.PureComponent:extend("TrackList");
v16.init = function(v17)
    v17.maxTrackWidth = 0;
    v17.trackCount = 1;
    v17.resetTrackCount = function()
        v17.trackCount = 1;
    end;
    v17.incrementTrackCount = function()
        v17.trackCount = v17.trackCount + 1;
    end;
    v17.state = {
        AbsoluteSize = Vector2.new()
    };
    v17.getTextWidth = function(v18, v19)
        return v5.getTextWidth(v18, v19.trackTheme.textSize, v19.font);
    end;
    v17.sizeChanged = function(v20)
        v17:setState({
            AbsoluteSize = v20.AbsoluteSize
        });
    end;
    v17.inputChanged = function(_, v22)
        if not (not (v22.UserInputType == Enum.UserInputType.MouseWheel) or not v17.props.OnScroll) then
            v17.props.OnScroll(v22.Position.Z);
        end;
    end;
    v17.onTrackExpandToggled = function(v23, v24)
        if v17.props.ToggleTrackExpanded then
            v17.props.ToggleTrackExpanded({
                v23
            }, v24);
        end;
    end;
    v17.onContextButtonClick = function(v25, v26, v27, v28)
        if v17.props.OpenContextMenu then
            v17.props.OpenContextMenu(v25, v26, v27, v28);
        end;
    end;
    v17.onTrackAdded = function(v29, v30, v31)
        if v17.props.OnTrackAdded then
            v17.props.OnTrackAdded(v29, v30, v31);
        end;
    end;
    v17.onTrackSelected = function(v32)
        if v17.props.OnTrackSelected then
            v17.props.OnTrackSelected(v32);
        end;
    end;
    v17.onValueChanged = function(v33, v34, v35, v36, v37, v38)
        if v17.props.OnValueChanged then
            v17.props.OnValueChanged(v33, v34, v35, v36, v37, v38);
        end;
    end;
    v17.getTrackWidth = function(v39, v40)
        return (v9.INDENT_PADDING * v39 + v40) + v9.TRACKLIST_RIGHT_PADDING;
    end;
end;
v16.renderSummaryTrack = function(v41, v42, v43, v44)
    v41.maxTrackWidth = math.max(v41.maxTrackWidth, (v41.getTrackWidth(1, v41.getTextWidth(v42, v44) + v9.TRACKLIST_BUTTON_SIZE)));
    v43.SummaryTrack = v1.createElement(v12, {
        LayoutOrder = v41.trackCount, 
        Name = v42, 
        UnusedTracks = v41.props.UnusedTracks, 
        OnTrackAdded = v41.onTrackAdded, 
        UnusedFacs = v41.props.UnusedFacs, 
        OnFacsAdded = v41.onFacsAdded
    });
    v41.incrementTrackCount();
end;
v16.renderExpandedCFrameTrack = function(v45, v46, v47, v48)
    local l_props_0 = v45.props;
    local l_Depth_0 = v46.Depth;
    local l_Instance_0 = v46.Instance;
    local l_Name_0 = v46.Name;
    local l_PROPERTY_KEYS_0 = v9.PROPERTY_KEYS;
    local l_AnimationData_0 = l_props_0.AnimationData;
    local l_Playhead_0 = l_props_0.Playhead;
    local v56 = v45.props.PlayState ~= v9.PLAY_STATE.Pause;
    local v57 = math.max(v45.getTextWidth(l_PROPERTY_KEYS_0.Position, v48), v45.getTextWidth(l_PROPERTY_KEYS_0.Rotation, v48));
    local v58 = v45.getTrackWidth(l_Depth_0, v57);
    local v59 = v4.getItemsForProperty(v46, v4.getCurrentValue(v46, l_Playhead_0, l_AnimationData_0, l_props_0.DefaultEulerAnglesOrder), nil, l_props_0.DefaultEulerAnglesOrder);
    v45.maxTrackWidth = math.max(v45.maxTrackWidth, v58 + #v59.Position * (v9.NUMBERBOX_WIDTH + v9.NUMBERTRACK_PADDING * 2));
    local v60 = if v46.Type == v9.TRACK_TYPES.Facs then v9.NUMBERBOX_FACS_DRAG_MULTIPLIER else v9.NUMBERBOX_DRAG_MULTIPLIER;
    local function v67(v61, v62)
        v47[v61 .. "_" .. v62] = v1.createElement(v14, {
            LayoutOrder = v45.trackCount, 
            Name = v62, 
            NameWidth = v57, 
            Items = v59[v62], 
            Height = v9.TRACK_HEIGHT, 
            Indent = l_Depth_0, 
            ReadOnly = v56, 
            DragMultiplier = v60, 
            OnItemChanged = function(v63, v64)
                if v46.Type == v9.TRACK_TYPES.Facs then
                    v64 = math.clamp(math.floor(0.5 + v64 * 100) / 100, 0, 1);
                end;
                for _, v66 in ipairs(v59[v62]) do
                    if v66.Key == v63 then
                        v66.Value = v64;
                    end;
                end;
                v45.onValueChanged(l_Instance_0, {
                    v61
                }, v46.Type, nil, l_Playhead_0, (v4.getPropertyForItems(v46, v59, l_props_0.DefaultEulerAnglesOrder)));
                return v64;
            end, 
            OnChangeBegan = l_props_0.OnChangeBegan
        });
        v45.incrementTrackCount();
    end;
    v67(l_Name_0, l_PROPERTY_KEYS_0.Position);
    v67(l_Name_0, l_PROPERTY_KEYS_0.Rotation);
end;
v16.renderExpandedGenericTrack = function(v68, v69, v70, _)
    v70["Expanded_" .. v69.Name] = v1.createElement(v13, {
        LayoutOrder = v68.trackCount, 
        Height = v9.TRACK_HEIGHT, 
        Indent = v69.Depth
    });
    v68.incrementTrackCount();
end;
v16.renderExpandedTracks = function(v72, v73, v74, v75)
    if v73.Type == v9.TRACK_TYPES.CFrame then
        v72:renderExpandedCFrameTrack(v73, v74, v75);
        return ;
    else
        v72:renderExpandedGenericTrack(v73, v74, v75);
        return ;
    end;
end;
v16.isSelected = function(v76, v77)
    if v76.props.SelectedTracks then
        for _, v79 in ipairs(v76.props.SelectedTracks) do
            if v77 == v79 then
                return true;
            end;
        end;
    end;
    return false;
end;
v16.renderTrack = function(v80, v81, v82, v83, v84, _, v86)
    local l_props_1 = v80.props;
    local l_SelectedTracks_0 = l_props_1.SelectedTracks;
    local l_Name_1 = v81.Name;
    local l_Instance_1 = v81.Instance;
    local l_Depth_1 = v81.Depth;
    local l_Type_0 = v81.Type;
    local v93 = v86 or v4.getRotationType(v81);
    local l_Expanded_0 = v81.Expanded;
    local l_Playhead_1 = l_props_1.Playhead;
    local l_AnimationData_1 = l_props_1.AnimationData;
    local v97 = l_props_1.PlayState ~= v9.PLAY_STATE.Pause;
    local l_ReadOnly_0 = l_props_1.ReadOnly;
    local v99 = (l_AnimationData_1 and l_AnimationData_1.Metadata) and l_AnimationData_1.Metadata.IsChannelAnimation;
    local v100 = nil;
    v100 = if not v99 then l_Type_0 == v9.TRACK_TYPES.CFrame else v81.Components and not v10(v81.Components);
    local v101 = v80.getTextWidth(l_Name_1, v83);
    local v102 = v80.getTrackWidth(0, v101) + (v9.NUMBERBOX_WIDTH + v9.NUMBERTRACK_PADDING * 2);
    local v103 = v2.List.join(v84 or {}, {
        l_Name_1
    });
    local v104 = table.concat(v103, "_");
    local v105 = nil;
    v105 = if l_Type_0 ~= v9.TRACK_TYPES.CFrame then (not not v99 and l_Expanded_0) and {} or v4.getItemsForProperty(v81, v4.getCurrentValueForPath(v103, l_Instance_1, l_Playhead_1, l_AnimationData_1, l_Type_0, l_props_1.DefaultEulerAnglesOrder), l_Name_1, l_props_1.DefaultEulerAnglesOrder) else {};
    local v106 = v11.findPath(l_SelectedTracks_0, v103) ~= nil;
    v80.maxTrackWidth = math.max(v80.maxTrackWidth, v102);
    v82["Track_" .. v104] = v1.createElement(v14, {
        LayoutOrder = v80.trackCount, 
        Name = l_Name_1, 
        NameWidth = v101, 
        Items = v105, 
        Height = v9.TRACK_HEIGHT, 
        Indent = l_Depth_1, 
        ReadOnly = v97 or l_ReadOnly_0, 
        Expanded = l_Expanded_0, 
        Selected = v106, 
        DragMultiplier = if v81.Type == v9.TRACK_TYPES.Facs then v9.NUMBERBOX_FACS_DRAG_MULTIPLIER else v9.NUMBERBOX_DRAG_MULTIPLIER, 
        OnItemChanged = function(v107, v108)
            if v81.Type == v9.TRACK_TYPES.Facs then
                v108 = math.clamp(v108, 0, 1);
            end;
            for _, v110 in ipairs(v105) do
                if v110.Key == v107 then
                    v110.Value = v108;
                end;
            end;
            v80.onValueChanged(l_Instance_1, v103, l_Type_0, v93, l_Playhead_1, (v4.getPropertyForItems(v81, v105, l_props_1.DefaultEulerAnglesOrder)));
            return v108;
        end, 
        OnExpandToggled = not not v100 and function(v111)
            v80.onTrackExpandToggled(v103, v111);
        end or nil, 
        OnChangeBegan = l_props_1.OnChangeBegan, 
        OnContextButtonClick = function()
            v80.onContextButtonClick(l_Instance_1, v103, l_Type_0, v93);
        end, 
        OnTrackSelected = function()
            v80.onTrackSelected(v103);
        end
    });
    v80.incrementTrackCount();
    if l_Expanded_0 then
        if not v99 then
            v80:renderExpandedTracks(v81, v82, v83);
        else
            for _, v113 in ipairs(v9.COMPONENT_TRACK_TYPES[v81.Type]._Order) do
                v80:renderTrack(v81.Components[v113], v82, v83, v103, v81.Type, v93);
            end;
        end;
    end;
end;
v16.renderTracks = function(v114, v115, v116, v117)
    local l_props_2 = v114.props;
    local l_Tracks_0 = l_props_2.Tracks;
    local l_RootName_0 = l_props_2.RootName;
    local v121 = {
        Layout = v1.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Vertical, 
            SortOrder = Enum.SortOrder.LayoutOrder
        })
    };
    v114:renderSummaryTrack(l_RootName_0, v121, v117);
    for v122, v123 in ipairs(l_Tracks_0) do
        if v115 <= v122 and v114.trackCount <= v116 then
            v114:renderTrack(v123, v121, v117);
        end;
    end;
    return v121;
end;
v16.render = function(v124)
    v124.resetTrackCount();
    v124.maxTrackWidth = 0;
    local l_props_3 = v124.props;
    local l_Stylizer_0 = l_props_3.Stylizer;
    local l_state_0 = v124.state;
    local l_Size_0 = l_props_3.Size;
    local l_TopTrackIndex_0 = l_props_3.TopTrackIndex;
    local l_Y_0 = l_state_0.AbsoluteSize.Y;
    local l_X_0 = l_state_0.AbsoluteSize.X;
    local l_LayoutOrder_0 = l_props_3.LayoutOrder;
    local _ = nil;
    return v1.createElement(v15, {
        Size = l_Size_0, 
        Width = l_X_0, 
        LayoutOrder = l_LayoutOrder_0, 
        BackgroundTransparency = 1, 
        CanvasSize = UDim2.new(0, v124.maxTrackWidth + v9.TRACKLIST_RIGHT_PADDING, 0, 0), 
        ZIndex = 2, 
        OnInputChanged = v124.inputChanged, 
        OnSizeChanged = v124.sizeChanged
    }, (v124:renderTracks(l_TopTrackIndex_0, if l_TopTrackIndex_0 == 0 then math.ceil((l_Y_0 - v9.SUMMARY_TRACK_HEIGHT) / v9.TRACK_HEIGHT) + 1 else (l_TopTrackIndex_0 + math.ceil(l_Y_0 / v9.TRACK_HEIGHT)) - 1, l_Stylizer_0)));
end;
return v3.connect(function(v134, _)
    local l_Status_0 = v134.Status;
    return {
        DefaultEulerAnglesOrder = l_Status_0.DefaultEulerAnglesOrder, 
        IsPlaying = l_Status_0.IsPlaying, 
        PlayState = l_Status_0.PlayState, 
        ReadOnly = l_Status_0.ReadOnly
    };
end, function(_)
    return {};
end)((l_withContext_0({
    Stylizer = l_ContextServices_0.Stylizer, 
    Analytics = l_ContextServices_0.Analytics, 
    Signals = v6
})(v16)));
