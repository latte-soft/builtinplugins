local l_Parent_0 = script.Parent.Parent.Parent.Parent.Parent;
local l_Packages_0 = l_Parent_0.Packages;
local v2 = require(l_Packages_0.Roact);
local l_Util_0 = l_Parent_0.Core.Util;
local v4 = require(l_Util_0.AssetConfigConstants);
local v5 = require(l_Util_0.Urls);
local v6 = require(l_Util_0.Constants);
local l_ContextServices_0 = require(l_Packages_0.Framework).ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_Permissions_0 = l_Parent_0.Core.Components.AssetConfiguration.Permissions;
local v10 = require(l_Permissions_0.PermissionsConstants);
local v11 = require(l_Permissions_0.CollaboratorItem);
local l_Separator_0 = require(l_Packages_0.Framework).UI.Separator;
local l_deepJoin_0 = require(l_Packages_0.Framework).Util.deepJoin;
local _ = function(v14, v15)
    for _, v17 in pairs(v15) do
        if v17.Key == v14 then
            return false;
        end;
    end;
    return true;
end;
local v19 = v2.PureComponent:extend("CollaboratorsWidget");
v19.init = function(v20)
    v20.userPermissionChanged = function(v21, v22)
        local l_props_0 = v20.props;
        l_props_0.PermissionsChanged((l_deepJoin_0(l_props_0.Permissions, {
            [v10.UserSubjectKey] = {
                [v21] = {
                    [v10.ActionKey] = v22
                }
            }
        })));
    end;
    v20.userRemoved = function(v24)
        local l_props_1 = v20.props;
        l_props_1.PermissionsChanged((l_deepJoin_0(l_props_1.Permissions, {
            [v10.UserSubjectKey] = {
                [v24] = {
                    [v10.ActionKey] = v10.NoAccessKey
                }
            }
        })));
    end;
    v20.getUserCollaboratorPermissions = function()
        local l_props_2 = v20.props;
        if l_props_2.CanManage then
            return {
                {
                    Key = v10.UseViewKey, 
                    Display = l_props_2.Localization:getText("AssetConfigPackagePermissions", "UseViewLabel"), 
                    Description = l_props_2.Localization:getText("AssetConfigPackagePermissions", "UseViewDescription")
                }, 
                {
                    Key = v10.EditKey, 
                    Display = l_props_2.Localization:getText("AssetConfigPackagePermissions", "EditLabel"), 
                    Description = l_props_2.Localization:getText("AssetConfigPackagePermissions", "EditDescription")
                }
            };
        else
            return {};
        end;
    end;
    v20.getLabelForAction = function(v27)
        local l_props_3 = v20.props;
        if v27 == v10.NoAccessKey then
            return l_props_3.Localization:getText("AssetConfigPackagePermissions", "NoAccessLabel");
        elseif v27 == v10.UseViewKey then
            return l_props_3.Localization:getText("AssetConfigPackagePermissions", "UseViewLabel");
        elseif v27 == v10.EditKey then
            return l_props_3.Localization:getText("AssetConfigPackagePermissions", "EditLabel");
        elseif v27 == v10.NoneKey then
            return "";
        else
            error("Unsupported Action: " .. tostring(v27));
            return "";
        end;
    end;
end;
v19.render = function(v29)
    local l_props_4 = v29.props;
    local l_Stylizer_0 = v29.props.Stylizer;
    local v32 = {};
    if l_props_4.Permissions[v10.UserSubjectKey] then
        for v33, v34 in pairs(l_props_4.Permissions[v10.UserSubjectKey]) do
            if not (l_props_4.OwnerType == Enum.CreatorType.User) or l_props_4.OwnerId ~= v33 and v34[v10.ActionKey] ~= v10.NoAccessKey then
                table.insert(v32, {
                    Name = v34[v10.SubjectNameKey], 
                    Id = v34[v10.SubjectIdKey], 
                    Action = v34[v10.ActionKey]
                });
            end;
        end;
        table.sort(v32, function(v35, v36)
            return v35.Name < v36.Name;
        end);
    end;
    local v37 = {
        UIListLayout = v2.createElement("UIListLayout", {
            SortOrder = Enum.SortOrder.LayoutOrder
        })
    };
    local v38 = v29.getUserCollaboratorPermissions();
    for v39, v40 in pairs(v32) do
        local v41 = v39 ~= #v32;
        local l_Action_0 = v40.Action;
        local v43;
        for _, v45 in pairs(v38) do
            if v45.Key == l_Action_0 then
                v43 = false;
                goto label0 --[[  true, false  ]];
            end;
        end;
        v43 = true;
        ::label0::;
        v37["User" .. v39] = v2.createElement("Frame", {
            BackgroundTransparency = 1, 
            Size = UDim2.new(1, 0, 0, 70), 
            LayoutOrder = v39
        }, {
            FirstSeparator = v2.createElement(l_Separator_0, {
                Position = UDim2.new(0.5, 0, 0, 0)
            }), 
            CollaboratorItem = v2.createElement(v11, {
                Enabled = l_props_4.Enabled, 
                SubjectType = Enum.CreatorType.User, 
                CollaboratorName = v40.Name, 
                CollaboratorId = v40.Id, 
                CollaboratorIcon = v5.constructRBXThumbUrl(v4.rbxThumbTypes.AvatarHeadShot, v40.Id, v4.rbxThumbSizes.AvatarHeadshotImageSize), 
                UseMask = true, 
                Items = not not v43 and {} or v38, 
                Action = v29.getLabelForAction(v40.Action), 
                SelectedItem = v40.Action, 
                Removable = true, 
                Removed = function()
                    v29.userRemoved(v40.Id);
                end, 
                PermissionChanged = function(v46)
                    v29.userPermissionChanged(v40.Id, v46);
                end, 
                HideLastSeparator = v39 ~= #v32
            }), 
            LastSeparator = not v41 and v2.createElement(l_Separator_0, {
                Position = UDim2.new(0.5, 0, 1, -1)
            })
        });
    end;
    return v2.createElement("Frame", {
        AutomaticSize = Enum.AutomaticSize.Y, 
        LayoutOrder = l_props_4.LayoutOrder or 0, 
        BackgroundTransparency = 1, 
        Size = UDim2.new(1, 0, 0, 0)
    }, {
        UIListLayout = v2.createElement("UIListLayout", {
            SortOrder = Enum.SortOrder.LayoutOrder, 
            Padding = UDim.new(0, 32)
        }), 
        Padding = v2.createElement("UIPadding", {
            PaddingLeft = UDim.new(0, v6.PERMISSIONS_UI_EDGE_PADDING)
        }), 
        UsersTitle = v2.createElement("TextLabel", {
            AutomaticSize = Enum.AutomaticSize.XY, 
            LayoutOrder = 0, 
            Font = v6.FONT, 
            Text = l_props_4.Localization:getText("AssetConfigPackagePermissions", "UsersCollaboratorType"), 
            TextSize = v6.FONT_SIZE_TITLE, 
            TextColor3 = l_Stylizer_0.assetConfig.packagePermissions.subTextColor, 
            TextXAlignment = Enum.TextXAlignment.Left, 
            Visible = #v32 > 0, 
            BackgroundTransparency = 1
        }), 
        Users = v2.createElement("Frame", {
            AutomaticSize = Enum.AutomaticSize.XY, 
            LayoutOrder = 1, 
            BackgroundTransparency = 1, 
            Size = UDim2.new(1, 0, 0, 0)
        }, v37)
    });
end;
return (l_withContext_0({
    Stylizer = l_ContextServices_0.Stylizer, 
    Localization = l_ContextServices_0.Localization
})(v19));
