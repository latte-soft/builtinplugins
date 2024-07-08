local l_script_FirstAncestor_0 = script:FindFirstAncestor("AnimationClipEditor");
local v1 = require(l_script_FirstAncestor_0.Src.Util.RigUtils);
local v2 = require(l_script_FirstAncestor_0.Src.Util.RigSerialization);
local v3 = require(l_script_FirstAncestor_0.Src.Util.Constants);
local v4 = require(l_script_FirstAncestor_0.Src.Thunks.LoadAnimationData);
local v5 = require(l_script_FirstAncestor_0.Src.Actions.SetNotification);
local v6 = require(l_script_FirstAncestor_0.Src.Actions.SetIsDirty);
local v7 = require(l_script_FirstAncestor_0.Src.Actions.SetIsLegacyAnimSaves);
local v8 = require(l_script_FirstAncestor_0.Src.Actions.SetFrameRate);
local v9 = require(l_script_FirstAncestor_0.Src.Util.AnimationData);
return function(v10, v11, v12)
    return function(v13)
        local l_RootInstance_0 = v13:getState().Status.RootInstance;
        if l_RootInstance_0 then
            local v15, v16 = v1.getAnimSavesFolder(l_RootInstance_0);
            if v11 then
                v15 = v16;
            end;
            if v15 then
                local l_v15_FirstChild_0 = v15:FindFirstChild(v10);
                if l_v15_FirstChild_0 then
                    local v18 = nil;
                    local v19 = nil;
                    local v20 = nil;
                    local v21 = nil;
                    local v22 = nil;
                    if not l_v15_FirstChild_0:IsA("KeyframeSequence") then
                        if not l_v15_FirstChild_0:IsA("CurveAnimation") then
                            return ;
                        else
                            local v23, v24, v25, v26 = v2.fromCurveAnimation(l_v15_FirstChild_0);
                            v18 = v23;
                            v19 = v24;
                            v20 = v25;
                            v21 = v26;
                            v22 = v3.DEFAULT_FRAMERATE;
                        end;
                    else
                        local v27, v28, v29, v30, v31 = v2.fromKeyframeSequence(l_v15_FirstChild_0);
                        v18 = v27;
                        v22 = v28;
                        v19 = v29;
                        v20 = v30;
                        v21 = v31;
                    end;
                    v13:dispatch(v4(v18, v12));
                    v13:dispatch(v5("Loaded", v10));
                    v13:dispatch(v6(false));
                    v13:dispatch(v8(v22));
                    v13:dispatch(v7(v11));
                    v12:report("onLoadAnimation", v10, v19, v20, v21, if not v9.isChannelAnimation(v18) then v3.ANIMATION_TYPE.KeyframeSequence else v3.ANIMATION_TYPE.CurveAnimation, if not v18.Metadata then nil else v18.Metadata.Guid);
                    return ;
                else
                    return ;
                end;
            else
                return ;
            end;
        else
            return ;
        end;
    end;
end;
