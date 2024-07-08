local l_script_FirstAncestor_0 = script:FindFirstAncestor("AnimationClipEditor");
local v1 = require(l_script_FirstAncestor_0.Packages.Cryo);
local v2 = require(l_script_FirstAncestor_0.Src.Util.KeyframeUtils);
local v3 = require(l_script_FirstAncestor_0.Src.Util.PathUtils);
local v4 = require(l_script_FirstAncestor_0.Src.Util.Constants);
local v5 = require(l_script_FirstAncestor_0.Src.Util.CurveUtils);
local v6 = require(l_script_FirstAncestor_0.Src.Util.isEmpty);
local v7 = require(l_script_FirstAncestor_0.Src.Util.Templates);
local _ = require(l_script_FirstAncestor_0.Src.Types);
local v9 = {};
local function _(v10)
    if v10 == 0 then
        return (math.abs(v10));
    else
        return v10;
    end;
end;
v9.traverseTracks = function(v12, v13, v14, v15)
    assert(v14 ~= nil, "func must not be nil");
    local function v16(v17, v18, v19)
        if v17 ~= nil then
            if v18 then
                v19 = v1.List.join(v19, {
                    v18
                });
            end;
            local v20 = true;
            if v17.Components ~= nil then
                v20 = v6(v17.Components);
            end;
            if not (not v20 and v15) then
                v14(v17, v18, v19, v20);
            end;
            if v17.Components ~= nil then
                for v21, v22 in pairs(v17.Components) do
                    v16(v22, v21, v19);
                end;
            end;
        end;
    end;
    v16(v13, v12, {});
end;
v9.traverseKeyframeRange = function(v23, v24, v25, v26)
    local v27, v28 = v2.findNearestKeyframes(v23, v24);
    local v29 = v2.findNearestKeyframes(v23, v25);
    local v30 = not not v28 and v28 or v27;
    for v31 = v30, v29 do
        local v32 = v23[v31];
        if v24 <= v32 and v32 <= v25 then
            v26(v32, v23[v31]);
        end;
    end;
end;
v9.getNextKeyframe = function(v33, v34)
    local v35 = nil;
    for _, v37 in pairs(v33) do
        v9.traverseTracks(nil, v37, function(v38)
            local l_Keyframes_0 = v38.Keyframes;
            local v40, _, v42 = v2.findNearestKeyframesProperly(l_Keyframes_0, v34 + 1);
            v42 = v40 or v42;
            local v43 = not not v42 and l_Keyframes_0[v42] or nil;
            if v43 then
                v35 = not not v35 and math.min(v35, v43) or v43;
            end;
        end, true);
    end;
    return v35 or v34;
end;
v9.getPreviousKeyframe = function(v44, v45)
    local v46 = nil;
    for _, v48 in pairs(v44) do
        v9.traverseTracks(nil, v48, function(v49)
            local l_Keyframes_1 = v49.Keyframes;
            local v51, v52 = v2.findNearestKeyframesProperly(l_Keyframes_1, v45 - 1);
            v52 = v51 or v52;
            local v53 = not not v52 and l_Keyframes_1[v52] or nil;
            if v53 and v53 < v45 then
                v46 = not not v46 and math.max(v46, v53) or v53;
            end;
        end, true);
    end;
    return v46 or v45;
end;
v9.getSummaryKeyframes = function(v54, v55, v56, v57, _)
    local v59 = {};
    local v60 = {};
    for v61, v62 in pairs(v54) do
        local l_Instance_0 = v62.Instance;
        v9.traverseTracks(v62.Name or v61, v62, function(v64, _, v66)
            local l_Keyframes_2 = v64.Keyframes;
            local v68 = not not v57 and v57[l_Instance_0] or nil;
            for _, v70 in ipairs(v66) do
                v68 = not not v68 and (v68.Components and v68.Components[v70] or v68[v70]) or nil;
            end;
            local v71 = not not v68 and v68.Selection or {};
            if not (not l_Keyframes_2 or v6(l_Keyframes_2)) then
                v9.traverseKeyframeRange(l_Keyframes_2, v55, v56, function(v72)
                    v59[v72] = true;
                    if v71[v72] then
                        v60[v72] = true;
                    end;
                end);
            end;
        end, true);
    end;
    return v1.Dictionary.keys(v59), v60;
end;
v9.getScaledKeyframePosition = function(v73, v74, v75, v76)
    return (math.floor(((v73 - v74) * v76) / (v75 - v74)));
end;
v9.getKeyframeFromPosition = function(v77, v78, v79, v80, v81)
    return v2.getNearestTick(v78 + (v77.X - v80) / (v81 / (v79 - v78)));
end;
v9.countVisibleKeyframes = function(v82, v83, v84)
    local v85, v86 = v9.getKeyframesExtents(v82, v83, v84);
    if v85 == v86 then
        if (v2.findKeyframe(v82, v83) or v2.findKeyframe(v82, v84)) ~= nil then
            return 1;
        else
            return 0;
        end;
    else
        return (v86 - v85) + 1;
    end;
end;
v9.getKeyframesExtents = function(v87, v88, v89)
    local v90, v91 = v2.findNearestKeyframes(v87, v88);
    local v92 = nil;
    local v93 = nil;
    v92 = if v91 ~= nil then v91 else v90;
    v93 = v2.findNearestKeyframes(v87, v89);
    if (not (not v92 or not v93) and v88 <= v87[v92]) and v88 <= v87[v93] then
        return v92, v93;
    else
        return ;
    end;
end;
v9.getExpandedSize = function(v94)
    if not v94.Components then
        if v94.Type == v4.TRACK_TYPES.CFrame then
            return 3;
        else
            return 2;
        end;
    else
        local function v95(v96)
            local v97 = 1;
            if v96.Expanded then
                for _, v99 in pairs(v96.Components) do
                    v97 = v97 + v95(v99);
                end;
            end;
            return v97;
        end;
        local v100 = 1;
        if v94.Expanded then
            for _, v102 in pairs(v94.Components) do
                v100 = v100 + v95(v102);
            end;
        end;
        return v100;
    end;
end;
v9.getDefaultValue = function(v103)
    if not v103 or not v103.Type then
        return ;
    else
        return v2.getDefaultValue(v103.Type);
    end;
end;
v9.getTrackTypeFromName = function(v104, v105)
    for _, v107 in pairs(v105) do
        if v107.Name == v104 then
            return v107.Type;
        end;
    end;
end;
v9.getComponentTypeFromPath = function(v108, v109)
    for _, v111 in pairs(v109) do
        if v111.Name == v108[1] then
            local v112 = v3.getRelativePath(v108);
            local l_v111_0 = v111;
            for _, v115 in ipairs(v112) do
                if not (not l_v111_0.Components or not l_v111_0.Components[v115]) then
                    l_v111_0 = l_v111_0.Components[v115];
                end;
            end;
            return l_v111_0.Type;
        end;
    end;
end;
v9.getEulerAnglesOrder = function(v116)
    if v116 == nil then
        return nil;
    else
        assert(v116);
        if v116.Type == v4.TRACK_TYPES.CFrame then
            if v116.Components then
                assert(v116.Components);
                return v9.getEulerAnglesOrder(v116.Components[v4.PROPERTY_KEYS.Rotation]);
            else
                return nil;
            end;
        elseif v116.Type == v4.TRACK_TYPES.EulerAngles then
            return v116.EulerAnglesOrder;
        else
            return nil;
        end;
    end;
end;
v9.getRotationType = function(v117)
    local v118 = v117.Components and v117.Components[v4.PROPERTY_KEYS.Rotation];
    return not not v118 and v118.Type or nil;
end;
v9.getRotationTypeFromName = function(v119, v120)
    for _, v122 in pairs(v120) do
        if v122.Name == v119 then
            return v9.getRotationType(v122);
        end;
    end;
end;
v9.getTrackFromPosition = function(v123, v124, v125)
    local v126 = math.max(0, v124 - 1);
    v125 = v125 - v4.SUMMARY_TRACK_HEIGHT;
    local v127 = #v123;
    for v128, v129 in ipairs(v123) do
        if v124 <= v128 then
            if v125 > 0 then
                v126 = v126 + 1;
                if not v129.Expanded then
                    v125 = v125 - v4.TRACK_HEIGHT;
                else
                    v125 = v125 - v4.TRACK_HEIGHT * v9.getExpandedSize(v129);
                end;
            else
                break;
            end;
        end;
    end;
    if v125 / v4.TRACK_HEIGHT > 0 then
        return v127 + 1;
    elseif v126 == v124 - 1 then
        return 0;
    else
        return (math.max(0, v126));
    end;
end;
v9.getTrackInfoFromPosition = function(v130, v131, v132)
    if v132 < v4.SUMMARY_TRACK_HEIGHT then
        return 0, {}, nil, nil;
    else
        v132 = v132 - v4.SUMMARY_TRACK_HEIGHT;
        local function v133(v134, v135, v136)
            if v135 < v4.SUMMARY_TRACK_HEIGHT then
                return v136, v135, v134.Type, v9.getRotationType(v134);
            else
                v135 = v135 - v4.SUMMARY_TRACK_HEIGHT;
                if v134.Expanded then
                    for _, v138 in ipairs(v4.COMPONENT_TRACK_TYPES[v134.Type]._Order) do
                        local v139 = nil;
                        local v140 = nil;
                        if v134.Components[v138] then
                            local v141, v142, v143 = v133(v134.Components[v138], v135, v1.List.join(v136, {
                                v138
                            }));
                            v139 = v141;
                            v135 = v142;
                            v140 = v143;
                            if v139 then
                                return v139, v135, v140, nil;
                            end;
                        end;
                    end;
                end;
                return nil, v135, nil, nil;
            end;
        end;
        local v144 = math.max(0, v131 - 1);
        local v145 = nil;
        local v146 = nil;
        for v147, v148 in ipairs(v130) do
            if v131 <= v147 then
                local v149 = nil;
                local v150, v151, v152, v153 = v133(v148, v132, {
                    v148.Name
                });
                v149 = v150;
                v132 = v151;
                v145 = v152;
                v146 = v153;
                v144 = v144 + 1;
                if v149 then
                    return v144, v149, v145, v146;
                end;
            end;
        end;
        return #v130 + 1, {}, nil, nil;
    end;
end;
v9.getTrackIndex = function(v154, v155)
    for v156, v157 in ipairs(v154) do
        if v155 == v157.Name then
            return v156;
        end;
    end;
end;
v9.getTrackYPosition = function(v158, v159, v160)
    local l_SUMMARY_TRACK_HEIGHT_0 = v4.SUMMARY_TRACK_HEIGHT;
    local l_v159_0 = v159;
    while l_v159_0 < v160 do
        local v163 = v158[l_v159_0];
        l_SUMMARY_TRACK_HEIGHT_0 = if not v163.Expanded then l_SUMMARY_TRACK_HEIGHT_0 + v4.TRACK_HEIGHT else l_SUMMARY_TRACK_HEIGHT_0 + v4.TRACK_HEIGHT * v9.getExpandedSize(v163);
        l_v159_0 = l_v159_0 + 1;
    end;
    return l_SUMMARY_TRACK_HEIGHT_0;
end;
v9.getCurrentValue = function(v164, v165, v166, v167)
    local l_Name_0 = v164.Name;
    local l_Instance_1 = v164.Instance;
    if v166 == nil then
        return v9.getDefaultValue(v164);
    else
        local v170 = v166.Instances[l_Instance_1].Tracks[l_Name_0];
        if not v170 then
            return v9.getDefaultValue(v164);
        else
            return v2.getValue(v170, v165, v167);
        end;
    end;
end;
v9.getCurrentValueForPath = function(v171, v172, v173, v174, v175, v176)
    local v177 = v174.Instances[v172];
    for v178, v179 in ipairs(v171) do
        v177 = (v178 == 1 and v177.Tracks or v177.Components)[v179];
        if not v177 then
            return v2.getDefaultValue(v175);
        end;
    end;
    return v2.getValue(v177, v173, v176);
end;
v9.getItemsForProperty = function(v180, v181, v182, v183)
    local l_Type_0 = v180.Type;
    local v185 = v180.EulerAnglesOrder or v183;
    local _ = nil;
    local function v191(v187, v188, v189, v190)
        return {
            {
                Name = v4.PROPERTY_KEYS.X, 
                Key = "X", 
                Value = v187, 
                Type = v190
            }, 
            {
                Name = v4.PROPERTY_KEYS.Y, 
                Key = "Y", 
                Value = v188, 
                Type = v190
            }, 
            {
                Name = v4.PROPERTY_KEYS.Z, 
                Key = "Z", 
                Value = v189, 
                Type = v190
            }
        };
    end;
    if l_Type_0 == v4.TRACK_TYPES.CFrame then
        local l_Position_0 = v181.Position;
        local v193, v194, v195 = v181:ToEulerAngles(v185);
        local v196 = math.deg(v193);
        v193 = if v196 == 0 then math.abs(v196) else v196;
        v196 = math.deg(v194);
        v194 = if v196 == 0 then math.abs(v196) else v196;
        v196 = math.deg(v195);
        return {
            Position = v191(l_Position_0.X, l_Position_0.Y, l_Position_0.Z, v4.TRACK_TYPES.Number), 
            Rotation = v191(v193, v194, if v196 == 0 then math.abs(v196) else v196, v4.TRACK_TYPES.Angle)
        };
    elseif l_Type_0 == v4.TRACK_TYPES.Position then
        return (v191(v181.X, v181.Y, v181.Z, v4.TRACK_TYPES.Number));
    elseif l_Type_0 == v4.TRACK_TYPES.EulerAngles then
        local l_v191_0 = v191;
        local v198 = math.deg(v181.X);
        local v199 = if v198 == 0 then math.abs(v198) else v198;
        local v200 = math.deg(v181.Y);
        v198 = if v200 == 0 then math.abs(v200) else v200;
        local v201 = math.deg(v181.Z);
        return (l_v191_0(v199, v198, if v201 == 0 then math.abs(v201) else v201, v4.TRACK_TYPES.Angle));
    elseif l_Type_0 == v4.TRACK_TYPES.Quaternion then
        local v202, v203, v204 = v181:ToEulerAngles(v185);
        local l_v191_1 = v191;
        local v206 = math.deg(v202);
        local v207 = if v206 == 0 then math.abs(v206) else v206;
        local v208 = math.deg(v203);
        v206 = if v208 == 0 then math.abs(v208) else v208;
        local v209 = math.deg(v204);
        return (l_v191_1(v207, v206, if v209 == 0 then math.abs(v209) else v209, v4.TRACK_TYPES.Angle));
    elseif l_Type_0 == v4.TRACK_TYPES.Facs then
        return {
            {
                Name = "V", 
                Key = "Value", 
                Value = math.clamp(v181, 0, 1), 
                Type = v4.TRACK_TYPES.Facs
            }
        };
    elseif l_Type_0 == v4.TRACK_TYPES.Angle then
        local v210 = {};
        local v211 = {
            Name = v182, 
            Key = v182
        };
        local v212 = math.deg(v181);
        v211.Value = if v212 == 0 then math.abs(v212) else v212;
        v211.Type = v4.TRACK_TYPES.Angle;
        setlist { ['R008[1 to 1]'] = 'R009 to R009' };
        return v210;
    else
        return {
            {
                Name = v182, 
                Key = v182, 
                Value = v181, 
                Type = v4.TRACK_TYPES.Number
            }
        };
    end;
end;
v9.getPropertyForItems = function(v213, v214, v215)
    local l_Type_1 = v213.Type;
    local v217 = nil;
    local v218 = v213.EulerAnglesOrder or v215;
    if l_Type_1 == v4.TRACK_TYPES.CFrame then
        local l_Position_1 = v214.Position;
        local l_Rotation_0 = v214.Rotation;
        return CFrame.new(l_Position_1[1].Value, l_Position_1[2].Value, l_Position_1[3].Value) * CFrame.fromEulerAngles(math.rad(l_Rotation_0[1].Value), math.rad(l_Rotation_0[2].Value), math.rad(l_Rotation_0[3].Value), v218);
    elseif l_Type_1 == v4.TRACK_TYPES.Position then
        return (Vector3.new(v214[1].Value, v214[2].Value, v214[3].Value));
    elseif l_Type_1 == v4.TRACK_TYPES.EulerAngles then
        return (Vector3.new(math.rad(v214[1].Value), math.rad(v214[2].Value), (math.rad(v214[3].Value))));
    elseif l_Type_1 == v4.TRACK_TYPES.Quaternion then
        return (CFrame.fromEulerAngles(math.rad(v214[1].Value), math.rad(v214[2].Value), math.rad(v214[3].Value), v218));
    elseif l_Type_1 == v4.TRACK_TYPES.Number then
        return v214[1].Value;
    elseif l_Type_1 == v4.TRACK_TYPES.Angle then
        return (math.rad(v214[1].Value));
    else
        if l_Type_1 == v4.TRACK_TYPES.Facs then
            v217 = math.clamp(v214[1].Value, 0, 1);
        end;
        return v217;
    end;
end;
v9.getZoomRange = function(v221, v222, v223, v224)
    local v225 = {};
    local l_StartTick_0 = v221.Metadata.StartTick;
    local v227 = math.min((math.max(v221.Metadata.EndTick, v224) - l_StartTick_0) * v4.LENGTH_PADDING, v4.MAX_ANIMATION_LENGTH);
    local v228 = math.max(v227 * (1 - v223), 1);
    v225.Start = l_StartTick_0 + (v227 - v228) * v222;
    v225.End = v225.Start + v228;
    return v225;
end;
v9.adjustCurves = function(v229)
    if v229.Keyframes then
        local v230 = v1.List.join({}, v229.Keyframes);
        for v231, v232 in pairs(v230) do
            local v233 = v229.Data[v232];
            local l_EasingStyle_0 = v233.EasingStyle;
            local l_EasingDirection_0 = v233.EasingDirection;
            if v231 < #v230 then
                local v236 = v230[v231 + 1];
                local v237 = v5.generateCurve(v229.Type, l_EasingStyle_0, l_EasingDirection_0, v232, v233, v236, v229.Data[v236]);
                if not (not v237 or v6(v237)) then
                    v229.Keyframes = v1.List.join(v229.Keyframes, v1.Dictionary.keys(v237));
                    v229.Data = v1.Dictionary.join(v229.Data, v237);
                end;
            else
                v233.EasingStyle = nil;
                v233.EasingDirection = nil;
                v233.InterpolationMode = v4.POSE_EASING_STYLE_TO_KEY_INTERPOLATION[l_EasingStyle_0];
            end;
        end;
        table.sort(v229.Keyframes);
        v229.IsCurveTrack = true;
        return ;
    else
        return ;
    end;
end;
v9.splitTrackComponents = function(v238, v239, v240)
    if v238.Type == v4.TRACK_TYPES.CFrame then
        local function v241(v242)
            local v243 = v4.COMPONENT_TRACK_TYPES[v242.Type];
            if not v243 then
                v242.Keyframes = not not v238.Keyframes and v1.List.join({}, v238.Keyframes) or {};
                v242.Data = {};
                return ;
            else
                v242.Components = {};
                for _, v245 in pairs(v243._Order) do
                    local v246 = v243[v245];
                    if not (not (v245 == v4.PROPERTY_KEYS.Rotation) or not v239) then
                        v246 = v239;
                    end;
                    v242.Components[v245] = v7.track(v246);
                    if v245 == v4.PROPERTY_KEYS.Rotation and v246 == v4.TRACK_TYPES.EulerAngles then
                        v242.Components[v245].EulerAnglesOrder = v240;
                    end;
                    v241(v242.Components[v245]);
                end;
                return ;
            end;
        end;
        v241(v238);
        local l_pairs_0 = pairs;
        local v248 = v238.Keyframes or {};
        for _, v250 in l_pairs_0(v248) do
            local l_Value_0 = v238.Data[v250].Value;
            if v239 == v4.TRACK_TYPES.Quaternion then
                local l_Position_2 = l_Value_0.Position;
                local v253 = l_Value_0 - l_Value_0.Position;
                local l_Position_3 = v238.Components.Position;
                local l_Rotation_1 = v238.Components.Rotation;
                for _, v257 in ipairs(v4.COMPONENT_TRACK_TYPES[v4.TRACK_TYPES.Position]._Order) do
                    l_Position_3.Components[v257].Data[v250] = v1.Dictionary.join(v238.Data[v250], {
                        Value = l_Position_2[v257]
                    });
                end;
                l_Rotation_1.Data[v250] = v1.Dictionary.join(v238.Data[v250], {
                    Value = v253
                });
            else
                local l_Position_4 = l_Value_0.Position;
                local v259 = Vector3.new(l_Value_0:ToEulerAngles(v240));
                for v260, v261 in pairs(v238.Components) do
                    local v262 = v260 == v4.PROPERTY_KEYS.Position and l_Position_4 or v259;
                    for v263, v264 in pairs(v261.Components) do
                        v264.Data[v250] = v1.Dictionary.join(v238.Data[v250], {
                            Value = v262[v263]
                        });
                    end;
                    v261.Keyframes = nil;
                    v261.Data = nil;
                end;
            end;
        end;
        for _, v266 in pairs(v238.Components) do
            v9.adjustCurves(v266);
            local l_pairs_1 = pairs;
            local v268 = v266.Components or {};
            for _, v270 in l_pairs_1(v268) do
                v9.adjustCurves(v270);
            end;
        end;
        v238.Keyframes = nil;
        v238.Data = nil;
        return ;
    else
        if v238.Type == v4.TRACK_TYPES.Facs then
            v238.Keyframes = v238.Keyframes or {};
            v238.Data = v238.Data or {};
            v9.adjustCurves(v238);
        end;
        return ;
    end;
end;
v9.createTrackListEntryComponents = function(v271, v272, v273, v274)
    local v275 = v4.COMPONENT_TRACK_TYPES[v271.Type];
    v271.Instance = v272;
    if v275 then
        v271.Components = {};
        assert(v271.Components);
        for _, v277 in ipairs(v275._Order) do
            local v278 = v275[v277];
            local v279 = nil;
            if v277 == v4.PROPERTY_KEYS.Rotation then
                v279 = v7.trackListEntry(v273);
                if v273 == v4.TRACK_TYPES.EulerAngles then
                    v279.EulerAnglesOrder = v274;
                end;
            else
                v279 = v7.trackListEntry(v278);
            end;
            v279.Name = v277;
            v271.Components[v277] = v279;
            v9.createTrackListEntryComponents(v271.Components[v277], v272, v273, v274);
        end;
    end;
end;
v9.getComponentsInfo = function(v280, v281, v282)
    v282 = v282 or v281;
    local v283 = {};
    local v284 = 0;
    v9.traverseTracks(nil, v280, function()
        v284 = v284 + 1;
    end, true);
    v9.traverseTracks(nil, v280, function(v285)
        if v285.Data then
            for v286, v287 in pairs(v285.Data) do
                if v281 <= v286 and v286 <= v282 then
                    if not v283[v286] then
                        v283[v286] = {
                            Count = 1, 
                            Complete = v284 == 1, 
                            EasingStyle = v287.EasingStyle, 
                            InterpolationMode = v287.InterpolationMode
                        };
                    else
                        v283[v286].Count = v283[v286].Count + 1;
                        v283[v286].Complete = v283[v286].Count == v284;
                        if v283[v286].EasingStyle ~= v287.EasingStyle then
                            v283[v286].EasingStyle = nil;
                        end;
                        if v283[v286].InterpolationMode ~= v287.InterpolationMode then
                            v283[v286].InterpolationMode = nil;
                        end;
                    end;
                end;
            end;
        end;
    end, true);
    return v283;
end;
v9.findTrackEntry = function(v288, v289)
    if v288 and v289 then
        local v290 = nil;
        for _, v292 in ipairs(v288) do
            if v292.Name == v289[1] then
                v290 = v292;
                break;
            end;
        end;
        if v290 then
            for v293, v294 in ipairs(v289) do
                if v293 > 1 then
                    v290 = v290.Components[v294];
                    if not v290 then
                        return nil;
                    end;
                end;
            end;
            return v290;
        else
            return nil;
        end;
    else
        return nil;
    end;
end;
v9.traverseComponents = function(v295, v296, v297)
    local function v298(v299, v300)
        local v301 = v4.COMPONENT_TRACK_TYPES[v299];
        if not v301 then
            v296(v299, v300);
            return ;
        else
            for _, v303 in ipairs(v301._Order) do
                local v304 = v301[v303];
                if v303 == v4.PROPERTY_KEYS.Rotation then
                    v304 = v297;
                end;
                v298(v304, v1.List.join(v300, {
                    v303
                }));
            end;
            return ;
        end;
    end;
    v298(v295, {});
end;
v9.traverseValue = function(v305, v306, v307, v308, v309)
    local function v310(v311, v312, v313)
        if v311 == v4.TRACK_TYPES.CFrame then
            local l_Position_5 = v313.Position;
            v310(v4.TRACK_TYPES.Position, v1.List.join(v312, {
                v4.PROPERTY_KEYS.Position
            }), l_Position_5);
            v310(v308, v1.List.join(v312, {
                v4.PROPERTY_KEYS.Rotation
            }), if v308 == v4.TRACK_TYPES.Quaternion then v313 - l_Position_5 else Vector3.new(v313:ToEulerAngles(v309)));
            return ;
        elseif v311 == v4.TRACK_TYPES.Position then
            v310(v4.TRACK_TYPES.Number, v1.List.join(v312, {
                v4.PROPERTY_KEYS.X
            }), v313.X);
            v310(v4.TRACK_TYPES.Number, v1.List.join(v312, {
                v4.PROPERTY_KEYS.Y
            }), v313.Y);
            v310(v4.TRACK_TYPES.Number, v1.List.join(v312, {
                v4.PROPERTY_KEYS.Z
            }), v313.Z);
            return ;
        elseif v311 == v4.TRACK_TYPES.EulerAngles then
            v310(v4.TRACK_TYPES.Angle, v1.List.join(v312, {
                v4.PROPERTY_KEYS.X
            }), v313.X);
            v310(v4.TRACK_TYPES.Angle, v1.List.join(v312, {
                v4.PROPERTY_KEYS.Y
            }), v313.Y);
            v310(v4.TRACK_TYPES.Angle, v1.List.join(v312, {
                v4.PROPERTY_KEYS.Z
            }), v313.Z);
            return ;
        else
            v307(v311, v312, v313);
            return ;
        end;
    end;
    v310(v305, {}, v306);
end;
v9.findPreviousKeyframe = function(v315, v316, v317)
    local v318, v319, _ = v2.findNearestKeyframesProperly(v315.Keyframes, v316);
    if v317 then
        v319 = v319 or v318;
    end;
    local v321 = not not v319 and v315.Keyframes[v319] or nil;
    return not not v321 and v315.Data[v321] or nil;
end;
v9.convertTrackToEulerAngles = function(v322, v323)
    local v330 = {
        [Enum.RotationOrder.XYZ] = function(v324)
            return v324.Z, v324.Y, v324.X;
        end, 
        [Enum.RotationOrder.XZY] = function(v325)
            return v325.Y, v325.Z, v325.X;
        end, 
        [Enum.RotationOrder.YXZ] = function(v326)
            return v326.Z, v326.X, v326.Y;
        end, 
        [Enum.RotationOrder.YZX] = function(v327)
            return v327.X, v327.Z, v327.Y;
        end, 
        [Enum.RotationOrder.ZXY] = function(v328)
            return v328.Y, v328.X, v328.Z;
        end, 
        [Enum.RotationOrder.ZYX] = function(v329)
            return v329.X, v329.Y, v329.Z;
        end
    };
    local v349 = {
        [Enum.RotationOrder.XYZ] = function(v331, v332, v333)
            return (Vector3.new(v333, v332, v331));
        end, 
        [Enum.RotationOrder.XZY] = function(v334, v335, v336)
            return (Vector3.new(v336, v334, v335));
        end, 
        [Enum.RotationOrder.YXZ] = function(v337, v338, v339)
            return (Vector3.new(v338, v339, v337));
        end, 
        [Enum.RotationOrder.YZX] = function(v340, v341, v342)
            return (Vector3.new(v340, v342, v341));
        end, 
        [Enum.RotationOrder.ZXY] = function(v343, v344, v345)
            return (Vector3.new(v344, v343, v345));
        end, 
        [Enum.RotationOrder.ZYX] = function(v346, v347, v348)
            return (Vector3.new(v346, v347, v348));
        end
    };
    local function v366(v350, v351)
        local v352 = Vector3.new(v351:ToEulerAngles(v323));
        if v350 then
            local v353, v354, v355 = v330[v323](v352);
            local v356, v357, v358 = v330[v323](v350);
            local v359 = v353 + 3.141592653589793;
            local v360 = 3.141592653589793 - v354;
            local v361 = v355 + 3.141592653589793;
            local function _(v362, v363)
                return v363 + (math.floor((v362 - v363) / 6.283185307179586 + 0.5) * 3.141592653589793) * 2;
            end;
            local l_v353_0 = v353;
            v353 = l_v353_0 + (math.floor((v356 - l_v353_0) / 6.283185307179586 + 0.5) * 3.141592653589793) * 2;
            l_v353_0 = v359;
            v359 = l_v353_0 + (math.floor((v356 - l_v353_0) / 6.283185307179586 + 0.5) * 3.141592653589793) * 2;
            l_v353_0 = v354;
            v354 = l_v353_0 + (math.floor((v357 - l_v353_0) / 6.283185307179586 + 0.5) * 3.141592653589793) * 2;
            l_v353_0 = v360;
            v360 = l_v353_0 + (math.floor((v357 - l_v353_0) / 6.283185307179586 + 0.5) * 3.141592653589793) * 2;
            l_v353_0 = v355;
            v355 = l_v353_0 + (math.floor((v358 - l_v353_0) / 6.283185307179586 + 0.5) * 3.141592653589793) * 2;
            l_v353_0 = v361;
            v361 = l_v353_0 + (math.floor((v358 - l_v353_0) / 6.283185307179586 + 0.5) * 3.141592653589793) * 2;
            if ((v356 - v353) * (v356 - v353) + (v357 - v354) * (v357 - v354)) + (v358 - v355) * (v358 - v355) <= ((v356 - v359) * (v356 - v359) + (v357 - v360) * (v357 - v360)) + (v358 - v361) * (v358 - v361) then
                return v349[v323](v353, v354, v355);
            else
                return v349[v323](v359, v360, v361);
            end;
        else
            return v352;
        end;
    end;
    local l__Order_0 = v4.COMPONENT_TRACK_TYPES[v4.TRACK_TYPES.EulerAngles]._Order;
    v322.Components = {};
    assert(v322.Components);
    v322.EulerAnglesOrder = v323;
    for _, v369 in ipairs(l__Order_0) do
        local v370 = v7.track(v4.COMPONENT_TRACK_TYPES[v4.TRACK_TYPES.EulerAngles][v369]);
        v370.Keyframes = v1.List.join(v322.Keyframes);
        v370.Data = {};
        v370.IsCurveTrack = true;
        v322.Components[v369] = v370;
    end;
    local v371 = nil;
    if not (not v322.Keyframes or not v322.Data) then
        for _, v373 in ipairs(v322.Keyframes) do
            local v374 = v322.Data[v373];
            if v374 then
                v371 = v366(v371, v374.Value);
                for _, v376 in ipairs(l__Order_0) do
                    local v377 = v7.keyframe();
                    v377.Value = v371[v376];
                    v377.InterpolationMode = v374.InterpolationMode;
                    v322.Components[v376].Data[v373] = v377;
                end;
            end;
        end;
        for _, v379 in ipairs(l__Order_0) do
            local v380 = v322.Components[v379];
            for v381, v382 in ipairs(v322.Keyframes) do
                local v383 = v322.Keyframes[v381 - 1];
                local v384 = v322.Keyframes[v381 + 1];
                local v385 = v322.Data[v382];
                local v386 = v380.Data[v382];
                if not (v385.LeftSlope ~= nil) or not v383 then
                    v386.LeftSlope = nil;
                else
                    v386.LeftSlope = v385.LeftSlope * (v371[v379] - v380.Data[v383].Value);
                end;
                if not (v385.RightSlope ~= nil) or not v384 then
                    v386.RightSlope = nil;
                else
                    v386.RightSlope = v385.RightSlope * (v380.Data[v384].Value - v371[v379]);
                end;
            end;
        end;
    end;
    v322.Keyframes = nil;
    v322.Data = nil;
    v322.Type = v4.TRACK_TYPES.EulerAngles;
end;
v9.countKeyframes = function(v387)
    local v388 = 0;
    v9.traverseTracks(nil, v387, function(v389)
        if v389.Keyframes then
            v388 = v388 + #v389.Keyframes;
        end;
    end, true);
    return v388;
end;
return v9;
