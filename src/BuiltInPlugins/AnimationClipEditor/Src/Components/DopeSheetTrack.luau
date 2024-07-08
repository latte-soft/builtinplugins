local l_script_FirstAncestor_0 = script:FindFirstAncestor("AnimationClipEditor");
local v1 = require(l_script_FirstAncestor_0.Packages.Roact);
local v2 = require(l_script_FirstAncestor_0.Src.Components.BaseTrack);
local v3 = require(l_script_FirstAncestor_0.Src.Util.Constants);
local v4 = require(l_script_FirstAncestor_0.Src.Util.TrackUtils);
local v5 = require(l_script_FirstAncestor_0.Src.Components.Timeline.Keyframe);
local v6 = require(l_script_FirstAncestor_0.Src.Components.KeyframeCluster);
local v7 = require(l_script_FirstAncestor_0.Src.Components.Tooltip);
local v8 = v1.PureComponent:extend("DopeSheetTrack");
v8.renderKeyframe = function(v9, v10, v11, v12, v13, v14, v15, v16)
    local l_props_0 = v9.props;
    local v18 = l_props_0.Path or {
        v12.Name
    };
    local v19 = nil;
    v19 = if not l_props_0.IsChannelAnimation then ((not not v15 and v15.EasingStyle) and v15.EasingStyle ~= Enum.PoseEasingStyle.Linear) and v15.EasingStyle.Name .. ", " .. v15.EasingDirection.Name or nil else ((not not v15 and v15.InterpolationMode) and v15.InterpolationMode ~= Enum.KeyInterpolationMode.Linear) and v15.InterpolationMode.Name or nil;
    return v1.createElement(v5, {
        Selected = v10, 
        Position = UDim2.new(0, v11, 0.5, 0), 
        ZIndex = l_props_0.ZIndex, 
        Width = v3.KEYFRAME_WIDTH, 
        BorderSizePixel = not v10 and 1 or 2, 
        KeyframeStyle = v3.KEYFRAME_STYLE[v14] or nil, 
        Filled = v16, 
        OnActivated = l_props_0.OnKeyActivated, 
        OnRightClick = function(_, _)
            l_props_0.OnKeyRightClick(v12.Instance, v18, v13, v10);
        end, 
        OnInputBegan = function(_, v23)
            l_props_0.OnKeyInputBegan(v12.Instance, v18, v13, v10, v23);
        end, 
        OnInputEnded = function(_, v25)
            l_props_0.OnKeyInputEnded(v13, v10, v25);
        end
    }, {
        Tooltip = not not v19 and v1.createElement(v7, {
            Text = v19, 
            ShowDelay = 0
        }) or nil
    });
end;
v8.renderKeyframeCluster = function(_, v27, v28, v29, v30)
    return v1.createElement(v6, {
        Position = UDim2.new(0, v27, 0.5, 0), 
        Size = UDim2.new(0, v28 - v27, 0, v29), 
        ZIndex = v30
    });
end;
v8.renderKeyframes = function(v31, v32)
    local l_props_1 = v31.props;
    local l_Width_0 = l_props_1.Width;
    local l_Track_0 = l_props_1.Track;
    local l_StartTick_0 = l_props_1.StartTick;
    local l_EndTick_0 = l_props_1.EndTick;
    local l_SelectedKeyframes_0 = l_props_1.SelectedKeyframes;
    local l_ShowCluster_0 = l_props_1.ShowCluster;
    local l_IsChannelAnimation_0 = l_props_1.IsChannelAnimation;
    local v41 = l_props_1.Path or {
        l_Track_0.Name
    };
    local l_Keyframes_0 = l_Track_0.Keyframes;
    local l_Data_0 = l_Track_0.Data;
    local l_Instance_0 = l_Track_0.Instance;
    if not l_ShowCluster_0 then
        local v45 = v4.getComponentsInfo(l_Track_0, l_StartTick_0, l_EndTick_0);
        local v46 = l_SelectedKeyframes_0[l_Instance_0];
        for _, v48 in ipairs(v41) do
            if v46 then
                v46 = not not v46.Components and v46.Components[v48] or v46[v48];
            else
                break;
            end;
        end;
        for v49, v50 in pairs(v45) do
            local v51 = nil;
            local v52 = l_Data_0 and l_Data_0[v49];
            local v53 = not l_IsChannelAnimation_0 or v50.Complete;
            if v45[v49].Complete then
                v51 = not not l_IsChannelAnimation_0 and v45[v49].InterpolationMode or v45[v49].EasingStyle;
            end;
            table.insert(v32, v31:renderKeyframe((v46 and v46.Selection) and v46.Selection[v49], v4.getScaledKeyframePosition(v49, l_StartTick_0, l_EndTick_0, l_Width_0), l_Track_0, v49, v51, v52, v53));
        end;
    else
        local v54, v55 = v4.getKeyframesExtents(l_Keyframes_0, l_StartTick_0, l_EndTick_0);
        if v54 ~= nil and v55 ~= nil then
            v32[v55] = v31:renderKeyframeCluster(v4.getScaledKeyframePosition(l_Keyframes_0[v54], l_StartTick_0, l_EndTick_0, l_Width_0), v4.getScaledKeyframePosition(l_Keyframes_0[v55], l_StartTick_0, l_EndTick_0, l_Width_0), v3.MIN_SPACE_BETWEEN_KEYS);
            return ;
        end;
    end;
end;
v8.render = function(v56)
    local l_props_2 = v56.props;
    local v58 = {};
    v56:renderKeyframes(v58);
    return v1.createElement(v2, l_props_2, v58);
end;
return v8;
