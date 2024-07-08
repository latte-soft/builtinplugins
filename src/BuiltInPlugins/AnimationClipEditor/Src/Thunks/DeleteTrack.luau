local l_script_FirstAncestor_0 = script:FindFirstAncestor("AnimationClipEditor");
local v1 = require(l_script_FirstAncestor_0.Packages.Cryo);
local v2 = require(l_script_FirstAncestor_0.Src.Util.deepCopy);
local v3 = require(l_script_FirstAncestor_0.Src.Util.isEmpty);
local v4 = require(l_script_FirstAncestor_0.Src.Thunks.SortAndSetTracks);
local v5 = require(l_script_FirstAncestor_0.Src.Actions.SetSelectedKeyframes);
local v6 = require(l_script_FirstAncestor_0.Src.Actions.SetSelectedTracks);
local v7 = require(l_script_FirstAncestor_0.Src.Thunks.SetSelectedTracks);
local v8 = require(l_script_FirstAncestor_0.Src.Thunks.UpdateAnimationData);
local v9 = require(l_script_FirstAncestor_0.LuaFlags.GetFFlagSelectFromViewport);
return function(v10, v11)
    return function(v12)
        local v13 = v12:getState();
        local l_Status_0 = v13.Status;
        local l_Tracks_0 = l_Status_0.Tracks;
        local l_SelectedTracks_0 = l_Status_0.SelectedTracks;
        local l_RootInstance_0 = l_Status_0.RootInstance;
        local l_EditorMode_0 = l_Status_0.EditorMode;
        if l_RootInstance_0 == nil then
            return ;
        else
            local v19 = nil;
            for v20, v21 in ipairs(l_Tracks_0) do
                if v21.Name == v10 then
                    v19 = v20;
                end;
            end;
            if l_SelectedTracks_0 then
                for v22, v23 in ipairs(l_SelectedTracks_0) do
                    if v10 == v23[1] then
                        table.remove(l_SelectedTracks_0, v22);
                        break;
                    end;
                end;
                if not v9() then
                    v12:dispatch(v6(v1.Dictionary.join(l_SelectedTracks_0)));
                else
                    v12:dispatch(v7(v1.Dictionary.join(l_SelectedTracks_0)));
                end;
            end;
            if v19 then
                v12:dispatch(v4((v1.List.removeIndex(l_Tracks_0, v19))));
                local l_AnimationData_0 = v13.AnimationData;
                if l_AnimationData_0 then
                    for v25, v26 in pairs(l_AnimationData_0.Instances) do
                        for v27, _ in pairs(v26.Tracks) do
                            if v27 == v10 then
                                local v29 = v27.Keyframes and not v3(v27.Keyframes);
                                local v30 = v2(l_AnimationData_0);
                                v30.Instances[v25].Tracks[v27] = nil;
                                v12:dispatch(v8(v30));
                                v12:dispatch(v5({}));
                                v11:report("onTrackDeleted", v10, v29, l_EditorMode_0, if not l_AnimationData_0.Metadata then nil else l_AnimationData_0.Metadata.Guid);
                                return ;
                            end;
                        end;
                    end;
                else
                    return ;
                end;
            end;
            return ;
        end;
    end;
end;
