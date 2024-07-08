local l_script_FirstAncestor_0 = script:FindFirstAncestor("AnimationClipEditor");
local v1 = require(l_script_FirstAncestor_0.Packages.Roact);
local v2 = require(l_script_FirstAncestor_0.Src.Components.BaseTrack);
local v3 = require(l_script_FirstAncestor_0.Src.Util.Constants);
local v4 = require(l_script_FirstAncestor_0.Src.Util.TrackUtils);
local v5 = require(l_script_FirstAncestor_0.Src.Components.Timeline.Keyframe);
local v6 = require(l_script_FirstAncestor_0.Src.Components.KeyframeCluster);
local v7 = require(l_script_FirstAncestor_0.Src.Components.Tooltip);
local v8 = v1.PureComponent:extend("SummaryTrack");
v8.getSummaryKeyframes = function(v9)
    local l_props_0 = v9.props;
    return v4.getSummaryKeyframes(l_props_0.Tracks, l_props_0.StartTick, l_props_0.EndTick, l_props_0.SelectedKeyframes, l_props_0.PreviewKeyframes);
end;
v8.renderKeyframe = function(v11, v12, v13, v14, v15)
    local l_props_1 = v11.props;
    return v1.createElement(v5, {
        Selected = v12, 
        KeyframeStyle = v3.KEYFRAME_STYLE.Primary, 
        Position = UDim2.new(0, v13, 0.5, 0), 
        ZIndex = l_props_1.ZIndex, 
        Width = v3.SUMMARY_KEYFRAME_WIDTH, 
        BorderSizePixel = not v12 and 1 or 2, 
        Filled = true, 
        Named = v15 ~= nil, 
        OnActivated = l_props_1.OnKeyActivated, 
        OnRightClick = function(_, _)
            l_props_1.OnKeyRightClick(nil, nil, v14, v12);
        end, 
        OnInputBegan = function(_, v20)
            l_props_1.OnKeyInputBegan(nil, nil, v14, v12, v20);
        end, 
        OnInputEnded = function(_, v22)
            l_props_1.OnKeyInputEnded(v14, v12, v22);
        end
    }, {
        Tooltip = v15 and v1.createElement(v7, {
            Text = v15, 
            ShowDelay = 0
        })
    });
end;
v8.renderKeyframeCluster = function(_, v24, v25, v26, v27)
    return v1.createElement(v6, {
        Primary = true, 
        Position = UDim2.new(0, v24, 0.5, 0), 
        Size = UDim2.new(0, v25 - v24, 0, v26), 
        ZIndex = v27
    });
end;
v8.renderKeyframes = function(v28, v29)
    local v30, v31 = v28:getSummaryKeyframes();
    table.sort(v30);
    if #v30 == 0 then
        return ;
    else
        local l_props_2 = v28.props;
        local l_Width_0 = l_props_2.Width;
        local l_StartTick_0 = l_props_2.StartTick;
        local l_EndTick_0 = l_props_2.EndTick;
        local l_ShowCluster_0 = l_props_2.ShowCluster;
        local l_NamedKeyframes_0 = l_props_2.NamedKeyframes;
        local v38, v39 = v4.getKeyframesExtents(v30, l_StartTick_0, l_EndTick_0);
        if not l_ShowCluster_0 then
            if v38 ~= nil and v39 ~= nil then
                for v40 = v38, v39 do
                    local v41 = v30[v40];
                    v29[v40] = v28:renderKeyframe(v31[v41], v4.getScaledKeyframePosition(v41, l_StartTick_0, l_EndTick_0, l_Width_0), v41, l_NamedKeyframes_0[v41]);
                end;
            end;
            return ;
        else
            v29[v39] = v28:renderKeyframeCluster(v4.getScaledKeyframePosition(v30[v38], l_StartTick_0, l_EndTick_0, l_Width_0), v4.getScaledKeyframePosition(v30[v39], l_StartTick_0, l_EndTick_0, l_Width_0), v3.MIN_SPACE_BETWEEN_KEYS);
            return ;
        end;
    end;
end;
v8.render = function(v42)
    local l_props_3 = v42.props;
    l_props_3.Primary = true;
    local v44 = {};
    v42:renderKeyframes(v44);
    return v1.createElement(v2, l_props_3, v44);
end;
return v8;
