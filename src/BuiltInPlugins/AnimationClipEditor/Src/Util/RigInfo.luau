local l_script_FirstAncestor_0 = script:FindFirstAncestor("AnimationClipEditor");
local v1 = require(l_script_FirstAncestor_0.Src.Util.buildHierarchy);
local v2 = require(l_script_FirstAncestor_0.Src.Util.Constants);
local v3 = require(l_script_FirstAncestor_0.LuaFlags.GetFFlagAnimationConstraints);
local v4 = require(l_script_FirstAncestor_0.LuaFlags.GetFFlagForceR6HumanoidRootPart);
local v5 = game:DefineFastFlag("ACEPrimaryPartPriority", false);
local v6 = {
    Cache = {
        CacheRig = nil, 
        CacheData = nil
    }, 
    FaceControlsCache = {
        CacheRig = nil, 
        CacheData = nil
    }
};
local function v7(v8, v9)
    local v10 = false;
    if v9.Name == "AnimSaves" then
        v10 = v9:IsA("Model") or v9:IsA("ObjectValue");
    end;
    if not v10 then
        for _, v12 in ipairs(v9:GetChildren()) do
            table.insert(v8, v12);
            v7(v8, v12);
        end;
    end;
    return v8;
end;
v6.getTemporaryConstraints = function()
    return Workspace:FindFirstChild(v2.TEMPORARY_CONSTRAINTS);
end;
v6.usingTemporaryConstraints = function()
    return v6.getTemporaryConstraints() ~= nil;
end;
v6.getConstraints = function(v13)
    local v14 = {};
    for _, v16 in ipairs((v7({}, v6.getTemporaryConstraints() or v13))) do
        if not (not v16:IsA("BallSocketConstraint") and not v16:IsA("HingeConstraint")) then
            table.insert(v14, v16);
        end;
    end;
    return v14;
end;
v6.buildRigHierarchy = function(v17)
    local v18 = v6.findRootPart(v17);
    local v19 = v6.getMotors(v17);
    local v20 = v6.getBones(v17);
    local v21 = if not v3() then {} else v6.getAnimationConstraints(v17);
    assert(v18, "Rig is missing a root part.");
    local l_Name_0 = v18.Name;
    return {
        [l_Name_0] = v1(l_Name_0, function(v23)
            local v24 = {};
            for _, v26 in ipairs(v19) do
                if v26.Part0.Name == v23 then
                    table.insert(v24, v26.Part1.Name);
                end;
            end;
            if v3() then
                for _, v28 in ipairs(v21) do
                    local v29 = v6.getPart0(v28);
                    local v30 = v6.getPart1(v28);
                    if not (not v29 or not v30) and v29.Name == v23 then
                        table.insert(v24, v30.Name);
                    end;
                end;
            end;
            for _, v32 in ipairs(v20) do
                if v32.Parent.Name == v23 then
                    table.insert(v24, v32.Name);
                end;
            end;
            return v24;
        end)
    };
end;
v6.isR15Humanoid = function(v33)
    local l_Humanoid_0 = v33:FindFirstChildOfClass("Humanoid");
    if (not l_Humanoid_0 or not l_Humanoid_0:IsA("Humanoid")) or l_Humanoid_0.RigType ~= Enum.HumanoidRigType.R15 then
        return false;
    else
        local l_Parent_0 = l_Humanoid_0.Parent;
        if l_Parent_0 and l_Parent_0:IsA("Model") then
            return true;
        else
            return false;
        end;
    end;
end;
v6.isR6Humanoid = function(v36)
    local l_Humanoid_1 = v36:FindFirstChildOfClass("Humanoid");
    if (not l_Humanoid_1 or not l_Humanoid_1:IsA("Humanoid")) or l_Humanoid_1.RigType ~= Enum.HumanoidRigType.R6 then
        return false;
    else
        local l_Parent_1 = l_Humanoid_1.Parent;
        if l_Parent_1 and l_Parent_1:IsA("Model") then
            return true;
        else
            return false;
        end;
    end;
end;
v6.findRootPart = function(v39)
    if not v5 then
        local l_HumanoidRootPart_0 = v39:FindFirstChild("HumanoidRootPart");
        if not l_HumanoidRootPart_0 then
            if v39.PrimaryPart then
                return v39.PrimaryPart;
            end;
        else
            return l_HumanoidRootPart_0;
        end;
    else
        local v41 = nil;
        v41 = if not not v4() and v6.isR6Humanoid(v39) then v39:FindFirstChild("HumanoidRootPart") or v39.PrimaryPart else v39.PrimaryPart or v39:FindFirstChild("HumanoidRootPart");
        if v41 then
            return v41;
        end;
    end;
    local v42 = v6.getRigInfo(v39);
    local l_PartNameToMotor_0 = v42.PartNameToMotor;
    local l_PartNameToAnimConstraint_0 = v42.PartNameToAnimConstraint;
    local l_BoneNameToBone_0 = v42.BoneNameToBone;
    local v46 = nil;
    local v47 = next(l_PartNameToMotor_0 or {});
    if v47 then
        while not v46 do
            local v48 = l_PartNameToMotor_0[v47];
            if not v48 or not v48.Part0 then
                v46 = v47;
            else
                v47 = v48.Part0.Name;
            end;
        end;
    end;
    if not (not v3() and v46) then
        local v49 = next(l_BoneNameToBone_0 or {});
        if v49 then
            while not v46 do
                local v50 = l_BoneNameToBone_0[v49];
                if not v50 then
                    v46 = v49;
                else
                    v49 = v50.Parent.Name;
                end;
            end;
        end;
    end;
    if not (not v3() or not l_PartNameToAnimConstraint_0) then
        local v51 = next(l_PartNameToAnimConstraint_0);
        if v51 then
            while not v46 do
                local v52 = v6.getPart0(l_PartNameToAnimConstraint_0[v51]);
                if not v52 then
                    v46 = v51;
                else
                    v51 = v52.Name;
                end;
            end;
        end;
    end;
    for _, v54 in ipairs((v7({}, v39))) do
        if not (not (v54.Name == v46) or not v54:IsA("BasePart")) then
            return v54;
        end;
    end;
end;
v6.getAnimationController = function(v55)
    return v55:FindFirstChildOfClass("Humanoid") or v55:FindFirstChildOfClass("AnimationController");
end;
v6.getAnimator = function(v56)
    local v57 = v6.getAnimationController(v56);
    if not v57 then
        return ;
    else
        local l_Animator_0 = v57:FindFirstChildOfClass("Animator");
        if not l_Animator_0 then
            return Instance.new("Animator", v57);
        else
            return l_Animator_0;
        end;
    end;
end;
v6.getPart0 = function(v59)
    local v60 = (v59 and v59.Attachment0) and v59.Attachment0.Parent;
    if not v60 or not v60:IsA("BasePart") then
        return nil;
    else
        return v60;
    end;
end;
v6.getPart1 = function(v61)
    local v62 = (v61 and v61.Attachment1) and v61.Attachment1.Parent;
    if not v62 or not v62:IsA("BasePart") then
        return nil;
    else
        return v62;
    end;
end;
v6.getMotors = function(v63)
    local v64 = {};
    for _, v66 in ipairs((v7({}, v63))) do
        if v66:IsA("Motor6D") then
            table.insert(v64, v66);
        end;
    end;
    return v64;
end;
v6.getBones = function(v67)
    local v68 = {};
    for _, v70 in ipairs((v7({}, v67))) do
        if v70:IsA("Bone") then
            table.insert(v68, v70);
        end;
    end;
    return v68;
end;
v6.getAnimationConstraints = function(v71)
    local v72 = {};
    for _, v74 in ipairs((v7({}, v71))) do
        if v74:IsA("AnimationConstraint") then
            table.insert(v72, v74);
        end;
    end;
    return v72;
end;
v6.getUnusedRigTracks = function(v75, v76)
    local v77 = {};
    local v78 = v6.findRootPart(v75);
    local v79 = v6.getRigInfo(v75);
    local l_Parts_0 = v79.Parts;
    local l_PartNameToMotor_1 = v79.PartNameToMotor;
    local _ = v79.PartNameToConstraint;
    local l_PartNameToAnimConstraint_1 = v79.PartNameToAnimConstraint;
    local l_BoneNameToBone_1 = v79.BoneNameToBone;
    for _, v86 in ipairs(l_Parts_0) do
        if not (not l_BoneNameToBone_1[v86.Name] and (not (v86 ~= v78) or not l_PartNameToMotor_1[v86.Name] and ((not v3() or not l_PartNameToAnimConstraint_1) or not l_PartNameToAnimConstraint_1[v86.Name]))) then
            local v87 = false;
            for _, v89 in ipairs(v76) do
                if v86.Name == v89.Name then
                    v87 = true;
                    break;
                end;
            end;
            if not v87 then
                table.insert(v77, {
                    Name = v86.Name, 
                    Instance = "Root", 
                    Type = v2.TRACK_TYPES.CFrame
                });
            end;
        end;
    end;
    table.sort(v77, function(v90, v91)
        return v90.Name < v91.Name;
    end);
    return v77;
end;
v6.clearCache = function()
    v6.Cache = {};
    v6.FaceControlsCache = {};
end;
v6.getRigInfo = function(v92)
    local v93 = {};
    local v94 = {};
    local v95 = {};
    local v96 = {};
    local v97 = {};
    if v92 ~= v6.Cache.CacheRig then
        local v98 = v6.getMotors(v92);
        local v99 = v6.getConstraints(v92);
        local v100 = if not v3() then {} else v6.getAnimationConstraints(v92);
        for _, v102 in ipairs((v7({}, v92))) do
            if not v102:IsA("BasePart") then
                if v102:IsA("Bone") then
                    v97[v102.Name] = v102;
                    table.insert(v93, v102);
                end;
            else
                for _, v104 in ipairs(v98) do
                    if v104.Part1 == v102 then
                        v94[v102.Name] = v104;
                        table.insert(v93, v102);
                        break;
                    end;
                end;
                for _, v106 in ipairs(v99) do
                    if v6.getPart1(v106) == v102 then
                        v95[v102.Name] = v106;
                        break;
                    end;
                end;
                if v3() then
                    for _, v108 in ipairs(v100) do
                        if v6.getPart1(v108) == v102 then
                            v96[v102.Name] = v108;
                            table.insert(v93, v102);
                            break;
                        end;
                    end;
                end;
            end;
        end;
        v6.Cache.CacheRig = v92;
        v6.Cache.CacheData = {
            Parts = v93, 
            PartNameToMotor = v94, 
            PartNameToConstraint = v95, 
            PartNameToAnimConstraint = v96, 
            BoneNameToBone = v97
        };
    end;
    return v6.Cache.CacheData;
end;
v6.getFaceControls = function(v109)
    local v110 = {};
    if v109 ~= v6.FaceControlsCache.CacheRig then
        for _, v112 in ipairs((v7({}, v109))) do
            if v112:IsA("FaceControls") then
                table.insert(v110, v112);
            end;
        end;
        v6.FaceControlsCache.CacheRig = v109;
        v6.FaceControlsCache.FaceControls = v110;
    end;
    return v6.FaceControlsCache.FaceControls[1], v6.FaceControlsCache.FaceControls;
end;
v6.getPartByName = function(v113, v114)
    local v115 = v6.getRigInfo(v113);
    local l_PartNameToMotor_2 = v115.PartNameToMotor;
    local l_PartNameToAnimConstraint_2 = v115.PartNameToAnimConstraint;
    if not v3() then
        local v118 = l_PartNameToMotor_2[v114];
        if v118 then
            return v118.Part1;
        end;
    else
        if l_PartNameToMotor_2 then
            local v119 = l_PartNameToMotor_2[v114];
            if v119 then
                return v119.Part1;
            end;
        end;
        if l_PartNameToAnimConstraint_2 then
            local v120 = l_PartNameToAnimConstraint_2[v114];
            if v120 then
                return v6.getPart1(v120);
            end;
        end;
    end;
    return nil;
end;
v6.getBoneByName = function(v121, v122)
    return v6.getRigInfo(v121).BoneNameToBone[v122];
end;
return v6;
