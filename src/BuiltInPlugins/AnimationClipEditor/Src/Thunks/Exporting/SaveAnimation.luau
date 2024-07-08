local l_CollectionService_0 = game:GetService("CollectionService");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("AnimationClipEditor");
local v2 = require(l_script_FirstAncestor_0.Src.Util.RigUtils);
local v3 = require(l_script_FirstAncestor_0.Src.Util.RigSerialization);
local v4 = require(l_script_FirstAncestor_0.Src.Util.deepCopy);
local v5 = require(l_script_FirstAncestor_0.Src.Util.AnimationData);
local v6 = require(l_script_FirstAncestor_0.Src.Util.Constants);
local v7 = require(l_script_FirstAncestor_0.Src.Actions.SetAnimationData);
local v8 = require(l_script_FirstAncestor_0.Src.Actions.SetIsDirty);
local _ = require(l_script_FirstAncestor_0.Src.Actions.SetIsLegacyAnimSaves);
local v10 = require(l_script_FirstAncestor_0.Src.Actions.SetNotification);
return function(v11, v12)
    return function(v13)
        local v14 = v13:getState();
        local l_AnimationData_0 = v14.AnimationData;
        local l_IsLegacyAnimSaves_0 = v14.Status.IsLegacyAnimSaves;
        local l_RootInstance_0 = v14.Status.RootInstance;
        if l_AnimationData_0 and l_RootInstance_0 then
            local v18 = v4(l_AnimationData_0);
            v18.Metadata.Name = v11;
            v13:dispatch(v7(v18));
            local v19, v20 = v2.getAnimSavesFolder(l_RootInstance_0, true);
            if l_IsLegacyAnimSaves_0 then
                v19 = v20;
            end;
            local v21 = nil;
            local v22 = nil;
            local v23 = nil;
            local v24 = nil;
            if not v5.isChannelAnimation(v18) then
                local v25, v26, v27, v28 = v3.toKeyframeSequence(v18, l_RootInstance_0);
                v21 = v25;
                v22 = v26;
                v23 = v27;
                v24 = v28;
            else
                local v29, v30, v31, v32 = v3.toCurveAnimation(v18, l_RootInstance_0);
                v21 = v29;
                v22 = v30;
                v23 = v31;
                v24 = v32;
            end;
            v21.Name = v18.Metadata.Name;
            if v19:FindFirstChild(v11) then
                v19[v11]:Destroy();
            end;
            v21.Parent = v19;
            for _, v34 in ipairs((l_CollectionService_0:GetTags(v21))) do
                l_CollectionService_0:RemoveTag(v21, v34);
            end;
            l_CollectionService_0:AddTag(v21, (tostring(os.time())));
            v13:dispatch(v8(false));
            v13:dispatch(v10("Saved", v11));
            v12:report("onSaveAnimation", v11, v22, v23, v24, if not v5.isChannelAnimation(v18) then v6.ANIMATION_TYPE.KeyframeSequence else v6.ANIMATION_TYPE.CurveAnimation, v21.Guid);
            return ;
        else
            return ;
        end;
    end;
end;
