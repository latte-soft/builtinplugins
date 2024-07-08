local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Roact);
local v2 = require(l_Parent_0.Packages.RoactRodux);
local v3 = require(l_Parent_0.Packages.AvatarToolsShared);
local l_PreviewingInfo_0 = v3.Util.AccessoryAndBodyToolShared.PreviewingInfo;
local l_PreviewAnimationPlayback_0 = v3.Components.PreviewAnimationPlayback;
local l_EditingItemContext_0 = v3.Contexts.EditingItemContext;
local l_PreviewContext_0 = v3.Contexts.PreviewContext;
local v8 = require(l_Parent_0.Packages.Framework);
local l_withContext_0 = v8.ContextServices.withContext;
local v10 = v1.PureComponent:extend("AnimationPlaybackWrapper");
local v11 = require(l_Parent_0.Src.Actions.SetPlayhead);
local v12 = require(l_Parent_0.Src.Actions.SetTrackLength);
local v13 = require(l_Parent_0.Src.Actions.SetIsPlaying);
v8.Util.Typecheck.wrap(v10, script);
v10.init = function(v14)
    v14.previewAvatar = {};
end;
v10.updatePreviewAvatar = function(v15)
    local l_PreviewContext_1 = v15.props.PreviewContext;
    local v17 = {
        l_PreviewContext_1:getAvatars()[l_PreviewContext_1:getCurrentPreviewAvatarIndex()]
    };
    if v17 ~= v15.previewAvatar then
        v15.previewAvatar = v17;
        v15:setState({
            temp = {}
        });
    end;
end;
v10.didMount = function(v18)
    v18.previewModelChangedConnection = v18.props.PreviewContext:getAnimationTargetChangedSignal():Connect(function()
        v18:updatePreviewAvatar();
    end);
    v18:updatePreviewAvatar();
end;
v10.render = function(v19)
    local l_props_0 = v19.props;
    return v1.createElement(l_PreviewAnimationPlayback_0, {
        AnimationId = l_props_0.AnimationId, 
        IsPlayingOverride = l_props_0.IsPlaying, 
        PreviewAvatars = v19.previewAvatar, 
        PlayheadOverride = l_props_0.SliderPlayhead, 
        OnPlayheadChanged = l_props_0.SetPlayhead, 
        OnIsPlayingChanged = l_props_0.SetIsPlaying, 
        OnTrackLengthChanged = l_props_0.SetTrackLength
    });
end;
v10.willUnmount = function(v21)
    if v21.previewModelChangedConnection then
        v21.previewModelChangedConnection:Disconnect();
        v21.previewModelChangedConnection = nil;
    end;
end;
return v2.connect(function(v22, _)
    local l_animation_0 = v22.animation;
    return {
        AnimationId = l_PreviewingInfo_0.getPreviewingAnimationId(v22), 
        IsPlaying = l_animation_0.IsPlaying, 
        Playhead = l_animation_0.Playhead, 
        SliderPlayhead = l_animation_0.SliderPlayhead
    };
end, function(v25)
    return {
        SetPlayhead = function(v26)
            v25(v11(v26));
        end, 
        SetTrackLength = function(v27)
            v25(v12(v27));
        end, 
        SetIsPlaying = function(v28)
            v25(v13(v28));
        end
    };
end)((l_withContext_0({
    EditingItemContext = l_EditingItemContext_0, 
    PreviewContext = l_PreviewContext_0
})(v10)));
