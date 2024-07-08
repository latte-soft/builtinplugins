local l_RunService_0 = game:GetService("RunService");
local l_Workspace_0 = game:GetService("Workspace");
local l_ServerStorage_0 = game:GetService("ServerStorage");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("AnimationClipEditor");
local v4 = require(l_script_FirstAncestor_0.Packages.Roact);
local _ = require(l_script_FirstAncestor_0.Packages.Cryo);
local v6 = require(l_script_FirstAncestor_0.Packages.Framework);
local v7 = require(l_script_FirstAncestor_0.Packages.Thumbnailing);
local l_CharacterUtility_0 = v7.CharacterUtility;
local l_CFrameUtility_0 = v7.CFrameUtility;
local _ = require(l_script_FirstAncestor_0.Src.Types);
local _ = v6.Util.Math;
local _ = require(l_script_FirstAncestor_0.Src.Util.buildHierarchy);
local _ = require(l_script_FirstAncestor_0.Src.Util.AnimationData);
local v14 = require(l_script_FirstAncestor_0.Src.Util.KeyframeUtils);
local _ = require(l_script_FirstAncestor_0.Src.Util.TrackUtils);
local _ = require(l_script_FirstAncestor_0.Src.Util.Adorn);
local _ = require(l_script_FirstAncestor_0.Src.Util.Templates);
local v18 = require(l_script_FirstAncestor_0.Src.Util.RigInfo);
local v19 = require(l_script_FirstAncestor_0.Src.Util.Constants);
local v20 = require(l_script_FirstAncestor_0.LuaFlags.GetFFlagAnimationConstraints);
local v21 = require(l_script_FirstAncestor_0.LuaFlags.GetFFlagRigIK);
local v22 = {};
if not v21() then
    v22.buildR15Constraints = function(v23)
        local v24 = v18.getRigInfo(v23);
        local l_PartNameToMotor_0 = v24.PartNameToMotor;
        local l_PartNameToAnimConstraint_0 = v24.PartNameToAnimConstraint;
        local v27 = {};
        for v28, v29 in pairs(v19.PartToConstraintConfigMap) do
            local v30 = {};
            if not (v20() and not l_PartNameToMotor_0[v28]) then
                local v31, v32 = v22.findMatchingAttachments(l_PartNameToMotor_0[v28].Part0, l_PartNameToMotor_0[v28].Part1);
                v30.Attachment0 = v31;
                v30.Attachment1 = v32;
            end;
            if not ((not v20() or not l_PartNameToAnimConstraint_0) or not l_PartNameToAnimConstraint_0[v28]) then
                local v33, v34 = v22.findMatchingAttachments(v18.getPart0(l_PartNameToAnimConstraint_0[v28]), v18.getPart1(l_PartNameToAnimConstraint_0[v28]));
                v30.Attachment0 = v33;
                v30.Attachment1 = v34;
            end;
            local v35 = string.gsub(v30.Attachment0.Name, "Attachment", "");
            if v29.LowerAngle ~= nil then
                v30.LowerAngle = v29.LowerAngle;
            end;
            if v29.TwistLimitsEnabled ~= nil then
                v30.TwistLimitsEnabled = v29.TwistLimitsEnabled;
                v30.TwistUpperAngle = v29.TwistUpperAngle;
                v30.TwistLowerAngle = v29.TwistLowerAngle;
            end;
            v30.Restitution = v29.Restitution;
            v30.LimitsEnabled = v29.LimitsEnabled;
            v30.UpperAngle = v29.UpperAngle;
            v30.Enabled = false;
            v27[v35] = {
                Type = v29.Type, 
                Props = v30
            };
        end;
        return v27;
    end;
    v22.findMatchingAttachments = function(v36, v37)
        if not (not v36 or not v37) then
            for _, v39 in ipairs(v36:GetChildren()) do
                if v39:IsA("Attachment") then
                    local l_v37_FirstChild_0 = v37:FindFirstChild(v39.Name);
                    if l_v37_FirstChild_0 then
                        return v39, l_v37_FirstChild_0;
                    end;
                end;
            end;
        end;
    end;
    v22.canUseIK = function(v41)
        if v41 then
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
                        local v50, v51 = v22.findMatchingAttachments(v41:FindFirstChild(v46), v41:FindFirstChild(v47));
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
end;
v22.canUseFaceControlsEditor = function(v53)
    if v53 then
        if v53:FindFirstChildOfClass("Humanoid") then
            if v18.getFaceControls(v53) == nil then
                return false;
            else
                return true;
            end;
        else
            return false;
        end;
    else
        return false;
    end;
end;
v22.getJoints = function(v54, v55)
    local v56 = {};
    local v57 = v18.getRigInfo(v55);
    local l_PartNameToMotor_2 = v57.PartNameToMotor;
    local l_PartNameToAnimConstraint_2 = v57.PartNameToAnimConstraint;
    local l_BoneNameToBone_0 = v57.BoneNameToBone;
    for _, v62 in ipairs(v54) do
        local l_Name_0 = v62.Name;
        if not l_PartNameToMotor_2[l_Name_0] then
            if not l_BoneNameToBone_0[l_Name_0] then
                if v20() then
                    local v64 = l_PartNameToAnimConstraint_2[l_Name_0];
                    if not ((not v64 or not v64.Attachment0) or not v64.Attachment1) then
                        table.insert(v56, {
                            Type = v19.JOINT_TYPES.AnimationConstraint, 
                            Part0 = v18.getPart0(v64), 
                            Part1 = v18.getPart1(v64), 
                            C0 = v64.Attachment0.CFrame, 
                            C1 = v64.Attachment1.CFrame
                        });
                    end;
                end;
            else
                table.insert(v56, {
                    Type = v19.JOINT_TYPES.Bone, 
                    Bone = l_BoneNameToBone_0[l_Name_0]
                });
            end;
        else
            table.insert(v56, {
                Type = v19.JOINT_TYPES.Motor6D, 
                Part0 = l_PartNameToMotor_2[l_Name_0].Part0, 
                Part1 = l_PartNameToMotor_2[l_Name_0].Part1, 
                C0 = l_PartNameToMotor_2[l_Name_0].C0, 
                C1 = l_PartNameToMotor_2[l_Name_0].C1
            });
        end;
    end;
    return v56;
end;
if not v21() then
    local function v74(v65, v66)
        local v67 = {};
        for _, v69 in pairs(v65) do
            v67[v69.Part0] = v69.Part0.CFrame;
            v67[v69.Part1] = v69.Part1.CFrame;
        end;
        if v20() then
            for _, v71 in v66, nil, nil do
                local v72 = v18.getPart0(v71.OriginalData);
                local v73 = v18.getPart1(v71.OriginalData);
                v67[v72] = v72.CFrame;
                v67[v73] = v73.CFrame;
            end;
        end;
        return v67;
    end;
    local function _(v75)
        local l_Motor6D_0 = Instance.new("Motor6D");
        l_Motor6D_0.Name = v75.Name;
        l_Motor6D_0.Part0 = v75.Part0;
        l_Motor6D_0.Part1 = v75.Part1;
        l_Motor6D_0.C0 = v75.C0;
        l_Motor6D_0.C1 = v75.C1;
        l_Motor6D_0.Parent = v75.Parent;
    end;
    local function _(v78)
        v78.OriginalData.Parent = v78.Parent;
    end;
    local function _(v80, v81, v82, v83)
        return ((v82:inverse() * v80:inverse()) * v81) * v83;
    end;
    local function _(v85, v86)
        return ((v85.C0:inverse() * v86[v85.Part0]:inverse()) * v86[v85.Part1]) * v85.C1;
    end;
    local function _(v88, v89)
        return ((v88.OriginalData.Attachment0.CFrame:inverse() * v89[v18.getPart0(v88.OriginalData)]:inverse()) * v89[v18.getPart1(v88.OriginalData)]) * v88.OriginalData.Attachment1.CFrame;
    end;
    v22.getJointTransform = function(v91)
        return ((v91.C0:inverse() * v91.Part0.CFrame:inverse()) * v91.Part1.CFrame) * v91.C1;
    end;
    local function v103(v92, v93, v94, v95)
        local l_PartNameToConstraint_1 = v18.getRigInfo(v92).PartNameToConstraint;
        for v97, v98 in pairs(v94) do
            if l_PartNameToConstraint_1[v97.Name] ~= nil then
                l_PartNameToConstraint_1[v97.Name].Enabled = false;
            end;
            v97.Anchored = false;
            local v99 = v98.Attachments or {};
            for _, v101 in v99, nil, nil do
                local l_v97_FirstChild_0 = v97:FindFirstChild(v101.Name);
                if l_v97_FirstChild_0 then
                    l_v97_FirstChild_0.Axis = v101.Axis;
                    l_v97_FirstChild_0.SecondaryAxis = v101.SecondaryAxis;
                end;
            end;
            v99 = Instance.new("Motor6D");
            v99.Name = v98.Name;
            v99.Part0 = v98.Part0;
            v99.Part1 = v98.Part1;
            v99.C0 = v98.C0;
            v99.C1 = v98.C1;
            v99.Parent = v98.Parent;
            v95[v97.Name] = ((v98.C0:inverse() * v93[v98.Part0]:inverse()) * v93[v98.Part1]) * v98.C1;
        end;
    end;
    local function v123(v104, v105, v106, v107, v108)
        local l_PartNameToConstraint_2 = v18.getRigInfo(v104).PartNameToConstraint;
        local function v117(v110, v111, _)
            if l_PartNameToConstraint_2[v110.Name] ~= nil then
                l_PartNameToConstraint_2[v110.Name].Enabled = false;
            end;
            v110.Anchored = false;
            local v113 = v111.Attachments or {};
            for _, v115 in v113, nil, nil do
                local l_v110_FirstChild_0 = v110:FindFirstChild(v115.Name);
                if l_v110_FirstChild_0 then
                    l_v110_FirstChild_0.Axis = v115.Axis;
                    l_v110_FirstChild_0.SecondaryAxis = v115.SecondaryAxis;
                end;
            end;
        end;
        for v118, v119 in pairs(v106) do
            v117(v118, v119);
            local l_Motor6D_1 = Instance.new("Motor6D");
            l_Motor6D_1.Name = v119.Name;
            l_Motor6D_1.Part0 = v119.Part0;
            l_Motor6D_1.Part1 = v119.Part1;
            l_Motor6D_1.C0 = v119.C0;
            l_Motor6D_1.C1 = v119.C1;
            l_Motor6D_1.Parent = v119.Parent;
            v108[v118.Name] = ((v119.C0:inverse() * v105[v119.Part0]:inverse()) * v105[v119.Part1]) * v119.C1;
        end;
        for v121, v122 in pairs(v107) do
            v117(v121, v122);
            v122.OriginalData.Parent = v122.Parent;
            v108[v121.Name] = ((v122.OriginalData.Attachment0.CFrame:inverse() * v105[v18.getPart0(v122.OriginalData)]:inverse()) * v105[v18.getPart1(v122.OriginalData)]) * v122.OriginalData.Attachment1.CFrame;
        end;
    end;
    v22.ikDragEnd = function(v124, v125, v126)
        local v127 = {};
        local v128 = v74(v125, v126);
        if not v20() then
            v103(v124, v128, v125, v127);
        else
            v123(v124, v128, v125, v126, v127);
        end;
        v18.findRootPart(v124).Anchored = true;
        v18.clearCache();
        return v127;
    end;
    local function v133(v129, v130, v131)
        if not (not v129 or not v130) then
            v131[v129] = {
                Name = v130.Name, 
                Parent = v130.Parent, 
                Part0 = v130.Part0, 
                Part1 = v130.Part1, 
                C0 = v130.C0, 
                C1 = v130.C1
            };
            local l_CFrame_0 = v129.CFrame;
            v130:Destroy();
            v129.CFrame = l_CFrame_0;
        end;
    end;
    local function _(v134, v135, v136)
        if not (not v134 or not v135) then
            v136[v134] = {
                OriginalData = v135, 
                Parent = v135.Parent
            };
            local l_CFrame_1 = v134.CFrame;
            v135.Parent = nil;
            v134.CFrame = l_CFrame_1;
        end;
    end;
    local function _(v139, v140, v141)
        if v139 then
            local v142 = v139[v141.Name];
            if v142 then
                return v142.Part0;
            end;
        end;
        if not (not v20() or not v140) then
            local v143 = v140[v141.Name];
            if v143 then
                return v18.getPart0(v143);
            end;
        end;
    end;
    local function _(v145, v146, v147)
        local l_v147_0 = v147;
        local v149 = -1;
        while l_v147_0 ~= nil do
            local l_l_v147_0_0 = l_v147_0;
            if v145 then
                local v151 = v145[l_l_v147_0_0.Name];
                if v151 then
                    l_v147_0 = v151.Part0;
                    goto label0 --[[  true, true  ]];
                end;
            end;
            if not (not v20() or not v146) then
                local v152 = v146[l_l_v147_0_0.Name];
                if v152 then
                    l_v147_0 = v18.getPart0(v152);
                    goto label0 --[[  true, true  ]];
                end;
            end;
            l_v147_0 = nil;
            ::label0::;
            v149 = v149 + 1;
        end;
        return v149;
    end;
    v22.pinForLimbMode = function(v154, v155, v156)
        local v157 = {};
        local v158 = v155[v19.R15_PARTS.UpperTorso];
        local v159 = v155[v19.R15_PARTS.LowerTorso];
        local v160 = v155[v19.R15_PARTS.LeftFoot];
        local v161 = v155[v19.R15_PARTS.RightFoot];
        if not (not v158 or not v159) then
            if v154 ~= v158.Part1 and v154 ~= v159.Part1 then
                v157[v158.Part1] = true;
                v157[v159.Part1] = true;
            elseif not (not v160 or not v161) then
                v157[v160.Part1] = true;
                v157[v161.Part1] = true;
            end;
        end;
        if not (not v20() or not v156) then
            local v162 = v156[v19.R15_PARTS.UpperTorso];
            local v163 = v156[v19.R15_PARTS.LowerTorso];
            if not (not v162 or not v163) then
                local v164 = v18.getPart1(v162);
                local v165 = v18.getPart1(v163);
                if v154 ~= v164 and v154 ~= v165 then
                    if not (not v164 or not v165) then
                        v157[v164] = true;
                        v157[v165] = true;
                        return v157;
                    end;
                else
                    local v166 = v156[v19.R15_PARTS.LeftFoot];
                    local v167 = v156[v19.R15_PARTS.RightFoot];
                    if not (not v166 or not v167) then
                        local v168 = v18.getPart1(v166);
                        local v169 = v18.getPart1(v167);
                        if not (not v168 or not v169) then
                            v157[v168] = true;
                            v157[v169] = true;
                        end;
                    end;
                end;
            end;
        end;
        return v157;
    end;
    v22.getPoseCFrames = function(v170)
        local v171 = {};
        local v172 = v18.getRigInfo(v170);
        local l_PartNameToMotor_3 = v172.PartNameToMotor;
        local l_PartNameToAnimConstraint_3 = v172.PartNameToAnimConstraint;
        for _, v176 in pairs(l_PartNameToMotor_3) do
            v171[v176.Part0.Name] = v176.Part0.CFrame;
            v171[v176.Part1.Name] = v176.Part1.CFrame;
        end;
        if not (not v20() or not l_PartNameToAnimConstraint_3) then
            for _, v178 in pairs(l_PartNameToAnimConstraint_3) do
                local v179 = v18.getPart0(v178);
                local v180 = v18.getPart1(v178);
                v171[v179.Name] = v179.CFrame;
                v171[v180.Name] = v180.CFrame;
            end;
        end;
        return v171;
    end;
    v22.fixRigAttachments = function(v181, v182, v183, v184)
        if not v182 or v182 == v4.None then
            return ;
        else
            for _, v186 in pairs(v181) do
                local v187 = v18.getPart0(v186);
                local v188 = v18.getPart1(v186);
                if not (not v186:IsA("BallSocketConstraint") or not (v183[v187] and v183[v188]) and ((not v20() or not v184[v187]) or not v184[v188])) then
                    local v189 = nil;
                    for _, v191 in pairs(v181) do
                        if v18.getPart0(v191) == v188 then
                            v189 = v191;
                        end;
                    end;
                    local v192 = nil;
                    local v193 = v18.getPart1(v189);
                    v192 = if not v193 then (v182[v188.Name].p - v182[v187.Name].p).Unit else (v182[v193.Name].p - v182[v188.Name].p).Unit;
                    if not (not v183[v187] or not v183[v188]) then
                        v183[v187].Attachments = v183[v187].Attachments or {};
                        v183[v188].Attachments = v183[v188].Attachments or {};
                        table.insert(v183[v187].Attachments, {
                            Axis = v186.Attachment0.Axis, 
                            SecondaryAxis = v186.Attachment0.SecondaryAxis, 
                            Name = v186.Attachment0.Name
                        });
                        table.insert(v183[v188].Attachments, {
                            Axis = v186.Attachment1.Axis, 
                            SecondaryAxis = v186.Attachment1.SecondaryAxis, 
                            Name = v186.Attachment1.Name
                        });
                    end;
                    if not ((not v20() or not v184[v187]) or not v184[v188]) then
                        v184[v187].Attachments = v184[v187].Attachments or {};
                        v184[v188].Attachments = v184[v188].Attachments or {};
                        table.insert(v184[v187].Attachments, {
                            Axis = v186.Attachment0.Axis, 
                            SecondaryAxis = v186.Attachment0.SecondaryAxis, 
                            Name = v186.Attachment0.Name
                        });
                        table.insert(v184[v188].Attachments, {
                            Axis = v186.Attachment1.Axis, 
                            SecondaryAxis = v186.Attachment1.SecondaryAxis, 
                            Name = v186.Attachment1.Name
                        });
                    end;
                    v186.Attachment0.Axis = v192;
                    v186.Attachment1.Axis = v192;
                end;
            end;
            return ;
        end;
    end;
    v22.ikDragStart = function(v194, v195, v196, v197, v198)
        v18.clearCache();
        local v199 = {};
        local v200 = {};
        local v201 = {};
        local v202 = {};
        local v203 = v18.getRigInfo(v194);
        local l_PartNameToMotor_4 = v203.PartNameToMotor;
        local l_PartNameToConstraint_3 = v203.PartNameToConstraint;
        local l_PartNameToAnimConstraint_4 = v203.PartNameToAnimConstraint;
        local function v217(v207)
            local l_l_PartNameToMotor_4_0 = l_PartNameToMotor_4;
            local l_l_PartNameToAnimConstraint_4_0 = l_PartNameToAnimConstraint_4;
            local l_v207_0 = v207;
            local v211 = -1;
            while l_v207_0 ~= nil do
                local l_l_v207_0_0 = l_v207_0;
                if l_l_PartNameToMotor_4_0 then
                    local v213 = l_l_PartNameToMotor_4_0[l_l_v207_0_0.Name];
                    if v213 then
                        l_v207_0 = v213.Part0;
                        goto label1 --[[  true, true  ]];
                    end;
                end;
                if not (not v20() or not l_l_PartNameToAnimConstraint_4_0) then
                    local v214 = l_l_PartNameToAnimConstraint_4_0[l_l_v207_0_0.Name];
                    if v214 then
                        l_v207_0 = v18.getPart0(v214);
                        goto label1 --[[  true, true  ]];
                    end;
                end;
                l_v207_0 = nil;
                ::label1::;
                v211 = v211 + 1;
            end;
            local l_v211_0 = v211;
            while l_v211_0 >= 0 do
                if not v199[v207] then
                    v200[#v200 + 1] = {
                        Item = v207, 
                        Priority = l_v211_0
                    };
                    v199[v207] = true;
                end;
                l_l_PartNameToMotor_4_0 = l_PartNameToMotor_4;
                l_l_PartNameToAnimConstraint_4_0 = l_PartNameToAnimConstraint_4;
                local l_v207_1 = v207;
                if l_l_PartNameToMotor_4_0 then
                    l_v207_0 = l_l_PartNameToMotor_4_0[l_v207_1.Name];
                    if l_v207_0 then
                        v207 = l_v207_0.Part0;
                        goto label2 --[[  true, true  ]];
                    end;
                end;
                if not (not v20() or not l_l_PartNameToAnimConstraint_4_0) then
                    l_v207_0 = l_l_PartNameToAnimConstraint_4_0[l_v207_1.Name];
                    if l_v207_0 then
                        v207 = v18.getPart0(l_v207_0);
                        goto label2 --[[  true, true  ]];
                    end;
                end;
                v207 = nil;
                ::label2::;
                l_v211_0 = l_v211_0 - 1;
            end;
        end;
        if v196 then
            v198 = v22.pinForLimbMode(v195, l_PartNameToMotor_4, l_PartNameToAnimConstraint_4);
        end;
        v217(v195);
        for v218, v219 in pairs(v198) do
            if v219 and v218.Name ~= v195.Name then
                v217(v218);
            end;
        end;
        table.sort(v200, function(v220, v221)
            return v221.Priority < v220.Priority;
        end);
        for v222 = 1, #v200 do
            local l_Item_0 = v200[v222].Item;
            v133(l_Item_0, l_PartNameToMotor_4[l_Item_0.Name], v201);
            if not (not v20() or not l_PartNameToAnimConstraint_4) then
                local v224 = l_PartNameToAnimConstraint_4[l_Item_0.Name];
                if not (not l_Item_0 or not v224) then
                    v202[l_Item_0] = {
                        OriginalData = v224, 
                        Parent = v224.Parent
                    };
                    local l_CFrame_2 = l_Item_0.CFrame;
                    v224.Parent = nil;
                    l_Item_0.CFrame = l_CFrame_2;
                end;
            end;
            if v198[l_Item_0] and l_Item_0.Name ~= v195.Name then
                l_Item_0.Anchored = true;
            end;
        end;
        v22.fixRigAttachments(l_PartNameToConstraint_3, v197, v201, v202);
        for v226 in pairs(v201) do
            local v227 = l_PartNameToConstraint_3[v226.Name];
            if v227 then
                v227.Enabled = true;
            end;
        end;
        if v20() then
            for v228 in pairs(v202) do
                local v229 = l_PartNameToConstraint_3[v228.Name];
                if v229 then
                    v229.Enabled = true;
                end;
            end;
        end;
        return v201, v202;
    end;
end;
v22.resetAllFacsValuesInFaceControls = function(v230)
    if v22.canUseFaceControlsEditor(v230) then
        local v231 = v18.getFaceControls(v230);
        if v231 ~= nil then
            for _, v233 in pairs(v19.FacsNames) do
                v231[v233] = 0;
            end;
        end;
        return ;
    else
        return ;
    end;
end;
v22.stepRigAnimation = function(v234, v235, v236)
    local v237 = v18.getAnimator(v234);
    local v238 = v18.getRigInfo(v234);
    local l_Parts_0 = v238.Parts;
    local l_PartNameToMotor_5 = v238.PartNameToMotor;
    local l_PartNameToAnimConstraint_5 = v238.PartNameToAnimConstraint;
    local l_BoneNameToBone_1 = v238.BoneNameToBone;
    local v243 = not v234:IsA("Model") and 1 or v234:GetScale();
    for _, v245 in ipairs(l_Parts_0) do
        local v246 = (l_PartNameToMotor_5[v245.Name] or l_BoneNameToBone_1[v245.Name]) or v20() and l_PartNameToAnimConstraint_5[v245.Name];
        if v246 then
            local v247 = v235.Tracks[v245.Name];
            if not v247 then
                v246.Transform = CFrame.new();
            else
                local v248 = v14.getValue(v247, v236);
                v246.Transform = v248.Rotation + v248.Position * v243;
            end;
        end;
    end;
    local v249 = v18.getFaceControls(v234);
    if v249 ~= nil then
        for _, v251 in pairs(v19.FacsNames) do
            if v235 and v235.Tracks ~= nil then
                local v252 = v235.Tracks[v251];
                if v252 and v252.Type == v19.TRACK_TYPES.Facs then
                    v249[v251] = v14.getValue(v252, v236);
                else
                    v249[v251] = 0;
                end;
            else
                v249[v251] = 0;
            end;
        end;
    end;
    if not (not v237 or l_RunService_0:IsRunning()) then
        v237:StepAnimations(0);
    end;
end;
v22.clearPose = function(v253)
    local v254 = v18.getAnimator(v253);
    local v255 = v18.getRigInfo(v253);
    local l_Parts_1 = v255.Parts;
    local l_PartNameToMotor_6 = v255.PartNameToMotor;
    local l_PartNameToAnimConstraint_6 = v255.PartNameToAnimConstraint;
    local l_BoneNameToBone_2 = v255.BoneNameToBone;
    for _, v261 in ipairs(l_Parts_1) do
        local v262 = (l_PartNameToMotor_6[v261.Name] or l_BoneNameToBone_2[v261.Name]) or (v20() and l_PartNameToAnimConstraint_6) and l_PartNameToAnimConstraint_6[v261.Name];
        if v262 then
            v262.Transform = CFrame.new();
        end;
    end;
    if not (not v254 or l_RunService_0:IsRunning()) then
        v254:StepAnimations(0);
    end;
end;
v22.findOrCreateServerAnimSaves = function()
    local l_l_ServerStorage_0_FirstChild_0 = l_ServerStorage_0:FindFirstChild(v19.FOLDERS.AnimSaves);
    if not l_l_ServerStorage_0_FirstChild_0 then
        local l_Model_0 = Instance.new("Model");
        l_Model_0.Name = v19.FOLDERS.AnimSaves;
        l_Model_0.Parent = l_ServerStorage_0;
        l_l_ServerStorage_0_FirstChild_0 = l_Model_0;
    end;
    return l_l_ServerStorage_0_FirstChild_0;
end;
v22.getAnimSavesFolder = function(v265, _)
    if v265 then
        local l_AnimSaves_0 = v265:FindFirstChild("AnimSaves");
        if not (l_AnimSaves_0 and l_AnimSaves_0:IsA("ObjectValue")) then
            local l_ObjectValue_0 = Instance.new("ObjectValue");
            l_ObjectValue_0.Name = "AnimSaves";
            l_ObjectValue_0.Parent = v265;
            if l_AnimSaves_0 then
                for _, v270 in l_AnimSaves_0:GetChildren() do
                    v270.Parent = l_ObjectValue_0;
                end;
                l_AnimSaves_0:Destroy();
            end;
            l_AnimSaves_0 = l_ObjectValue_0;
        end;
        local v271 = v22.findOrCreateServerAnimSaves();
        local l_Value_0 = l_AnimSaves_0.Value;
        if not (not l_Value_0 or l_Value_0.Parent) then
            l_Value_0.Parent = v271;
        end;
        if (not l_Value_0 or not l_Value_0:IsA("ObjectValue")) or l_Value_0.Value ~= v265 then
            local l_ObjectValue_1 = Instance.new("ObjectValue");
            l_ObjectValue_1.Name = v265.Name;
            l_ObjectValue_1.Parent = v271;
            l_ObjectValue_1.Value = v265;
            l_Value_0 = l_ObjectValue_1;
            l_AnimSaves_0.Value = l_Value_0;
        end;
        return l_Value_0, l_AnimSaves_0;
    else
        return nil, nil;
    end;
end;
v22.getAnimSaves = function(v274)
    local v275, v276 = v22.getAnimSavesFolder(v274);
    local v277 = {};
    local function v282(v278, v279)
        if v278 then
            for _, v281 in ipairs((v278:GetChildren())) do
                if not (not v281:IsA("KeyframeSequence") and not v281:IsA("CurveAnimation")) then
                    table.insert(v277, {
                        animation = v281, 
                        isLegacyAnimSaves = v279
                    });
                end;
            end;
        end;
    end;
    v282(v275, false);
    v282(v276, true);
    return v277;
end;
v22.focusCamera = function(v283)
    local l_Camera_0 = l_Workspace_0:FindFirstChildOfClass("Camera");
    if l_Camera_0 then
        local l_v283_ExtentsSize_0 = v283:GetExtentsSize();
        local v286 = math.max(l_v283_ExtentsSize_0.X, l_v283_ExtentsSize_0.Z);
        local l_CFrame_3 = v18.findRootPart(v283).CFrame;
        l_Camera_0.CFrame = CFrame.new(l_CFrame_3.Position + l_CFrame_3.LookVector * (v286 * 2), l_CFrame_3.Position);
        l_Camera_0.Focus = l_CFrame_3;
    end;
end;
v22.focusCameraOnFace = function(v288)
    if v288 then
        local l_CurrentCamera_0 = workspace.CurrentCamera;
        local v290 = v18.getFaceControls(v288);
        if v290 ~= nil then
            local l_Parent_0 = v290.Parent;
            local v292 = nil;
            local l_Neck_0 = l_Parent_0:FindFirstChild("Neck");
            if not (not l_Neck_0 or not l_Neck_0:IsA("Motor6D")) and l_Neck_0.Part1 == l_Parent_0 then
                v292 = l_Neck_0.Part0;
            else
                l_Neck_0 = l_Parent_0:FindFirstChildOfClass("Motor6D");
                if l_Neck_0 and l_Neck_0.Part1 == l_Parent_0 then
                    v292 = l_Neck_0.Part0;
                elseif not (not (v292 == nil) or not l_Parent_0.Parent) and l_Parent_0.Parent ~= l_Workspace_0 then
                    for _, v295 in pairs((l_Parent_0.Parent:GetDescendants())) do
                        if not ((not (v295:IsA("Motor6D") and v295.Part1 == l_Parent_0) or not v295.Parent) or not v295.Parent:IsA("BasePart")) then
                            v292 = v295.Parent;
                            break;
                        end;
                    end;
                end;
            end;
            if v292 ~= nil then
                local v296 = 1;
                local v297 = 1;
                local v298, v299 = l_CharacterUtility_0.CalculateHeadExtents(v288, (l_CFrameUtility_0.CalculateTargetCFrame(l_Parent_0.CFrame)));
                local v300 = Vector3.new(v299.X, v299.Y, v299.Z) - Vector3.new(v298.X, v298.Y, v298.Z);
                headHeight = l_Parent_0.Size.Y;
                v297 = math.min(v300.X, v300.Z) + 0.25;
                v296 = v297;
                if l_CurrentCamera_0.FieldOfView ~= 70 then
                    v296 = v297 / (l_CurrentCamera_0.FieldOfView / 70);
                end;
                l_CurrentCamera_0.CFrame = CFrame.lookAt(l_Parent_0.Position + v292.CFrame.LookVector * (v296 * 1.5), l_Parent_0.CFrame.Position);
                l_CurrentCamera_0.Focus = l_Parent_0.CFrame;
            end;
        end;
        return ;
    else
        return ;
    end;
end;
return v22;
