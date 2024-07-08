local l_script_FirstAncestor_0 = script:FindFirstAncestor("AnimationClipEditor");
local v1 = require(l_script_FirstAncestor_0.Src.Util.Constants);
local v2 = require(l_script_FirstAncestor_0.Src.Util.isEmpty);
local _ = require(l_script_FirstAncestor_0.Src.Types);
local l_TweenService_0 = game:GetService("TweenService");
local v5 = require(l_script_FirstAncestor_0.LuaFlags.GetFFlagFacialAnimationRecordingInStudio);
local v37 = {
    getDefaultValue = function(v6)
        if not (v6 ~= v1.TRACK_TYPES.CFrame) or v6 == v1.TRACK_TYPES.Quaternion then
            return CFrame.new();
        elseif not (v6 ~= v1.TRACK_TYPES.Position) or v6 == v1.TRACK_TYPES.EulerAngles then
            return (Vector3.new());
        elseif not (v6 ~= v1.TRACK_TYPES.Number and v6 ~= v1.TRACK_TYPES.Angle) or v6 == v1.TRACK_TYPES.Facs then
            return 0;
        else
            assert(false, "Unknown track type");
            return 0;
        end;
    end, 
    findNearestKeyframes = function(v7, v8)
        if not (v7 ~= nil) or #v7 == 0 then
            return nil, nil;
        else
            local v9 = 1;
            local v10 = #v7;
            if v8 < v7[v9] then
                return v9, nil;
            elseif v7[v10] < v8 then
                return v10, nil;
            else
                local v11 = nil;
                while true do
                    if v9 <= v10 then
                        v11 = math.floor((v10 + v9) / 2);
                        local v12 = v7[v11];
                        if v8 == v12 then
                            return v11, nil;
                        elseif v12 < v8 then
                            v9 = v11 + 1;
                        elseif v8 < v12 then
                            v10 = v11 - 1;
                        end;
                    elseif v8 < v7[v11] then
                        return v11 - 1, v11;
                    else
                        return v11, v11 + 1;
                    end;
                end;
            end;
        end;
    end, 
    findNearestKeyframesProperly = function(v13, v14)
        if not (v13 ~= nil) or #v13 == 0 then
            return nil, nil, nil;
        else
            local v15 = 1;
            local v16 = #v13;
            if v14 < v13[v15] then
                return nil, nil, v15;
            elseif v13[v16] < v14 then
                return nil, v16, nil;
            else
                local v17 = nil;
                while true do
                    if v15 <= v16 then
                        v17 = math.floor((v16 + v15) / 2);
                        local v18 = v13[v17];
                        if v14 == v18 then
                            return v17, nil, nil;
                        elseif v18 < v14 then
                            v15 = v17 + 1;
                        elseif v14 < v18 then
                            v16 = v17 - 1;
                        end;
                    elseif v14 < v13[v17] then
                        return nil, v17 - 1, v17;
                    else
                        return nil, v17, v17 + 1;
                    end;
                end;
            end;
        end;
    end, 
    findKeyframe = function(v19, v20)
        local v21 = 1;
        local v22 = #v19;
        local v23 = nil;
        while true do
            if v21 <= v22 then
                v23 = math.floor((v22 + v21) / 2);
                local v24 = v19[v23];
                if v20 == v24 then
                    return v23;
                elseif v24 < v20 then
                    v21 = v23 + 1;
                elseif v20 < v24 then
                    v22 = v23 - 1;
                end;
            else
                return nil;
            end;
        end;
    end, 
    findInsertIndex = function(v25, v26)
        local v27 = 1;
        local v28 = #v25;
        local v29 = nil;
        while true do
            if v27 <= v28 then
                v29 = math.floor((v28 + v27) / 2);
                local v30 = v25[v29];
                if v26 == v30 then
                    return nil;
                elseif v30 < v26 then
                    v27 = v29 + 1;
                elseif v26 < v30 then
                    v28 = v29 - 1;
                end;
            else
                return v27;
            end;
        end;
    end, 
    interpolate = function(v31, v32, v33)
        if typeof(v31) == "CFrame" and typeof(v32) == "CFrame" then
            return v31:Lerp(v32, v33);
        elseif typeof(v31) == "Vector3" and typeof(v32) == "Vector3" then
            return v31:Lerp(v32, v33);
        elseif typeof(v31) == "number" and typeof(v32) == "number" then
            return v31 + (v32 - v31) * v33;
        else
            assert(false, "Attempted to interpolate an unsupported value.");
            return ;
        end;
    end, 
    getNearestTick = function(v34)
        return (math.floor(v34 + 0.5));
    end, 
    getNearestFrame = function(v35, v36)
        return (math.floor((math.floor((v35 * v36) / v1.TICK_FREQUENCY + 0.5) * v1.TICK_FREQUENCY) / v36 + 0.5));
    end
};
v37.snapToFrame = function(v38, v39)
    local v40 = false;
    if v39 > 0 then
        v40 = v39 < 1;
    end;
    assert(v40, "Tolerance should be between 0 and 1.");
    local v41 = v37.getNearestTick(v38);
    if math.abs(v38 - v41) < v39 then
        return v41;
    else
        return v38;
    end;
end;
v37.getSlope = function(v42, v43, v44)
    local function v45(v46, v47, v48, v49)
        local v50 = v37.findNearestKeyframesProperly(v46.Keyframes, v47);
        if v50 then
            local v51 = v46.Data[v46.Keyframes[v50]];
            local function _()
                local v52 = v46.Keyframes[v50 - 1];
                return v52, not not v52 and v46.Data[v52] or nil;
            end;
            local function _()
                local v54 = v46.Keyframes[v50 + 1];
                return v54, not not v54 and v46.Data[v54] or nil;
            end;
            local function v66()
                local v56 = v46.Keyframes[v50 - 1];
                local l_v56_0 = v56;
                local v58 = not not v56 and v46.Data[v56] or nil;
                local v59 = v46.Keyframes[v50 + 1];
                v56 = v59;
                local v60 = not not v59 and v46.Data[v59] or nil;
                if not l_v56_0 or not v56 then
                    return 0;
                elseif v46.Type == v1.TRACK_TYPES.Quaternion then
                    return 0.5 * (1 / (v56 - v47) + 1 / (v47 - l_v56_0));
                else
                    v59 = function(v61)
                        local l_CLAMPED_AUTO_TANGENT_THRESHOLD_0 = v1.CLAMPED_AUTO_TANGENT_THRESHOLD;
                        return (math.max(0, (math.min(v61 / l_CLAMPED_AUTO_TANGENT_THRESHOLD_0, (1 - v61) / l_CLAMPED_AUTO_TANGENT_THRESHOLD_0, 1))));
                    end;
                    local v63 = 0.5 * ((v60.Value - v51.Value) / (v56 - v47) + (v58.Value - v51.Value) / (l_v56_0 - v47));
                    local v64 = (v51.Value - v58.Value) / (v60.Value - v58.Value);
                    local l_CLAMPED_AUTO_TANGENT_THRESHOLD_1 = v1.CLAMPED_AUTO_TANGENT_THRESHOLD;
                    return v63 * math.max(0, (math.min(v64 / l_CLAMPED_AUTO_TANGENT_THRESHOLD_1, (1 - v64) / l_CLAMPED_AUTO_TANGENT_THRESHOLD_1, 1)));
                end;
            end;
            if v48 == v1.SLOPES.Right then
                if v51.InterpolationMode == Enum.KeyInterpolationMode.Constant then
                    return 0;
                elseif v51.InterpolationMode == Enum.KeyInterpolationMode.Linear then
                    local v67 = v46.Keyframes[v50 + 1];
                    local l_v67_0 = v67;
                    local v69 = not not v67 and v46.Data[v67] or nil;
                    if v46.Type == v1.TRACK_TYPES.Quaternion then
                        return not not v69 and 1 / (l_v67_0 - v47) or 0;
                    else
                        return not not v69 and (v69.Value - v51.Value) / (l_v67_0 - v47) or 0;
                    end;
                elseif not v51.RightSlope then
                    if v49 then
                        return (v66());
                    else
                        return v45(v46, v47, v1.SLOPES.Left, true);
                    end;
                else
                    return v51.RightSlope;
                end;
            else
                local v70 = v46.Keyframes[v50 - 1];
                local l_v70_0 = v70;
                local v72 = not not v70 and v46.Data[v70] or nil;
                if v72 then
                    if v72.InterpolationMode == Enum.KeyInterpolationMode.Constant then
                        return 0;
                    elseif v72.InterpolationMode == Enum.KeyInterpolationMode.Linear then
                        if v46.Type == v1.TRACK_TYPES.Quaternion then
                            return 1 / (v47 - l_v70_0);
                        else
                            return (v72.Value - v51.Value) / (l_v70_0 - v47);
                        end;
                    elseif not v51.LeftSlope then
                        if v49 then
                            return (v66());
                        else
                            return v45(v46, v47, v1.SLOPES.Right, true);
                        end;
                    else
                        return v51.LeftSlope;
                    end;
                else
                    return 0;
                end;
            end;
        else
            return 0;
        end;
    end;
    return v45(v42, v43, v44, false);
end;
v37.getSlopes = function(v73, v74)
    if v73.Keyframes and not v2(v73.Keyframes) then
        local l_Keyframes_0 = v73.Keyframes;
        local l_Data_0 = v73.Data;
        if not l_Data_0[v74] then
            local v77, v78 = v37.findNearestKeyframes(l_Keyframes_0, v74);
            if not v77 or not v78 then
                return 0, 0;
            else
                local v79 = l_Keyframes_0[v77];
                local v80 = l_Keyframes_0[v78];
                local v81 = l_Data_0[v79];
                local v82 = l_Data_0[v80];
                if v81.EasingSyle == Enum.KeyInterpolationMode.Constant then
                    return 0, 0;
                elseif v81.EasingStyle == Enum.KeyInterpolationMode.Linear then
                    local v83 = nil;
                    v83 = if v73.Type == v1.TRACK_TYPES.Quaternion then 1 / (v80 - v79) else (v82.Value - v81.Value) / (v80 - v79);
                    return v83, v83;
                else
                    local v84 = v37.getSlope(v73, v79, v1.SLOPES.Right);
                    local v85 = v37.getSlope(v73, v80, v1.SLOPES.Left);
                    local v86 = v80 - v79;
                    local v87 = (v74 - v79) / v86;
                    local v88 = (6 * v87) * (v87 - 1);
                    local v89 = (v87 - 1) * (3 * v87 - 1);
                    local v90 = -v88;
                    local v91 = v87 * (3 * v87 - 2);
                    local v92 = nil;
                    if v73.Type == v1.TRACK_TYPES.Quaternion then
                        v92 = (v90 / v86 + v89 * v84) + v91 * v85;
                        local v93 = v87 * v87;
                        local v94 = (((((v87 - 2) * v87 + 1) * v87) * v86) * v84 + v93 * (3 - 2 * v87)) + ((v93 * (v87 - 1)) * v86) * v85;
                        return v92 / v94, v92 / (1 - v94);
                    else
                        v92 = ((v88 * v81.Value + v90 * v82.Value) / v86 + v89 * v84) + v91 * v85;
                        return v92, v92;
                    end;
                end;
            end;
        else
            return v37.getSlope(v73, v74, v1.SLOPES.Left), v37.getSlope(v73, v74, v1.SLOPES.Right);
        end;
    else
        return nil, nil;
    end;
end;
v37.blendCurveKeyframes = function(v95, v96, v97, v98)
    assert(v97 < v98, "Low keyframe must be less than high keyframe.");
    local l_Data_1 = v95.Data;
    local v100 = l_Data_1[v97];
    local v101 = l_Data_1[v98];
    local v102 = v98 - v97;
    local v103 = (v96 - v97) / v102;
    if v100.InterpolationMode == Enum.KeyInterpolationMode.Constant then
        return v100.Value;
    elseif v100.InterpolationMode == Enum.KeyInterpolationMode.Linear then
        return v37.interpolate(v100.Value, v101.Value, v103);
    else
        local v104 = v37.getSlope(v95, v97, v1.SLOPES.Right);
        local v105 = v37.getSlope(v95, v98, v1.SLOPES.Left);
        local v106 = v103 * v103;
        local v107 = v106 * (2 * v103 - 3) + 1;
        local v108 = ((v103 - 2) * v103 + 1) * v103;
        local v109 = v106 * (3 - 2 * v103);
        local v110 = v106 * (v103 - 1);
        if v95.Type == v1.TRACK_TYPES.Quaternion then
            return v37.interpolate(v100.Value, v101.Value, ((v108 * v102) * v104 + v109) + (v110 * v102) * v105);
        else
            return ((v107 * v100.Value + (v108 * v102) * v104) + v109 * v101.Value) + (v110 * v102) * v105;
        end;
    end;
end;
v37.blendKeyframes = function(v111, v112, v113, v114)
    assert(v113 < v114, "Low keyframe must be less than high keyframe.");
    local v115 = v111[v113];
    local v116 = v111[v114];
    local v117 = (v112 - v113) / (v114 - v113);
    local _ = nil;
    if v115.EasingStyle == Enum.PoseEasingStyle.Constant then
        return v115.Value;
    else
        return v37.interpolate(v115.Value, v116.Value, if v115.EasingStyle == Enum.PoseEasingStyle.Linear then v117 else l_TweenService_0:GetValue(v117, Enum.EasingStyle[v115.EasingStyle.Name], Enum.EasingDirection[v115.EasingDirection.Name]));
    end;
end;
v37.getValue = function(v119, v120, v121)
    if ((not v119.Keyframes or v2(v119.Keyframes)) or not v119.Data) or v2(v119.Data) then
        if v119.Type == v1.TRACK_TYPES.CFrame then
            local v122 = if not v5() or v119 and v119.Components then v119.Components[v1.PROPERTY_KEYS.Position] else nil;
            local v123 = if not v5() or v119 and v119.Components then v119.Components[v1.PROPERTY_KEYS.Rotation] else nil;
            local v124 = not not v122 and v37.getValue(v122, v120, v121) or Vector3.new();
            if not (v5() and not v123) and v123.Type == v1.TRACK_TYPES.EulerAngles then
                local v125 = not not v123 and v37.getValue(v123, v120, v121) or Vector3.new();
                return CFrame.new(v124) * CFrame.fromEulerAngles(v125.X, v125.Y, v125.Z, v123.EulerAnglesOrder or v121);
            else
                return CFrame.new(v124) * (not not v123 and v37.getValue(v123, v120, v121) or CFrame.new());
            end;
        elseif not (not (v119.Type ~= v1.TRACK_TYPES.Position) or v119.Type == v1.TRACK_TYPES.EulerAngles) or not v119.Components then
            return v37.getDefaultValue(v119.Type);
        else
            local v126 = v119.Components[v1.PROPERTY_KEYS.X];
            local v127 = v119.Components[v1.PROPERTY_KEYS.Y];
            local v128 = v119.Components[v1.PROPERTY_KEYS.Z];
            return (Vector3.new(not not v126 and v37.getValue(v126, v120, v121) or 0, not not v127 and v37.getValue(v127, v120, v121) or 0, not not v128 and v37.getValue(v128, v120, v121) or 0));
        end;
    else
        local l_Keyframes_1 = v119.Keyframes;
        local v130, v131 = v37.findNearestKeyframes(l_Keyframes_1, v120);
        local v132 = l_Keyframes_1[v130];
        local v133 = v131 and l_Keyframes_1[v131];
        if v131 == nil then
            return v119.Data[v132].Value;
        elseif not v119.IsCurveTrack then
            return v37.blendKeyframes(v119.Data, v120, v132, v133);
        else
            return v37.blendCurveKeyframes(v119, v120, v132, v133);
        end;
    end;
end;
return v37;
