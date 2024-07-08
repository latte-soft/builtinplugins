local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Roact);
local l_ContextServices_0 = require(l_Parent_0.Packages.Framework).ContextServices;
local v3 = require(script.Parent.Parent.contains);
local v4 = require(script.Parent.Parent.Util.Immutable);
local v5 = require(script.Parent.MainView);
local v6 = require(script.Parent.Parent.Constants);
local v7 = v1.Component:extend("Gui");
v7.init = function(v8)
    v8.state = {
        GroupRenaming = "", 
        GroupRenameDialogOpen = false, 
        Theme = "", 
        UISelectedGroupId = "", 
        InPlayMode = false
    };
    v8.state.Groups = v8:GetGroups();
end;
v7.setStateAndRefresh = function(v9, v10)
    v9:setState(v4.Set(v10, "Groups", v9:GetGroups((v4.JoinDictionaries(v9.state, v10)))));
end;
local _ = function(v11)
    local v12 = 0;
    for _, v14 in v11, nil, nil do
        if not v14.Virtual then
            v12 = v12 + 1;
        end;
    end;
    return v12;
end;
v7.GetGroups = function(v16, v17)
    if v17 == nil then
        v17 = {};
    end;
    local l_plugin_0 = v16.props.plugin;
    local l_l_plugin_0_Item_0 = l_plugin_0:GetItem("Groups");
    if l_l_plugin_0_Item_0 == nil then
        l_l_plugin_0_Item_0 = {};
    end;
    local l_l_plugin_0_Item_1 = l_plugin_0:GetItem("SelectedGroupIds");
    if l_l_plugin_0_Item_1 == nil then
        l_l_plugin_0_Item_1 = {};
    end;
    for _, v22 in pairs(l_l_plugin_0_Item_0) do
        v22.Renaming = v17.GroupRenaming == v22.Name;
        v22.UISelected = v17.UISelectedGroupId == v22.Id;
        v22.Selected = v3(l_l_plugin_0_Item_1, v22.Id);
        v22.OnDeleted = function()
            if not v17.InPlayMode then
                if v22.Name == "Default" then
                    return ;
                else
                    l_plugin_0:Invoke("DeleteCollisionGroup", v22.Name);
                    return ;
                end;
            else
                v16.props.OnAttemptModifyInPlayMode();
                return ;
            end;
        end;
        v22.OnRenamed = function(v23)
            if not v17.InPlayMode then
                if v22.Name == "Default" then
                    return ;
                elseif not v23 then
                    if v16.state.GroupRenaming == "" then
                        v16:setStateAndRefresh({
                            GroupRenaming = v22.Name
                        });
                        return ;
                    else
                        v16:setStateAndRefresh({
                            GroupRenaming = ""
                        });
                        return ;
                    end;
                else
                    v16:setStateAndRefresh({
                        GroupRenameDialogOpen = true
                    });
                    l_plugin_0:Invoke("RenameCollisionGroup", {
                        oldName = v22.Name, 
                        newName = v23
                    });
                    return ;
                end;
            else
                v16.props.OnAttemptModifyInPlayMode();
                return ;
            end;
        end;
        v22.OnMembershipSet = function()
            if not v17.InPlayMode then
                l_plugin_0:Invoke("AddSelectedPartsToCollisionGroup", v22.Name);
                return ;
            else
                v16.props.OnAttemptModifyInPlayMode();
                return ;
            end;
        end;
        v22.OnSelected = function(_)
            if v22.Name ~= "Default" then
                l_plugin_0:Invoke("SelectPartsInCollisionGroup", v22.Name);
            end;
            v16:setStateAndRefresh({
                UISelectedGroupId = v22.Id
            });
        end;
        v22.GetCollidesWith = function(v25)
            for _, v27 in pairs(v22.Collisions) do
                if v27.Name == v25.Name then
                    return v27.Collides;
                end;
            end;
        end;
        v22.ToggleCollidesWith = function(v28)
            if v22.Virtual or v28.Virtual then
                local l_l_l_plugin_0_Item_0_0 = l_l_plugin_0_Item_0;
                local v30 = 0;
                for _, v32 in l_l_l_plugin_0_Item_0_0, nil, nil do
                    if not v32.Virtual then
                        v30 = v30 + 1;
                    end;
                end;
                if v30 == v6.GroupCountMax then
                    v16.props.OnCannotConfigureSelection();
                    return ;
                end;
            end;
            if not v17.InPlayMode then
                l_plugin_0:Invoke("ToggleCollidesWith", {
                    groupName = v22.Name, 
                    otherGroupName = v28.Name
                });
                return ;
            else
                v16.props.OnAttemptModifyInPlayMode();
                return ;
            end;
        end;
    end;
    return l_l_plugin_0_Item_0;
end;
v7.shouldUpdate = function(v33, v34, v35)
    if v34 ~= v33.props then
        return true;
    elseif #v35.Groups ~= #v33.state.Groups then
        return true;
    else
        local function _(v36, v37, v38)
            for v39, v40 in v36, nil, nil do
                if v39 ~= v38 and v40 ~= v37[v39] then
                    return true;
                end;
            end;
            return false;
        end;
        local l_state_0 = v33.state;
        local v43;
        for v44, v45 in v35, nil, nil do
            if v44 ~= "Groups" and v45 ~= l_state_0[v44] then
                v43 = true;
                goto label0 --[[  true, false  ]];
            end;
        end;
        v43 = false;
        ::label0::;
        if not v43 then
            for v46, v47 in v33.state, nil, nil do
                if v46 ~= "Groups" and v47 ~= v35[v46] then
                    v43 = true;
                    goto label1 --[[  true, false  ]];
                end;
            end;
            v43 = false;
            ::label1::;
            if not v43 then
                for v48, v49 in v35.Groups, nil, nil do
                    local v50 = v33.state.Groups[v48];
                    if not (v50.Name == v49.Name) or v50.Id ~= v49.Id then
                        return true;
                    elseif #v50.Collisions ~= #v49.Collisions then
                        return true;
                    elseif v50.Selected ~= v49.Selected then
                        return true;
                    else
                        for v51, v52 in v49.Collisions, nil, nil do
                            local v53 = v50.Collisions[v51];
                            local v54;
                            for v55, v56 in v52, nil, nil do
                                if v55 ~= nil and v56 ~= v53[v55] then
                                    v54 = true;
                                    goto label2 --[[  true, false  ]];
                                end;
                            end;
                            v54 = false;
                            ::label2::;
                            if v54 then
                                return true;
                            end;
                        end;
                    end;
                end;
                return false;
            end;
        end;
        return true;
    end;
end;
v7.render = function(v57)
    local v58 = v57.props.Plugin:get();
    return v1.createElement(v5, {
        Groups = v57.state.Groups, 
        GroupRenameDialogOpen = v57.state.GroupRenameDialogOpen, 
        OnGroupRenameDialogClosed = function()
            v57:setState({
                GroupRenameDialogOpen = false
            });
        end, 
        OnGroupAdded = function(v59)
            if not v57.state.InPlayMode then
                v58:Invoke("CreateCollisionGroup", v59);
                return ;
            else
                v57.props.OnAttemptModifyInPlayMode();
                return ;
            end;
        end, 
        OnGroupDeleted = function()
            for _, v61 in pairs(v57.state.Groups) do
                if v61.Id == v57.state.UISelectedGroupId then
                    v61.OnDeleted();
                    return ;
                end;
            end;
        end, 
        OnGroupRenamed = function()
            for _, v63 in pairs(v57.state.Groups) do
                if v63.Id == v57.state.UISelectedGroupId then
                    v63.OnRenamed();
                    return ;
                end;
            end;
        end
    });
end;
v7.didMount = function(v64)
    v64:setState({
        plugin = v64.props.Plugin:get()
    });
    v64.setStateAndRefreshConnection = v64.props.plugin:OnInvoke("SetStateAndRefresh", function(v65)
        if v65 == nil then
            v65 = {};
        end;
        v64:setStateAndRefresh(v65);
    end);
    v64.setStateAndRefreshConnection.Name = "setStateAndRefresh";
end;
v7.willUnmount = function(v66)
    v66.setStateAndRefreshConnection:Disconnect();
end;
return (l_ContextServices_0.withContext({
    Plugin = l_ContextServices_0.Plugin, 
    Stylizer = l_ContextServices_0.Stylizer, 
    Localization = l_ContextServices_0.Localization, 
    Mouse = l_ContextServices_0.Mouse
})(v7));
