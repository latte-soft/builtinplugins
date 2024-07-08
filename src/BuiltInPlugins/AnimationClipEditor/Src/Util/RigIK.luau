local _ = game:GetService("RunService");
local _ = game:GetService("Workspace");
local _ = game:GetService("ServerStorage");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("AnimationClipEditor");
local v4 = require(l_script_FirstAncestor_0.Packages.Roact);
local _ = require(l_script_FirstAncestor_0.Packages.Cryo);
local v6 = require(l_script_FirstAncestor_0.Packages.Framework);
local v7 = require(l_script_FirstAncestor_0.Packages.Thumbnailing);
local _ = v7.CharacterUtility;
local _ = v7.CFrameUtility;
local _ = require(l_script_FirstAncestor_0.Src.Types);
local _ = v6.Util.Math;
local _ = require(l_script_FirstAncestor_0.Src.Util.buildHierarchy);
local _ = require(l_script_FirstAncestor_0.Src.Util.AnimationData);
local _ = require(l_script_FirstAncestor_0.Src.Util.KeyframeUtils);
local _ = require(l_script_FirstAncestor_0.Src.Util.TrackUtils);
local _ = require(l_script_FirstAncestor_0.Src.Util.Adorn);
local _ = require(l_script_FirstAncestor_0.Src.Util.Templates);
local v18 = require(l_script_FirstAncestor_0.Src.Util.RigInfo);
local v19 = require(l_script_FirstAncestor_0.Src.Util.Constants);
local v20 = require(l_script_FirstAncestor_0.LuaFlags.GetFFlagAnimationConstraints);
local v21 = {};
local function v27(v22, v23)
    if not (not v22 or not v23) then
        for _, v25 in ipairs(v22:GetChildren()) do
            if v25:IsA("Attachment") then
                local l_v23_FirstChild_0 = v23:FindFirstChild(v25.Name);
                if l_v23_FirstChild_0 then
                    return v25, l_v23_FirstChild_0;
                end;
            end;
        end;
    end;
    return nil, nil;
end;
v21.buildR15Constraints = function(v28)
    local v29 = v18.getRigInfo(v28);
    local l_PartNameToMotor_0 = v29.PartNameToMotor;
    local l_PartNameToAnimConstraint_0 = v29.PartNameToAnimConstraint;
    local v32 = {};
    for v33, v34 in pairs(v19.PartToConstraintConfigMap) do
        local v35 = {};
        if not (v20() and not l_PartNameToMotor_0[v33]) then
            local v36, v37 = v27(l_PartNameToMotor_0[v33].Part0, l_PartNameToMotor_0[v33].Part1);
            v35.Attachment0 = v36;
            v35.Attachment1 = v37;
        end;
        if not ((not v20() or not l_PartNameToAnimConstraint_0) or not l_PartNameToAnimConstraint_0[v33]) then
            local v38, v39 = v27(v18.getPart0(l_PartNameToAnimConstraint_0[v33]), v18.getPart1(l_PartNameToAnimConstraint_0[v33]));
            v35.Attachment0 = v38;
            v35.Attachment1 = v39;
        end;
        if v35.Attachment0 then
            assert(v35.Attachment0);
            local v40 = string.gsub(v35.Attachment0.Name, "Attachment", "");
            if v34.LowerAngle ~= nil then
                v35.LowerAngle = v34.LowerAngle;
            end;
            if v34.TwistLimitsEnabled ~= nil then
                v35.TwistLimitsEnabled = v34.TwistLimitsEnabled;
                v35.TwistUpperAngle = v34.TwistUpperAngle;
                v35.TwistLowerAngle = v34.TwistLowerAngle;
            end;
            v35.Restitution = v34.Restitution;
            v35.LimitsEnabled = v34.LimitsEnabled;
            v35.UpperAngle = v34.UpperAngle;
            v35.Enabled = false;
            v32[v40] = {
                Type = v34.Type, 
                Props = v35
            };
        end;
    end;
    return v32;
end;
v21.canUseIK = function(v41)
    if v41 then
        assert(v41 ~= nil);
        local v42 = v18.getRigInfo(v41);
        local l_PartNameToMotor_1 = v42.PartNameToMotor;
        local l_PartNameToConstraint_0 = v42.PartNameToConstraint;
        local l_PartNameToAnimConstraint_1 = v42.PartNameToAnimConstraint;
        if next(l_PartNameToConstraint_0) ~= nil then
            return true, v18.usingTemporaryConstraints();
        else
            for v46, v47 in pairs(v19.R15links) do
                local v48 = l_PartNameToMotor_1[v46];
                local v49 = if not not v20() and l_PartNameToAnimConstraint_1 then l_PartNameToAnimConstraint_1[v46] else nil;
                if not v48 and (not v20() or not v49) then
                    return false, false;
                else
                    local v50, v51 = v27(v41:FindFirstChild(v46), v41:FindFirstChild(v47));
                    local v52 = if not v20() then nil else v18.getPart0(v49);
                    if not ((v50 ~= nil and v51 ~= nil) and (not v48 or v48.Part0.Name == v47)) or not (not v20() or not v52) and v52.Name ~= v47 then
                        return false, false;
                    end;
                end;
            end;
            return true, true;
        end;
    else
        return false, false;
    end;
end;
local function v62(v53, v54)
    local v55 = {};
    for _, v57 in pairs(v53) do
        v55[v57.Part0] = v57.Part0.CFrame;
        v55[v57.Part1] = v57.Part1.CFrame;
    end;
    if v20() then
        for _, v59 in v54, nil, nil do
            local v60 = v18.getPart0(v59.OriginalData);
            local v61 = v18.getPart1(v59.OriginalData);
            if not (not v60 or not v61) then
                v55[v60] = v60.CFrame;
                v55[v61] = v61.CFrame;
            end;
        end;
    end;
    return v55;
end;
local function _(v63)
    local l_Motor6D_0 = Instance.new("Motor6D");
    l_Motor6D_0.Name = v63.Name;
    l_Motor6D_0.Part0 = v63.Part0;
    l_Motor6D_0.Part1 = v63.Part1;
    l_Motor6D_0.C0 = v63.C0;
    l_Motor6D_0.C1 = v63.C1;
    l_Motor6D_0.Parent = v63.Parent;
end;
local function _(v66)
    v66.OriginalData.Parent = v66.Parent;
end;
local function _(v68, v69, v70, v71)
    return ((v70:Inverse() * v68:Inverse()) * v69) * v71;
end;
local function _(v73, v74)
    return ((v73.C0:Inverse() * v74[v73.Part0]:Inverse()) * v74[v73.Part1]) * v73.C1;
end;
local function v78(v76, v77)
    assert(v76.OriginalData.Attachment0 ~= nil);
    assert(v76.OriginalData.Attachment1 ~= nil);
    return ((v76.OriginalData.Attachment0.CFrame:Inverse() * v77[v18.getPart0(v76.OriginalData)]:Inverse()) * v77[v18.getPart1(v76.OriginalData)]) * v76.OriginalData.Attachment1.CFrame;
end;
local function v91(v79, v80, v81, v82)
    local l_PartNameToConstraint_1 = v18.getRigInfo(v79).PartNameToConstraint;
    for v84, v85 in pairs(v81) do
        if l_PartNameToConstraint_1[v84.Name] ~= nil then
            l_PartNameToConstraint_1[v84.Name].Enabled = false;
        end;
        v84.Anchored = false;
        local l_ipairs_0 = ipairs;
        local v87 = v85.Attachments or {};
        for _, v89 in l_ipairs_0(v87) do
            local l_v84_FirstChild_0 = v84:FindFirstChild(v89.Name);
            if not (not l_v84_FirstChild_0 or not l_v84_FirstChild_0:IsA("Attachment")) then
                l_v84_FirstChild_0.Axis = v89.Axis;
                l_v84_FirstChild_0.SecondaryAxis = v89.SecondaryAxis;
            end;
        end;
        l_ipairs_0 = Instance.new("Motor6D");
        l_ipairs_0.Name = v85.Name;
        l_ipairs_0.Part0 = v85.Part0;
        l_ipairs_0.Part1 = v85.Part1;
        l_ipairs_0.C0 = v85.C0;
        l_ipairs_0.C1 = v85.C1;
        l_ipairs_0.Parent = v85.Parent;
        v82[v84.Name] = ((v85.C0:Inverse() * v80[v85.Part0]:Inverse()) * v80[v85.Part1]) * v85.C1;
    end;
end;
local function v111(v92, v93, v94, v95, v96)
    local l_PartNameToConstraint_2 = v18.getRigInfo(v92).PartNameToConstraint;
    local function v105(v98, v99)
        if l_PartNameToConstraint_2[v98.Name] ~= nil then
            l_PartNameToConstraint_2[v98.Name].Enabled = false;
        end;
        v98.Anchored = false;
        local l_ipairs_1 = ipairs;
        local v101 = v99.Attachments or {};
        for _, v103 in l_ipairs_1(v101) do
            local l_v98_FirstChild_0 = v98:FindFirstChild(v103.Name);
            if not (not l_v98_FirstChild_0 or not l_v98_FirstChild_0:IsA("Attachment")) then
                l_v98_FirstChild_0.Axis = v103.Axis;
                l_v98_FirstChild_0.SecondaryAxis = v103.SecondaryAxis;
            end;
        end;
    end;
    for v106, v107 in pairs(v94) do
        v105(v106, v107);
        local l_Motor6D_1 = Instance.new("Motor6D");
        l_Motor6D_1.Name = v107.Name;
        l_Motor6D_1.Part0 = v107.Part0;
        l_Motor6D_1.Part1 = v107.Part1;
        l_Motor6D_1.C0 = v107.C0;
        l_Motor6D_1.C1 = v107.C1;
        l_Motor6D_1.Parent = v107.Parent;
        v96[v106.Name] = ((v107.C0:Inverse() * v93[v107.Part0]:Inverse()) * v93[v107.Part1]) * v107.C1;
    end;
    for v109, v110 in pairs(v95) do
        v105(v109, v110);
        v110.OriginalData.Parent = v110.Parent;
        v96[v109.Name] = v78(v110, v93);
    end;
end;
v21.ikDragEnd = function(v112, v113, v114)
    local v115 = {};
    local v116 = v62(v113, v114);
    if not v20() then
        v91(v112, v116, v113, v115);
    else
        v111(v112, v116, v113, v114, v115);
    end;
    v18.findRootPart(v112).Anchored = true;
    v18.clearCache();
    return v115;
end;
local function v121(v117, v118, v119)
    if not (not v117 or not v118) then
        v119[v117] = {
            Name = v118.Name, 
            Parent = v118.Parent, 
            Part0 = v118.Part0, 
            Part1 = v118.Part1, 
            C0 = v118.C0, 
            C1 = v118.C1, 
            Attachments = {}
        };
        local l_CFrame_0 = v117.CFrame;
        v118:Destroy();
        v117.CFrame = l_CFrame_0;
    end;
end;
local function v126(v122, v123, v124)
    if not (not v122 or not v123) then
        v124[v122] = {
            OriginalData = v123, 
            Parent = v123.Parent, 
            Attachments = {}
        };
        local l_CFrame_1 = v122.CFrame;
        v123.Parent = nil;
        v122.CFrame = l_CFrame_1;
    end;
end;
local function _(v127, v128, v129)
    if v129 then
        assert(v129);
        if v127 then
            local v130 = v127[v129.Name];
            if v130 then
                return v130.Part0;
            end;
        end;
        if not (not v20() or not v128) then
            local v131 = v128[v129.Name];
            if v131 then
                return v18.getPart0(v131);
            end;
        end;
        return nil;
    else
        return nil;
    end;
end;
local function _(v133, v134, v135)
    local l_v135_0 = v135;
    local v137 = -1;
    while l_v135_0 ~= nil do
        local l_l_v135_0_0 = l_v135_0;
        if l_l_v135_0_0 then
            assert(l_l_v135_0_0);
            if v133 then
                local v139 = v133[l_l_v135_0_0.Name];
                if v139 then
                    l_v135_0 = v139.Part0;
                    goto label0 --[[  true, true  ]];
                end;
            end;
            if not (not v20() or not v134) then
                local v140 = v134[l_l_v135_0_0.Name];
                if v140 then
                    l_v135_0 = v18.getPart0(v140);
                    goto label0 --[[  true, true  ]];
                end;
            end;
            l_v135_0 = nil;
        else
            l_v135_0 = nil;
        end;
        ::label0::;
        v137 = v137 + 1;
    end;
    return v137;
end;
v21.pinForLimbMode = function(v142, v143, v144)
    local v145 = {};
    local v146 = v143[v19.R15_PARTS.UpperTorso];
    local v147 = v143[v19.R15_PARTS.LowerTorso];
    local v148 = v143[v19.R15_PARTS.LeftFoot];
    local v149 = v143[v19.R15_PARTS.RightFoot];
    if not (not v146 or not v147) then
        if v142 ~= v146.Part1 and v142 ~= v147.Part1 then
            v145[v146.Part1] = true;
            v145[v147.Part1] = true;
        elseif not (not v148 or not v149) then
            v145[v148.Part1] = true;
            v145[v149.Part1] = true;
        end;
    end;
    if not (not v20() or not v144) then
        local v150 = v144[v19.R15_PARTS.UpperTorso];
        local v151 = v144[v19.R15_PARTS.LowerTorso];
        if not (not v150 or not v151) then
            local v152 = v18.getPart1(v150);
            local v153 = v18.getPart1(v151);
            if v142 ~= v152 and v142 ~= v153 then
                if not (not v152 or not v153) then
                    v145[v152] = true;
                    v145[v153] = true;
                    return v145;
                end;
            else
                local v154 = v144[v19.R15_PARTS.LeftFoot];
                local v155 = v144[v19.R15_PARTS.RightFoot];
                if not (not v154 or not v155) then
                    local v156 = v18.getPart1(v154);
                    local v157 = v18.getPart1(v155);
                    if not (not v156 or not v157) then
                        v145[v156] = true;
                        v145[v157] = true;
                    end;
                end;
            end;
        end;
    end;
    return v145;
end;
v21.getPoseCFrames = function(v158)
    local v159 = {};
    local v160 = v18.getRigInfo(v158);
    local l_PartNameToMotor_2 = v160.PartNameToMotor;
    local l_PartNameToAnimConstraint_2 = v160.PartNameToAnimConstraint;
    for _, v164 in pairs(l_PartNameToMotor_2) do
        if not (not v164.Part0 or not v164.Part1) then
            v159[v164.Part0.Name] = v164.Part0.CFrame;
            v159[v164.Part1.Name] = v164.Part1.CFrame;
        end;
    end;
    if not (not v20() or not l_PartNameToAnimConstraint_2) then
        for _, v166 in pairs(l_PartNameToAnimConstraint_2) do
            local v167 = v18.getPart0(v166);
            local v168 = v18.getPart1(v166);
            if not (not v167 or not v168) then
                v159[v167.Name] = v167.CFrame;
                v159[v168.Name] = v168.CFrame;
            end;
        end;
    end;
    return v159;
end;
local function v182(v169, v170, v171, v172)
    if not v170 or v170 == v4.None then
        return ;
    else
        assert(v170);
        for _, v174 in pairs(v169) do
            local v175 = v18.getPart0(v174);
            local v176 = v18.getPart1(v174);
            if not (((not ((v174:IsA("BallSocketConstraint") and v175 ~= nil) and v176 ~= nil) or not (v171[v175] and v171[v176]) and ((not v20() or not v172[v175]) or not v172[v176])) or not v174.Attachment0) or not v174.Attachment1) then
                local v177 = nil;
                for _, v179 in pairs(v169) do
                    if v18.getPart0(v179) == v176 then
                        v177 = v179;
                    end;
                end;
                local v180 = nil;
                local v181 = v18.getPart1(v177);
                if not v181 or not v176 then
                    if not (not v176 or not v175) then
                        v180 = (v170[v176.Name].p - v170[v175.Name].p).Unit;
                    end;
                else
                    v180 = (v170[v181.Name].p - v170[v176.Name].p).Unit;
                end;
                assert(v180);
                if not (not v171[v175] or not v171[v176]) then
                    v171[v175].Attachments = v171[v175].Attachments or {};
                    v171[v176].Attachments = v171[v176].Attachments or {};
                    table.insert(v171[v175].Attachments, {
                        Axis = v174.Attachment0.Axis, 
                        SecondaryAxis = v174.Attachment0.SecondaryAxis, 
                        Name = v174.Attachment0.Name
                    });
                    table.insert(v171[v176].Attachments, {
                        Axis = v174.Attachment1.Axis, 
                        SecondaryAxis = v174.Attachment1.SecondaryAxis, 
                        Name = v174.Attachment1.Name
                    });
                end;
                if not ((not v20() or not v172[v175]) or not v172[v176]) then
                    v172[v175].Attachments = v172[v175].Attachments or {};
                    v172[v176].Attachments = v172[v176].Attachments or {};
                    table.insert(v172[v175].Attachments, {
                        Axis = v174.Attachment0.Axis, 
                        SecondaryAxis = v174.Attachment0.SecondaryAxis, 
                        Name = v174.Attachment0.Name
                    });
                    table.insert(v172[v176].Attachments, {
                        Axis = v174.Attachment1.Axis, 
                        SecondaryAxis = v174.Attachment1.SecondaryAxis, 
                        Name = v174.Attachment1.Name
                    });
                end;
                v174.Attachment0.Axis = v180;
                v174.Attachment1.Axis = v180;
            end;
        end;
        return ;
    end;
end;
v21.ikDragStart = function(v183, v184, v185, v186, v187)
    v18.clearCache();
    local v188 = {};
    local v189 = {};
    local v190 = {};
    local v191 = {};
    local v192 = v18.getRigInfo(v183);
    local l_PartNameToMotor_3 = v192.PartNameToMotor;
    local l_PartNameToConstraint_3 = v192.PartNameToConstraint;
    local l_PartNameToAnimConstraint_3 = v192.PartNameToAnimConstraint;
    local function v206(v196)
        local l_l_PartNameToMotor_3_0 = l_PartNameToMotor_3;
        local l_l_PartNameToAnimConstraint_3_0 = l_PartNameToAnimConstraint_3;
        local l_v196_0 = v196;
        local v200 = -1;
        while l_v196_0 ~= nil do
            local l_l_v196_0_0 = l_v196_0;
            if l_l_v196_0_0 then
                assert(l_l_v196_0_0);
                if l_l_PartNameToMotor_3_0 then
                    local v202 = l_l_PartNameToMotor_3_0[l_l_v196_0_0.Name];
                    if v202 then
                        l_v196_0 = v202.Part0;
                        goto label1 --[[  true, true  ]];
                    end;
                end;
                if not (not v20() or not l_l_PartNameToAnimConstraint_3_0) then
                    local v203 = l_l_PartNameToAnimConstraint_3_0[l_l_v196_0_0.Name];
                    if v203 then
                        l_v196_0 = v18.getPart0(v203);
                        goto label1 --[[  true, true  ]];
                    end;
                end;
                l_v196_0 = nil;
            else
                l_v196_0 = nil;
            end;
            ::label1::;
            v200 = v200 + 1;
        end;
        local l_v200_0 = v200;
        while l_v200_0 >= 0 do
            if not v188[v196] then
                v189[#v189 + 1] = {
                    Item = v196, 
                    Priority = l_v200_0
                };
                v188[v196] = true;
            end;
            l_l_PartNameToMotor_3_0 = l_PartNameToMotor_3;
            l_l_PartNameToAnimConstraint_3_0 = l_PartNameToAnimConstraint_3;
            local l_v196_1 = v196;
            if l_v196_1 then
                assert(l_v196_1);
                if l_l_PartNameToMotor_3_0 then
                    l_v196_0 = l_l_PartNameToMotor_3_0[l_v196_1.Name];
                    if l_v196_0 then
                        v196 = l_v196_0.Part0;
                        goto label2 --[[  true, true  ]];
                    end;
                end;
                if not (not v20() or not l_l_PartNameToAnimConstraint_3_0) then
                    l_v196_0 = l_l_PartNameToAnimConstraint_3_0[l_v196_1.Name];
                    if l_v196_0 then
                        v196 = v18.getPart0(l_v196_0);
                        goto label2 --[[  true, true  ]];
                    end;
                end;
                v196 = nil;
            else
                v196 = nil;
            end;
            ::label2::;
            l_v200_0 = l_v200_0 - 1;
        end;
    end;
    if v185 then
        v187 = v21.pinForLimbMode(v184, l_PartNameToMotor_3, l_PartNameToAnimConstraint_3);
    end;
    v206(v184);
    for v207, v208 in pairs(v187) do
        if v208 and v207.Name ~= v184.Name then
            v206(v207);
        end;
    end;
    table.sort(v189, function(v209, v210)
        return v210.Priority < v209.Priority;
    end);
    for v211 = 1, #v189 do
        local l_Item_0 = v189[v211].Item;
        if l_Item_0 then
            v121(l_Item_0, l_PartNameToMotor_3[l_Item_0.Name], v190);
            if not (not v20() or not l_PartNameToAnimConstraint_3) then
                v126(l_Item_0, l_PartNameToAnimConstraint_3[l_Item_0.Name], v191);
            end;
            if v187[l_Item_0] and l_Item_0.Name ~= v184.Name then
                l_Item_0.Anchored = true;
            end;
        end;
    end;
    v182(l_PartNameToConstraint_3, v186, v190, v191);
    for v213 in pairs(v190) do
        local v214 = l_PartNameToConstraint_3[v213.Name];
        if v214 then
            v214.Enabled = true;
        end;
    end;
    if v20() then
        for v215 in pairs(v191) do
            local v216 = l_PartNameToConstraint_3[v215.Name];
            if v216 then
                v216.Enabled = true;
            end;
        end;
    end;
    return v190, v191;
end;
return v21;
