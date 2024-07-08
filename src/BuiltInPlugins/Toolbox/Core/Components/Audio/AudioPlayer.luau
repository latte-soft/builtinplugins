local l_script_FirstAncestor_0 = script:FindFirstAncestor("Toolbox");
local l_RunService_0 = game:GetService("RunService");
local l_Packages_0 = l_script_FirstAncestor_0.Packages;
local v3 = require(l_Packages_0.Roact);
local l_ContextServices_0 = require(l_Packages_0.Framework).ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local v6 = require(l_script_FirstAncestor_0.Core.Util.Urls);
game:DefineFastFlag("StudioAudioPermissionFix", false);
local v7 = require(l_script_FirstAncestor_0.Core.Util.SharedFlags.getFFlagUseBindingsForAudioPlayhead);
local v8 = v3.PureComponent:extend("AudioPlayer");
v8.init = function(v9, v10)
    v9.frameRef = v3.createRef();
    v9.audioRef = v3.createRef();
    if v7() then
        local v11, v12 = v3.createBinding(0);
        v9.elapsedTime = v11;
        v9.updateElapsedTime = v12;
    end;
    v9.state = {
        isLoaded = false, 
        elapsedTime = 0, 
        totalTime = 0
    };
    v9.onSoundChange = function(_, v14)
        if v9.isMounted and v9.audioRef.current then
            if (v7() and (not (v14 ~= "Playing") or v14 == "TimePosition")) and v9.audioRef.current.TimePosition ~= v9.elapsedTime:getValue() then
                v9.updateElapsedTime(v9.audioRef.current.TimePosition);
            end;
            v9:setState(function(v15)
                local v16 = {
                    isLoaded = v9.audioRef.current.IsLoaded
                };
                if v14 == "TimeLength" and v9.audioRef.current.TimeLength ~= v15.totalTime then
                    v16.totalTime = v9.audioRef.current.TimeLength;
                end;
                if (not v7() and (not (v14 ~= "Playing") or v14 == "TimePosition")) and v9.audioRef.current.TimePosition ~= v15.elapsedTime then
                    v16.elapsedTime = v9.audioRef.current.TimePosition;
                end;
                return v16;
            end);
            return ;
        else
            return ;
        end;
    end;
    v9.calculateTimePosition = function(v17)
        local l_current_0 = v9.frameRef.current;
        return (math.clamp((v17.Position.X - l_current_0.AbsolutePosition.X) / l_current_0.AbsoluteSize.X, 0, 1));
    end;
    v9.handleIndicatorEvent = function(_, v20)
        if v20.UserInputType == Enum.UserInputType.MouseButton1 then
            v9.indicatorPressed = true;
        end;
    end;
    v9.updateTimePosition = function(v21)
        v9.audioRef.current.TimePosition = v9.state.totalTime * v21;
    end;
    v9.onSoundEnded = function()
        if v10.OnEnded then
            v10.OnEnded();
        end;
    end;
    v9.getCurrentTimeProgress = function(v22)
        return v9.state.indicatorPosition or (v9.state.totalTime ~= 0 and v22 / v9.state.totalTime or 0);
    end;
end;
v8.didMount = function(v23)
    v23.isMounted = true;
    v23.runServiceConnection = l_RunService_0.RenderStepped:Connect(function(v24)
        if not (not v23.isMounted or not v23.audioRef.current) and v23.audioRef.current.IsPlaying then
            if not v7() then
                v23:setState(function(v25)
                    return {
                        elapsedTime = math.min(v25.elapsedTime + v24, v23.audioRef.current.TimeLength)
                    };
                end);
                return ;
            else
                v23.updateElapsedTime((math.min(v23.elapsedTime:getValue() + v24, v23.audioRef.current.TimeLength)));
                return ;
            end;
        else
            return ;
        end;
    end);
end;
v8.willUnmount = function(v26)
    v26.isMounted = false;
    if v26.runServiceConnection then
        v26.runServiceConnection:Disconnect();
        v26.runServiceConnection = nil;
    end;
end;
v8.render = function(v27)
    local l_props_0 = v27.props;
    local l_state_0 = v27.state;
    local l_isLoaded_0 = l_state_0.isLoaded;
    local l_IsPlaying_0 = l_props_0.IsPlaying;
    local l_SoundId_0 = l_props_0.SoundId;
    local l_totalTime_0 = l_state_0.totalTime;
    local l_elapsedTime_0 = l_state_0.elapsedTime;
    local v35 = 0;
    if not v7() then
        v35 = l_state_0.indicatorPosition or if l_totalTime_0 ~= 0 then l_elapsedTime_0 / l_totalTime_0 else 0;
    end;
    local l_audioPlayer_0 = l_props_0.Stylizer.audioPlayer;
    local v38 = if not v7() then nil else v27.elapsedTime:map(function(v37)
        return UDim2.new(v27.getCurrentTimeProgress(v37), 0, 1, 0);
    end);
    local v40 = if not v7() then nil else v27.elapsedTime:map(function(v39)
        return UDim2.new(v27.getCurrentTimeProgress(v39), 0, 0.5, 0);
    end);
    return v3.createElement("Frame", {
        Size = UDim2.new(1, 0, 0, 4), 
        BackgroundColor3 = l_audioPlayer_0.backgroundColor, 
        [v3.Ref] = v27.frameRef
    }, {
        Button = v3.createElement("ImageButton", {
            BackgroundTransparency = 1, 
            Size = UDim2.new(1, 0, 0, 12), 
            AnchorPoint = Vector2.new(0, 0.5), 
            Position = UDim2.new(0, 0, 0.5, 0), 
            [v3.Event.InputChanged] = function(_, v42)
                if not (not (v42.UserInputType == Enum.UserInputType.MouseMovement) or not v27.indicatorPressed) then
                    v27:setState({
                        indicatorPosition = v27.calculateTimePosition(v42)
                    });
                end;
            end, 
            [v3.Event.InputEnded] = function(_, v44)
                if v44.UserInputType == Enum.UserInputType.MouseButton1 then
                    v27.updateTimePosition(v27.calculateTimePosition(v44));
                    v27.indicatorPressed = false;
                    v27:setState({
                        indicatorPosition = v3.None
                    });
                end;
            end
        }), 
        ProgressBar = v3.createElement("Frame", {
            BackgroundColor3 = l_audioPlayer_0.progressBarColor, 
            Size = if not v7() then UDim2.new(v35, 0, 1, 0) else v38, 
            ZIndex = 1
        }, v3.createElement("UICorner", {
            CornerRadius = UDim.new(0, 4)
        })), 
        ProgressIndicator = v3.createElement("Frame", {
            BackgroundColor3 = l_audioPlayer_0.indicatorColor, 
            Size = UDim2.new(0, 12, 0, 12), 
            AnchorPoint = Vector2.new(0.5, 0.5), 
            Position = if not v7() then UDim2.new(v35, 0, 0.5, 0) else v40, 
            ZIndex = 3, 
            [v3.Event.InputBegan] = function(_, v46)
                if v46.UserInputType == Enum.UserInputType.MouseButton1 then
                    v27.indicatorPressed = true;
                end;
            end
        }, {
            CornerRadius = v3.createElement("UICorner", {
                CornerRadius = UDim.new(0, 12)
            })
        }), 
        ProgressIndicatorBorder = v3.createElement("Frame", {
            BackgroundColor3 = l_audioPlayer_0.indicatorBorderColor, 
            Size = UDim2.new(0, 14, 0, 14), 
            AnchorPoint = Vector2.new(0.5, 0.5), 
            Position = if not v7() then UDim2.new(v35, 0, 0.5, 0) else v40, 
            ZIndex = 2
        }, {
            UICorner = v3.createElement("UICorner", {
                CornerRadius = UDim.new(0, 14)
            })
        }), 
        UICorner = v3.createElement("UICorner", {
            CornerRadius = UDim.new(4, 4)
        }), 
        Sound = v3.createElement("Sound", {
            [v3.Ref] = v27.audioRef, 
            [v3.Event.Changed] = v27.onSoundChange, 
            [v3.Event.Ended] = v27.onSoundEnded, 
            SoundId = v6.constructAssetIdString(l_SoundId_0), 
            Playing = (not l_state_0.indicatorPosition and l_isLoaded_0) and l_IsPlaying_0, 
            UsageContextPermission = if not game:GetFastFlag("StudioAudioPermissionFix") then nil else Enum.UsageContext.Preview
        })
    });
end;
return (l_withContext_0({
    Stylizer = l_ContextServices_0.Stylizer
})(v8));
