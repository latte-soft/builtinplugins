local l_script_FirstAncestor_0 = script:FindFirstAncestor("AnimationClipEditor");
local v1 = require(l_script_FirstAncestor_0.Packages.Cryo);
local l_Math_0 = require(l_script_FirstAncestor_0.Packages.Framework).Util.Math;
local v3 = require(l_script_FirstAncestor_0.Src.Util.AnimationData);
local v4 = require(l_script_FirstAncestor_0.Src.Util.Constants);
local v5 = require(l_script_FirstAncestor_0.Src.Util.KeyframeUtils);
local v6 = require(l_script_FirstAncestor_0.Src.Util.RigInfo);
local v7 = require(l_script_FirstAncestor_0.Src.Util.Templates);
local v8 = require(l_script_FirstAncestor_0.Src.Util.TrackUtils);
local v9 = require(l_script_FirstAncestor_0.LuaFlags.GetFFlagAnimationConstraints);
local v10 = require(l_script_FirstAncestor_0.LuaFlags.GetFFlagForceR6HumanoidRootPart);
local _ = require(l_script_FirstAncestor_0.Src.Types);
local v12 = {};
local function v23(v13)
    local l_v13_Keyframes_0 = v13:GetKeyframes();
    table.sort(l_v13_Keyframes_0, function(v15, v16)
        return v15.Time < v16.Time;
    end);
    local v17 = nil;
    local v18 = 0;
    for _, v20 in pairs(l_v13_Keyframes_0) do
        local v21 = v20.Time - v18;
        if v21 ~= 0 and (not v17 or v21 < v17) then
            v17 = v21;
        end;
        v18 = v20.Time;
    end;
    local l_DEFAULT_FRAMERATE_0 = v4.DEFAULT_FRAMERATE;
    if v17 and v17 > 0 then
        l_DEFAULT_FRAMERATE_0 = l_Math_0.round(1 / v17);
    end;
    if v4.FRAMERATES.FPS_30 % l_DEFAULT_FRAMERATE_0 == 0 then
        l_DEFAULT_FRAMERATE_0 = v4.FRAMERATES.FPS_30;
    elseif v4.FRAMERATES.FPS_24 % l_DEFAULT_FRAMERATE_0 == 0 then
        l_DEFAULT_FRAMERATE_0 = v4.FRAMERATES.FPS_24;
    elseif v4.FRAMERATES.FPS_60 % l_DEFAULT_FRAMERATE_0 == 0 then
        l_DEFAULT_FRAMERATE_0 = v4.FRAMERATES.FPS_60;
    end;
    return (math.clamp(l_DEFAULT_FRAMERATE_0, 1, v4.MAX_FRAMERATE));
end;
local function v24(v25, v26)
    local v27 = {};
    if not v25:IsA("Keyframe") then
        if v25:IsA("PoseBase") or v25:IsA("Folder") and v25.Name == v4.FACE_CONTROLS_FOLDER then
            v27 = v25:GetChildren();
        end;
    else
        v27 = v25:GetPoses();
    end;
    for _, v29 in pairs(v27) do
        if v29:IsA("PoseBase") then
            v26(v29);
        end;
        v24(v29, v26);
    end;
end;
local function v34(v30, v31)
    for _, v33 in pairs(v30:GetChildren()) do
        if v33:IsA("KeyframeMarker") then
            v31(v33);
        end;
    end;
end;
local function v35(v36, v37)
    for _, v39 in pairs((v36:GetChildren())) do
        if v39:IsA("Folder") then
            v37(v39);
            v35(v39, v37);
        end;
    end;
end;
local function v55(v40, v41, v42, v43)
    local v44 = {};
    local v45 = nil;
    local function v52(v46)
        local v47 = {};
        local l_v46_0 = v46;
        while l_v46_0 ~= nil do
            local v49 = v41[l_v46_0];
            local v50 = v42[l_v46_0];
            local v51 = v43 and v43[l_v46_0];
            if not v49 then
                if not v50 then
                    if not (not v9() or not v51) then
                        l_v46_0 = v51.Attachment0.Parent.Name;
                    else
                        break;
                    end;
                else
                    l_v46_0 = v50.Parent.Name;
                end;
            else
                l_v46_0 = v49.Part0.Name;
            end;
            table.insert(v47, 1, l_v46_0);
        end;
        return v47;
    end;
    for v53, v54 in pairs(v40) do
        if v54.Type == v4.TRACK_TYPES.CFrame then
            v44[v53] = v52(v53);
        elseif v54.Type == v4.TRACK_TYPES.Facs then
            if v45 == nil then
                v45 = v1.List.join(v52(v4.R15_PARTS.Head), {
                    v4.R15_PARTS.Head
                });
            end;
            v44[v53] = v1.List.join(v45, {
                v4.FACE_CONTROLS_FOLDER
            });
        end;
    end;
    return v44;
end;
local function _(v56, v57)
    local l_Keyframe_0 = Instance.new("Keyframe");
    l_Keyframe_0.Time = v57;
    l_Keyframe_0.Parent = v56;
    return l_Keyframe_0;
end;
local function v71(v60, v61, v62, v63, v64)
    local v65 = v64[v61];
    if v65 == nil then
        return ;
    else
        local l_v60_0 = v60;
        for _, v68 in ipairs(v65) do
            local l_l_v60_0_FirstChild_0 = l_v60_0:FindFirstChild(v68);
            if l_l_v60_0_FirstChild_0 == nil then
                if v68 == v4.FACE_CONTROLS_FOLDER then
                    l_l_v60_0_FirstChild_0 = Instance.new("Folder", l_v60_0);
                else
                    l_l_v60_0_FirstChild_0 = Instance.new("Pose", l_v60_0);
                    l_l_v60_0_FirstChild_0.Weight = 0;
                end;
                l_l_v60_0_FirstChild_0.Name = v68;
            end;
            l_v60_0 = l_l_v60_0_FirstChild_0;
        end;
        local l_l_v60_0_FirstChild_1 = l_v60_0:FindFirstChild(v61);
        if v62 == v4.TRACK_TYPES.Facs then
            l_l_v60_0_FirstChild_1 = l_l_v60_0_FirstChild_1 or Instance.new("NumberPose", l_v60_0);
            l_l_v60_0_FirstChild_1.Value = v63.Value;
        elseif v62 == v4.TRACK_TYPES.CFrame then
            l_l_v60_0_FirstChild_1 = l_l_v60_0_FirstChild_1 or Instance.new("Pose", l_v60_0);
            l_l_v60_0_FirstChild_1.CFrame = v63.Value;
        end;
        l_l_v60_0_FirstChild_1.Name = v61;
        l_l_v60_0_FirstChild_1.Weight = 1;
        l_l_v60_0_FirstChild_1.EasingStyle = v63.EasingStyle.Name;
        l_l_v60_0_FirstChild_1.EasingDirection = v63.EasingDirection.Name;
        return ;
    end;
end;
local function v79(v72, v73, v74)
    local v75 = v74[v73];
    if v75 == nil then
        return ;
    else
        local l_v72_0 = v72;
        for _, v78 in ipairs(v75) do
            l_v72_0 = l_v72_0:FindFirstChild(v78) or Instance.new("Folder", l_v72_0);
            l_v72_0.Name = v78;
        end;
        return l_v72_0;
    end;
end;
fillFloatCurve = function(v80, v81)
    if v80 then
        local v82 = nil;
        for _, v84 in ipairs(v80.Keyframes) do
            local v85 = v80.Data[v84];
            local v86 = FloatCurveKey.new(v84 / v4.TICK_FREQUENCY, v85.Value, v85.InterpolationMode or Enum.KeyInterpolationMode.Cubic);
            if not (v82 and v82.InterpolationMode == Enum.KeyInterpolationMode.Cubic) or not v85.LeftSlope then
                v86.LeftTangent = nil;
            else
                v86.LeftTangent = v85.LeftSlope * v4.TICK_FREQUENCY;
            end;
            if v85.InterpolationMode == Enum.KeyInterpolationMode.Cubic then
                v86.RightTangent = not not v85.RightSlope and v85.RightSlope * v4.TICK_FREQUENCY or nil;
            end;
            v81:InsertKey(v86);
            v82 = v85;
        end;
    end;
end;
fillQuaternionCurve = function(v87, v88)
    local v89 = nil;
    for _, v91 in ipairs(v87.Keyframes) do
        local v92 = v87.Data[v91];
        local v93 = RotationCurveKey.new(v91 / v4.TICK_FREQUENCY, v92.Value, v92.InterpolationMode);
        if not (v89 and v89.InterpolationMode == Enum.KeyInterpolationMode.Cubic) or not v92.LeftSlope then
            v93.LeftTangent = nil;
        else
            v93.LeftTangent = v92.LeftSlope * v4.TICK_FREQUENCY;
        end;
        if v92.InterpolationMode == Enum.KeyInterpolationMode.Cubic then
            v93.RightTangent = not not v92.RightSlope and v92.RightSlope * v4.TICK_FREQUENCY or nil;
        end;
        v88:InsertKey(v93);
        v89 = v92;
    end;
end;
makeVector3Curve = function(v94)
    if not v94 then
        return ;
    else
        local l_Vector3Curve_0 = Instance.new("Vector3Curve");
        fillFloatCurve(v94.Components[v4.PROPERTY_KEYS.X], l_Vector3Curve_0:X());
        fillFloatCurve(v94.Components[v4.PROPERTY_KEYS.Y], l_Vector3Curve_0:Y());
        fillFloatCurve(v94.Components[v4.PROPERTY_KEYS.Z], l_Vector3Curve_0:Z());
        return l_Vector3Curve_0;
    end;
end;
makeQuaternionCurve = function(v96)
    if not v96 then
        return ;
    else
        local l_RotationCurve_0 = Instance.new("RotationCurve");
        fillQuaternionCurve(v96, l_RotationCurve_0);
        return l_RotationCurve_0;
    end;
end;
makeEulerCurve = function(v98)
    if not v98 then
        return ;
    else
        local l_EulerRotationCurve_0 = Instance.new("EulerRotationCurve");
        l_EulerRotationCurve_0.RotationOrder = v98.EulerAnglesOrder;
        fillFloatCurve(v98.Components[v4.PROPERTY_KEYS.X], l_EulerRotationCurve_0:X());
        fillFloatCurve(v98.Components[v4.PROPERTY_KEYS.Y], l_EulerRotationCurve_0:Y());
        fillFloatCurve(v98.Components[v4.PROPERTY_KEYS.Z], l_EulerRotationCurve_0:Z());
        return l_EulerRotationCurve_0;
    end;
end;
makeRotationCurve = function(v100)
    if not v100 then
        return ;
    elseif v100.Type == v4.TRACK_TYPES.Quaternion then
        return makeQuaternionCurve(v100);
    else
        return makeEulerCurve(v100);
    end;
end;
makeFacsCurve = function(v101)
    if not v101 then
        return ;
    else
        local l_FloatCurve_0 = Instance.new("FloatCurve");
        fillFloatCurve(v101, l_FloatCurve_0);
        return l_FloatCurve_0;
    end;
end;
local function _(v103)
    if (not v103 or not v103:IsA("Humanoid")) or v103.RigType ~= Enum.HumanoidRigType.R15 then
        return false;
    else
        local l_Parent_0 = v103.Parent;
        if l_Parent_0 and l_Parent_0:IsA("Model") then
            return true;
        else
            return false;
        end;
    end;
end;
local function v112(v106, v107, v108)
    local l_Humanoid_0 = v107:FindFirstChildOfClass("Humanoid");
    local v110;
    if not (v10() and v6.isR15Humanoid(v107)) then
        if v10() then
            goto label0;
        else
            if (not l_Humanoid_0 or not l_Humanoid_0:IsA("Humanoid")) or l_Humanoid_0.RigType ~= Enum.HumanoidRigType.R15 then
                v110 = false;
            else
                local l_Parent_1 = l_Humanoid_0.Parent;
                v110 = not not l_Parent_1 and (l_Parent_1:IsA("Model") and true or false);
            end;
            if not v110 then
                goto label0;
            end;
        end;
    end;
    v110 = Instance.new("AnimationRigData", v108);
    if v110:LoadFromHumanoid(l_Humanoid_0) then
        v110.Name = v107.Name .. "AnimationRigData";
        v106.Metadata.AnimationRig = v110;
    else
        v110:Destroy();
        return ;
    end;
    ::label0::;
end;
readCurve = function(v113, v114, v115)
    local v116 = 0;
    local v117 = 0;
    v113.IsCurveTrack = true;
    if not ((v115 ~= v4.TRACK_TYPES.Number and v115 ~= v4.TRACK_TYPES.Angle) and v115 ~= v4.TRACK_TYPES.Facs) or v115 == v4.TRACK_TYPES.Quaternion then
        v113.Keyframes = {};
        v113.Data = {};
        for _, v119 in ipairs((v114:GetKeys())) do
            local v120 = v5.getNearestTick(v119.Time * v4.TICK_FREQUENCY);
            if v116 < v120 then
                v116 = v120;
            end;
            v3.addKeyframe(v113, v120, {
                Value = v119.Value, 
                InterpolationMode = v119.Interpolation, 
                LeftSlope = not not v119.LeftTangent and v119.LeftTangent / v4.TICK_FREQUENCY or nil, 
                RightSlope = not not v119.RightTangent and v119.RightTangent / v4.TICK_FREQUENCY or nil
            });
        end;
        return v116;
    else
        v113.Components = {};
        for _, v122 in ipairs(v4.COMPONENT_TRACK_TYPES[v115]._Order) do
            local v123 = nil;
            local l_v114_FirstChild_0 = v114:FindFirstChild(v122);
            if l_v114_FirstChild_0 ~= nil then
                v123 = if l_v114_FirstChild_0.ClassName == "RotationCurve" then v4.TRACK_TYPES.Quaternion else if l_v114_FirstChild_0.ClassName == "EulerRotationCurve" then v4.TRACK_TYPES.EulerAngles else v4.COMPONENT_TRACK_TYPES[v115][v122];
                local v125 = v7.track(v123);
                v125.IsCurveTrack = true;
                v117 = readCurve(v125, l_v114_FirstChild_0, v123);
                v113.Components[v122] = v125;
                if v116 < v117 then
                    v116 = v117;
                end;
            end;
        end;
        if v115 == v4.TRACK_TYPES.EulerAngles then
            v113.EulerAnglesOrder = v114.RotationOrder;
        end;
        return v116;
    end;
end;
readFacsCurves = function(v126, v127)
    local v128 = 0;
    for _, v130 in pairs((v127:GetChildren())) do
        if v130:IsA("FloatCurve") then
            local v131 = readCurve(v3.addTrack(v126, v130.Name, v4.TRACK_TYPES.Facs), v130, v4.TRACK_TYPES.Facs);
            if v128 < v131 then
                v128 = v131;
            end;
        end;
    end;
    return v128;
end;
v12.fromKeyframeSequence = function(v132)
    local v133 = v23(v132);
    local l_v132_Keyframes_0 = v132:GetKeyframes();
    local v135 = 0;
    local v136 = nil;
    local v137 = v3.new(v132.Name, v4.INSTANCE_TYPES.Rig, v132.Guid);
    local v138 = 0;
    local v139 = 0;
    local l_Tracks_0 = v137.Instances.Root.Tracks;
    for _, v142 in pairs(l_v132_Keyframes_0) do
        local l_Time_0 = v142.Time;
        local v144 = v5.getNearestTick(l_Time_0 * v4.TICK_FREQUENCY);
        v24(v142, function(v145)
            local l_Name_0 = v145.Name;
            local v147 = not not v145:IsA("Pose") and v4.TRACK_TYPES.CFrame or v4.TRACK_TYPES.Facs;
            if l_Name_0 ~= "HumanoidRootPart" and v145.Weight ~= 0 then
                if l_Tracks_0[l_Name_0] == nil then
                    v3.addTrack(l_Tracks_0, l_Name_0, v147, false, v4.TRACK_TYPES.Quaternion, nil);
                end;
                v3.addKeyframe(l_Tracks_0[l_Name_0], v144, {
                    Value = not not v145:IsA("Pose") and v145.CFrame or v145.Value, 
                    EasingStyle = v145.EasingStyle, 
                    EasingDirection = v145.EasingDirection
                });
                v138 = v138 + 1;
            end;
        end);
        v34(v142, function(v148)
            v3.addEvent(v137.Events, v144, v148.Name, v148.Value);
            v139 = v139 + 1;
        end);
        if v135 < l_Time_0 then
            v136 = v142;
            v135 = math.max(v135, v142.Time);
        end;
        if v142.Name ~= v4.DEFAULT_KEYFRAME_NAME then
            v3.setKeyframeName(v137, v144, v142.Name);
        end;
    end;
    local v149 = v5.getNearestTick(v135 * v4.TICK_FREQUENCY);
    if v136 and #v136:GetChildren() == 0 then
        for _, v151 in pairs(l_Tracks_0) do
            v3.addKeyframe(v151, v149, {
                Value = v151.Data[v151.Keyframes[#v151.Keyframes]].Value, 
                EasingStyle = Enum.PoseEasingStyle.Linear, 
                EasingDirection = Enum.PoseEasingDirection.In
            });
        end;
    end;
    v137.Metadata.EndTick = v149;
    v137.Metadata.Priority = v132.Priority;
    v137.Metadata.Looping = v132.Loop;
    v137.Metadata.Name = v132.Name;
    v137.Metadata.Guid = v132.Guid;
    local l_AnimationRigData_0 = v132:FindFirstChildOfClass("AnimationRigData");
    if l_AnimationRigData_0 then
        v137.Metadata.AnimationRig = l_AnimationRigData_0;
    end;
    return v137, v133, #l_v132_Keyframes_0, v138, v139;
end;
v12.toKeyframeSequence = function(v153, v154)
    assert(v153 ~= nil, "No data table was provided.");
    assert(v154 ~= nil, "Exporting to KeyframeSequence requires a reference rig.");
    local l_Metadata_0 = v153.Metadata;
    local l_Events_0 = v153.Events;
    local l_NamedKeyframes_0 = l_Events_0.NamedKeyframes;
    local l_KeyframeSequence_0 = Instance.new("KeyframeSequence");
    l_KeyframeSequence_0.Name = l_Metadata_0.Name;
    l_KeyframeSequence_0.Loop = l_Metadata_0.Looping;
    l_KeyframeSequence_0.Priority = l_Metadata_0.Priority;
    l_KeyframeSequence_0.Guid = l_Metadata_0.Guid or "";
    local v159 = 0;
    local v160 = 0;
    local v161 = v6.getRigInfo(v154);
    local _ = v161.Parts;
    local l_PartNameToMotor_0 = v161.PartNameToMotor;
    local _ = v161.PartNameToConstraint;
    local l_PartNameToAnimConstraint_0 = v161.PartNameToAnimConstraint;
    local l_BoneNameToBone_0 = v161.BoneNameToBone;
    local v167 = {};
    local l_Root_0 = v153.Instances.Root;
    assert(l_Root_0.Type == v4.INSTANCE_TYPES.Rig, "Can only export Rig animations to KeyframeSequence.");
    local l_Tracks_1 = l_Root_0.Tracks;
    local v170 = v55(l_Tracks_1, l_PartNameToMotor_0, l_BoneNameToBone_0, l_PartNameToAnimConstraint_0);
    for v171, v172 in pairs(l_Tracks_1) do
        for _, v174 in pairs(v172.Keyframes) do
            local v175 = v174 / v4.TICK_FREQUENCY;
            local v176 = v167[v174];
            if not v176 then
                local l_Keyframe_1 = Instance.new("Keyframe");
                l_Keyframe_1.Time = v175;
                l_Keyframe_1.Parent = l_KeyframeSequence_0;
                v176 = l_Keyframe_1;
                v167[v174] = v176;
            end;
            v71(v176, v171, v172.Type, v172.Data[v174], v170);
            if l_NamedKeyframes_0[v174] then
                v176.Name = l_NamedKeyframes_0[v174];
            end;
            v159 = v159 + 1;
        end;
    end;
    for _, v179 in ipairs(l_Events_0.Keyframes) do
        for v180, v181 in pairs(l_Events_0.Data[v179]) do
            local v182 = v179 / v4.TICK_FREQUENCY;
            local v183 = v167[v179];
            if not v183 then
                local l_Keyframe_2 = Instance.new("Keyframe");
                l_Keyframe_2.Time = v182;
                l_Keyframe_2.Parent = l_KeyframeSequence_0;
                v183 = l_Keyframe_2;
                v167[v179] = v183;
            end;
            local v185 = Instance.new("KeyframeMarker", v183);
            v185.Name = v180;
            v185.Value = v181;
            v160 = v160 + 1;
        end;
    end;
    v112(v153, v154, l_KeyframeSequence_0);
    return l_KeyframeSequence_0, #l_KeyframeSequence_0:GetKeyframes(), v159, v160;
end;
v12.fromCurveAnimation = function(v186)
    local v187 = false;
    if v186 ~= nil then
        v187 = false;
        if typeof(v186) == "Instance" then
            v187 = v186.ClassName == "CurveAnimation";
        end;
    end;
    assert(v187, "Expected a CurveAnimation for the AnimationData.");
    local v188 = v3.new(v186.Name, v4.INSTANCE_TYPES.Rig, v186.Guid);
    v187 = v188.Instances.Root.Tracks;
    local v189 = 0;
    local v190 = 0;
    local v191 = 0;
    local v192 = 0;
    v35(v186, function(v193)
        local v194 = 0;
        if v193.Name == v4.FACE_CONTROLS_FOLDER then
            v194 = readFacsCurves(v187, v193);
        else
            local l_v193_FirstChild_0 = v193:FindFirstChild(v4.PROPERTY_KEYS.Position);
            local l_v193_FirstChild_1 = v193:FindFirstChild(v4.PROPERTY_KEYS.Rotation);
            if not (not l_v193_FirstChild_0 and not l_v193_FirstChild_1) then
                local v197 = nil;
                if l_v193_FirstChild_1 then
                    if l_v193_FirstChild_1.ClassName == "RotationCurve" then
                        v197 = v4.TRACK_TYPES.Quaternion;
                    elseif l_v193_FirstChild_1.ClassName == "EulerRotationCurve" then
                        v197 = v4.TRACK_TYPES.EulerAngles;
                    end;
                end;
                local v198 = v3.addTrack(v187, v193.Name, v4.TRACK_TYPES.CFrame, true, v197);
                v194 = readCurve(v198, v193, v4.TRACK_TYPES.CFrame);
                v191 = v191 + 1;
                v190 = v190 + v8.countKeyframes(v198);
            end;
        end;
        if v189 < v194 then
            v189 = v194;
        end;
    end);
    for _, v200 in ipairs((v186:GetChildren())) do
        if v200:IsA("MarkerCurve") then
            for _, v202 in ipairs((v200:GetMarkers())) do
                local v203 = v5.getNearestTick(v202.Time * v4.TICK_FREQUENCY);
                if v189 < v203 then
                    v189 = v203;
                end;
                if v200.Name == v4.NAMED_KEYFRAMES_CHANNEL then
                    v3.setKeyframeName(v188, v203, v202.Value);
                else
                    v3.addEvent(v188.Events, v203, v200.Name, v202.Value);
                    v192 = v192 + 1;
                end;
            end;
        end;
    end;
    local l_Metadata_1 = v188.Metadata;
    l_Metadata_1.Name = v186.Name;
    l_Metadata_1.Looping = v186.Loop;
    l_Metadata_1.Priority = v186.Priority;
    l_Metadata_1.EndTick = v189;
    l_Metadata_1.IsChannelAnimation = true;
    l_Metadata_1.Guid = v186.Guid;
    local l_AnimationRigData_1 = v186:FindFirstChildOfClass("AnimationRigData");
    if l_AnimationRigData_1 then
        l_Metadata_1.AnimationRig = l_AnimationRigData_1;
    end;
    return v188, v190, v191, v192;
end;
v12.toCurveAnimation = function(v206, v207)
    assert(v206 ~= nil, "No data table was provided.");
    assert(v207 ~= nil, "Exporting to CurveAnimation requires a reference rig.");
    local l_Metadata_2 = v206.Metadata;
    local l_CurveAnimation_0 = Instance.new("CurveAnimation");
    l_CurveAnimation_0.Name = l_Metadata_2.Name;
    l_CurveAnimation_0.Loop = l_Metadata_2.Looping;
    l_CurveAnimation_0.Priority = l_Metadata_2.Priority;
    l_CurveAnimation_0.Guid = l_Metadata_2.Guid or "";
    local v210 = v6.getRigInfo(v207);
    local l_PartNameToMotor_1 = v210.PartNameToMotor;
    local l_PartNameToAnimConstraint_1 = v210.PartNameToAnimConstraint;
    local l_BoneNameToBone_1 = v210.BoneNameToBone;
    local v214 = 0;
    local v215 = 0;
    local v216 = 0;
    local l_Root_1 = v206.Instances.Root;
    assert(l_Root_1.Type == v4.INSTANCE_TYPES.Rig, "Can only export Rig animations to CurveAnimation.");
    local l_Tracks_2 = l_Root_1.Tracks;
    local v219 = v55(l_Tracks_2, l_PartNameToMotor_1, l_BoneNameToBone_1, l_PartNameToAnimConstraint_1);
    for v220, v221 in pairs(l_Tracks_2) do
        local v222 = v79(l_CurveAnimation_0, v220, v219);
        if v221.Type == v4.TRACK_TYPES.CFrame then
            v222 = v222:FindFirstChild(v220) or Instance.new("Folder", v222);
            v222.Name = v220;
            local v223 = makeVector3Curve(v221.Components[v4.PROPERTY_KEYS.Position]);
            if v223 then
                v223.Name = v4.PROPERTY_KEYS.Position;
                v223.Parent = v222;
            end;
            local v224 = makeRotationCurve(v221.Components[v4.PROPERTY_KEYS.Rotation]);
            if v224 then
                v224.Name = v4.PROPERTY_KEYS.Rotation;
                v224.Parent = v222;
            end;
        elseif v221.Type == v4.TRACK_TYPES.Facs then
            local v225 = makeFacsCurve(v221);
            if v225 then
                v225.Name = v220;
                v225.Parent = v222;
            end;
        end;
        v214 = v214 + v8.countKeyframes(v221);
        v215 = v215 + 1;
    end;
    local v226 = {};
    local l_Events_1 = v206.Events;
    for v228, v229 in pairs(l_Events_1.Data) do
        for v230, v231 in pairs(v229) do
            if not v226[v230] then
                v226[v230] = {};
            end;
            v226[v230][v228] = v231;
        end;
    end;
    if l_Events_1.NamedKeyframes then
        local v232 = {};
        for v233, v234 in pairs(l_Events_1.NamedKeyframes) do
            v232[v233] = v234;
        end;
        v226[v4.NAMED_KEYFRAMES_CHANNEL] = v232;
    end;
    for v235, v236 in pairs(v226) do
        local l_MarkerCurve_0 = Instance.new("MarkerCurve");
        l_MarkerCurve_0.Name = v235;
        l_MarkerCurve_0.Parent = l_CurveAnimation_0;
        for v238, v239 in pairs(v236) do
            l_MarkerCurve_0:InsertMarkerAtTime(v238 / v4.TICK_FREQUENCY, v239);
            v216 = v216 + 1;
        end;
    end;
    v112(v206, v207, l_CurveAnimation_0);
    return l_CurveAnimation_0, v214, v215, v216;
end;
return v12;
