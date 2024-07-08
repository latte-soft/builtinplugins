local _ = game:GetService("CollectionService");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("AnimationClipEditor");
local _ = require(l_script_FirstAncestor_0.Packages.Roact);
local l_Actions_0 = l_script_FirstAncestor_0.Src.Actions;
local v4 = require(l_Actions_0.SetAnimationData);
local v5 = require(l_Actions_0.SetClipboard);
local v6 = require(l_Actions_0.SetFuture);
local v7 = require(l_Actions_0.SetIKEnabled);
local v8 = require(l_Actions_0.SetIKMode);
local v9 = require(l_Actions_0.SetLegacyAnimationInstances);
local v10 = require(l_Actions_0.SetPast);
local v11 = require(l_Actions_0.SetPinnedParts);
local v12 = require(l_Actions_0.SetRootInstance);
local v13 = require(l_Actions_0.SetSelectedKeyframes);
local v14 = require(l_Actions_0.SetSelectedTrackInstances);
local v15 = require(l_Actions_0.SetShowTree);
local v16 = require(l_Actions_0.SetStartingPose);
local l_Thunks_0 = l_script_FirstAncestor_0.Src.Thunks;
local v18 = require(l_Thunks_0.AttachEditor);
local _ = require(l_Thunks_0.Exporting.LoadAnimation);
local v20 = require(l_Thunks_0.LoadLatestAnimation);
local v21 = require(l_Thunks_0.ReleaseEditor);
local v22 = require(l_Thunks_0.SortAndSetTracks);
local v23 = require(l_Thunks_0.SetSelectedTracks);
local l_Util_0 = l_script_FirstAncestor_0.Src.Util;
local v25 = require(l_Util_0.Constants);
local v26 = require(l_Util_0.RigIK);
local v27 = require(l_Util_0.RigUtils);
local v28 = require(l_script_FirstAncestor_0.LuaFlags.GetFFlagSelectFromViewport);
local v29 = require(l_script_FirstAncestor_0.LuaFlags.GetFFlagRigIK);
return function(v30, v31)
    return function(v32)
        v32:dispatch(v21(v31));
        v32:dispatch(v11({}));
        v32:dispatch(v15(false));
        v32:dispatch(v7(false));
        local v33 = nil;
        local v34 = nil;
        if not v29() then
            local v35, v36 = v27.canUseIK(v30);
            v33 = v35;
            v34 = v36;
        else
            local v37, v38 = v26.canUseIK(v30);
            v33 = v37;
            v34 = v38;
        end;
        v32:dispatch(v8(not not v34 and v25.IK_MODE.BodyPart or v25.IK_MODE.FullBody));
        v32:dispatch(v12(v30));
        if not v28() then
            v32:dispatch(v14({}));
        else
            v32:dispatch(v23({}));
        end;
        if not v33 or not v34 then
            v32:dispatch(v16(nil));
        else
            v32:dispatch(v16(if not v29() then v27.getPoseCFrames(v30) else v26.getPoseCFrames(v30)));
        end;
        local v39 = v27.getAnimSaves(v30);
        if #v39 > 0 then
            local v40 = {};
            for _, v42 in v39, nil, nil do
                if v42.isLegacyAnimSaves then
                    table.insert(v40, v42);
                end;
            end;
            if #v40 > 0 then
                v32:dispatch(v9(v40));
            else
                v32:dispatch(v20(v30, v31));
            end;
        else
            v32:dispatch(v10({}));
            v32:dispatch(v6({}));
            v32:dispatch(v13({}));
            v32:dispatch(v22({}));
            v32:dispatch(v4(nil));
        end;
        v32:dispatch(v5({}));
        v32:dispatch(v18(v31));
    end;
end;
