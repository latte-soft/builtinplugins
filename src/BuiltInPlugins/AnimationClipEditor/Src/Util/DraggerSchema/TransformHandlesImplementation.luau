local l_script_FirstAncestor_0 = script:FindFirstAncestor("AnimationClipEditor");
local l_DraggerFramework_0 = l_script_FirstAncestor_0.Packages.DraggerFramework;
local v2 = require(l_script_FirstAncestor_0.Src.Util.Constants);
local _ = require(l_DraggerFramework_0.Utility.getBoundingBoxScale);
local v4 = require(l_DraggerFramework_0.Utility.PartMover);
local v5 = require(l_DraggerFramework_0.Utility.AttachmentMover);
local v6 = require(l_script_FirstAncestor_0.Src.Util.RigIK);
local v7 = require(l_script_FirstAncestor_0.Src.Util.RigUtils);
local v8 = require(l_script_FirstAncestor_0.Src.Util.RigInfo);
local l_Workspace_0 = game:GetService("Workspace");
local v10 = require(l_script_FirstAncestor_0.LuaFlags.GetFFlagAnimationConstraints);
local v11 = require(l_script_FirstAncestor_0.LuaFlags.GetFFlagMultiSelectionTransform);
local v12 = require(l_script_FirstAncestor_0.LuaFlags.GetFFlagRigIK);
local v13 = {};
v13.__index = v13;
v13.new = function(v14, v15, v16)
    return (setmetatable({
        _draggerContext = v14, 
        _ikTransformFunction = v15, 
        _partMover = if v11() then nil else v4.new(), 
        _attachmentMover = if v11() then nil else v5.new(), 
        _motordata = if not v10() then {} else nil, 
        _motorData = {}, 
        _animConstraintData = {}, 
        _tool = v16
    }, v13));
end;
local function _(v17)
    if not v17 then
        return ;
    else
        return v17[#v17];
    end;
end;
v13.beginDrag = function(v19, _, v21)
    local v22, _ = v21:getObjectsToTransform();
    v19._hasPartsToMove = #v22 > 0;
    v19._draggerContext.AddWaypoint();
    v19._partsToMove = v22;
    v19._jointsToOrigPart1CFrame = {};
    v19._jointsToOrigBoneTransformedWorldCFrame = {};
    v19._jointsToOrigBoneCFrame = {};
    v19._originalTransform = {};
    v19._joints = v7.getJoints(v19._partsToMove, v19._draggerContext.RootInstance);
    for _, v25 in ipairs(v19._joints) do
        if v25.Type == v2.JOINT_TYPES.Bone then
            v19._jointsToOrigBoneTransformedWorldCFrame[v25] = v25.Bone.TransformedWorldCFrame;
            v19._jointsToOrigBoneCFrame[v25] = v25.Bone.CFrame;
            v19._originalTransform[v25] = v25.Bone.Transform;
        elseif not (v10() and v25.Type ~= v2.JOINT_TYPES.Motor6D) or v25.Type == v2.JOINT_TYPES.AnimationConstraint then
            v19._jointsToOrigPart1CFrame[v25] = v25.Part1.CFrame;
            if v11() then
                v19._originalTransform[v25] = (v25.Part0.CFrame * v25.C0):Inverse() * (v25.Part1.CFrame * v25.C1);
            end;
        end;
    end;
    if v19:_shouldSolveConstraints() then
        local l__joints_0 = v19._joints;
        v19._effectorCFrame = (if not l__joints_0 then nil else l__joints_0[#l__joints_0]).Part1.CFrame;
        if not v12() then
            local v27, v28 = v7.ikDragStart(v19._draggerContext.RootInstance, v22[1], v19._draggerContext.IKMode == v2.IK_MODE.BodyPart, v19._draggerContext.StartingPose, v19._draggerContext.PinnedParts);
            v19._motorData = v27;
            v19._animConstraintData = v28;
        else
            local v29, v30 = v6.ikDragStart(v19._draggerContext.RootInstance, v22[1], v19._draggerContext.IKMode == v2.IK_MODE.BodyPart, v19._draggerContext.StartingPose, v19._draggerContext.PinnedParts);
            v19._motorData = v29;
            v19._animConstraintData = v30;
        end;
    end;
    v19._lastGoodGeometricTransform = CFrame.new();
    local _ = nil;
    local _ = nil;
    local v33, v34, v35 = v21:getBoundingBox();
    v19._boundingBoxSize = v35;
    v19._centerPoint = v33 * CFrame.new(v34);
end;
local function _(v36)
    local l_Parent_0 = v36.Parent;
    if l_Parent_0 then
        if not l_Parent_0:IsA("Bone") then
            if l_Parent_0:IsA("BasePart") then
                return l_Parent_0.CFrame;
            end;
        else
            return l_Parent_0.TransformedWorldCFrame;
        end;
    end;
    return CFrame.new();
end;
local function _(v39, v40)
    local l_Parent_1 = v39.Bone.Parent;
    return if not l_Parent_1 then CFrame.new() else if l_Parent_1:IsA("Bone") then l_Parent_1.TransformedWorldCFrame else if l_Parent_1:IsA("BasePart") then l_Parent_1.CFrame else CFrame.new() * v40;
end;
v13.applyWorldTransformToPart = function(v43, v44, v45)
    return (v45.Part0.CFrame * v45.C0):toObjectSpace(v44 * (v43._jointsToOrigPart1CFrame[v45] * v45.C1));
end;
v13.applyWorldTransformToBone = function(v46, v47, v48)
    local v49 = v46._jointsToOrigBoneCFrame[v48];
    local l_Parent_2 = v48.Bone.Parent;
    return (if not l_Parent_2 then CFrame.new() else if l_Parent_2:IsA("Bone") then l_Parent_2.TransformedWorldCFrame else if l_Parent_2:IsA("BasePart") then l_Parent_2.CFrame else CFrame.new() * v49):toObjectSpace(v47 * v46._jointsToOrigBoneTransformedWorldCFrame[v48]);
end;
v13.updateDrag = function(v51, v52)
    if not v51._draggerContext.IsPlaying then
        v51._globalTransform = v52;
        if v51:_shouldSolveConstraints() then
            if not (v51._tool == Enum.RibbonTool.Move) or not v51._effectorCFrame then
                if not (not (v51._tool == Enum.RibbonTool.Rotate) or not v51._effectorCFrame) then
                    local v53 = v52 * v51._effectorCFrame;
                    local l__joints_1 = v51._joints;
                    local v55 = if not l__joints_1 then nil else l__joints_1[#l__joints_1];
                    l_Workspace_0:IKMoveTo(v55.Part1, v53, v2.TRANSLATION_STIFFNESS, v2.ROTATION_STIFFNESS, Enum.IKCollisionsMode.NoCollisions);
                    return v55.Part1.CFrame * v51._effectorCFrame:Inverse();
                end;
            else
                local v56 = v52 * v51._effectorCFrame;
                local l__joints_2 = v51._joints;
                local v58 = if not l__joints_2 then nil else l__joints_2[#l__joints_2];
                local v59 = (v8.findRootPart(v51._draggerContext.RootInstance).CFrame.p - v56.p).Magnitude <= v2.MIN_EFFECTOR_DISTANCE;
                l_Workspace_0:IKMoveTo(v58.Part1, v56, not not v59 and v2.MIN_TRANSLATION_STIFFNESS or v2.MIN_TRANSLATION_STIFFNESS, not not v59 and v2.MIN_ROTATION_STIFFNESS or v2.MIN_ROTATION_STIFFNESS, Enum.IKCollisionsMode.NoCollisions);
                return v58.Part1.CFrame * v51._effectorCFrame:Inverse();
            end;
        else
            local _ = nil;
            local v61 = nil;
            local v62 = {};
            if not v11() then
                for _, v64 in ipairs(v51._joints) do
                    if v64.Type == v2.JOINT_TYPES.Bone then
                        v62[v64.Bone.Name] = v51:applyWorldTransformToBone(v52, v64);
                    else
                        v62[v64.Part1.Name] = v51:applyWorldTransformToPart(v52, v64);
                    end;
                end;
            elseif next(v51._joints) then
                referenceJoint = v51._joints[#v51._joints];
                if referenceJoint.Type == v2.JOINT_TYPES.Bone then
                    local v65, v66 = v51:applyWorldTransformToBone(v52, referenceJoint);
                    delta = v66;
                    v62[referenceJoint.Bone.Name] = v65;
                    v61 = v51._originalTransform[referenceJoint]:Inverse() * referenceJoint.Bone.Transform;
                else
                    v62[referenceJoint.Part1.Name] = v51:applyWorldTransformToPart(v52, referenceJoint);
                    v61 = (v51._jointsToOrigPart1CFrame[referenceJoint] * referenceJoint.C1):Inverse() * (referenceJoint.Part1.CFrame * referenceJoint.C1);
                end;
                for _, v68 in v51._joints, nil, nil do
                    if v68 ~= referenceJoint then
                        if v68.Type == v2.JOINT_TYPES.Bone then
                            v62[v68.Bone.Name] = v61 * v51._originalTransform[v68];
                        else
                            v62[v68.Part1.Name] = v61 * v51._originalTransform[v68];
                        end;
                    end;
                end;
            end;
            if v62 ~= nil then
                v51._draggerContext.OnManipulateJoints("Root", v62);
                return v52;
            end;
        end;
        return v52;
    else
        return CFrame.new();
    end;
end;
v13.endDrag = function(v69)
    if v69:_shouldSolveConstraints() then
        v69._draggerContext.OnManipulateJoints("Root", if not v12() then v7.ikDragEnd(v69._draggerContext.RootInstance, v69._motorData, v69._animConstraintData) else v6.ikDragEnd(v69._draggerContext.RootInstance, v69._motorData, v69._animConstraintData));
    end;
end;
v13.render = function(_, _)
    return nil;
end;
v13._toLocalTransform = function(v72, v73)
    return (v72._centerPoint:Inverse() * v73) * v72._centerPoint;
end;
v13._shouldSolveConstraints = function(v74)
    return v74._draggerContext.IKEnabled and v74._hasPartsToMove;
end;
return v13;
