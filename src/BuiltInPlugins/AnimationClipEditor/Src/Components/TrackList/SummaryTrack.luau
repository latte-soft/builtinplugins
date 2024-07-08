local l_script_FirstAncestor_0 = script:FindFirstAncestor("AnimationClipEditor");
local v1 = require(l_script_FirstAncestor_0.Packages.Roact);
local l_ContextServices_0 = require(l_script_FirstAncestor_0.Packages.Framework).ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local v4 = require(l_script_FirstAncestor_0.Src.Components.IK.IKController);
local v5 = require(l_script_FirstAncestor_0.Src.Components.FaceControlsEditor.FaceControlsEditorController);
local v6 = require(l_script_FirstAncestor_0.Src.Components.FacialAnimationRecorder.RecordingModeButton);
local v7 = require(l_script_FirstAncestor_0.Src.Components.TrackList.TrackListEntry);
local v8 = require(l_script_FirstAncestor_0.Src.Components.TrackList.AddTrackButton);
local v9 = require(l_script_FirstAncestor_0.Src.Util.Constants);
local v10 = require(l_script_FirstAncestor_0.Src.Util.isEmpty);
local v11 = require(l_script_FirstAncestor_0.Src.Util.StringUtils);
local v12 = require(l_script_FirstAncestor_0.LuaFlags.GetFFlagFacialAnimationRecordingInStudio);
local v13 = v1.PureComponent:extend("SummaryTrack");
v13.init = function(v14)
    v14.onTrackAdded = function(v15, v16, v17)
        if v14.props.OnTrackAdded then
            v14.props.OnTrackAdded(v15, v16, v17);
        end;
    end;
end;
truncateAtMiddle = function(v18, v19, v20)
    if v19 < #v18 then
        local v21 = v20 or "...";
        local v22 = v19 - #v21;
        return string.sub(v18, 0, (math.ceil(v22 / 2))) .. v21 .. string.sub(v18, #v18 - math.floor(v22 / 2));
    else
        return v18;
    end;
end;
v13.render = function(v23)
    local l_props_0 = v23.props;
    local l_Stylizer_0 = l_props_0.Stylizer;
    local l_Name_0 = l_props_0.Name;
    local l_LayoutOrder_0 = l_props_0.LayoutOrder;
    local l_UnusedTracks_0 = l_props_0.UnusedTracks;
    local l_UnusedFacs_0 = l_props_0.UnusedFacs;
    local l_trackTheme_0 = l_Stylizer_0.trackTheme;
    local v31 = "";
    local v32 = v11.getTextWidth(l_Name_0, l_trackTheme_0.textSize, l_Stylizer_0.font);
    if v12() then
        v31 = truncateAtMiddle(l_Name_0, 16);
        v32 = v11.getTextWidth(v31, l_trackTheme_0.textSize, l_Stylizer_0.font);
    end;
    return v1.createElement(v7, {
        Height = v9.SUMMARY_TRACK_HEIGHT, 
        Indent = 1, 
        LayoutOrder = l_LayoutOrder_0, 
        Primary = true
    }, {
        NameLabel = v1.createElement("TextLabel", {
            Size = UDim2.new(1, 0, 1, 0), 
            Position = UDim2.new(0, 0, 0, 0), 
            BackgroundTransparency = 1, 
            Text = not not v12() and v31 or l_Name_0, 
            Font = l_Stylizer_0.font, 
            TextSize = l_trackTheme_0.textSize, 
            TextColor3 = l_trackTheme_0.textColor, 
            TextXAlignment = Enum.TextXAlignment.Left
        }), 
        LeftButtonsListContainer = v1.createElement("Frame", {
            AnchorPoint = Vector2.new(0, 0.5), 
            BorderSizePixel = 0, 
            BackgroundTransparency = 0, 
            Position = UDim2.new(0, v32 + 12, 0.5, 0)
        }, {
            LeftButtonsList = v1.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Horizontal, 
                VerticalAlignment = Enum.VerticalAlignment.Center, 
                SortOrder = Enum.SortOrder.LayoutOrder, 
                Padding = UDim.new(0, 12)
            }), 
            IKController = v1.createElement(v4, {}), 
            FaceControlsEditorController = v1.createElement(v5, {}), 
            RecordingModeButton = v12() and v1.createElement(v6, {})
        }), 
        AddTrackButton = not not (not not l_UnusedTracks_0 and not v10(l_UnusedTracks_0) or l_UnusedFacs_0 and not v10(l_UnusedFacs_0)) and v1.createElement(v8, {
            Size = UDim2.new(0, v9.TRACKLIST_BUTTON_SIZE, 0, v9.TRACKLIST_BUTTON_SIZE), 
            Position = UDim2.new(1, -v9.TRACKLIST_RIGHT_PADDING, 0.5, 0), 
            Tracks = l_UnusedTracks_0, 
            Facs = l_UnusedFacs_0, 
            OnTrackSelected = v23.onTrackAdded
        }) or nil
    });
end;
return (l_withContext_0({
    Stylizer = l_ContextServices_0.Stylizer
})(v13));
