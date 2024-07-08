local l_script_FirstAncestor_0 = script:FindFirstAncestor("AvatarCompatibilityPreviewer");
local v1 = require(l_script_FirstAncestor_0.Packages.AvatarToolsShared);
local v2 = require(l_script_FirstAncestor_0.Packages.Framework);
local v3 = require(l_script_FirstAncestor_0.Packages.React);
local _ = require(l_script_FirstAncestor_0.Src.Resources.Theme);
local l_Pane_0 = v2.UI.Pane;
local l_Stylizer_0 = v2.ContextServices.Stylizer;
local l_AnimationPlaybackSlider_0 = v1.Components.AnimationPlaybackSlider;
return function(v8)
    local v9 = l_Stylizer_0:use("AnimationControllerDisplay");
    return v3.createElement(l_Pane_0, {
        AnchorPoint = Vector2.new(0, 1), 
        Position = v9.Position, 
        Padding = v9.Padding, 
        Size = v9.Size
    }, {
        Slider = v3.createElement(l_AnimationPlaybackSlider_0, {
            Size = UDim2.fromScale(1, 1), 
            IsPlaying = v8.ForcedPositionAlpha == nil, 
            Playhead = (v8.ForcedPositionAlpha or v8.AnimationPositionAlpha) * v8.Length, 
            OnSliderPlayheadChanged = function(v10)
                v8.SetForcedPositionAlpha(v10 / v8.Length);
            end, 
            OnPlayPauseClicked = function()
                v8.SetForcedPositionAlpha(if v8.ForcedPositionAlpha == nil then v8.AnimationPositionAlpha else nil);
            end, 
            ShowTime = false, 
            TrackLength = v8.Length
        })
    });
end;
