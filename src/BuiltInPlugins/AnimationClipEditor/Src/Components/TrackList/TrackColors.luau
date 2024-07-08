local l_script_FirstAncestor_0 = script:FindFirstAncestor("AnimationClipEditor");
local v1 = require(l_script_FirstAncestor_0.Packages.Roact);
local v2 = require(l_script_FirstAncestor_0.Src.Util.TrackUtils);
local l_ContextServices_0 = require(l_script_FirstAncestor_0.Packages.Framework).ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local v5 = require(l_script_FirstAncestor_0.Src.Util.Constants);
local v6 = v1.PureComponent:extend("TrackColors");
v6.renderTracks = function(v7, v8)
    local l_props_0 = v7.props;
    local l_Tracks_0 = l_props_0.Tracks;
    local l_TopTrackIndex_0 = l_props_0.TopTrackIndex;
    local l_MaxHeight_0 = l_props_0.MaxHeight;
    local l_l_TopTrackIndex_0_0 = l_TopTrackIndex_0;
    local v14 = 0;
    local v15 = {
        Layout = v1.createElement("UIListLayout", {
            SortOrder = Enum.SortOrder.LayoutOrder, 
            FillDirection = Enum.FillDirection.Vertical
        })
    };
    for v16 = l_TopTrackIndex_0, #l_Tracks_0 do
        if l_MaxHeight_0 >= v14 then
            local v17 = v16 % 2 == 0;
            local v18 = l_Tracks_0[v16];
            local v19 = 1;
            if not (not v18 or not v18.Expanded) then
                v19 = v2.getExpandedSize(v18);
            end;
            for _ = 1, v19 do
                if l_MaxHeight_0 >= v14 then
                    table.insert(v15, v1.createElement("Frame", {
                        Size = UDim2.new(1, 0, 0, v5.TRACK_HEIGHT), 
                        BackgroundColor3 = not not v17 and v8.trackTheme.shadedBackgroundColor or v8.trackTheme.backgroundColor, 
                        BorderSizePixel = 0, 
                        LayoutOrder = l_l_TopTrackIndex_0_0
                    }));
                    l_l_TopTrackIndex_0_0 = l_l_TopTrackIndex_0_0 + 1;
                    v14 = v14 + v5.TRACK_HEIGHT;
                else
                    break;
                end;
            end;
        else
            break;
        end;
    end;
    return v15;
end;
v6.render = function(v21)
    local l_props_1 = v21.props;
    return v1.createElement("Frame", {
        Size = UDim2.new(1, 0, 1, 0), 
        Position = l_props_1.Position, 
        BackgroundTransparency = 1, 
        ZIndex = 0
    }, (v21:renderTracks(l_props_1.Stylizer)));
end;
return (l_withContext_0({
    Stylizer = l_ContextServices_0.Stylizer
})(v6));
