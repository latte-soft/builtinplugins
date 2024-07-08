local l_Parent_0 = script.Parent.Parent;
require(l_Parent_0.Common.commonInit)();
local l_PhysicsService_0 = game:GetService("PhysicsService");
local l_ChangeHistoryService_0 = game:GetService("ChangeHistoryService");
local v3 = require(l_Parent_0.Plugin.getSelectedParts);
local v4 = require(l_Parent_0.Plugin.getPartsInGroup);
local v5 = require(l_Parent_0.Plugin.getGroups);
local v6 = require(l_Parent_0.Plugin.getSelectedGroupIds);
local v7 = game:GetService("StudioService"):HasInternalPermission();
local v8 = nil;
local v9 = nil;
local function _(v10)
    for v11 = 1, #v10 do
        if v9[v11].name ~= v10[v11].name then
            return true;
        end;
    end;
    return false;
end;
v8 = function()
    if v9 then
        local l_l_PhysicsService_0_RegisteredCollisionGroups_0 = l_PhysicsService_0:GetRegisteredCollisionGroups();
        local v14 = false;
        if #l_l_PhysicsService_0_RegisteredCollisionGroups_0 ~= #v9 then
            v14 = true;
        end;
        if not v14 then
            local v15;
            for v16 = 1, #l_l_PhysicsService_0_RegisteredCollisionGroups_0 do
                if v9[v16].name ~= l_l_PhysicsService_0_RegisteredCollisionGroups_0[v16].name then
                    v15 = true;
                    goto label0 --[[  true, false  ]];
                end;
            end;
            v15 = false;
            ::label0::;
            if v15 then
                v14 = true;
            end;
        end;
        v9 = l_l_PhysicsService_0_RegisteredCollisionGroups_0;
        return v14;
    else
        v9 = l_PhysicsService_0:GetRegisteredCollisionGroups();
        return false;
    end;
end;
local function _()
    local v17 = v5();
    local v18 = v6(v17);
    plugin:SetItem("Groups", v17);
    plugin:SetItem("SelectedGroupIds", v18);
end;
local function _(v20)
    local v21 = v5();
    local v22 = v6(v21);
    plugin:SetItem("Groups", v21);
    plugin:SetItem("SelectedGroupIds", v22);
    plugin:Invoke("SetStateAndRefresh", v20);
end;
local v24 = {};
local function v34()
    table.insert(v24, game:GetService("Selection").SelectionChanged:Connect(function()
        local v25 = {};
        local v26 = v5();
        local v27 = v6(v26);
        plugin:SetItem("Groups", v26);
        plugin:SetItem("SelectedGroupIds", v27);
        plugin:Invoke("SetStateAndRefresh", v25);
    end));
    table.insert(v24, l_ChangeHistoryService_0.OnUndo:Connect(function()
        local v28 = {};
        local v29 = v5();
        local v30 = v6(v29);
        plugin:SetItem("Groups", v29);
        plugin:SetItem("SelectedGroupIds", v30);
        plugin:Invoke("SetStateAndRefresh", v28);
    end));
    table.insert(v24, l_ChangeHistoryService_0.OnRedo:Connect(function()
        local v31 = {};
        local v32 = v5();
        local v33 = v6(v32);
        plugin:SetItem("Groups", v32);
        plugin:SetItem("SelectedGroupIds", v33);
        plugin:Invoke("SetStateAndRefresh", v31);
    end));
end;
local _ = function()
    for _, v36 in ipairs(v24) do
        v36:Disconnect();
    end;
end;
local _ = function(v38)
    if not l_PhysicsService_0:IsCollisionGroupRegistered(v38) then
        local l_status_0, _ = pcall(l_PhysicsService_0.RegisterCollisionGroup, l_PhysicsService_0, v38);
        return l_status_0;
    else
        return true;
    end;
end;
local v42 = {};
local function v80()
    table.insert(v42, plugin:OnInvoke("WindowEnabledChanged", function(v43)
        if not v43 then
            for _, v45 in ipairs(v24) do
                v45:Disconnect();
            end;
            return ;
        else
            v34();
            local v46 = {};
            local v47 = v5();
            local v48 = v6(v47);
            plugin:SetItem("Groups", v47);
            plugin:SetItem("SelectedGroupIds", v48);
            plugin:Invoke("SetStateAndRefresh", v46);
            return ;
        end;
    end));
    table.insert(v42, plugin:OnInvoke("DeleteCollisionGroup", function(v49)
        l_ChangeHistoryService_0:SetWaypoint("Deleting collision group");
        l_PhysicsService_0:UnregisterCollisionGroup(v49);
        l_ChangeHistoryService_0:SetWaypoint("Deleted collision group");
        local v50 = {};
        local v51 = v5();
        local v52 = v6(v51);
        plugin:SetItem("Groups", v51);
        plugin:SetItem("SelectedGroupIds", v52);
        plugin:Invoke("SetStateAndRefresh", v50);
    end));
    table.insert(v42, plugin:OnInvoke("RenameCollisionGroup", function(v53)
        l_ChangeHistoryService_0:SetWaypoint("Renaming collision group");
        l_PhysicsService_0:RenameCollisionGroup(v53.oldName, v53.newName);
        for _, v55 in pairs(v4(v53.oldName)) do
            if v55.CollisionGroup == v53.oldName then
                v55.CollisionGroup = v53.newName;
            end;
        end;
        l_ChangeHistoryService_0:SetWaypoint("Renamed collision group");
        local v56 = {
            GroupRenaming = ""
        };
        local v57 = v5();
        local v58 = v6(v57);
        plugin:SetItem("Groups", v57);
        plugin:SetItem("SelectedGroupIds", v58);
        plugin:Invoke("SetStateAndRefresh", v56);
    end));
    table.insert(v42, plugin:OnInvoke("AddSelectedPartsToCollisionGroup", function(v59)
        l_ChangeHistoryService_0:SetWaypoint("Setting part membership to collision group");
        for _, v61 in pairs(v3()) do
            v61.CollisionGroup = v59;
        end;
        l_ChangeHistoryService_0:SetWaypoint("Set part membership to collision group");
        local v62 = {};
        local v63 = v5();
        local v64 = v6(v63);
        plugin:SetItem("Groups", v63);
        plugin:SetItem("SelectedGroupIds", v64);
        plugin:Invoke("SetStateAndRefresh", v62);
    end));
    table.insert(v42, plugin:OnInvoke("ToggleCollidesWith", function(v65)
        local l_groupName_0 = v65.groupName;
        local v67;
        if not l_PhysicsService_0:IsCollisionGroupRegistered(l_groupName_0) then
            local l_status_1, _ = pcall(l_PhysicsService_0.RegisterCollisionGroup, l_PhysicsService_0, l_groupName_0);
            v67 = l_status_1;
        else
            v67 = true;
        end;
        if v67 then
            l_groupName_0 = v65.otherGroupName;
            if not l_PhysicsService_0:IsCollisionGroupRegistered(l_groupName_0) then
                local l_status_2, _ = pcall(l_PhysicsService_0.RegisterCollisionGroup, l_PhysicsService_0, l_groupName_0);
                v67 = l_status_2;
            else
                v67 = true;
            end;
        end;
        if v67 then
            l_groupName_0 = not l_PhysicsService_0:CollisionGroupsAreCollidable(v65.groupName, v65.otherGroupName);
            l_ChangeHistoryService_0:SetWaypoint("Setting group collision state");
            l_PhysicsService_0:CollisionGroupSetCollidable(v65.groupName, v65.otherGroupName, l_groupName_0);
            l_ChangeHistoryService_0:SetWaypoint("Set group collision state");
            local v72 = {};
            local v73 = v5();
            local v74 = v6(v73);
            plugin:SetItem("Groups", v73);
            plugin:SetItem("SelectedGroupIds", v74);
            plugin:Invoke("SetStateAndRefresh", v72);
            return ;
        else
            warn((("Could not toggle collision between \"%*\" and \"%*\""):format(v65.groupName, v65.otherGroupName)));
            return ;
        end;
    end));
    table.insert(v42, plugin:OnInvoke("CreateCollisionGroup", function(v75)
        l_ChangeHistoryService_0:SetWaypoint("Creating collision group");
        l_PhysicsService_0:RegisterCollisionGroup(v75);
        l_ChangeHistoryService_0:SetWaypoint("Created collision group");
        local v76 = {};
        local v77 = v5();
        local v78 = v6(v77);
        plugin:SetItem("Groups", v77);
        plugin:SetItem("SelectedGroupIds", v78);
        plugin:Invoke("SetStateAndRefresh", v76);
    end));
    table.insert(v42, plugin:OnInvoke("SelectPartsInCollisionGroup", function(v79)
        game:GetService("Selection"):Set(v4(v79));
    end));
end;
local _ = function()
    for _, v82 in ipairs(v42) do
        v82:Disconnect();
    end;
end;
local v84 = false;
local function _()
    v84 = true;
    spawn(function()
        while v84 do
            if v8() then
                plugin:Invoke("SetStateAndRefresh", nil);
            end;
            wait(1);
        end;
    end);
end;
local function _()
    v84 = false;
end;
local v87 = nil;
local function v94()
    if plugin.HostDataModelType == Enum.StudioDataModelType.PlayClient then
        local v88 = {
            InPlayMode = true
        };
        local v89 = v5();
        local v90 = v6(v89);
        plugin:SetItem("Groups", v89);
        plugin:SetItem("SelectedGroupIds", v90);
        plugin:Invoke("SetStateAndRefresh", v88);
        return ;
    else
        local v91 = {
            InPlayMode = false
        };
        local v92 = v5();
        local v93 = v6(v92);
        plugin:SetItem("Groups", v92);
        plugin:SetItem("SelectedGroupIds", v93);
        plugin:Invoke("SetStateAndRefresh", v91);
        v84 = true;
        spawn(function()
            while v84 do
                if v8() then
                    plugin:Invoke("SetStateAndRefresh", nil);
                end;
                wait(1);
            end;
        end);
        plugin:Invoke("PollGuiEnabled");
        v80();
        if v7 then
            v87 = require(l_Parent_0.Packages.DeveloperTools).forPlugin("CollisionGroupsEditor", plugin);
            v87:addPluginRouter(plugin);
        end;
        return ;
    end;
end;
local _ = function()
    for _, v96 in ipairs(v42) do
        v96:Disconnect();
    end;
    for _, v98 in ipairs(v24) do
        v98:Disconnect();
    end;
    v84 = false;
    if v87 then
        v87:destroy();
    end;
end;
(function(v100)
    v100.CurrentDataModelTypeAboutToChange:Connect(function()
        if plugin.HostDataModelTypeIsCurrent then
            for _, v102 in ipairs(v42) do
                v102:Disconnect();
            end;
            for _, v104 in ipairs(v24) do
                v104:Disconnect();
            end;
            v84 = false;
            if v87 then
                v87:destroy();
            end;
        end;
    end);
    v100.CurrentDataModelTypeChanged:Connect(function()
        if plugin.HostDataModelTypeIsCurrent then
            v94();
        end;
    end);
    if plugin.HostDataModelTypeIsCurrent then
        v94();
    end;
end)(plugin.MultipleDocumentInterfaceInstance.FocusedDataModelSession);
