local l_RunService_0 = game:GetService("RunService");
local l_Parent_0 = script.Parent.Parent.Parent;
local l_Packages_0 = l_Parent_0.Packages;
local v3 = require(l_Packages_0.Roact);
local v4 = require(l_Packages_0.RoactRodux);
local v5 = require(l_Parent_0.Core.Util.Urls);
local v6 = require(l_Parent_0.Core.Actions.StopPreviewSound);
local v7 = require(l_Parent_0.Core.Actions.SetSoundLoading);
local v8 = require(l_Parent_0.Core.Actions.SetSoundElapsedTime);
local v9 = require(l_Parent_0.Core.Actions.SetSoundTotalTime);
local v10 = v3.Component:extend("SoundPreviewComponent");
v10.init = function(v11)
    v11.ref = v3.createRef();
    v11.onSoundChange = function(_, v13)
        local l_current_0 = v11.ref.current;
        if l_current_0 then
            if l_current_0.IsLoaded ~= v11.props.isLoaded then
                v11.props.setSoundLoaded(not l_current_0.IsLoaded);
            end;
            if v13 == "TimeLength" and l_current_0.TimeLength ~= v11.props.totalTime then
                v11.props.setSoundTotalTime(l_current_0.TimeLength);
            end;
            return ;
        else
            return ;
        end;
    end;
    v11.updateSound = function()
        local l_current_1 = v11.ref.current;
        local l_currentSoundId_0 = v11.props.currentSoundId;
        local l_isPlaying_0 = v11.props.isPlaying;
        if l_current_1 then
            local l_lastSoundId_0 = v11.lastSoundId;
            if l_currentSoundId_0 ~= 0 and l_isPlaying_0 then
                if l_currentSoundId_0 == l_lastSoundId_0 then
                    l_current_1.Playing = true;
                    return ;
                else
                    l_current_1.TimePosition = 0;
                    l_current_1.Playing = true;
                    l_current_1.SoundId = v5.constructAssetIdString(l_currentSoundId_0);
                    v11.lastSoundId = l_currentSoundId_0;
                end;
            elseif l_current_1.isPlaying then
                l_current_1.Playing = false;
                return ;
            end;
            return ;
        else
            return ;
        end;
    end;
    v11.onSoundEnded = function(_)
        v11.props.stopPreviewSound();
    end;
end;
v10.didMount = function(v20)
    v20.runServiceConnection = l_RunService_0.RenderStepped:Connect(function(v21)
        local l_current_2 = v20.ref.current;
        local l_elapsedTime_0 = v20.props.elapsedTime;
        if l_current_2 and l_current_2.Playing then
            local v24 = l_elapsedTime_0 + v21;
            local l_TimeLength_0 = l_current_2.TimeLength;
            if l_TimeLength_0 <= v24 then
                v24 = l_TimeLength_0;
            end;
            if l_elapsedTime_0 ~= v24 then
                v20.props.setSoundElapsedTime(v24);
            end;
            return ;
        else
            return ;
        end;
    end);
end;
v10.willUnmount = function(v26)
    if v26.runServiceConnection then
        v26.runServiceConnection:Disconnect();
        v26.runServiceConnection = nil;
    end;
end;
v10.render = function(v27)
    return v3.createElement("Sound", {
        [v3.Ref] = v27.ref, 
        [v3.Event.Ended] = v27.onSoundEnded, 
        [v3.Event.Changed] = v27.onSoundChange, 
        UsageContextPermission = Enum.UsageContext.Preview
    });
end;
v10.didUpdate = function(v28)
    v28.updateSound();
end;
return v4.connect(function(v29, _)
    local v31 = (v29 or {}).sound or {};
    return {
        currentSoundId = v31.currentSoundId or 0, 
        elapsedTime = v31.elapsedTime or 0, 
        isPlaying = v31.isPlaying or false
    };
end, function(v32)
    return {
        stopPreviewSound = function()
            v32(v6());
        end, 
        setSoundLoaded = function(v33)
            v32(v7(v33));
        end, 
        setSoundElapsedTime = function(v34)
            v32(v8(v34));
        end, 
        setSoundTotalTime = function(v35)
            v32(v9(v35));
        end
    };
end)(v10);
