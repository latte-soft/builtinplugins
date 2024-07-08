local l_script_FirstAncestor_0 = script:FindFirstAncestor("AnimationClipEditor");
local v1 = require(l_script_FirstAncestor_0.Packages.Cryo);
local v2 = require(l_script_FirstAncestor_0.Src.Util.SkeletonUtils);
local _ = require(l_script_FirstAncestor_0.Src.Util.RigUtils);
local v4 = require(l_script_FirstAncestor_0.Src.Util.RigInfo);
local v5 = require(l_script_FirstAncestor_0.Src.Util.FacsUtils);
local v6 = require(l_script_FirstAncestor_0.LuaFlags.GetFFlagSelectFromViewport);
local v7 = require(l_script_FirstAncestor_0.Src.Actions.SetTracks);
local function v8(v9, v10)
    v9.Depth = v10;
    local l_pairs_0 = pairs;
    local v12 = v9.Components or {};
    for _, v14 in l_pairs_0(v12) do
        v8(v14, v10 + 1);
    end;
end;
local function v15(v16, v17, v18)
    local v19 = v1.Dictionary.keys(v16);
    table.sort(v19);
    for _, v21 in ipairs(v19) do
        local v22 = v16[v21];
        if not v17(v21, v18) then
            v15(v22, v17, v18);
        else
            v15(v22, v17, v18 + 1);
        end;
    end;
end;
local _ = function(v23, v24)
    local v25 = {};
    v15(v24, function(v26, v27)
        for _, v29 in ipairs(v23) do
            if v29.Name == v26 then
                v8(v29, v27);
                table.insert(v25, v29);
                return true;
            end;
        end;
    end, 0);
    return v25;
end;
local function v36(v31)
    table.sort(v31, function(v32, v33)
        return v32.Name < v33.Name;
    end);
    for _, v35 in ipairs(v31) do
        v8(v35, 0);
    end;
    return v31;
end;
return function(v37)
    return function(v38)
        local l_RootInstance_0 = v38:getState().Status.RootInstance;
        local v40 = nil;
        local v41 = nil;
        local v42 = {};
        if l_RootInstance_0 and (not (typeof(l_RootInstance_0) ~= "Instance") or not v6() and type(l_RootInstance_0) == "table") then
            if not v6() and (not (l_RootInstance_0.ClassName ~= "Skeleton") or l_RootInstance_0.ClassName == "MockSkeleton") then
                local v43 = nil;
                local v44 = nil;
                if l_RootInstance_0.ClassName == "Skeleton" then
                    local l_l_RootInstance_0_Bones_0 = l_RootInstance_0:GetBones();
                    v43 = l_l_RootInstance_0_Bones_0.Names;
                    v44 = l_l_RootInstance_0_Bones_0.Parents;
                else
                    v43 = l_RootInstance_0.Names;
                    v44 = l_RootInstance_0.Parents;
                end;
                v41 = v2.buildSkeletonHierarchy(v43, v44);
                v42 = v2.getUnusedSkeletonTracks(v43, v37);
            elseif not (not (l_RootInstance_0.ClassName == "Model" and l_RootInstance_0:FindFirstChildOfClass("Humanoid")) and not l_RootInstance_0:FindFirstChildOfClass("AnimationController")) then
                v41 = v4.buildRigHierarchy(l_RootInstance_0);
                v42 = v4.getUnusedRigTracks(l_RootInstance_0, v37);
            end;
        end;
        if not v41 then
            v40 = v36(v37);
        else
            local l_v37_0 = v37;
            local l_v41_0 = v41;
            local v48 = {};
            v15(l_v41_0, function(v49, v50)
                for _, v52 in ipairs(l_v37_0) do
                    if v52.Name == v49 then
                        v8(v52, v50);
                        table.insert(v48, v52);
                        return true;
                    end;
                end;
            end, 0);
            v40 = v1.List.join(v48, (v36((v5.filterFacsTracks(v37)))));
        end;
        v38:dispatch(v7(v40, v42, (v5.getUnusedFacs(v37))));
    end;
end;
