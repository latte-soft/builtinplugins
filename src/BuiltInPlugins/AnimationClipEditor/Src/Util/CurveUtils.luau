local l_script_FirstAncestor_0 = script:FindFirstAncestor("AnimationClipEditor");
local v1 = require(l_script_FirstAncestor_0.Packages.Cryo);
local v2 = require(l_script_FirstAncestor_0.Src.Util.KeyframeUtils);
local v3 = require(l_script_FirstAncestor_0.Src.Util.Templates);
local v4 = require(l_script_FirstAncestor_0.Src.Util.Constants);
local v58 = {
    makeCubic = function(v5, v6, v7, v8, v9, v10)
        local v11 = v8 - v6;
        local v12 = if not v10 then v9.Value - v7.Value else 1;
        if v5 == Enum.PoseEasingDirection.Out then
            v7.RightSlope = (3 * v12) / v11;
            v9.LeftSlope = 0;
        else
            v7.RightSlope = 0;
            v9.LeftSlope = (3 * v12) / v11;
        end;
        return {};
    end, 
    makeBounce = function(v13, v14, v15, v16, v17, v18, v19, v20)
        local v21 = {};
        local v22 = v16 - v14;
        local v23 = if not v18 then v17.Value - v15.Value else 1;
        v19 = v19 or 0.25;
        v20 = v20 or 3;
        local v24 = math.sqrt(v19);
        local v25 = 1;
        for v26 = 1, v20 do
            v25 = v25 + 2 * math.pow(v24, v26);
        end;
        local l_v24_0 = v24;
        local v28 = 2 * v25;
        local v29 = 1;
        local v30 = nil;
        for _ = 1, v20 do
            local v32 = nil;
            local v33 = nil;
            local v34 = v29 / v25;
            local v35 = not not v18 and ((2 * v25) * v24) / l_v24_0 or v28;
            local v36 = not not v18 and (2 * v25) / l_v24_0 or -v28 * v24;
            local v37 = v34 + l_v24_0 / v25;
            local v38 = 1 - l_v24_0 * l_v24_0;
            if v13 == Enum.PoseEasingDirection.In then
                v34 = 1 - v34;
                local l_v35_0 = v35;
                v35 = v36;
                v36 = l_v35_0;
                v37 = 1 - v37;
                v38 = 1 - v38;
            end;
            v32 = v2.getNearestTick(v14 + v34 * v22);
            v33 = v3.keyframe();
            v33.InterpolationMode = Enum.KeyInterpolationMode.Cubic;
            v33.LeftSlope = (v35 * v23) / v22;
            v33.RightSlope = (v36 * v23) / v22;
            v33.Value = v13 == Enum.PoseEasingDirection.In and v15.Value or v17.Value;
            v21[v32] = v33;
            v30 = if v13 == Enum.PoseEasingDirection.Out then v33.RightSlope else v33.LeftSlope;
            v32 = v2.getNearestTick(v14 + v37 * v22);
            v33 = v3.keyframe();
            v33.InterpolationMode = Enum.KeyInterpolationMode.Cubic;
            v33.LeftSlope = 0;
            v33.RightSlope = 0;
            if not v18 then
                v33.Value = v15.Value + v38 * (v17.Value - v15.Value);
            else
                v33.Value = v15.Value:lerp(v17.Value, v38);
            end;
            v21[v32] = v33;
            v29 = v29 + 2 * l_v24_0;
            l_v24_0 = l_v24_0 * v24;
            v28 = v28 * v24;
        end;
        if v13 == Enum.PoseEasingDirection.In then
            if not v18 then
                v15.RightSlope = -v30;
            else
                v15.RightSlope = v30;
            end;
            v17.LeftSlope = 0;
            return v21;
        else
            v15.RightSlope = 0;
            if not v18 then
                v17.LeftSlope = -v30;
                return v21;
            else
                v17.LeftSlope = v30;
                return v21;
            end;
        end;
    end, 
    makeElastic = function(v40, v41, v42, v43, v44, v45, v46, v47)
        local v48 = {};
        local v49 = v43 - v41;
        local v50 = if not v45 then v44.Value - v42.Value else 1;
        v46 = v46 or 3.3333333333333335;
        v47 = v47 or 10;
        local v51 = 6.283185307179586 * v46;
        local v52 = math.atan((-v47 * 0.6931471805599453) / v51) / v51;
        for v53 = 1, 2 * v46 do
            local v54 = v52 + v53 / (2 * v46);
            local v55 = 1 - math.pow(2, -v47 * v54) * math.cos(v51 * v54);
            if v40 == Enum.PoseEasingDirection.In then
                v54 = 1 - v54;
                v55 = 1 - v55;
            end;
            local v56 = v2.getNearestTick(v41 + v54 * v49);
            local v57 = v3.keyframe();
            v57.InterpolationMode = Enum.KeyInterpolationMode.Cubic;
            v57.LeftSlope = 0;
            v57.RightSlope = 0;
            if not v45 then
                v57.Value = v42.Value + v55 * (v44.Value - v42.Value);
            else
                v57.Value = v42.Value:lerp(v44.Value, v55);
            end;
            v48[v56] = v57;
        end;
        if v40 == Enum.PoseEasingDirection.In then
            v42.RightSlope = 0;
            v44.LeftSlope = ((v47 * 0.6931471805599453) * v50) / v49;
            return v48;
        else
            v42.RightSlope = ((v47 * 0.6931471805599453) * v50) / v49;
            v44.LeftSlope = 0;
            return v48;
        end;
    end
};
v58.generateCurve = function(v59, v60, v61, v62, v63, v64, v65)
    local v66 = {
        [Enum.PoseEasingStyle.Cubic] = v58.makeCubic, 
        [Enum.PoseEasingStyle.Bounce] = v58.makeBounce, 
        [Enum.PoseEasingStyle.Elastic] = v58.makeElastic
    };
    local v67 = v59 == v4.TRACK_TYPES.Quaternion;
    v63.InterpolationMode = v4.POSE_EASING_STYLE_TO_KEY_INTERPOLATION[v60];
    v63.EasingStyle = nil;
    v63.EasingDirection = nil;
    if (v61 == Enum.PoseEasingDirection.InOut and v60 ~= Enum.PoseEasingStyle.Constant) and v60 ~= Enum.PoseEasingStyle.Linear then
        local v68 = v2.getNearestTick((v62 + v64) * 0.5);
        local v69 = v3.keyframe();
        if not v67 then
            v69.Value = (v63.Value + v65.Value) * 0.5;
        else
            v69.Value = v63.Value:lerp(v65.Value, 0.5);
        end;
        local v70 = v1.Dictionary.join(v58.generateCurve(v59, v60, Enum.PoseEasingDirection.In, v62, v63, v68, v69), (v58.generateCurve(v59, v60, Enum.PoseEasingDirection.Out, v68, v69, v64, v65)));
        if v60 ~= Enum.PoseEasingStyle.Elastic then
            v70[v68] = v69;
        end;
        return v70;
    elseif not v66[v60] then
        return {};
    else
        return v66[v60](v61, v62, v63, v64, v65, v67);
    end;
end;
v58.getYExtents = function(v71, v72, v73, v74, v75, v76)
    local l_v71_0 = v71;
    local l_v72_0 = v72;
    local l_v74_0 = v74;
    local l_v75_0 = v75;
    local l_l_v72_0_0 = l_v72_0;
    local l_l_v72_0_1 = l_v72_0;
    local v83 = (v73 * (l_v74_0 - l_v71_0)) / (l_v75_0 - l_v72_0);
    local v84 = (v76 * (l_v74_0 - l_v71_0)) / (l_v75_0 - l_v72_0);
    local v85 = (6 - 4 * v83) - 2 * v84;
    local v86 = v85 * v85 - (4 * ((3 * v83 + 3 * v84) - 6)) * v83;
    local function _(v87)
        return v87 * (v87 * (((3 - 2 * v87) + (v87 - 2) * v83) + (v87 - 1) * v84) + v83);
    end;
    if v86 >= 0 then
        local v89 = math.sqrt(v86);
        local v90 = (((4 * v83 + 2 * v84) - 6) + v89) / ((6 * v83 + 6 * v84) - 12);
        if v90 > 0 and v90 < 1 then
            l_l_v72_0_0 = l_v72_0 + (v90 * (v90 * (((3 - 2 * v90) + (v90 - 2) * v83) + (v90 - 1) * v84) + v83)) * (l_v75_0 - l_v72_0);
        end;
        local v91 = (((4 * v83 + 2 * v84) - 6) - v89) / ((6 * v83 + 6 * v84) - 12);
        if v91 > 0 and v91 < 1 then
            l_l_v72_0_1 = l_v72_0 + (v91 * (v91 * (((3 - 2 * v91) + (v91 - 2) * v83) + (v91 - 1) * v84) + v83)) * (l_v75_0 - l_v72_0);
        end;
    end;
    return math.min(l_v72_0, l_l_v72_0_0, l_l_v72_0_1, l_v75_0), (math.max(l_v72_0, l_l_v72_0_0, l_l_v72_0_1, l_v75_0));
end;
return v58;
