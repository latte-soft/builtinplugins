local v0 = require(script.Parent.FuzzyMath);
local v1 = require(script.Parent.List);
local v2 = require(script.Parent.Extent);
local _ = require(script.Parent.FFlag);
local v4 = {};
local function _(v5)
    if not (v5 ~= nil) or typeof(v5) ~= "table" then
        return false;
    else
        return v5.IsWrapped == true;
    end;
end;
local function _(v7)
    return v7.CFrame ~= v4[v7];
end;
local v9 = {};
local function v10(v11)
    if v11:IsA("BasePart") then
        local l_v11_RootPart_0 = v11:GetRootPart();
        if l_v11_RootPart_0 then
            v9[l_v11_RootPart_0] = true;
        end;
    end;
    for _, v14 in ipairs((v11:GetChildren())) do
        v10(v14);
    end;
end;
local function v20(v15)
    v9 = {};
    for v16 = 1, #v15 do
        v10(v15[v16]);
    end;
    local v17 = {};
    for v18, _ in pairs(v9) do
        table.insert(v17, v18);
    end;
    return v17;
end;
local function v21(v22, v23)
    if not v23 then
        v23 = {};
    end;
    if v22:IsA("BasePart") then
        table.insert(v23, v22);
    end;
    local l_v22_Children_0 = v22:GetChildren();
    for v25 = 1, #l_v22_Children_0 do
        v23 = v21(l_v22_Children_0[v25], v23);
    end;
    return v23;
end;
local function v29(v26)
    local v27 = {};
    for v28 = 1, #v26 do
        v27 = v21(v26[v28], v27);
    end;
    return v27;
end;
local function v34(v30, v31)
    if v30:IsA("Model") then
        table.insert(v31, v30);
    end;
    for _, v33 in ipairs(v30:GetDescendants()) do
        if v33:IsA("Model") then
            table.insert(v31, v33);
        end;
    end;
end;
local function v39(v35)
    local v36 = {};
    for _, v38 in ipairs(v35) do
        v34(v38, v36);
    end;
    return v36;
end;
forcePrimaryPart = function(v40)
    if not v40.PrimaryPart then
        local v41 = nil;
        local l_v40_Children_0 = v40:GetChildren();
        for v43 = 1, #l_v40_Children_0 do
            if not l_v40_Children_0[v43]:IsA("BasePart") then
                if not (not l_v40_Children_0[v43]:IsA("Model") or l_v40_Children_0[v43]:IsA("Workspace")) then
                    local v44 = l_v40_Children_0[v43];
                    forcePrimaryPart(l_v40_Children_0[v43]);
                    if v44.PrimaryPart then
                        v41 = v44.PrimaryPart;
                        if v0.visiblyIdentityCFrame(v41.CFrame, 1.0E-5) then
                            break;
                        end;
                    end;
                end;
            else
                v41 = l_v40_Children_0[v43];
                local _ = v41.CFrame.p;
                if v0.visiblyIdentityCFrame(v41.CFrame, 1.0E-5) then
                    break;
                end;
            end;
        end;
        if v41 then
            v40.PrimaryPart = v41;
        end;
    end;
end;
local function _(v46)
    return v46 > 0 and math.ceil(v46 * 1000000 - 0.5) / 1000000 or math.floor(v46 * 1000000 + 0.5) / 1000000;
end;
local function v62(v48, v49)
    local v50, v51, v52, v53, v54, v55, v56, v57, v58, v59, v60, v61 = v48:components();
    return CFrame.new(v50 > 0 and math.ceil(v50 * 1000000 - 0.5) / 1000000 or math.floor(v50 * 1000000 + 0.5) / 1000000, v51 > 0 and math.ceil(v51 * 1000000 - 0.5) / 1000000 or math.floor(v51 * 1000000 + 0.5) / 1000000, v52 > 0 and math.ceil(v52 * 1000000 - 0.5) / 1000000 or math.floor(v52 * 1000000 + 0.5) / 1000000, not not v49 and (v53 > 0 and math.ceil(v53 * 1000000 - 0.5) / 1000000 or math.floor(v53 * 1000000 + 0.5) / 1000000) or v53, not not v49 and (v54 > 0 and math.ceil(v54 * 1000000 - 0.5) / 1000000 or math.floor(v54 * 1000000 + 0.5) / 1000000) or v54, not not v49 and (v55 > 0 and math.ceil(v55 * 1000000 - 0.5) / 1000000 or math.floor(v55 * 1000000 + 0.5) / 1000000) or v55, not not v49 and (v56 > 0 and math.ceil(v56 * 1000000 - 0.5) / 1000000 or math.floor(v56 * 1000000 + 0.5) / 1000000) or v56, not not v49 and (v57 > 0 and math.ceil(v57 * 1000000 - 0.5) / 1000000 or math.floor(v57 * 1000000 + 0.5) / 1000000) or v57, not not v49 and (v58 > 0 and math.ceil(v58 * 1000000 - 0.5) / 1000000 or math.floor(v58 * 1000000 + 0.5) / 1000000) or v58, not not v49 and (v59 > 0 and math.ceil(v59 * 1000000 - 0.5) / 1000000 or math.floor(v59 * 1000000 + 0.5) / 1000000) or v59, not not v49 and (v60 > 0 and math.ceil(v60 * 1000000 - 0.5) / 1000000 or math.floor(v60 * 1000000 + 0.5) / 1000000) or v60, not not v49 and (v61 > 0 and math.ceil(v61 * 1000000 - 0.5) / 1000000 or math.floor(v61 * 1000000 + 0.5) / 1000000) or v61);
end;
local function v63(v64, v65)
    if not v64:IsA("PVInstance") then
        for _, v67 in v64:GetChildren() do
            v63(v67, v65);
        end;
        return ;
    elseif not v65[v64] then
        v65[v64] = v64;
        for _, v69 in v64:GetDescendants() do
            if v69:IsA("PVInstance") then
                v65[v69] = v64;
            end;
        end;
        return ;
    else
        return ;
    end;
end;
local function v76(v70, v71)
    if not v71:IsA("Constraint") then
        if not v71:IsA("JointInstance") and not v71:IsA("WeldConstraint") then
            return nil;
        elseif v71.Part0 == v70 then
            return v71.Part1;
        else
            return v71.Part0;
        end;
    else
        local l_Attachment0_0 = v71.Attachment0;
        if not l_Attachment0_0 then
            local l_Attachment1_0 = v71.Attachment1;
            return l_Attachment1_0 and l_Attachment1_0.Parent;
        else
            local l_Parent_0 = l_Attachment0_0.Parent;
            if l_Parent_0 == v70 then
                local l_Attachment1_1 = v71.Attachment1;
                return l_Attachment1_1 and l_Attachment1_1.Parent;
            else
                return l_Parent_0;
            end;
        end;
    end;
end;
local function v88(v77)
    local v78 = {};
    for _, v80 in v77, nil, nil do
        v63(v80, v78);
    end;
    local v81 = {};
    local v82 = {};
    for v83, v84 in v78, nil, nil do
        if v83 == v84 then
            table.insert(v81, v83);
        end;
        if v83:IsA("BasePart") then
            for _, v86 in v83:GetJoints() do
                local v87 = v78[v76(v83, v86)];
                if v87 and v87 ~= v84 then
                    table.insert(v82, v86);
                end;
            end;
        end;
    end;
    return v81, v82;
end;
createMetaPart = function(v89, v90)
    if v89 then
        if not ((v89 ~= nil and typeof(v89) == "table") and v89.IsWrapped == true) then
            if not v90 then
                v90 = false;
            end;
            if type(v89) == "table" then
                if #v89 == 0 then
                    return nil;
                else
                    local v91 = {
                        objects = v89, 
                        mt = {}, 
                        info = {}
                    };
                    v91.info.oCFrame = nil;
                    v91.info.oSize = nil;
                    v91.info.pCFrame = nil;
                    v91.info.pSize = nil;
                    v91.info.lastPlaneCFrame = nil;
                    v91.children = v29(v91.objects);
                    v91.roots = v20(v91.objects);
                    v91.models = v39(v91.objects);
                    v91.IsWrapped = true;
                    local v92, v93 = v88(v89);
                    v91.rootPVs = v92;
                    v91.activeInterPVJoints = v93;
                    v91.info.expectingChanged = false;
                    v91.info.updateRequired = false;
                    v92 = function(v94)
                        for _, v96 in v91.activeInterPVJoints, nil, nil do
                            v96.Enabled = false;
                        end;
                        for _, v98 in v91.rootPVs, nil, nil do
                            v98:PivotTo(v94 * v98:GetPivot());
                        end;
                        for _, v100 in v91.activeInterPVJoints, nil, nil do
                            v100.Enabled = true;
                        end;
                    end;
                    v93 = function(v101)
                        local v102 = {};
                        for v103, v104 in ipairs(v101) do
                            v102[v103] = v104.Changed:connect(function()
                                if not v91.info.expectingChanged then
                                    v91.info.updateRequired = true;
                                end;
                            end);
                        end;
                        return v102;
                    end;
                    if v90 then
                        v91.subscribe = v93(v91.children);
                    end;
                    setmetatable(v91, v91.mt);
                    local function _()
                        v91.roots = v20(v91.objects);
                    end;
                    local function _()
                        local l_info_0 = v91.info;
                        local l_info_1 = v91.info;
                        local v108, v109 = v2.getCFrameAndSizeOfList(v91.children, createMetaPart(v91.objects[1]).CFrame);
                        l_info_0.oCFrame = v108;
                        l_info_1.oSize = v109;
                        v91.info.oCFrame = v62(v91.info.oCFrame);
                    end;
                    local function v114()
                        local v111 = {};
                        local l_children_0 = v91.children;
                        if #l_children_0 > 10 then
                            return {};
                        else
                            for v113 = 1, #l_children_0 do
                                v111 = v1.combineLists(v111, v1.filterOutItems(l_children_0, (l_children_0[v113]:GetTouchingParts())));
                            end;
                            return (v1.removeDuplicates(v111));
                        end;
                    end;
                    v91.mt.__index = function(_, v116)
                        if v116 == "IsA" then
                            return function(_, v118)
                                local v119 = true;
                                if v118 ~= "Grouping" then
                                    v119 = v118 == "Wrapped";
                                end;
                                return v119;
                            end;
                        elseif v116 == "Unsubscribe" then
                            return function()
                                if v91.subscribe then
                                    for _, v121 in ipairs(v91.subscribe) do
                                        v121:disconnect();
                                    end;
                                end;
                            end;
                        elseif v116 == "CanSimulate" then
                            return #v91.children < 10;
                        elseif v116 == "IsUpdateRequired" then
                            local l_updateRequired_0 = v91.info.updateRequired;
                            v91.info.updateRequired = false;
                            return l_updateRequired_0;
                        elseif v116 == "ClearCache" then
                            return function()
                                v91.info.oCFrame = nil;
                                v91.info.oSize = nil;
                                v91.info.pCFrame = nil;
                                v91.info.pSize = nil;
                                v91.info.lastPlaneCFrame = nil;
                            end;
                        elseif v116 == "TranslateFromTo" then
                            return function(v123, v124)
                                v91.info.expectingChanged = true;
                                if not v91.info.oCFrame then
                                    local l_info_2 = v91.info;
                                    local l_info_3 = v91.info;
                                    local v127, v128 = v2.getCFrameAndSizeOfList(v91.children, createMetaPart(v91.objects[1]).CFrame);
                                    l_info_2.oCFrame = v127;
                                    l_info_3.oSize = v128;
                                    v91.info.oCFrame = v62(v91.info.oCFrame);
                                end;
                                v91.roots = v20(v91.objects);
                                local v129 = v124.p - v123.p;
                                v92(CFrame.new(v129));
                                v91.info.pCFrame = v91.info.pCFrame + v129;
                                v91.info.oCFrame = v62(v91.info.oCFrame + v129);
                                v91.info.expectingChanged = false;
                            end;
                        elseif v116 == "Children" then
                            return v91.children;
                        elseif v116 == "Size" then
                            if not v91.info.oSize then
                                local l_info_4 = v91.info;
                                local l_info_5 = v91.info;
                                local v132, v133 = v2.getCFrameAndSizeOfList(v91.children, createMetaPart(v91.objects[1]).CFrame);
                                l_info_4.oCFrame = v132;
                                l_info_5.oSize = v133;
                                v91.info.oCFrame = v62(v91.info.oCFrame);
                                return v91.info.oSize;
                            else
                                return v91.info.oSize;
                            end;
                        elseif v116 == "CFrame" then
                            if not v91.info.oCFrame then
                                local l_info_6 = v91.info;
                                local l_info_7 = v91.info;
                                local v136, v137 = v2.getCFrameAndSizeOfList(v91.children, createMetaPart(v91.objects[1]).CFrame);
                                l_info_6.oCFrame = v136;
                                l_info_7.oSize = v137;
                                v91.info.oCFrame = v62(v91.info.oCFrame);
                                return v91.info.oCFrame;
                            else
                                return v91.info.oCFrame;
                            end;
                        elseif v116 == "PlaneAlignedSize" then
                            if not v91.info.pSize then
                                return nil;
                            else
                                return v91.info.pSize;
                            end;
                        elseif v116 == "PlaneAlignedCFrame" then
                            if not v91.info.pCFrame then
                                return nil;
                            else
                                return v91.info.pCFrame;
                            end;
                        elseif v116 == "GetTouchingParts" then
                            return function()
                                return (v114());
                            end;
                        elseif v116 == "PlaneSet" then
                            return v91.info.lastPlaneCFrame ~= nil;
                        else
                            return ;
                        end;
                    end;
                    v91.mt.__newindex = function(_, v139, v140)
                        if v139 == "UpdatePlaneCFrame" then
                            if v91.info.lastPlaneCFrame == v140 then
                                return ;
                            else
                                v91.info.lastPlaneCFrame = v140;
                                local l_info_8 = v91.info;
                                local l_info_9 = v91.info;
                                local v143, v144 = v2.getCFrameAndSizeOfList(v91.objects, v140);
                                l_info_8.pCFrame = v143;
                                l_info_9.pSize = v144;
                            end;
                        end;
                        if v139 == "CFrame" then
                            v91.info.expectingChanged = true;
                            if not v91.info.oCFrame then
                                local l_info_10 = v91.info;
                                local l_info_11 = v91.info;
                                local v147, v148 = v2.getCFrameAndSizeOfList(v91.children, createMetaPart(v91.objects[1]).CFrame);
                                l_info_10.oCFrame = v147;
                                l_info_11.oSize = v148;
                                v91.info.oCFrame = v62(v91.info.oCFrame);
                            end;
                            v91.roots = v20(v91.objects);
                            v92(v140 * v91.info.oCFrame:Inverse());
                            if v91.info.oCFrame - v91.info.oCFrame.p ~= v140 - v140.p then
                                v91.info.pCFrame = nil;
                                v91.info.pSize = nil;
                                v91.info.lastPlaneCFrame = nil;
                            elseif v91.info.pCFrame then
                                v91.info.pCFrame = (v91.info.pCFrame - v91.info.oCFrame.p) + v140.p;
                            end;
                            v91.info.oCFrame = v62(v140);
                            v91.info.expectingChanged = false;
                        end;
                    end;
                    return v91;
                end;
            elseif not v89:IsA("Model") or v89:IsA("Workspace") then
                if not v89:IsA("BasePart") then
                    if not ((v89 ~= nil and typeof(v89) == "table") and v89.IsWrapped == true) then
                        local v149 = {
                            object = v89, 
                            mt = {}, 
                            info = {}, 
                            IsWrapped = true
                        };
                        setmetatable(v149, v149.mt);
                        v149.mt.__eq = function(v150, v151)
                            return pcall(function()
                                return createMetaPart(v150).Object == createMetaPart(v151).Object;
                            end);
                        end;
                        v149.mt.__index = function(_, v153)
                            if v153 == "IsA" then
                                return function(_, v155)
                                    return v149.object:IsA(v155) or v155 == "Wrapped";
                                end;
                            elseif v153 == "CFrame" then
                                return CFrame.new();
                            elseif v153 == "Size" then
                                return (Vector3.new(0, 0, 0));
                            elseif v153 == "Position" then
                                return (Vector3.new(0, 0, 0));
                            elseif v153 == "Object" then
                                return v149.object;
                            elseif v153 == "PlaneAlignedSize" then
                                return (Vector3.new(0, 0, 0));
                            elseif v153 == "PlaneAlignedCFrame" then
                                return CFrame.new();
                            elseif not pcall(function()
                                local _ = v149.object[v153];
                            end) then
                                return nil;
                            elseif type(v149.object[v153]) == "function" then
                                return function(_, ...)
                                    return v149.object[v153](v149.object, ...);
                                end;
                            else
                                return v149.object[v153];
                            end;
                        end;
                        v149.mt.__newindex = function(_, v159, v160)
                            if v159 == "UpdatePlaneCFrame" then
                                return ;
                            elseif v159 == "CFrame" then
                                return ;
                            elseif v159 == "Size" then
                                return ;
                            elseif v159 == "Position" then
                                return ;
                            else
                                if pcall(function()
                                    local _ = v149.object[v159];
                                end) then
                                    v149.object[v159] = v160;
                                end;
                                return ;
                            end;
                        end;
                        return v149;
                    else
                        return v89;
                    end;
                elseif not ((v89 ~= nil and typeof(v89) == "table") and v89.IsWrapped == true) then
                    local v162 = {
                        object = v89, 
                        mt = {}, 
                        info = {}
                    };
                    v162.info.pCFrame = nil;
                    v162.info.pSize = nil;
                    v162.info.lastPlaneCFrame = nil;
                    v162.children = {
                        v89
                    };
                    v162.roots = v20({
                        v162.object
                    });
                    v162.models = v39({
                        v162.object
                    });
                    v162.IsWrapped = true;
                    v162.info.expectingChanged = false;
                    v162.info.updateRequired = false;
                    local function v167(v163)
                        local v164 = {};
                        for v165, v166 in ipairs(v163) do
                            v164[v165] = v166.Changed:connect(function()
                                if not v162.info.expectingChanged then
                                    v162.info.updateRequired = true;
                                end;
                            end);
                        end;
                        return v164;
                    end;
                    if v90 then
                        v162.subscribe = v167(v162.children);
                    end;
                    local function _()
                        v162.roots = v20({
                            v162.object
                        });
                    end;
                    setmetatable(v162, v162.mt);
                    local function _()
                        return v162.object:GetModelCFrame();
                    end;
                    v162.mt.__eq = function(v170, v171)
                        return pcall(function()
                            return createMetaPart(v170).Object == createMetaPart(v171).Object;
                        end);
                    end;
                    v162.mt.__index = function(_, v173)
                        if v173 == "IsA" then
                            return function(_, v175)
                                return v162.object:IsA(v175) or v175 == "Wrapped";
                            end;
                        elseif v173 == "UpdatePivot" then
                            return function(_, v177, v178)
                                local v179 = v178 / v177;
                                local l_PivotOffset_0 = v162.object.PivotOffset;
                                local l_Position_0 = l_PivotOffset_0.Position;
                                v162.object.PivotOffset = (l_PivotOffset_0 - l_Position_0) + v179 * l_Position_0;
                            end;
                        elseif v173 == "TranslateFromTo" then
                            return function(v182, v183)
                                v162.roots = v20({
                                    v162.object
                                });
                                v162.info.expectingChanged = true;
                                local v184 = v183.p - v182.p;
                                for _, v186 in ipairs(v162.models) do
                                    v186.WorldPivot = v186:GetPivot() + v184;
                                end;
                                for v187 = 1, #v162.roots do
                                    v162.roots[v187].CFrame = v162.roots[v187].CFrame + v184;
                                end;
                                v162.info.pCFrame = v162.info.pCFrame + v184;
                                v162.info.expectingChanged = false;
                            end;
                        elseif v173 == "Unsubscribe" then
                            return function()
                                if v162.subscribe then
                                    for _, v189 in ipairs(v162.subscribe) do
                                        v189:disconnect();
                                    end;
                                end;
                            end;
                        elseif v173 == "CanSimulate" then
                            return true;
                        elseif v173 == "ClearCache" then
                            return function()
                                v162.info.oCFrame = nil;
                                v162.info.oSize = nil;
                                v162.info.pCFrame = nil;
                                v162.info.pSize = nil;
                                v162.info.lastPlaneCFrame = nil;
                            end;
                        elseif v173 == "IsUpdateRequired" then
                            local l_updateRequired_1 = v162.info.updateRequired;
                            v162.info.updateRequired = false;
                            return l_updateRequired_1;
                        elseif v173 == "Children" then
                            return v162.children;
                        elseif v173 == "CFrame" then
                            return v162.object.CFrame;
                        elseif v173 == "Size" then
                            return v162.object.Size;
                        elseif v173 == "Position" then
                            return v162.object.CFrame.p;
                        elseif v173 == "Object" then
                            return v162.object;
                        elseif v173 == "PlaneAlignedSize" then
                            if not v162.info.pSize then
                                return nil;
                            else
                                return v162.info.pSize;
                            end;
                        elseif v173 == "PlaneAlignedCFrame" then
                            if not v162.info.pCFrame then
                                return nil;
                            else
                                return v162.info.pCFrame;
                            end;
                        elseif not pcall(function()
                            local _ = v162.object[v173];
                        end) then
                            return nil;
                        elseif type(v162.object[v173]) == "function" then
                            return function(_, ...)
                                return v162.object[v173](v162.object, ...);
                            end;
                        else
                            return v162.object[v173];
                        end;
                    end;
                    v162.mt.__newindex = function(_, v194, v195)
                        v162.info.expectingChanged = true;
                        if v194 == "UpdatePlaneCFrame" then
                            v162.info.lastPlaneCFrame = v195;
                            local l_info_12 = v162.info;
                            local l_info_13 = v162.info;
                            local v198, v199 = v2.getCFrameAndSizeOfList({
                                v162.object
                            }, v195);
                            l_info_12.pCFrame = v198;
                            l_info_13.pSize = v199;
                            v162.info.expectingChanged = false;
                            return ;
                        else
                            if v194 == "CFrame" then
                                v195 = v62(v195);
                                v162.info.lastPlaneCFrame = nil;
                            end;
                            if v194 == "Size" then
                                v162.info.lastPlaneCFrame = nil;
                            end;
                            if v194 == "Position" then
                                v162.info.lastPlaneCFrame = nil;
                            end;
                            if pcall(function()
                                local _ = v162.object[v194];
                            end) then
                                v162.object[v194] = v195;
                            end;
                            v162.info.expectingChanged = false;
                            return ;
                        end;
                    end;
                    return v162;
                else
                    return v89;
                end;
            elseif not ((v89 ~= nil and typeof(v89) == "table") and v89.IsWrapped == true) then
                local v201 = {
                    object = v89, 
                    mt = {}, 
                    info = {}
                };
                v201.info.oCFrame = nil;
                v201.info.oSize = nil;
                v201.info.pCFrame = nil;
                v201.info.pSize = nil;
                v201.info.lastPlaneCFrame = nil;
                v201.children = v29({
                    v201.object
                });
                v201.roots = v20({
                    v201.object
                });
                v201.models = v39({
                    v201.object
                });
                v201.IsWrapped = true;
                v201.info.expectingChanged = false;
                v201.info.updateRequired = false;
                local function v206(v202)
                    local v203 = {};
                    for v204, v205 in ipairs(v202) do
                        v203[v204] = v205.Changed:connect(function()
                            if not v201.info.expectingChanged then
                                v201.info.updateRequired = true;
                            end;
                        end);
                    end;
                    return v203;
                end;
                if v90 then
                    v201.subscribe = v206(v201.children);
                end;
                setmetatable(v201, v201.mt);
                local function _()
                    v201.roots = v20({
                        v201.object
                    });
                end;
                local function _()
                    return v201.object:GetModelCFrame();
                end;
                local function v212()
                    local v209 = v21(v201.object);
                    local v210 = {};
                    for v211 = 1, #v209 do
                        v210 = v1.combineLists(v210, v1.filterOutItems(v209, (v209[v211]:GetTouchingParts())));
                    end;
                    return (v1.removeDuplicates(v210));
                end;
                v201.mt.__eq = function(v213, v214)
                    return pcall(function()
                        return createMetaPart(v213).Object == createMetaPart(v214).Object;
                    end);
                end;
                local function v220()
                    local v215 = nil;
                    v215 = if not v201.object.PrimaryPart then if #v201.children > 0 then v201.children[1].CFrame else CFrame.new() else v201.object.PrimaryPart.CFrame;
                    local l_info_14 = v201.info;
                    local l_info_15 = v201.info;
                    local v218, v219 = v2.getCFrameAndSizeOfList(v201.children, v215);
                    l_info_14.oCFrame = v218;
                    l_info_15.oSize = v219;
                    v201.info.oCFrame = v62(v201.info.oCFrame);
                end;
                v201.mt.__index = function(_, v222)
                    if v222 == "IsA" then
                        return function(_, v224)
                            return v201.object:IsA(v224) or v224 == "Wrapped";
                        end;
                    elseif v222 == "Unsubscribe" then
                        return function()
                            if v201.subscribe then
                                for _, v226 in ipairs(v201.subscribe) do
                                    v226:disconnect();
                                end;
                            end;
                        end;
                    elseif v222 == "IsUpdateRequired" then
                        local l_updateRequired_2 = v201.info.updateRequired;
                        v201.info.updateRequired = false;
                        return l_updateRequired_2;
                    elseif v222 == "CanSimulate" then
                        return #v201.children < 10;
                    elseif v222 == "ClearCache" then
                        return function()
                            v201.info.oCFrame = nil;
                            v201.info.oSize = nil;
                            v201.info.pCFrame = nil;
                            v201.info.pSize = nil;
                            v201.info.lastPlaneCFrame = nil;
                        end;
                    elseif v222 == "TranslateFromTo" then
                        return function(v228, v229)
                            v201.info.expectingChanged = true;
                            if not v201.info.oCFrame then
                                v220();
                            end;
                            v201.roots = v20({
                                v201.object
                            });
                            local v230 = v229.p - v228.p;
                            v201.object:PivotTo(v201.object:GetPivot() + v230);
                            v201.info.pCFrame = v201.info.pCFrame + v230;
                            v201.info.oCFrame = v201.info.oCFrame + v230;
                            v201.info.expectingChanged = false;
                        end;
                    elseif v222 == "BreakImplicitJoints" then
                        return function()
                        end;
                    elseif v222 == "IsColliding" then
                        return function()
                            return false;
                        end;
                    elseif v222 == "GetTouchingParts" then
                        return function()
                            return (v212());
                        end;
                    elseif v222 == "SafeRotate" then
                        return function()
                        end;
                    elseif v222 == "Children" then
                        return v201.children;
                    elseif v222 == "Size" then
                        if not v201.info.oSize then
                            v220();
                            return v201.info.oSize;
                        else
                            return v201.info.oSize;
                        end;
                    elseif v222 == "CFrame" then
                        if not v201.info.oCFrame then
                            v220();
                            return v201.info.oCFrame;
                        else
                            return v201.info.oCFrame;
                        end;
                    elseif v222 == "PlaneAlignedSize" then
                        if not v201.info.pSize then
                            return nil;
                        else
                            return v201.info.pSize;
                        end;
                    elseif v222 == "PlaneAlignedCFrame" then
                        if not v201.info.pCFrame then
                            return nil;
                        else
                            return v201.info.pCFrame;
                        end;
                    elseif v222 == "Position" then
                        if not v201.info.oCFrame then
                            v220();
                            return v201.info.oCFrame.p;
                        else
                            return v201.info.oCFrame.p;
                        end;
                    elseif v222 == "Object" then
                        return v201.object;
                    elseif not pcall(function()
                        local _ = v201.object[v222];
                    end) then
                        return nil;
                    elseif type(v201.object[v222]) == "function" then
                        return function(_, ...)
                            return v201.object[v222](v201.object, ...);
                        end;
                    else
                        return v201.object[v222];
                    end;
                end;
                v201.mt.__newindex = function(_, v234, v235)
                    if v234 == "UpdatePlaneCFrame" then
                        v201.info.lastPlaneCFrame = v235;
                        local l_info_16 = v201.info;
                        local l_info_17 = v201.info;
                        local v238, v239 = v2.getCFrameAndSizeOfList(v201.children, v235);
                        l_info_16.pCFrame = v238;
                        l_info_17.pSize = v239;
                        return ;
                    elseif v234 == "CFrame" then
                        v201.info.expectingChanged = true;
                        if not v201.info.oCFrame then
                            v220();
                        end;
                        v201.roots = v20({
                            v201.object
                        });
                        v235 = v62(v235, true);
                        v201.object:PivotTo((v235 * v201.info.oCFrame:Inverse()) * v201.object:GetPivot());
                        if v201.info.oCFrame - v201.info.oCFrame.p ~= v235 - v235.p then
                            v201.info.pCFrame = nil;
                            v201.info.pSize = nil;
                            v201.info.lastPlaneCFrame = nil;
                        elseif v201.info.pCFrame then
                            v201.info.pCFrame = (v201.info.pCFrame - v201.info.oCFrame.p) + v235.p;
                        end;
                        v201.info.oCFrame = v235;
                        v201.info.expectingChanged = false;
                        return ;
                    elseif v234 == "BreakImplicitJoints" then
                        return function()
                        end;
                    elseif v234 == "Size" then
                        return ;
                    elseif v234 == "Position" then
                        v201.info.expectingChanged = true;
                        local l_ModelCFrame_0 = v201.object:GetModelCFrame();
                        v201.object:PivotTo((((l_ModelCFrame_0 - l_ModelCFrame_0.p) + v235) * l_ModelCFrame_0:Inverse()) * v201.object:GetPivot());
                        v201.info.expectingChanged = false;
                        return ;
                    else
                        v201.info.expectingChanged = true;
                        if pcall(function()
                            local _ = v201.object[v234];
                        end) then
                            v201.object[v234] = v235;
                        end;
                        v201.info.expectingChanged = false;
                        return ;
                    end;
                end;
                return v201;
            else
                return v89;
            end;
        else
            return v89;
        end;
    else
        return nil;
    end;
end;
return {
    convertToPart = createMetaPart, 
    forcePrimaryPart = forcePrimaryPart
};
