local l_script_FirstAncestor_0 = script:FindFirstAncestor("Toolbox");
local l_Packages_0 = l_script_FirstAncestor_0.Packages;
local v2 = require(l_Packages_0.Roact);
local v3 = require(l_Packages_0.Framework);
local v4 = require(l_Packages_0.RoactRodux);
local l_LoadingIndicator_0 = v3.UI.LoadingIndicator;
local v6 = require(l_script_FirstAncestor_0.Core.Util.Images);
local v7 = require(l_script_FirstAncestor_0.Core.Util.Constants);
local l_ContextServices_0 = v3.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local v10 = require(l_script_FirstAncestor_0.Core.Util.Analytics.Analytics);
local l_Actions_0 = l_script_FirstAncestor_0.Core.Actions;
local v12 = require(l_Actions_0.PlayPreviewSound);
local v13 = require(l_Actions_0.PausePreviewSound);
local v14 = require(l_Actions_0.ResumePreviewSound);
local v15 = v2.PureComponent:extend("AudioPreviewButton");
v15.init = function(v16)
    v16.onPreviewAudioButtonClicked = function()
        local l_assetId_0 = v16.props.assetId;
        if v16.props.currentSoundId == l_assetId_0 then
            if not v16.props.isPlaying then
                v16.props.resumeASound();
                v10.onSoundPlayedCounter();
                return ;
            else
                v16.props.pauseASound();
                v10.onSoundPausedCounter();
                return ;
            end;
        else
            v16.props.playASound(l_assetId_0);
            v10.onSoundPlayedCounter();
            return ;
        end;
    end;
end;
v15.render = function(v18)
    local l_props_0 = v18.props;
    local l_Stylizer_0 = l_props_0.Stylizer;
    local v21 = UDim2.new(1, 0, 1, 0);
    local v22 = UDim2.new(0, v7.ASSET_PLAY_AUDIO_ICON_SIZE, 0, v7.ASSET_PLAY_AUDIO_ICON_SIZE);
    local v23 = l_props_0.ZIndex or 0;
    local l_assetId_1 = l_props_0.assetId;
    local l_isLoading_0 = l_props_0.isLoading;
    local l_currentSoundId_0 = l_props_0.currentSoundId;
    local l_isPlaying_0 = l_props_0.isPlaying;
    local v28 = false;
    if l_currentSoundId_0 == l_assetId_1 then
        v28 = l_isPlaying_0;
    end;
    local v29 = not not v28 and v6.AUDIO_PREVIEW_PAUSE or v6.AUDIO_PREVIEW_PLAY;
    local l_icon_0 = l_Stylizer_0.asset.icon;
    if not l_isLoading_0 then
        return v2.createElement("ImageButton", {
            AnchorPoint = Vector2.new(1, 1), 
            Position = v21, 
            Size = v22, 
            ZIndex = v23, 
            Image = v29, 
            ImageColor3 = l_icon_0.buttonColor, 
            BackgroundTransparency = 1, 
            [v2.Event.MouseButton1Click] = function(_)
                v18.onPreviewAudioButtonClicked();
            end
        });
    else
        return v2.createElement(l_LoadingIndicator_0, {
            AnchorPoint = Vector2.new(1, 1), 
            Position = UDim2.new(v21.X, UDim.new(v21.Y.Scale, v21.Y.Offset - 5)), 
            Size = UDim2.new(v22.X, UDim.new(0, 10))
        });
    end;
end;
return v4.connect(function(v32, _)
    return {
        isPlaying = ((v32 or {}).sound or {}).isPlaying or false
    };
end, function(v34)
    return {
        pauseASound = function()
            v34(v13());
        end, 
        playASound = function(v35)
            v34(v12(v35));
        end, 
        resumeASound = function()
            v34(v14());
        end
    };
end)((l_withContext_0({
    Stylizer = l_ContextServices_0.Stylizer
})(v15)));
