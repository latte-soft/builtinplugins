local l_script_FirstAncestor_0 = script:FindFirstAncestor("AnimationClipEditor");
local v1 = require(l_script_FirstAncestor_0.Packages.Cryo);
local v2 = require(l_script_FirstAncestor_0.Src.Util.deepCopy);
local v3 = require(l_script_FirstAncestor_0.Src.Util.AnimationData);
local v4 = require(l_script_FirstAncestor_0.Src.Thunks.UpdateAnimationData);
local v5 = require(l_script_FirstAncestor_0.Src.Thunks.AddTrack);
local _ = require(l_script_FirstAncestor_0.Src.Types);
local v7 = require(l_script_FirstAncestor_0.Src.Actions.SetNotification);
return function(v8, v9)
    return function(v10)
        local v11 = v10:getState();
        local l_Clipboard_0 = v11.Status.Clipboard;
        local l_AnimationData_0 = v11.AnimationData;
        local l_EditorMode_0 = v11.EditorMode;
        if l_AnimationData_0 and l_Clipboard_0 then
            local v15 = v2(l_AnimationData_0);
            local v16 = v3.isChannelAnimation(v15);
            local v17 = nil;
            for _, v19 in pairs(l_Clipboard_0) do
                for _, v21 in pairs(v19) do
                    for v22, _ in pairs(v21.Data) do
                        v17 = not not v17 and math.min(v17, v22) or v22;
                    end;
                end;
            end;
            for v24, v25 in pairs(l_Clipboard_0) do
                local v26 = v15.Instances[v24];
                for _, v28 in ipairs(v25) do
                    local v29 = v1.List.join({
                        v28.TopTrackName
                    }, v28.RelPath);
                    if v3.getTrack(v15, v24, {
                        v28.TopTrackName
                    }) == nil then
                        v3.addTrack(v26.Tracks, v28.TopTrackName, v28.TopTrackType, v16, v28.RotationType, v28.EulerAnglesOrder);
                        v10:dispatch(v5(v24, v28.TopTrackName, v28.TopTrackType, v28.RotationType, v28.EulerAnglesOrder, v9));
                    end;
                    local v30 = v3.getTrack(v15, v24, v29);
                    if v30 and v30.Type == v28.Type then
                        for v31, v32 in pairs(v28.Data) do
                            v3.addKeyframe(v30, v8 + (v31 - v17), v32);
                            v9:report("onAddKeyframe", v28.TopTrackName, l_EditorMode_0, if not v15.Metadata then nil else v15.Metadata.Guid);
                        end;
                    else
                        v10:dispatch(v7("CannotPasteError", true));
                    end;
                end;
            end;
            v10:dispatch(v4(v15));
            return ;
        else
            return ;
        end;
    end;
end;
