local l_script_FirstAncestor_0 = script:FindFirstAncestor("AnimationClipEditor");
local v1 = require(l_script_FirstAncestor_0.Src.Util.RigInfo);
local v2 = require(l_script_FirstAncestor_0.Src.Util.Constants);
local v3 = require(l_script_FirstAncestor_0.LuaFlags.GetFFlagAnimationConstraints);
local v4 = {};
local function v21(v5)
    local v6 = v1.getMotors(v5);
    local v7 = v1.getBones(v5);
    local v8 = {};
    local v9 = {};
    local v10 = {};
    for _, v12 in v6, nil, nil do
        if v12.Part0 then
            v8[v12.Part0] = true;
        end;
        if v12.Part1 then
            v8[v12.Part1] = true;
        end;
    end;
    if v3() then
        for _, v14 in (v1.getAnimationConstraints(v5)), nil, nil do
            local v15 = v1.getPart0(v14);
            local v16 = v1.getPart1(v14);
            if v15 then
                v8[v15] = true;
            end;
            if v16 then
                v8[v16] = true;
            end;
        end;
    end;
    for v17, _ in v8, nil, nil do
        if not v9[v17.Name] then
            v9[v17.Name] = true;
        else
            return {
                {
                    ID = v2.RIG_ERRORS.NameCollision
                }
            };
        end;
    end;
    for _, v20 in v7, nil, nil do
        if not v10[v20.Name] then
            v10[v20.Name] = true;
        else
            return {
                {
                    ID = v2.RIG_ERRORS.BoneNameCollision
                }
            };
        end;
    end;
    return {};
end;
local function v33(v22)
    local l_motors_0 = v22.motors;
    local l_motorsWithMissingPart0_0 = v22.motorsWithMissingPart0;
    local l_motorsWithMissingPart1_0 = v22.motorsWithMissingPart1;
    local l_partsWithMultipleParents_0 = v22.partsWithMultipleParents;
    local l_rig_0 = v22.rig;
    local l_motorsMap_0 = v22.motorsMap;
    for _, v30 in pairs(l_motors_0) do
        local l_Part0_0 = v30.Part0;
        local l_Part1_0 = v30.Part1;
        if not l_Part0_0 or l_Part0_0 and l_Part0_0.Parent == nil then
            table.insert(l_motorsWithMissingPart0_0, v30);
        end;
        if not l_Part1_0 or l_Part1_0 and l_Part1_0.Parent == nil then
            table.insert(l_motorsWithMissingPart1_0, v30);
        end;
        if not ((not l_Part0_0 or not l_Part1_0) or l_Part0_0.Anchored and l_Part1_0.Anchored) then
            v22.unanchoredPartExists = true;
        end;
        if not (((not l_Part0_0 or not l_Part1_0) or not l_rig_0:FindFirstChild(l_Part0_0.Name, true)) or not l_rig_0:FindFirstChild(l_Part1_0.Name, true)) then
            if not l_motorsMap_0[l_Part1_0] then
                l_motorsMap_0[l_Part1_0] = v30;
            else
                table.insert(l_partsWithMultipleParents_0, l_Part1_0);
            end;
        end;
    end;
end;
local function v45(v34)
    local l_animConstraints_0 = v34.animConstraints;
    local l_animConstraintsWithMissingAttachment0_0 = v34.animConstraintsWithMissingAttachment0;
    local l_animConstraintsWithMissingAttachment1_0 = v34.animConstraintsWithMissingAttachment1;
    local l_partsWithMultipleParents_1 = v34.partsWithMultipleParents;
    local l_rig_1 = v34.rig;
    local l_animConstraintsMap_0 = v34.animConstraintsMap;
    for _, v42 in l_animConstraints_0, nil, nil do
        local v43 = v1.getPart0(v42);
        local v44 = v1.getPart1(v42);
        if not (v43 and v43.Parent) then
            table.insert(l_animConstraintsWithMissingAttachment0_0, v42);
        end;
        if not (v44 and v44.Parent) then
            table.insert(l_animConstraintsWithMissingAttachment1_0, v42);
        end;
        if not ((not v43 or not v44) or v43.Anchored and v44.Anchored) then
            v34.unanchoredPartExists = true;
        end;
        if not (((not v43 or not v44) or not l_rig_1:FindFirstChild(v43.Name, true)) or not l_rig_1:FindFirstChild(v44.Name, true)) then
            if not l_animConstraintsMap_0[v44] then
                l_animConstraintsMap_0[v44] = v42;
            else
                table.insert(l_partsWithMultipleParents_1, v44);
            end;
        end;
    end;
end;
local function v53(v46)
    local l_parts_0 = v46.parts;
    local l_root_0 = v46.root;
    if l_root_0 then
        for _, v50 in ipairs(l_parts_0) do
            if v50.Name == l_root_0.Name and v50 ~= l_root_0 then
                table.insert(v46.errorList, {
                    ID = v2.RIG_ERRORS.NameCollision
                });
                return ;
            else
                for _, v52 in ipairs(l_parts_0) do
                    if v50 ~= v52 and v50.Name == v52.Name then
                        table.insert(v46.errorList, {
                            ID = v2.RIG_ERRORS.NameCollision
                        });
                        break;
                    end;
                end;
            end;
        end;
        return ;
    else
        return ;
    end;
end;
local function v66(v54, v55)
    for v56, v57 in pairs(v54) do
        local l_Part0_1 = v57.Part0;
        if not (not l_Part0_1 or not v56) and l_Part0_1 == v56 then
            return true;
        else
            local v59 = {};
            while l_Part0_1 ~= nil and l_Part0_1 ~= game.Workspace do
                local v60 = v54[l_Part0_1];
                if not v60 then
                    break;
                else
                    l_Part0_1 = v60.Part0;
                    if not v3() then
                        if v59[v60] then
                            return true;
                        else
                            v59[v60] = {};
                        end;
                    elseif not v59[v60] then
                        v59[v60] = true;
                    else
                        return true;
                    end;
                end;
            end;
        end;
    end;
    if v3() then
        for v61, v62 in pairs(v55) do
            local v63 = v1.getPart0(v62);
            if not (not v63 or not v61) and v63 == v61 then
                return true;
            else
                local v64 = {};
                while v63 ~= nil and v63 ~= game.Workspace do
                    local v65 = v55[v63];
                    if not v65 then
                        break;
                    else
                        v63 = v1.getPart0(v65);
                        if not v64[v65] then
                            v64[v65] = true;
                        else
                            return true;
                        end;
                    end;
                end;
            end;
        end;
    end;
    return false;
end;
local function v89(v67)
    local l_bones_0 = v67.bones;
    local l_motors_1 = v67.motors;
    local l_animConstraints_1 = v67.animConstraints;
    local l_unanchoredPartExists_0 = v67.unanchoredPartExists;
    local l_motorsWithMissingPart0_1 = v67.motorsWithMissingPart0;
    local l_motorsWithMissingPart1_1 = v67.motorsWithMissingPart1;
    local l_partsWithMultipleParents_2 = v67.partsWithMultipleParents;
    local l_rig_2 = v67.rig;
    local l_motorsMap_1 = v67.motorsMap;
    local l_animConstraintsMap_1 = v67.animConstraintsMap;
    local l_animConstraintsWithMissingAttachment0_1 = v67.animConstraintsWithMissingAttachment0;
    local l_animConstraintsWithMissingAttachment1_1 = v67.animConstraintsWithMissingAttachment1;
    local l_errorList_0 = v67.errorList;
    local l_root_1 = v67.root;
    local v82 = false;
    if l_bones_0 ~= nil then
        v82 = #l_bones_0 > 0;
    end;
    if not (not ((#l_motors_1 == 0 and (not v3() or #l_animConstraints_1 == 0)) and not v82) and l_root_1) then
        table.insert(l_errorList_0, {
            ID = v2.RIG_ERRORS.NoMotors
        });
    end;
    if not (l_unanchoredPartExists_0 or v82) then
        table.insert(l_errorList_0, {
            ID = v2.RIG_ERRORS.PartsAnchored
        });
    end;
    if #l_partsWithMultipleParents_2 > 0 then
        table.insert(l_errorList_0, {
            ID = v2.RIG_ERRORS.MultipleParents, 
            Data = l_partsWithMultipleParents_2
        });
    end;
    if #l_motorsWithMissingPart0_1 > 0 then
        table.insert(l_errorList_0, {
            ID = v2.RIG_ERRORS.MissingPart0, 
            Data = l_motorsWithMissingPart0_1
        });
    end;
    if #l_motorsWithMissingPart1_1 > 0 then
        table.insert(l_errorList_0, {
            ID = v2.RIG_ERRORS.MissingPart1, 
            Data = l_motorsWithMissingPart1_1
        });
    end;
    if v3() then
        if #l_animConstraintsWithMissingAttachment0_1 > 0 then
            table.insert(l_errorList_0, {
                ID = v2.RIG_ERRORS.MissingPart0, 
                Data = l_animConstraintsWithMissingAttachment0_1
            });
        end;
        if #l_animConstraintsWithMissingAttachment1_1 > 0 then
            table.insert(l_errorList_0, {
                ID = v2.RIG_ERRORS.MissingPart1, 
                Data = l_animConstraintsWithMissingAttachment1_1
            });
        end;
    end;
    if v66(l_motorsMap_1, l_animConstraintsMap_1) then
        table.insert(l_errorList_0, {
            ID = v2.RIG_ERRORS.CircularRig
        });
    end;
    if v1.getAnimator(l_rig_2) == nil then
        table.insert(l_errorList_0, {
            ID = v2.RIG_ERRORS.NoAnimationController
        });
    end;
    local _, v84 = v1.getFaceControls(l_rig_2);
    local _ = require(l_script_FirstAncestor_0.Src.Util.Debug.dumpTable);
    if #v84 > 1 then
        table.insert(l_errorList_0, {
            ID = v2.RIG_ERRORS.MultipleFaceControls, 
            Data = v84
        });
    end;
    local v86 = {};
    for _, v88 in v84, nil, nil do
        if not (not v88.Parent or v88.Parent:IsA("BasePart")) then
            table.insert(v86, v88);
        end;
    end;
    if #v86 > 0 then
        table.insert(l_errorList_0, {
            ID = v2.RIG_ERRORS.FaceControlsParent, 
            Data = v86
        });
    end;
end;
v4.rigHasErrors = function(v90)
    v1.clearCache();
    local v91 = v21(v90);
    if #v91 > 0 then
        return true, v91;
    else
        local v92 = {
            errorList = {}, 
            motorsMap = {}, 
            partsWithMultipleParents = {}, 
            motorsWithMissingPart0 = {}, 
            motorsWithMissingPart1 = {}, 
            unanchoredPartExists = false, 
            motors = v1.getMotors(v90), 
            parts = v1.getRigInfo(v90).Parts, 
            root = v1.findRootPart(v90), 
            bones = v1.getBones(v90), 
            animConstraints = if not v3() then {} else v1.getAnimationConstraints(v90), 
            animConstraintsMap = {}, 
            animConstraintsWithMissingAttachment0 = {}, 
            animConstraintsWithMissingAttachment1 = {}, 
            rig = v90
        };
        v33(v92);
        if v3() then
            v45(v92);
        end;
        v53(v92);
        v89(v92);
        return #v92.errorList > 0, v92.errorList;
    end;
end;
return v4;
