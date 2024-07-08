local l_script_FirstAncestor_0 = script:FindFirstAncestor("CompositorDebugger");
local v1 = require(l_script_FirstAncestor_0.Packages.React);
local v2 = require(l_script_FirstAncestor_0.Packages.RoactRodux);
local v3 = require(l_script_FirstAncestor_0.Packages.Framework);
local l_ContextServices_0 = v3.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local _ = v3.Dash.join;
local l_Pane_0 = v3.UI.Pane;
local _ = l_script_FirstAncestor_0.Src.Actions;
local _ = l_script_FirstAncestor_0.Src.Components;
local v10 = require(script.playPauseButton);
local v11 = require(script.scrubber);
local v12 = require(script.timeline);
local v13 = require(l_script_FirstAncestor_0.Src.Thunks.SetScrubberOffset);
local _ = require(l_script_FirstAncestor_0.Src.Types);
local v15 = require(l_script_FirstAncestor_0.Src.Util.Constants);
local v16 = v1.PureComponent:extend("TimeControls");
v16.init = function(v17)
    v17.onPlayPauseClicked = function()
        local l_props_0 = v17.props;
        local v19 = l_props_0.HistoryOffset == nil;
        l_props_0.SetScrubberOffset(0);
        if not v19 then
            l_props_0.SetScrubberOffset(nil);
        end;
    end;
end;
v16.render = function(v20)
    local _ = v20.state;
    local l_props_1 = v20.props;
    local l_Stylizer_0 = l_props_1.Stylizer;
    local l_FrameBuffer_0 = l_props_1.FrameBuffer;
    local v25 = nil;
    local v26 = nil;
    local v27 = nil;
    if l_FrameBuffer_0 then
        v25 = l_FrameBuffer_0:getSize() / v15.FRAMERATE;
        v26 = 1 + (l_props_1.HistoryOffset or 0) / v25;
        v27 = if not not l_FrameBuffer_0.first and l_FrameBuffer_0.last then l_FrameBuffer_0.last.timestamp - l_FrameBuffer_0.first.timestamp else 0;
    end;
    return v1.createElement(l_Pane_0, {
        Padding = {
            Left = 24, 
            Right = 24
        }, 
        Size = l_props_1.Size, 
        Layout = Enum.FillDirection.Horizontal, 
        VerticalAlignment = Enum.VerticalAlignment.Top, 
        HorizontalAlignment = Enum.HorizontalAlignment.Left
    }, {
        Timeline = if not l_props_1.FrameBuffer then v1.createElement(l_Pane_0, {
            Size = UDim2.new(1, -24, 1, 0)
        }) else v1.createElement(v12, {
            Style = l_Stylizer_0, 
            Size = UDim2.new(1, -24, 1, 0), 
            Timespan = v25, 
            MajorInterval = l_props_1.MajorInterval, 
            MinorInterval = l_props_1.MinorInterval, 
            LayoutOrder = 1, 
            ZIndez = l_props_1.ZIndex
        }, {
            Scrubber = v1.createElement(v11, {
                Style = l_Stylizer_0, 
                Position = UDim2.fromScale(v26, 0), 
                ZIndex = 2
            }), 
            BufferBar = v1.createElement(l_Pane_0, {
                ZIndex = 2, 
                AnchorPoint = Vector2.new(1, 1), 
                Size = UDim2.new(math.clamp(v27 / v25, 0, 1), 0, 0, l_Stylizer_0.BufferBar.Height), 
                Position = UDim2.fromScale(1, 1), 
                BackgroundColor = l_Stylizer_0.BufferBar.Color
            })
        }), 
        PlayPauseButton = v1.createElement(v10, {
            Style = l_Stylizer_0.PlayPauseButton, 
            ScrubberOffset = l_props_1.HistoryOffset, 
            OnButtonClicked = v20.onPlayPauseClicked, 
            IsPlaying = l_props_1.HistoryOffset == nil, 
            LayoutOrder = 2
        })
    });
end;
return (v2.connect(function(v28, _)
    return {
        HistoryOffset = v28.Status.HistoryOffset
    };
end, function(v30)
    return {
        SetScrubberOffset = function(v31)
            v30(v13(v31));
        end
    };
end)((l_withContext_0({
    Analytics = l_ContextServices_0.Analytics, 
    Localization = l_ContextServices_0.Localization, 
    Stylizer = v3.Style.Stylizer
})(v16))));
