local l_CollectionService_0 = game:GetService("CollectionService");
local l_Selection_0 = game:GetService("Selection");
local l_ChangeHistoryService_0 = game:GetService("ChangeHistoryService");
local v3 = require(script.Parent.Actions);
local v4 = require(script.Parent.Maid);
local _ = require(script.Parent.Types);
local l_ServerStorage_0 = game:GetService("ServerStorage");
local l_TagEditorShowTextSeparately_0 = game:GetFastFlag("TagEditorShowTextSeparately");
local l_TagEditorExternalUpdate_0 = game:GetFastFlag("TagEditorExternalUpdate");
local v9 = {};
v9.__index = v9;
local v10 = {
    Icon = "rbxasset://textures/TagEditor/Tag.png", 
    Visible = true, 
    DrawType = "Box", 
    ShowText = if not l_TagEditorShowTextSeparately_0 then nil else false, 
    AlwaysOnTop = false, 
    Group = ""
};
v9._global = nil;
local function _(v11, v12, v13)
    return (v12 - v11) * v13 + v11;
end;
local function v18(v15)
    local v16 = 2166136261;
    for v17 = 1, #v15 do
        v16 = ((v16 * 16777619) % 4294967296 + v15:byte(v17)) % 4294967296;
    end;
    return Color3.fromHSV(((v16 / 65536) % 256) / 255, 0.5 * (((v16 / 256) % 256) / 255) + 0.5, 0.7 * (((v16 / 1) % 256) / 255) + 0.3);
end;
local _ = function(v19)
    if v19 then
        for _, v21 in v19:GetChildren() do
            if v21:IsA("Folder") then
                return true;
            end;
        end;
        return false;
    else
        return false;
    end;
end;
v9.new = function(v23, v24)
    local v25 = setmetatable({
        store = v23, 
        analytics = v24, 
        updateTriggered = false, 
        enabled = false, 
        tags = {}, 
        onUpdate = {}, 
        _tagFolderSet = {}, 
        _defaultTagsFolder = l_ServerStorage_0:FindFirstChild("TagList"), 
        _maid = v4.new(), 
        _gaveDuplicateWarningsFor = {}
    }, v9);
    v9._global = v25;
    local l__defaultTagsFolder_0 = v25._defaultTagsFolder;
    local v27;
    if l__defaultTagsFolder_0 then
        for _, v29 in l__defaultTagsFolder_0:GetChildren() do
            if v29:IsA("Folder") then
                v27 = true;
                goto label0 --[[  true, false  ]];
            end;
        end;
        v27 = false;
    else
        v27 = false;
    end;
    ::label0::;
    if v27 then
        l_ChangeHistoryService_0:SetWaypoint("Migrating tags folder");
        v27 = 0;
        for _, v31 in pairs(v25._defaultTagsFolder:GetChildren()) do
            if v31:IsA("Folder") then
                local l_Configuration_0 = Instance.new("Configuration");
                l_Configuration_0.Name = v31.Name;
                local v33 = {};
                for _, v35 in pairs(v31:GetChildren()) do
                    if v35:IsA("ValueBase") then
                        l_Configuration_0:SetAttribute(v35.Name, v35.Value);
                        v33[v35.Name] = true;
                    end;
                end;
                for v36, v37 in pairs(v10) do
                    if not v33[v36] then
                        l_Configuration_0:SetAttribute(v36, v37);
                    end;
                end;
                l_Configuration_0.Parent = v25._defaultTagsFolder;
                v31.Parent = nil;
                v27 = v27 + 1;
            end;
        end;
        if v27 > 0 then
            print(string.format("TagEditor: Converted %d tags to attribute-based format.", v27));
        end;
        l_CollectionService_0:AddTag(v25._defaultTagsFolder, "TagEditorTagContainer");
        l_ChangeHistoryService_0:SetWaypoint("Migrated tags folder");
    end;
    v25:_updateStore();
    v25._maid:give(l_Selection_0.SelectionChanged:Connect(function()
        if v25.enabled then
            v25:_updateStore();
            v25:_updateUnknownTags();
            return ;
        else
            return ;
        end;
    end));
    if v25._defaultTagsFolder then
        v25:_watchFolder(v25._defaultTagsFolder);
    end;
    v25._maid:give(l_CollectionService_0:GetInstanceAddedSignal("TagEditorTagContainer"):Connect(function(v38)
        v25:_watchFolder(v38);
    end));
    v25._maid:give(l_CollectionService_0:GetInstanceRemovedSignal("TagEditorTagContainer"):Connect(function(v39)
        if v39 ~= v25._defaultTagsFolder then
            v25:_stopWatchingFolder(v39);
        end;
    end));
    for _, v41 in pairs(l_CollectionService_0:GetTagged("TagEditorTagContainer")) do
        v25:_watchFolder(v41);
    end;
    return v25;
end;
v9.Destroy = function(v42)
    v42._maid:destroy();
end;
v9.Get = function()
    return v9._global;
end;
v9.GetTags = function(v43)
    return v43.tags;
end;
v9.OnTagsUpdated = function(v44, v45)
    local v47 = {
        Disconnect = function(v46)
            v44.onUpdate[v46] = nil;
        end
    };
    v44.onUpdate[v47] = v45;
    return v47;
end;
v9._stopWatchingFolder = function(v48, v49)
    if v48._maid[v49] then
        v48._maid[v49] = nil;
        v48:_updateStore(true);
    end;
end;
v9._watchFolder = function(v50, v51)
    if not v50._maid[v51] then
        local v52 = v4.new();
        v50._tagFolderSet[v51] = true;
        v52:give(function()
            v50._tagFolderSet[v51] = nil;
        end);
        for _, v54 in pairs(v51:GetChildren()) do
            if v54:IsA("Configuration") then
                v52[v54] = v50:_watchChild(v54);
            end;
        end;
        v52:give(v51.ChildAdded:Connect(function(v55)
            if v55:IsA("Configuration") then
                v52[v55] = v50:_watchChild(v55);
            end;
        end));
        v52:give(v51.ChildRemoved:Connect(function(v56)
            if v56:IsA("Configuration") then
                v52[v56] = nil;
                v50:_updateStore();
            end;
        end));
        v50._maid[v51] = v52;
        return ;
    else
        return ;
    end;
end;
v9._watchChild = function(v57, v58)
    local v59 = v4.new();
    v57:_updateStore(true);
    local function v63()
        local v60 = v4.new();
        v60:give(l_CollectionService_0:GetInstanceAddedSignal(v58.Name):Connect(function(_)
            v57:_updateStore();
        end));
        v60:give(l_CollectionService_0:GetInstanceRemovedSignal(v58.Name):Connect(function(_)
            v57:_updateStore();
        end));
        return v60;
    end;
    v59:give(v58.AttributeChanged:Connect(function(_)
        v57:_updateStore();
    end));
    local v65 = nil;
    if l_TagEditorExternalUpdate_0 then
        v65 = v63();
    end;
    v59:give(v58:GetPropertyChangedSignal("Name"):Connect(function(_)
        v57:_updateStore(true);
        if l_TagEditorExternalUpdate_0 then
            v65:destroy();
            v65 = v63();
        end;
    end));
    if l_TagEditorExternalUpdate_0 then
        v59:give(function()
            v65:destroy();
        end);
    end;
    return v59;
end;
v9._ensureDefaultFolder = function(v67)
    if not v67._defaultTagsFolder then
        v67._defaultTagsFolder = Instance.new("Folder");
        v67._defaultTagsFolder.Name = "TagList";
        v67._defaultTagsFolder.Parent = l_ServerStorage_0;
        l_CollectionService_0:AddTag(v67._defaultTagsFolder, "TagEditorTagContainer");
        v67:_watchFolder(v67._defaultTagsFolder);
    end;
    return v67._defaultTagsFolder;
end;
v9._updateStore = function(v68, v69)
    if not v68.updateTriggered then
        v68.updateTriggered = true;
        task.spawn(function()
            v68:_doUpdateStore();
            if v69 then
                v68:_updateUnknownTags();
            end;
        end);
    end;
end;
v9._doUpdateStore = function(v70)
    v70.updateTriggered = false;
    local v71 = {};
    local v72 = {};
    local v73 = l_Selection_0:Get();
    local function v82(v74)
        local v75 = {};
        for _, v77 in pairs(v74:GetChildren()) do
            if v77:IsA("Configuration") then
                if not v75[v77.Name] then
                    v75[v77.Name] = true;
                    local v78 = false;
                    local v79 = false;
                    local v80 = {
                        Name = v77.Name, 
                        Icon = v77:GetAttribute("Icon") or v10.Icon, 
                        Visible = v77:GetAttribute("Visible") or false, 
                        DrawType = v77:GetAttribute("DrawType") or v10.DrawType, 
                        ShowText = if not l_TagEditorShowTextSeparately_0 then nil else v77:GetAttribute("ShowText") or v10.ShowText, 
                        AlwaysOnTop = v77:GetAttribute("AlwaysOnTop") or v10.AlwaysOnTop, 
                        Group = v77:GetAttribute("Group") or v10.Group, 
                        Color = v77:GetAttribute("Color") or v18(v77.Name), 
                        HasAll = false, 
                        HasSome = false
                    };
                    if v80.Group == "" then
                        v80.Group = nil;
                    end;
                    if v80.Icon == "" then
                        v80.Icon = v10.Icon;
                    end;
                    for v81 = 1, #v73 do
                        if not l_CollectionService_0:HasTag(v73[v81], v80.Name) then
                            v79 = true;
                        else
                            v78 = true;
                        end;
                    end;
                    v80.HasAll = v78 and not v79;
                    v80.HasSome = v78 and v79;
                    v71[#v71 + 1] = v80;
                    if v80.Group then
                        v72[v80.Group] = true;
                    end;
                elseif not v70._gaveDuplicateWarningsFor[v77.Name] then
                    warn(string.format("Multiple tags in %s are named %q, consider removing the duplicates.", v74:GetFullName(), v77.Name));
                    v70._gaveDuplicateWarningsFor[v77.Name] = true;
                end;
            end;
        end;
    end;
    if v70._defaultTagsFolder then
        v82(v70._defaultTagsFolder);
    end;
    for v83, _ in pairs(v70._tagFolderSet) do
        if v83 ~= v70._defaultTagsFolder then
            v82(v83);
        end;
    end;
    table.sort(v71, function(v85, v86)
        return v85.Name < v86.Name;
    end);
    local l_tags_0 = v70.tags;
    v70.tags = v71;
    v70.store:dispatch(v3.SetTagData(v71));
    local v88 = {};
    for v89, _ in pairs(v72) do
        table.insert(v88, v89);
    end;
    table.sort(v88);
    v70.groups = v72;
    v70.store:dispatch(v3.SetGroupData(v88));
    for _, v92 in pairs(v70.onUpdate) do
        v92(v71, l_tags_0);
    end;
end;
v9._updateUnknownTags = function(v93)
    local v94 = l_Selection_0:Get();
    if #v94 ~= 0 then
        local v95 = {};
        for _, v97 in pairs(v93.tags) do
            v95[v97.Name] = true;
        end;
        local v98 = {};
        for _, v100 in pairs(v94) do
            for _, v102 in pairs((l_CollectionService_0:GetTags(v100))) do
                if not v95[v102] and v102:sub(1, 1) ~= "." then
                    v98[v102] = true;
                end;
            end;
        end;
        local v103 = {};
        for v104, _ in pairs(v98) do
            table.insert(v103, v104);
        end;
        table.sort(v103);
        v93.store:dispatch(v3.SetUnknownTags(v103));
    end;
end;
v9._setProp = function(v106, v107, v108, v109)
    local v110 = v106:_findTagInst(v107);
    if v110 then
        if v110:GetAttribute(v108) == v109 then
            return false;
        else
            l_ChangeHistoryService_0:SetWaypoint(string.format("Setting property %q of tag %q", v108, v107));
            v110:SetAttribute(v108, v109);
            l_ChangeHistoryService_0:SetWaypoint(string.format("Set property %q of tag %q", v108, v107));
            return true;
        end;
    else
        warn("Setting property of non-existent tag `" .. tostring(v107) .. "`");
        return false;
    end;
end;
v9._getProp = function(v111, v112, v113)
    local v114 = v111:_findTagInst(v112);
    if v114 then
        return v114:GetAttribute(v113);
    else
        return nil;
    end;
end;
v9._findTagInst = function(v115, v116)
    if v115._defaultTagsFolder then
        local l_FirstChild_0 = v115._defaultTagsFolder:FindFirstChild(v116);
        if l_FirstChild_0 then
            return l_FirstChild_0;
        end;
    end;
    for v118, _ in pairs(v115._tagFolderSet) do
        local l_v118_FirstChild_0 = v118:FindFirstChild(v116);
        if l_v118_FirstChild_0 then
            return l_v118_FirstChild_0;
        end;
    end;
    return nil;
end;
v9.AddTag = function(v121, v122)
    if not v121:_findTagInst(v122) then
        l_ChangeHistoryService_0:SetWaypoint(string.format("Creating tag %q", v122));
        local v123 = v121:_ensureDefaultFolder();
        local l_Configuration_1 = Instance.new("Configuration");
        l_Configuration_1.Name = v122;
        l_Configuration_1:SetAttribute("Icon", v10.Icon);
        l_Configuration_1:SetAttribute("Visible", v10.Visible);
        l_Configuration_1:SetAttribute("DrawType", v10.DrawType);
        if l_TagEditorShowTextSeparately_0 then
            l_Configuration_1:SetAttribute("ShowText", v10.ShowText);
        end;
        l_Configuration_1:SetAttribute("AlwaysOnTop", v10.AlwaysOnTop);
        l_Configuration_1:SetAttribute("Group", v10.Group);
        l_Configuration_1:SetAttribute("Color", v18(v122));
        l_Configuration_1.Parent = v123;
        v121.analytics:report("tagCreated");
        l_ChangeHistoryService_0:SetWaypoint(string.format("Created tag %q", v122));
        return ;
    else
        return ;
    end;
end;
v9.Rename = function(v125, v126, v127)
    local v128 = v125:_findTagInst(v126);
    if v128 then
        l_ChangeHistoryService_0:SetWaypoint(string.format("Renaming tag %q to %q", v126, v127));
        v128.Name = v127;
        for _, v130 in pairs(l_CollectionService_0:GetTagged(v126)) do
            l_CollectionService_0:RemoveTag(v130, v126);
            l_CollectionService_0:AddTag(v130, v127);
        end;
        v125:_updateStore();
        v125:_updateUnknownTags();
        l_ChangeHistoryService_0:SetWaypoint(string.format("Renamed tag %q to %q", v126, v127));
        return ;
    else
        return ;
    end;
end;
v9.ToggleGroupVisibility = function(v131, v132)
    local v133 = {};
    local v134 = false;
    for _, v136 in pairs(v131.tags) do
        if v136.Group == v132 then
            if v134 then
                v131:_setProp(v136.Name, "Visible", true);
            else
                table.insert(v133, v136);
                if not v136.Visible then
                    v134 = true;
                    v131:_setProp(v136.Name, "Visible", true);
                end;
            end;
        end;
    end;
    if not v134 then
        for _, v138 in pairs(v133) do
            v131:_setProp(v138.Name, "Visible", false);
        end;
    end;
end;
v9.GetGroups = function(v139)
    return v139.groups;
end;
v9.RenameGroup = function(v140, v141, v142)
    l_ChangeHistoryService_0:SetWaypoint(string.format("Renaming Group %q to %q", v141, v142));
    for _, v144 in pairs(v140.tags) do
        if v144.Group == v141 then
            v140:_setProp(v144.Name, "Group", v142 or "");
        end;
    end;
    l_ChangeHistoryService_0:SetWaypoint(string.format("Renamed Group %q to %q", v141, v142));
end;
v9.DeleteGroup = function(v145, v146)
    l_ChangeHistoryService_0:SetWaypoint(string.format("Deleteing Group %q", v146));
    for _, v148 in pairs(v145.tags) do
        if v148.Group == v146 then
            v145:_setProp(v148.Name, "Group", "");
        end;
    end;
    l_ChangeHistoryService_0:SetWaypoint(string.format("Deleted Group %q", v146));
end;
v9.SelectAll = function(_, v150)
    l_Selection_0:Set(l_CollectionService_0:GetTagged(v150));
end;
v9.GetIcon = function(v151, v152)
    return v151:_getProp(v152, "Icon") or v10.Icon;
end;
v9.GetVisible = function(v153, v154)
    return v153:_getProp(v154, "Visible") or v10.Visible;
end;
v9.GetDrawType = function(v155, v156)
    return v155:_getProp(v156, "DrawType") or v10.DrawType;
end;
v9.GetColor = function(v157, v158)
    return v157:_getProp(v158, "Color") or v10.Color;
end;
if l_TagEditorShowTextSeparately_0 then
    v9.GetShowText = function(v159, v160)
        return v159:_getProp(v160, "ShowText") or v10.ShowText;
    end;
end;
v9.GetAlwaysOnTop = function(v161, v162)
    return v161:_getProp(v162, "AlwaysOnTop") or v10.AlwaysOnTop;
end;
v9.GetGroup = function(v163, v164)
    return v163:_getProp(v164, "Group") or v10.Group;
end;
v9.SetIcon = function(v165, v166, v167)
    v165:_setProp(v166, "Icon", v167 or "");
    v165.analytics:report("iconChanged");
end;
v9.SetVisible = function(v168, v169, v170)
    v168:_setProp(v169, "Visible", v170);
end;
v9.SetDrawType = function(v171, v172, v173)
    v171:_setProp(v172, "DrawType", v173);
end;
v9.SetColor = function(v174, v175, v176)
    v174:_setProp(v175, "Color", v176);
    v174.analytics:report("colorChanged");
end;
if l_TagEditorShowTextSeparately_0 then
    v9.SetShowText = function(v177, v178, v179)
        v177:_setProp(v178, "ShowText", v179);
    end;
end;
v9.SetAlwaysOnTop = function(v180, v181, v182)
    v180:_setProp(v181, "AlwaysOnTop", v182);
end;
v9.SetGroup = function(v183, v184, v185)
    v183:_setProp(v184, "Group", v185 or "");
end;
v9.DelTag = function(v186, v187)
    local v188 = v186:_findTagInst(v187);
    if v188 then
        l_ChangeHistoryService_0:SetWaypoint(string.format("Deleting tag %q", v187));
        v188.Parent = nil;
        for _, v190 in pairs(l_CollectionService_0:GetTagged(v187)) do
            l_CollectionService_0:RemoveTag(v190, v187);
        end;
        l_ChangeHistoryService_0:SetWaypoint(string.format("Deleted tag %q", v187));
        return ;
    else
        return ;
    end;
end;
v9.SetTag = function(v191, v192, v193)
    if not v193 then
        l_ChangeHistoryService_0:SetWaypoint(string.format("Removing tag %q from selection", v192));
    else
        l_ChangeHistoryService_0:SetWaypoint(string.format("Applying tag %q to selection", v192));
    end;
    for _, v195 in pairs((l_Selection_0:Get())) do
        if not v193 then
            l_CollectionService_0:RemoveTag(v195, v192);
        else
            l_CollectionService_0:AddTag(v195, v192);
        end;
    end;
    v191:_updateStore();
    if not v193 then
        l_ChangeHistoryService_0:SetWaypoint(string.format("Removed tag %q from selection", v192));
        return ;
    else
        l_ChangeHistoryService_0:SetWaypoint(string.format("Applied tag %q to selection", v192));
        v191.analytics:report("objectTagged");
        return ;
    end;
end;
v9.SetEnabled = function(v196, v197)
    if v196.enabled == v197 then
        return ;
    else
        v196.enabled = v197;
        if v197 then
            v196:_updateStore();
            v196:_updateUnknownTags();
        end;
        return ;
    end;
end;
return v9;
