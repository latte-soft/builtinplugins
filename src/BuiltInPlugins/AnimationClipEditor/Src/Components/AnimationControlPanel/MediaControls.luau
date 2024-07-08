local l_script_FirstAncestor_0 = script:FindFirstAncestor("AnimationClipEditor");
local v1 = require(l_script_FirstAncestor_0.Packages.Roact);
local v2 = require(l_script_FirstAncestor_0.Packages.Framework);
local l_ContextServices_0 = v2.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local v5 = require(l_script_FirstAncestor_0.Src.Util.Constants);
local v6 = require(l_script_FirstAncestor_0.Src.Util.LayoutOrderIterator);
local l_Button_0 = v2.UI.Button;
local v8 = require(l_script_FirstAncestor_0.Src.Components.Tooltip);
local v9 = v1.PureComponent:extend("MediaControls");
v9.makeButton = function(v10, v11, v12, v13, v14)
    return v1.createElement("Frame", {
        LayoutOrder = v10.layoutOrderIterator:getNextOrder(), 
        Size = UDim2.new(0, v5.TIMELINE_HEIGHT, 0, v5.TIMELINE_HEIGHT), 
        BackgroundTransparency = 1
    }, {
        Button = v1.createElement(l_Button_0, {
            ZIndex = 1, 
            Size = UDim2.new(1, 0, 1, 0), 
            OnClick = v12, 
            Style = v10.props.Stylizer.button.MediaControl
        }, {
            Image = v1.createElement("ImageLabel", {
                BackgroundTransparency = 1, 
                Size = UDim2.new(1, 0, 1, 0), 
                Image = v11, 
                ImageColor3 = v13.iconColor
            }), 
            Tooltip = v14 and v1.createElement(v8, {
                TextKey = v14
            })
        })
    });
end;
v9.makeToggle = function(v15, v16, v17, v18, v19, v20, v21)
    local l_button_0 = v15.props.Stylizer.button;
    return v1.createElement("Frame", {
        LayoutOrder = v15.layoutOrderIterator:getNextOrder(), 
        Size = UDim2.new(0, v5.TIMELINE_HEIGHT, 0, v5.TIMELINE_HEIGHT), 
        BackgroundTransparency = 1
    }, {
        Button = v1.createElement(l_Button_0, {
            ZIndex = 1, 
            Size = UDim2.new(1, 0, 1, 0), 
            Style = not not v16 and l_button_0.ActiveControl or l_button_0.MediaControl, 
            OnClick = v19
        }, {
            Image = v1.createElement("ImageLabel", {
                BackgroundTransparency = 1, 
                Size = UDim2.new(1, 0, 1, 0), 
                Image = not not v16 and v17 or v18, 
                ImageColor3 = not not v16 and v20.iconHighlightColor or v20.iconColor
            }), 
            Tooltip = v21 and v1.createElement(v8, {
                TextKey = v21
            })
        })
    });
end;
v9.makePlayToggle = function(v23, v24, v25, v26, v27, v28, v29, v30)
    local l_button_1 = v23.props.Stylizer.button;
    return v1.createElement("Frame", {
        LayoutOrder = v23.layoutOrderIterator:getNextOrder(), 
        Size = UDim2.new(0, v5.TIMELINE_HEIGHT, 0, v5.TIMELINE_HEIGHT), 
        BackgroundTransparency = 1
    }, {
        Button = v1.createElement(l_Button_0, {
            ZIndex = 1, 
            Size = UDim2.new(1, 0, 1, 0), 
            Style = not not v24 and l_button_1.ActiveControl or l_button_1.MediaControl, 
            OnClick = function()
                if v23.props.SetPlayState then
                    v23.props.SetPlayState(if not v24 then v27 else v5.PLAY_STATE.Pause);
                end;
            end
        }, {
            Image = v1.createElement("ImageLabel", {
                BackgroundTransparency = 1, 
                Size = UDim2.new(1, 0, 1, 0), 
                Image = if not v24 then v26 else v25, 
                ImageColor3 = not not v24 and v28.iconHighlightColor or v28.iconColor
            }), 
            Tooltip = v1.createElement(v8, {
                TextKey = if not v24 then v30 else v29
            })
        })
    });
end;
v9.render = function(v32)
    local l_props_0 = v32.props;
    local l_Stylizer_0 = l_props_0.Stylizer;
    local l_IsLooping_0 = l_props_0.IsLooping;
    local v36 = l_props_0.PlayState == v5.PLAY_STATE.Reverse;
    local _ = l_props_0.PlayState == v5.PLAY_STATE.Pause;
    local v38 = l_props_0.PlayState == v5.PLAY_STATE.Play;
    local l_LayoutOrder_0 = l_props_0.LayoutOrder;
    local l_SkipBackward_0 = l_props_0.SkipBackward;
    local l_SkipForward_0 = l_props_0.SkipForward;
    local l_ToggleLooping_0 = l_props_0.ToggleLooping;
    local l_GoToFirstFrame_0 = l_props_0.GoToFirstFrame;
    local l_GoToLastFrame_0 = l_props_0.GoToLastFrame;
    local l_playbackTheme_0 = l_Stylizer_0.playbackTheme;
    v32.layoutOrderIterator = v6.new();
    return v1.createElement("Frame", {
        BackgroundTransparency = 1, 
        LayoutOrder = l_LayoutOrder_0, 
        Size = UDim2.new(0, v5.CONTROLS_WIDTH, 0, v5.TIMELINE_HEIGHT)
    }, {
        Layout = v1.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Horizontal, 
            HorizontalAlignment = Enum.HorizontalAlignment.Left, 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            VerticalAlignment = Enum.VerticalAlignment.Center
        }), 
        GoToFirstFrame = v32:makeButton(l_playbackTheme_0.goToFirstFrame, l_GoToFirstFrame_0, l_playbackTheme_0, "GoToFirstFrame"), 
        SkipBackward = v32:makeButton(l_playbackTheme_0.skipBackward, l_SkipBackward_0, l_playbackTheme_0, "SkipBackward"), 
        Reverse = v32:makePlayToggle(v36, l_playbackTheme_0.pause, l_playbackTheme_0.reverse, v5.PLAY_STATE.Reverse, l_playbackTheme_0, "Pause", "Reverse"), 
        Play = v32:makePlayToggle(v38, l_playbackTheme_0.pause, l_playbackTheme_0.play, v5.PLAY_STATE.Play, l_playbackTheme_0, "Pause", "Play"), 
        SkipForward = v32:makeButton(l_playbackTheme_0.skipForward, l_SkipForward_0, l_playbackTheme_0, "SkipForward"), 
        GoToLastFrame = v32:makeButton(l_playbackTheme_0.goToLastFrame, l_GoToLastFrame_0, l_playbackTheme_0, "GoToLastFrame"), 
        Loop = v32:makeToggle(l_IsLooping_0, l_playbackTheme_0.loop, l_playbackTheme_0.loop, l_ToggleLooping_0, l_playbackTheme_0, "ToggleLooping")
    });
end;
return (l_withContext_0({
    Stylizer = l_ContextServices_0.Stylizer
})(v9));
