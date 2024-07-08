local l_Parent_0 = script.Parent.Parent.Parent.Parent.Parent;
local l_Packages_0 = l_Parent_0.Packages;
local v2 = require(l_Packages_0.Roact);
local v3 = require(l_Packages_0.Cryo);
local v4 = require(l_Packages_0.Framework);
local l_Util_0 = l_Parent_0.Core.Util;
local v6 = require(l_Util_0.Urls);
local v7 = require(l_Util_0.Images);
local v8 = require(l_Util_0.AssetConfigConstants);
local l_ContextServices_0 = v4.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_Permissions_0 = l_Parent_0.Core.Components.AssetConfiguration.Permissions;
local v12 = require(l_Permissions_0.CollaboratorItem);
local v13 = require(l_Permissions_0.PermissionsConstants);
local l_ExpandablePane_0 = require(l_Packages_0.Framework).UI.ExpandablePane;
local v15 = require(l_Packages_0.Framework).Util.Spritesheet(v7.ARROW_SPRITESHEET, {
    SpriteSize = 12, 
    NumSprites = 4
});
local v16 = v15[2];
local v17 = v15[3];
local function _(v18, v19)
    if v18.Permissions[v13.RoleSubjectKey] then
        local v20 = v18.Permissions[v13.RoleSubjectKey];
        if v20[v19.Id] then
            return v20[v19.Id][v13.PermissionLevelKey] or v13.AssetPermissionLevel;
        else
            return v13.AssetPermissionLevel;
        end;
    else
        return v13.AssetPermissionLevel;
    end;
end;
local function _(v22, v23)
    if v22.Permissions[v13.RoleSubjectKey] then
        if v22.Permissions[v13.RoleSubjectKey][v23.Id] then
            return v22.Permissions[v13.RoleSubjectKey][v23.Id][v13.ActionKey];
        else
            return v13.NoAccessKey;
        end;
    else
        return v13.NoneKey;
    end;
end;
local _ = function(v25, v26)
    for _, v28 in pairs(v26) do
        if v28.Key == v25 then
            return false;
        end;
    end;
    return true;
end;
local v30 = v2.PureComponent:extend("GroupCollaboratorItem");
v30.init = function(v31)
    v31.state = {
        expanded = false, 
        hovered = false
    };
    v31.onClick = function()
        if v31.props.Enabled then
            v31:setState({
                expanded = not v31.state.expanded
            });
            return ;
        else
            return ;
        end;
    end;
    v31.getLabelForAction = function(v32)
        local l_props_0 = v31.props;
        if v32 == v13.NoAccessKey then
            return l_props_0.Localization:getText("AssetConfigPackagePermissions", "NoAccessLabel");
        elseif v32 == v13.UseViewKey then
            return l_props_0.Localization:getText("AssetConfigPackagePermissions", "UseViewLabel");
        elseif v32 == v13.EditKey then
            return l_props_0.Localization:getText("AssetConfigPackagePermissions", "EditLabel");
        elseif v32 == v13.NoneKey then
            return "";
        else
            error("Unsupported Action: " .. tostring(v32));
            return "";
        end;
    end;
    v31.getRolesetItems = function()
        local l_props_1 = v31.props;
        if next(l_props_1.Items) == nil then
            return {};
        else
            return (v3.List.join({
                v3.Dictionary.join({
                    Key = v13.NoAccessKey, 
                    Display = l_props_1.Localization:getText("AssetConfigPackagePermissions", "NoAccessLabel"), 
                    Description = l_props_1.Localization:getText("AssetConfigPackagePermissions", "NoAccessDescription")
                })
            }, l_props_1.Items));
        end;
    end;
end;
v30.render = function(v35)
    local l_props_2 = v35.props;
    local v37 = {
        UIListLayout = v2.createElement("UIListLayout", {
            SortOrder = Enum.SortOrder.LayoutOrder
        })
    };
    local v38 = false;
    local v39 = false;
    local l_LayoutOrder_0 = l_props_2.LayoutOrder;
    local v41 = not not v35.props.GroupData and v35.props.GroupData.Roles or {};
    table.sort(v41, function(v42, v43)
        return v43.Rank < v42.Rank;
    end);
    local v44 = v35.getRolesetItems();
    local v45 = not l_props_2.Enabled and 0 or 16;
    for v46, v47 in pairs(v41) do
        local v48 = if l_props_2.Permissions[v13.RoleSubjectKey] then if l_props_2.Permissions[v13.RoleSubjectKey][v47.Id] then l_props_2.Permissions[v13.RoleSubjectKey][v47.Id][v13.ActionKey] else v13.NoAccessKey else v13.NoneKey;
        if v46 == 1 then
            v39 = v48;
        end;
        local l_Enabled_0 = l_props_2.Enabled;
        if v47.Name == "Owner" then
            l_Enabled_0 = false;
        end;
        local v50 = nil;
        local l_l_Enabled_0_0 = l_Enabled_0;
        if l_l_Enabled_0_0 then
            local v52;
            if l_props_2.Permissions[v13.RoleSubjectKey] then
                local v53 = l_props_2.Permissions[v13.RoleSubjectKey];
                v52 = if v53[v47.Id] then v53[v47.Id][v13.PermissionLevelKey] or v13.AssetPermissionLevel else v13.AssetPermissionLevel;
            else
                v52 = v13.AssetPermissionLevel;
            end;
            l_l_Enabled_0_0 = v52 == v13.AssetPermissionLevel;
        end;
        l_Enabled_0 = l_l_Enabled_0_0;
        v50 = if l_Enabled_0 then nil else l_props_2.Localization:getText("AssetConfigPackagePermissions", "LockedGroup", {
            roleName = v47.Name
        });
        for _, v55 in pairs(v44) do
            if v55.Key == v48 then
                l_l_Enabled_0_0 = false;
                goto label0 --[[  true, false  ]];
            end;
        end;
        l_l_Enabled_0_0 = true;
        ::label0::;
        v39 = v39 == v48 and (v39 or false);
        v38 = (l_l_Enabled_0_0 or v47.LockedTo) and true or v38;
        v37["Roleset" .. v46] = v2.createElement("Frame", {
            BackgroundTransparency = 1, 
            LayoutOrder = v46, 
            Size = UDim2.new(1, 0, 0, 60)
        }, {
            v2.createElement("Frame", {
                BackgroundTransparency = 1, 
                Position = UDim2.new(0, v45, 0, 0), 
                Size = UDim2.new(1, -v45, 0, 1)
            }, {
                v2.createElement(v12, {
                    Enabled = l_Enabled_0, 
                    CollaboratorName = v47.Name, 
                    CollaboratorId = v47.Id, 
                    CollaboratorIcon = nil, 
                    Action = v47.LockedTo or v35.getLabelForAction(v48), 
                    Items = (l_l_Enabled_0_0 or v47.LockedTo) and {} or v44, 
                    SelectedItem = v48, 
                    HideLastSeparator = v46 ~= #v41, 
                    Removable = false, 
                    PermissionChanged = function(v56)
                        if l_props_2.RolePermissionChanged then
                            l_props_2.RolePermissionChanged(v47.Id, v56);
                        end;
                    end, 
                    TooltipText = v50
                })
            })
        });
    end;
    if not (v35.state.expanded and v17) then
        local _ = v16;
    end;
    return v2.createElement(l_ExpandablePane_0, {
        AutomaticSize = Enum.AutomaticSize.XY, 
        Expanded = l_props_2.Enabled and v35.state.expanded, 
        LayoutOrder = l_LayoutOrder_0, 
        OnExpandedChanged = v35.onClick, 
        HeaderComponent = not not l_props_2.GroupData and v12 or nil, 
        HeaderComponentProps = {
            Enabled = false, 
            SubjectType = Enum.CreatorType.Group, 
            CollaboratorName = l_props_2.GroupData.Name, 
            CollaboratorId = l_props_2.GroupData.Id, 
            CollaboratorIcon = v6.constructRBXThumbUrl(v8.rbxThumbTypes.GroupIcon, l_props_2.GroupData.Id, v8.rbxThumbSizes.GroupIconImageSize), 
            UseMask = false, 
            Action = if not v39 then l_props_2.Localization:getText("AssetConfigPackagePermissions", "MultipleLabel") else v35.getLabelForAction(v39), 
            Items = not not v38 and {} or l_props_2.Items, 
            SecondaryText = l_props_2.SecondaryText, 
            Removable = l_props_2.Removable or false, 
            Removed = l_props_2.Removed, 
            IsLoading = #v41 == 0, 
            TooltipText = l_props_2.Localization:getText("AssetConfigPackagePermissions", "GroupOwnedTooltip") .. " " .. (v39 and "" or l_props_2.Localization:getText("AssetConfigPackagePermissions", "MultipleLabelTooltip"))
        }
    }, v37);
end;
return (l_withContext_0({
    Localization = l_ContextServices_0.Localization
})(v30));
