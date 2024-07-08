local l_script_FirstAncestor_0 = script:FindFirstAncestor("StreamingServiceDispatcherRegistry");
local v1 = require(l_script_FirstAncestor_0.Src.Utils.CliAdapter);
local v2 = v1.GetService("StreamingService");
local v3 = v1.GetService("ChatbotUIService");
local v4 = v1.GetService("ConversationalAIAcceptanceService");
local v5 = v1.GetService("Selection");
local v6 = v1.GetService("HttpService");
local v7 = require(l_script_FirstAncestor_0.Src.Utils.Utils);
local v8 = require(l_script_FirstAncestor_0.Src.Commands.BuilderCommands.BuilderNameMap);
local v9 = require(script.Parent.RecentInstancesContext);
local v10 = {};
local v11 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagShowViewportContextVisualization);
local v12 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagDebugConvAIEnableAudioCapabilities);
local v13 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagCAPRecentInstancesContextV2);
local v14 = require(l_script_FirstAncestor_0.Src.Flags.getFIntCAPRecentSelectedInstanceCount);
local v15 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagCAPDMHierarchyIncludePosition);
local v16 = require(l_script_FirstAncestor_0.Src.Flags.getFIntViewportContextCollectionHeight);
local v17 = require(l_script_FirstAncestor_0.Src.Flags.getFIntMaxContextAllowedFromSelection);
local v18 = require(l_script_FirstAncestor_0.Src.Flags.getFIntMaxContextAllowedFromViewport);
local v19 = require(l_script_FirstAncestor_0.Src.Flags.getFIntViewportRootMaxAreaFactor);
local v20 = require(l_script_FirstAncestor_0.Src.Flags.getFIntCAPDMHierarchySelectedMaxDepth);
local v21 = require(l_script_FirstAncestor_0.Src.Flags.getFIntCAPDMHierarchyDefaultDepth);
local v22 = require(l_script_FirstAncestor_0.Src.Flags.getFIntCAPDMHierarchyGlobalContainerDepth);
local v23 = require(l_script_FirstAncestor_0.Src.Flags.getFIntCAPDMHierarchyMaxBytes);
local v24 = OverlapParams.new();
v24.BruteForceAllSlow = true;
local v25 = {
    ServerScriptService = true, 
    ReplicatedStorage = true, 
    ReplicatedFirst = true, 
    Workspace = true, 
    StarterGui = true, 
    StarterPlayer = true
};
local function v30(v26, v27)
    local v28, v29 = v7.getPositionAndSize(v26, v27);
    if v28 and v29 then
        return {
            x = math.ceil(v28.X * 100) / 100, 
            y = math.ceil(v28.Y * 100) / 100, 
            z = math.ceil(v28.Z * 100) / 100
        }, {
            x = math.ceil(v29.X * 100) / 100, 
            y = math.ceil(v29.Y * 100) / 100, 
            z = math.ceil(v29.Z * 100) / 100
        };
    else
        return ;
    end;
end;
local function v36(v31, v32, v33)
    if v11() then
        local v34, v35 = v7.getPositionAndSize(v32, v33);
        if not (not v34 or not v35) then
            v7.addConstraintVisualization(v31, v33:ToWorldSpace(CFrame.new(v34)), v35, true, Color3.fromRGB(0, 170, 255));
        end;
    end;
end;
local function _(v37, v38)
    return (v37:IsA("Script") or v37:IsA("ModuleScript")) and (v38.isSelected or v38.isRecent);
end;
local function v53(v40, v41, v42)
    local v43 = v18();
    local v44 = v19() / 100;
    local v45 = {};
    local v46 = 0;
    for _, v48 in v40, nil, nil do
        if v43 > v46 then
            local l_v48_0 = v48;
            if (l_v48_0.Size.X * l_v48_0.Size.Z) / v41 <= 1 then
                while true do
                    local l_Parent_0 = l_v48_0.Parent;
                    if l_Parent_0 and l_Parent_0 ~= workspace then
                        local _, v52 = v30(l_Parent_0, v42);
                        if v44 >= (v52.x * v52.z) / v41 then
                            l_v48_0 = l_Parent_0;
                        else
                            break;
                        end;
                    else
                        break;
                    end;
                end;
                if not v45[l_v48_0] then
                    v45[l_v48_0] = l_v48_0;
                    v46 = v46 + 1;
                end;
            end;
        else
            break;
        end;
    end;
    return v45;
end;
local function v62(v54, v55, v56)
    local v57 = {};
    for _, v59 in (v53(workspace:GetPartBoundsInBox(v55, v56, v24), v56.X * v56.Z, v55)), nil, nil do
        v36(v54, v59, v55);
        local v60, v61 = v30(v59, v55);
        table.insert(v57, {
            instanceId = v59, 
            assetId = if v59.SourceAssetId > 0 then v59.SourceAssetId else nil, 
            size = {
                x = v61.x, 
                z = v61.z
            }, 
            pos = {
                x = v60.x, 
                z = v60.z
            }
        });
        v8.guid2instance[v59:GetDebugId()] = v59;
    end;
    return v57;
end;
local v63 = 0;
generateHierarchy = function(v64, v65, v66, v67)
    local v68 = {
        instanceId = v64, 
        instanceName = v64.Name, 
        className = v64.ClassName, 
        assetId = if v64.SourceAssetId > 0 then v64.SourceAssetId else nil, 
        attributes = v7.getInstanceAttributes(v64)
    };
    if v15() then
        local v69, v70 = v30(v64, v66);
        v68.pos = v69;
        v68.size = v70;
    end;
    if v65[v64] then
        v68.isSelected = true;
    end;
    if not v13() then
        if not (not v67 or not v67[v64]) then
            v68.isRecent = true;
        end;
    elseif not ((not v67 or not v67[v64]) or v68.isSelected) then
        v68.isRecent = true;
    end;
    if not v13() then
        if v64:IsA("Script") then
            v68.scriptSource = v64.Source;
        end;
    elseif (v64:IsA("Script") or v64:IsA("ModuleScript")) and (v68.isSelected or v68.isRecent) then
        v68.scriptSource = v64.Source;
    end;
    v68.children = {};
    local v71 = false;
    for _, v73 in ipairs(v64:GetChildren()) do
        local v74 = generateHierarchy(v73, v65, v66, v67);
        if v74 then
            table.insert(v68.children, v74);
            if not v13() then
                if not (not v74.isSelected and not v74.isRecent) then
                    v71 = true;
                end;
            else
                v71 = true;
            end;
        end;
    end;
    if not v13() then
        if ((v68.isSelected or v68.isRecent) or v71) or next(v68.children) ~= nil then
            return v68;
        else
            return nil;
        end;
    elseif not (v68.isSelected or v68.isRecent) and not v71 then
        return nil;
    else
        return v68;
    end;
end;
populateChildren = function(v75, v76, v77, v78)
    if v75 then
        if not v75.isSelected and not v75.isRecent then
            for _, v80 in ipairs(v75.children) do
                populateChildren(v80, v80.instanceId, v77, v78);
            end;
            return ;
        else
            local v81 = {};
            for _, v83 in ipairs(v75.children) do
                table.insert(v81, v83);
            end;
            populateChildrenRecursive(v75, v76, v77, v78);
            for _, v85 in ipairs(v81) do
                populateChildren(v85, v85.instanceId, v77, v78);
            end;
            return ;
        end;
    else
        return ;
    end;
end;
populateChildrenRecursive = function(v86, v87, v88, v89)
    if v89 <= 0 then
        return ;
    else
        local v90 = {};
        for _, v92 in ipairs(v86.children) do
            v90[v92.instanceId] = v92;
        end;
        for _, v94 in ipairs(v87:GetChildren()) do
            local v95 = {
                instanceId = v94, 
                instanceName = v94.Name, 
                className = v94.ClassName, 
                assetId = v94.SourceAssetId > 0 and v94.SourceAssetId or nil, 
                attributes = v7.getInstanceAttributes(v94)
            };
            if v15() then
                local v96, v97 = v30(v94, v88);
                v95.pos = v96;
                v95.size = v97;
            end;
            if not v13() then
                if v94:IsA("Script") then
                    v95.scriptSource = v94.Source;
                end;
            elseif (v94:IsA("Script") or v94:IsA("ModuleScript")) and (v95.isSelected or v95.isRecent) then
                v95.scriptSource = v94.Source;
            end;
            v95.children = {};
            local v98 = string.len((v6:JSONEncode(v95)));
            if v90[v94] then
                populateChildrenRecursive(v90[v94], v94, v88, v89 - 1);
            elseif v23() < v63 + v98 then
                return ;
            else
                table.insert(v86.children, v95);
                v63 = v63 + v98;
                populateChildrenRecursive(v95, v94, v88, v89 - 1);
            end;
        end;
        return ;
    end;
end;
populateMissingGlobalContainers = function(v99, v100, v101, v102)
    local v103 = {};
    for _, v105 in ipairs(v99.children) do
        v103[v105.instanceName] = v105;
    end;
    for v106, _ in pairs(v25) do
        local l_v100_FirstChild_0 = v100:FindFirstChild(v106);
        if v103[v106] or not l_v100_FirstChild_0 then
            if l_v100_FirstChild_0 then
                populateChildrenRecursive(v103[v106], l_v100_FirstChild_0, v101, v102);
            end;
        else
            local v109 = {
                instanceId = l_v100_FirstChild_0, 
                instanceName = v106, 
                className = l_v100_FirstChild_0.ClassName, 
                children = {}
            };
            populateChildrenRecursive(v109, l_v100_FirstChild_0, v101, v102);
            table.insert(v99.children, v109);
        end;
    end;
end;
v10.register = function()
    v2:RegisterContextCollector("DefaultContextCollector", function(v110)
        v63 = 0;
        local v111 = {};
        local v112 = v5:Get();
        local v113 = v7.getRequestCFrame(v110);
        local v114 = {};
        if #v112 > 0 then
            local v115 = v17();
            v111.Selected = {};
            for v116, v117 in v112, nil, nil do
                if v115 >= v116 then
                    v114[v117] = true;
                    local v118, v119 = v30(v117, v113);
                    v8.guid2instance[v117:GetDebugId()] = v117;
                    table.insert(v111.Selected, {
                        instanceId = v117, 
                        className = v117.ClassName, 
                        instanceName = v117.Name, 
                        assetId = if v117.SourceAssetId > 0 then v117.SourceAssetId else nil, 
                        attributes = v7.getInstanceAttributes(v117), 
                        size = v119, 
                        pos = v118
                    });
                else
                    break;
                end;
            end;
        end;
        local v120 = {};
        if not v13() then
            v120 = v9.fetchContext();
            if #v120 > 0 then
                v111.Recent = v120;
            end;
        else
            v9.syncContext();
            v120 = v9.fetchContextV2();
        end;
        local v121 = nil;
        local _ = nil;
        v121 = tick();
        local v123 = {};
        for _, v125 in ipairs(v120) do
            v123[v125.instanceId] = true;
        end;
        if not (next(v114) == nil) or next(v123) ~= nil then
            v111.Hierarchy = generateHierarchy(game, v114, v113, v123);
            v63 = string.len((v6:JSONEncode(v111.Hierarchy)));
            populateChildren(v111.Hierarchy, game, v113, v20());
            if not v111.Hierarchy then
                v111.Hierarchy = {
                    instanceId = game, 
                    instanceName = game.Name, 
                    className = game.ClassName, 
                    children = {}
                };
            end;
            populateMissingGlobalContainers(v111.Hierarchy, game, v113, v22());
        else
            local v126 = {
                instanceId = game, 
                instanceName = game.Name, 
                className = game.ClassName, 
                children = {}
            };
            populateMissingGlobalContainers(v126, game, v113, v21());
            v111.Hierarchy = v126;
        end;
        if v13() then
            local v127 = v9.getInstanceTypes();
            local v128 = 0;
            for v129, _ in pairs(v114) do
                if v14() > v128 then
                    v9.registerInstanceV2(v129, v110, v127.Selected);
                    v128 = v128 + 1;
                else
                    break;
                end;
            end;
        end;
        v4:DataModelHierarchyLatency(v110, tick() - v121);
        v111.use_inventory_assets = v3:GetSettings().UseInventoryAssets;
        v111.enable_audio_capabilities = not not v12() or nil;
        return v111;
    end);
    v2:RegisterContextCollector("ViewportContextCollector", function(v131)
        v7.getRequestCFrame(v131);
        local v132 = v8.GetRequestMetadata(v131, "RequestCFrame");
        local v133 = v8.GetRequestMetadata(v131, "PlacementSize");
        return {
            placement_area = {
                x = v133.X, 
                z = v133.Z
            }, 
            viewport_instances = v62(v131, v132, (Vector3.new(v133.X, v16(), v133.Z)))
        };
    end);
end;
v10.unregister = function()
    v2:UnregisterContextCollector("DefaultContextCollector");
    v2:UnregisterContextCollector("ViewportContextCollector");
end;
return v10;
