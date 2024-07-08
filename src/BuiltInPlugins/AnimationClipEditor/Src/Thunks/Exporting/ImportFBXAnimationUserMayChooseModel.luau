local l_script_FirstAncestor_0 = script:FindFirstAncestor("AnimationClipEditor");
local v1 = require(l_script_FirstAncestor_0.Src.Actions.SetIsDirty);
local v2 = require(l_script_FirstAncestor_0.Src.Actions.SetIsLegacyAnimSaves);
local v3 = require(l_script_FirstAncestor_0.Src.Thunks.LoadAnimationData);
local v4 = require(l_script_FirstAncestor_0.Src.Util.AnimationData);
local v5 = require(l_script_FirstAncestor_0.Src.Util.Constants);
local _ = require(l_script_FirstAncestor_0.Src.Util.RigUtils);
local v7 = require(l_script_FirstAncestor_0.Src.Util.RigSerialization);
return function(_, v9, v10)
    return function(v11)
        local l_RootInstance_0 = v11:getState().Status.RootInstance;
        if l_RootInstance_0 then
            local function v13()
                v9:showImportAnimModelChoicePrompt();
            end;
            local l_status_0, l_result_0 = pcall(function()
                return game:GetService("AvatarImportService"):ImportFBXAnimationUserMayChooseModel(l_RootInstance_0, v13);
            end);
            if not l_status_0 then
                warn(l_result_0);
                return ;
            else
                local v16 = v7.fromKeyframeSequence(l_result_0);
                v16.Metadata.Name = v5.DEFAULT_IMPORTED_NAME;
                v4.clearTrackSequences(v16);
                v11:dispatch(v3(v16, v10));
                v11:dispatch(v1(false));
                v11:dispatch(v2(false));
                if l_result_0 then
                    l_result_0:Destroy();
                end;
                v10:report("onImportFbxAnimation", if not v16.Metadata then nil else v16.Metadata.Guid);
                return ;
            end;
        else
            return ;
        end;
    end;
end;
