local l_script_FirstAncestor_0 = script:FindFirstAncestor("AnimationClipEditor");
local v1 = require(l_script_FirstAncestor_0.Packages.Cryo);
local l_Math_0 = require(l_script_FirstAncestor_0.Packages.Framework).Util.Math;
local _ = require(l_script_FirstAncestor_0.Src.Types);
local l_Util_0 = l_script_FirstAncestor_0.Src.Util;
local v5 = require(l_Util_0.Constants);
local v6 = require(l_Util_0.deepCopy);
local v7 = require(l_Util_0.fuzzyCFrameEq);
local v8 = require(l_Util_0.isEmpty);
local v9 = require(l_Util_0.KeyframeUtils);
local _ = require(l_Util_0.PathUtils);
local v11 = require(l_Util_0.Templates);
local v12 = require(l_Util_0.TrackUtils);
local v13 = require(l_script_FirstAncestor_0.LuaFlags.GetFFlagSelectFromViewport);
local v18 = {
    new = function(v14, v15, v16)
        assert(v14 ~= nil, "Expected a name for the AnimationData.");
        local v17 = v11.animationData();
        v17.Metadata.Name = v14;
        v17.Metadata.IsChannelAnimation = false;
        if v16 and v16 ~= "" then
            v17.Metadata.Guid = v16;
        end;
        v17.Instances.Root.Type = v15;
        return v17;
    end
};
v18.newRigAnimation = function(v19)
    return v18.new(v19, v5.INSTANCE_TYPES.Rig);
end;
if not v13() then
    v18.toCFrameArray = function(v20, v21, v22)
        assert(v20 ~= nil, "No bones array was provided.");
        assert(v21 ~= nil, "No data table was provided.");
        assert(typeof(v20) == "table", "Bones should be an array of bone names.");
        assert(typeof(v21) == "table", "Data must be an AnimationData table.");
        local l_TICK_FREQUENCY_0 = v5.TICK_FREQUENCY;
        local v24 = v22 or l_TICK_FREQUENCY_0;
        assert(v24 ~= nil, "No frame rate was found for exporting.");
        assert(l_TICK_FREQUENCY_0 > 0, "Input frame rate must be positive.");
        assert(v24 > 0, "Output frame rate must be positive.");
        local v25 = v21.Metadata.EndTick - v21.Metadata.StartTick;
        local v26 = l_TICK_FREQUENCY_0 / v24;
        local v27 = v25 / v26;
        local v28 = {};
        local l_Root_0 = v21.Instances.Root;
        assert(l_Root_0.Type == "Skeleton", "Can only export Skeleton animations to CFrame[][]");
        local l_Tracks_0 = l_Root_0.Tracks;
        for v31, v32 in ipairs(v20) do
            local v33 = {};
            if l_Tracks_0[v32] then
                for v34 = 1, v27 do
                    v33[v34] = v9.getValue(l_Tracks_0[v32], v34 * v26);
                end;
            end;
            v28[v31] = v33;
        end;
        return v28;
    end;
    v18.fromCFrameArray = function(v35, v36, v37, v38)
        assert(v35 ~= nil, "No bones array was provided.");
        assert(typeof(v35) == "table", "Bones should be an array of bone names.");
        local v39 = v18.new(v37, v38);
        v39.Instances.Root.Type = "Skeleton";
        local l_Tracks_1 = v39.Instances.Root.Tracks;
        for v41, v42 in ipairs(v35) do
            if #v36[v41] > 0 then
                l_Tracks_1[v42] = v11.track(v5.TRACK_TYPES.CFrame);
                l_Tracks_1[v42].Keyframes = {};
                l_Tracks_1[v42].Data = {};
                v39.Metadata.EndTick = math.max(v39.Metadata.EndTick, #v36[v41]);
                for v43 = 1, #v36[v41] do
                    table.insert(l_Tracks_1[v42].Keyframes, v43);
                    local v44 = v11.keyframe();
                    v44.EasingStyle = Enum.PoseEasingStyle.Linear;
                    v44.EasingDirection = Enum.PoseEasingDirection.In;
                    v44.Value = v36[v41][v43];
                    l_Tracks_1[v42].Data[v43] = v44;
                end;
            end;
        end;
        return v39;
    end;
end;
v18.addEvent = function(v45, v46, v47, v48)
    local l_Keyframes_0 = v45.Keyframes;
    local l_Data_0 = v45.Data;
    if not l_Data_0[v46] then
        local v51 = v9.findInsertIndex(l_Keyframes_0, v46);
        if v51 then
            table.insert(l_Keyframes_0, v51, v46);
        end;
        l_Data_0[v46] = {};
    end;
    if not l_Data_0[v46][v47] then
        l_Data_0[v46][v47] = v48 or "";
    end;
end;
v18.moveEvents = function(v52, v53, v54)
    if v53 == v54 then
        return ;
    else
        local l_Keyframes_1 = v52.Keyframes;
        local l_Data_1 = v52.Data;
        if l_Data_1[v53] then
            table.remove(l_Keyframes_1, (v9.findKeyframe(l_Keyframes_1, v53)));
            local v57 = v9.findInsertIndex(l_Keyframes_1, v54);
            if v57 then
                table.insert(l_Keyframes_1, v57, v54);
            end;
            l_Data_1[v54] = v6(l_Data_1[v53]);
            l_Data_1[v53] = nil;
        end;
        return ;
    end;
end;
v18.deleteEvents = function(v58, v59)
    local l_Keyframes_2 = v58.Keyframes;
    local l_Data_2 = v58.Data;
    if l_Data_2[v59] then
        table.remove(l_Keyframes_2, (v9.findKeyframe(l_Keyframes_2, v59)));
        l_Data_2[v59] = nil;
    end;
end;
v18.setEventValue = function(v62, v63, v64, v65)
    local l_Data_3 = v62.Data;
    if not (not l_Data_3[v63] or not l_Data_3[v63][v64]) then
        l_Data_3[v63][v64] = v65;
    end;
end;
v18.removeEvent = function(v67, v68, v69)
    local l_Keyframes_3 = v67.Keyframes;
    local l_Data_4 = v67.Data;
    if not (not l_Data_4[v68] or not l_Data_4[v68][v69]) then
        l_Data_4[v68][v69] = nil;
        if v8(l_Data_4[v68]) then
            l_Data_4[v68] = nil;
            table.remove(l_Keyframes_3, (v9.findKeyframe(l_Keyframes_3, v68)));
        end;
    end;
end;
v18.addTrack = function(v72, v73, v74, v75, v76, v77)
    v72[v73] = v11.track(v74);
    if not v75 then
        v72[v73].Keyframes = {};
        v72[v73].Data = {};
        v72[v73].EulerAnglesOrder = v77;
    else
        v12.splitTrackComponents(v72[v73], v76, v77);
    end;
    return v72[v73];
end;
v18.addKeyframe = function(v78, v79, v80)
    local l_Keyframes_4 = v78.Keyframes;
    local v82 = v9.findInsertIndex(l_Keyframes_4, v79);
    if v82 then
        table.insert(l_Keyframes_4, v82, v79);
    end;
    v78.Data[v79] = v1.Dictionary.join(v78.Data[v79] or v11.keyframe(), v80);
end;
v18.addDefaultKeyframe = function(v83, v84, v85)
    local v86 = {
        Value = v9.getDefaultValue(v85)
    };
    if not v83.IsCurveTrack then
        v86.EasingStyle = Enum.PoseEasingStyle.Linear;
        v86.EasingDirection = Enum.PoseEasingDirection.In;
    else
        v86.InterpolationMode = Enum.KeyInterpolationMode.Cubic;
    end;
    v18.addKeyframe(v83, v84, v86);
end;
v18.moveNamedKeyframe = function(v87, v88, v89)
    if v87.Events then
        local l_NamedKeyframes_0 = v87.Events.NamedKeyframes;
        if not (not l_NamedKeyframes_0 or not l_NamedKeyframes_0[v88]) then
            local v91 = l_NamedKeyframes_0[v88];
            local v92 = true;
            for _, v94 in pairs(v87.Instances) do
                for _, v96 in ipairs((v12.getSummaryKeyframes(v94.Tracks, v87.Metadata.StartTick, v87.Metadata.EndTick))) do
                    if v96 == v88 then
                        v92 = false;
                    end;
                end;
            end;
            if v92 then
                v18.setKeyframeName(v87, v88, nil);
                v18.setKeyframeName(v87, v89, v91);
            end;
        end;
    end;
end;
v18.moveKeyframe = function(v97, v98, v99)
    if v98 == v99 then
        return ;
    else
        local l_Keyframes_5 = v97.Keyframes;
        table.remove(l_Keyframes_5, (v9.findKeyframe(l_Keyframes_5, v98)));
        local v101 = v9.findInsertIndex(l_Keyframes_5, v99);
        if v101 then
            table.insert(l_Keyframes_5, v101, v99);
        end;
        v97.Data[v99] = v6(v97.Data[v98]);
        v97.Data[v98] = nil;
        return ;
    end;
end;
v18.deleteKeyframe = function(v102, v103)
    v102.Data[v103] = nil;
    table.remove(v102.Keyframes, (v9.findKeyframe(v102.Keyframes, v103)));
end;
v18.setKeyframeData = function(v104, v105, v106)
    v104.Data[v105] = v1.Dictionary.join(v104.Data[v105], v106);
end;
v18.setKeyframeName = function(v107, v108, v109)
    if v109 == v5.DEFAULT_KEYFRAME_NAME then
        v107.Events.NamedKeyframes[v108] = nil;
        return ;
    else
        v107.Events.NamedKeyframes[v108] = v109;
        return ;
    end;
end;
v18.validateKeyframeNames = function(v110)
    if v110.Events then
        local l_NamedKeyframes_1 = v110.Events.NamedKeyframes;
        if not (not l_NamedKeyframes_1 or v8(l_NamedKeyframes_1)) then
            local v112 = {};
            for _, v114 in pairs(v110.Instances) do
                for _, v116 in ipairs((v12.getSummaryKeyframes(v114.Tracks, v110.Metadata.StartTick, v110.Metadata.EndTick))) do
                    v112[v116] = true;
                end;
            end;
            for v117, _ in pairs(l_NamedKeyframes_1) do
                if not v112[v117] then
                    v18.setKeyframeName(v110, v117, nil);
                end;
            end;
        end;
    end;
end;
v18.setEndTick = function(v119)
    if v119 then
        local v120 = 0;
        if not (not v119 or not v119.Instances) then
            for _, v122 in pairs(v119.Instances) do
                if v122.Tracks then
                    for _, v124 in pairs(v122.Tracks) do
                        v12.traverseTracks(nil, v124, function(v125)
                            if not (not v125.Keyframes or v8(v125.Keyframes)) then
                                v120 = math.max(v120, v125.Keyframes[#v125.Keyframes]);
                            end;
                        end);
                    end;
                end;
            end;
        end;
        if v119.Metadata then
            v119.Metadata.EndTick = v120;
        end;
        return ;
    else
        return ;
    end;
end;
v18.getMaximumLength = function(v126)
    return v126 * v5.MAX_TIME;
end;
v18.setLooping = function(v127, v128)
    if v127 then
        v127.Metadata.Looping = v128;
    end;
end;
v18.isQuantized = function(v129)
    if not v129 or not v129.Instances then
        return ;
    else
        for _, v131 in pairs(v129.Instances) do
            for _, v133 in pairs(v131.Tracks) do
                for _, v135 in ipairs(v133.Keyframes) do
                    if v135 ~= math.floor(v135) then
                        return false;
                    end;
                end;
            end;
        end;
        return true;
    end;
end;
v18.removeExtraKeyframes = function(v136)
    local v137 = false;
    if v136 and v136.Metadata then
        if not ((not v136 or not v136.Instances) or not v136.Metadata) then
            local function v141(v138)
                if not ((not v138 or not v138.Keyframes) or not v138.Data) then
                    for v139, v140 in ipairs(v138.Keyframes) do
                        if v5.MAX_ANIMATION_LENGTH < v140 then
                            v138.Data[v140] = nil;
                            v138.Keyframes[v139] = nil;
                            v137 = true;
                        end;
                    end;
                end;
            end;
            local l_pairs_0 = pairs;
            local v143 = v136.Instances or {};
            for _, v145 in l_pairs_0(v143) do
                for _, v147 in pairs(v145.Tracks) do
                    v12.traverseTracks(nil, v147, v141, true);
                end;
            end;
            v141(v136.Events);
        end;
        return v137;
    else
        return v137;
    end;
end;
v18.getSelectionBounds = function(_, v149)
    if v149 and not v8(v149) then
        local l_MAX_ANIMATION_LENGTH_0 = v5.MAX_ANIMATION_LENGTH;
        local v151 = 0;
        local function v152(v153)
            local l_pairs_1 = pairs;
            local v155 = v153.Selection or {};
            for v156, _ in l_pairs_1(v155) do
                l_MAX_ANIMATION_LENGTH_0 = math.min(v156, l_MAX_ANIMATION_LENGTH_0);
                v151 = math.max(v156, v151);
            end;
            l_pairs_1 = pairs;
            v155 = v153.Components or {};
            for _, v159 in l_pairs_1(v155) do
                v152(v159);
            end;
        end;
        for _, v161 in pairs(v149) do
            for _, v163 in pairs(v161) do
                v152(v163);
            end;
        end;
        return l_MAX_ANIMATION_LENGTH_0, v151;
    else
        return nil, nil;
    end;
end;
v18.getEventBounds = function(_, v165)
    local l_MAX_ANIMATION_LENGTH_1 = v5.MAX_ANIMATION_LENGTH;
    local v167 = 0;
    local v168 = v1.Dictionary.keys(v165);
    table.sort(v168);
    if v168 then
        if v168[1] <= l_MAX_ANIMATION_LENGTH_1 then
            l_MAX_ANIMATION_LENGTH_1 = v168[1];
        end;
        if v167 <= v168[#v168] then
            v167 = v168[#v168];
        end;
    end;
    return l_MAX_ANIMATION_LENGTH_1, v167;
end;
v18.promoteToChannels = function(v169, v170, v171)
    if v169 and (not v169.Metadata or not v169.Metadata.IsChannelAnimation) then
        for _, v173 in pairs(v169.Instances) do
            for _, v175 in pairs(v173.Tracks) do
                v12.splitTrackComponents(v175, v5.TRACK_TYPES.Quaternion);
                if v175.Type == v5.TRACK_TYPES.CFrame and v170 == v5.TRACK_TYPES.EulerAngles then
                    v12.convertTrackToEulerAngles(v175.Components[v5.PROPERTY_KEYS.Rotation], v171);
                end;
            end;
        end;
        v18.clearTrackSequences(v169);
        v169.Metadata.IsChannelAnimation = true;
        v169.Metadata.Name = v169.Metadata.Name .. " [CHANNELS]";
        local v176 = 0;
        local v177 = 0;
        for _, v179 in pairs(v169.Instances) do
            for _, v181 in pairs(v179.Tracks) do
                v176 = v176 + 1;
                v177 = v177 + v12.countKeyframes(v181);
            end;
        end;
        return v176, v177;
    else
        return 0, 0;
    end;
end;
v18.isChannelAnimation = function(v182)
    return (v182 and v182.Metadata) and v182.Metadata.IsChannelAnimation;
end;
v18.getTrack = function(v183, v184, v185)
    if not ((not v183 or not v183.Instances[v184]) or not v185) and not v8(v185) then
        local v186 = v183.Instances[v184].Tracks[v185[1]];
        for v187, v188 in ipairs(v185) do
            if v187 > 1 then
                if not v186 or v186.Components == nil then
                    return nil;
                else
                    v186 = v186.Components[v188];
                end;
            end;
        end;
        return v186;
    else
        return nil;
    end;
end;
v18.hasFacsData = function(v189)
    if v189 then
        for _, v191 in pairs(v189.Instances) do
            for _, v193 in pairs(v191.Tracks) do
                if v193.Type == v5.TRACK_TYPES.Facs then
                    return true;
                end;
            end;
        end;
        return false;
    else
        return false;
    end;
end;
local function v207(v194)
    local v195 = nil;
    v195 = if not (v194.Type ~= v5.TRACK_TYPES.CFrame) or v194.Type == v5.TRACK_TYPES.Quaternion then v7 else l_Math_0.fuzzyEq;
    if not (not v194.Keyframes or not v194.Keyframes[1]) and v194.Data then
        assert((v194.Keyframes and v194.Keyframes[1]) and v194.Data);
        local v196 = v194.Keyframes[1];
        local v197 = v194.Data[v196];
        if v197 then
            local v198 = nil;
            local v199 = {};
            for v200 = 2, #v194.Keyframes do
                local v201 = v194.Keyframes[v200];
                if not v195(v194.Data[v201].Value, v197.Value) then
                    if v201 ~= v196 then
                        if v198 then
                            v199[v198] = nil;
                        end;
                        v196 = v201;
                        v197 = v194.Data[v196];
                    end;
                else
                    v199[v201] = true;
                end;
                v198 = v201;
            end;
            if v198 and v198 ~= v196 then
                v199[v198] = nil;
            end;
            local v202 = {};
            local v203 = false;
            for _, v205 in v194.Keyframes, nil, nil do
                if not v199[v205] then
                    table.insert(v202, v205);
                else
                    v194.Data[v205] = nil;
                    v203 = true;
                end;
            end;
            v194.Keyframes = v202;
            if #v194.Keyframes == 2 then
                local v206 = v9.getValue(v194, v194.Keyframes[1]);
                if not (not v195(v206, (v9.getValue(v194, v194.Keyframes[2]))) or not v195(v206, v9.getDefaultValue(v194.Type))) then
                    v194.Data = {};
                    v194.Keyframes = {};
                    v203 = true;
                end;
            end;
            return v203;
        else
            return false;
        end;
    else
        return false;
    end;
end;
v18.clearTrackSequences = function(v208)
    if v208 then
        local v209 = false;
        for _, v211 in pairs(v208.Instances) do
            for v212, v213 in pairs(v211.Tracks) do
                v12.traverseTracks(nil, v213, function(v214)
                    v209 = v207(v214) or v209;
                end, true);
                if not ((not (not (v213.Type ~= v5.TRACK_TYPES.CFrame) or v213.Type == v5.TRACK_TYPES.Facs) or not v213.Keyframes) or not v8(v213.Keyframes)) then
                    v211.Tracks[v212] = nil;
                end;
            end;
        end;
        return v209;
    else
        return false;
    end;
end;
return v18;
