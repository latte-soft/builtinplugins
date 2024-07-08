local l_StudioService_0 = game:GetService("StudioService");
local l_Parent_0 = script.Parent;
local l_Parent_1 = script.Parent.Parent.Parent;
local v3 = require(l_Parent_1.Packages.Roact);
local v4 = require(l_Parent_1.Packages.Framework);
local v5 = require(l_Parent_1.Packages.RoactRodux);
local l_ContextServices_0 = v4.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_UI_0 = v4.UI;
local l_Pane_0 = l_UI_0.Pane;
local l_RadioButtonList_0 = l_UI_0.RadioButtonList;
local l_TextLabel_0 = l_UI_0.TextLabel;
local l_TitledFrame_0 = l_UI_0.TitledFrame;
local v13 = require(l_Parent_1.Src.Components.SettingsPages.SettingsPage);
local v14 = require(l_Parent_1.Src.Actions.AddChange);
local v15 = require(l_Parent_1.Src.Actions.AddWarning);
local v16 = require(l_Parent_1.Src.Actions.DiscardWarning);
local v17 = require(l_Parent_1.Src.Actions.SetCreatorId);
local v18 = require(l_Parent_1.Src.Actions.SetCreatorName);
local v19 = require(l_Parent_1.Src.Actions.SetCreatorType);
local v20 = require(l_Parent_0.Actions.SetGroupOwnerId);
local v21 = require(l_Parent_0.Actions.SetGroupOwnerName);
local v22 = require(l_Parent_1.Src.Actions.SetCreatorFriends);
local v23 = require(l_Parent_1.Src.Util.KeyProvider);
local l_getIsFriendOnlyKeyName_0 = v23.getIsFriendOnlyKeyName;
local l_getIsActiveKeyName_0 = v23.getIsActiveKeyName;
local l_getIsForSaleKeyName_0 = v23.getIsForSaleKeyName;
local l_getVipServersIsEnabledKeyName_0 = v23.getVipServersIsEnabledKeyName;
local l_Name_0 = script.Name;
local function v52(v29, v30)
    local v31 = v29:getState();
    local l_gameId_0 = v31.Metadata.gameId;
    local l_gameMetadataController_0 = v30.gameMetadataController;
    local l_groupMetadataController_0 = v30.groupMetadataController;
    local l_gamePermissionsController_0 = v30.gamePermissionsController;
    local l_socialController_0 = v30.socialController;
    local l_monetizationController_0 = v30.monetizationController;
    return {
        function(v38)
            v38[l_getIsActiveKeyName_0()] = l_gamePermissionsController_0:isActive(l_gameId_0);
        end, 
        function(v39)
            v39[l_getIsFriendOnlyKeyName_0()] = l_gamePermissionsController_0:isFriendsOnly(l_gameId_0);
        end, 
        function(_)
            v29:dispatch(v18((l_gameMetadataController_0:getCreatorName(l_gameId_0))));
        end, 
        function(_)
            v29:dispatch(v17((l_gameMetadataController_0:getCreatorId(l_gameId_0))));
        end, 
        function(_)
            local v43 = l_gameMetadataController_0:getCreatorType(l_gameId_0);
            v29:dispatch(v19(v43));
            if v43 == Enum.CreatorType.Group then
                local v44 = l_gameMetadataController_0:getCreatorId(l_gameId_0);
                local v45 = l_groupMetadataController_0:getOwnerId(v44);
                local v46 = l_groupMetadataController_0:getOwnerName(v44);
                v29:dispatch(v20(v45));
                v29:dispatch(v21(v46));
                return ;
            else
                if v43 == Enum.CreatorType.User then
                    v29:dispatch(v22((l_socialController_0:getUserFriends((l_gameMetadataController_0:getCreatorId(l_gameId_0))))));
                end;
                return ;
            end;
        end, 
        function(v47)
            local v48, v49 = l_gamePermissionsController_0:getPermissions(l_gameId_0, l_gameMetadataController_0:getCreatorName(l_gameId_0), l_gameMetadataController_0:getCreatorId(l_gameId_0), (l_gameMetadataController_0:getCreatorType(l_gameId_0)));
            v47.permissions = v48;
            v47.groupMetadata = v49;
        end, 
        function(v50)
            if v31.Settings.Current[l_getIsForSaleKeyName_0()] == nil then
                v50[l_getIsForSaleKeyName_0()] = l_monetizationController_0:getPaidAccessEnabled(l_gameId_0);
            end;
        end, 
        function(v51)
            if v31.Settings.Current[l_getVipServersIsEnabledKeyName_0()] == nil then
                v51[l_getVipServersIsEnabledKeyName_0()] = l_monetizationController_0:getVIPServersEnabled(l_gameId_0);
            end;
        end
    };
end;
local function v62(v53, v54)
    local v55 = v53:getState();
    local l_gameId_1 = v55.Metadata.gameId;
    local l_gamePermissionsController_1 = v54.gamePermissionsController;
    return {
        function()
            local l_isActive_0 = v55.Settings.Changed.isActive;
            if l_isActive_0 ~= nil then
                l_gamePermissionsController_1:setActive(l_gameId_1, l_isActive_0);
            end;
        end, 
        function()
            local l_isFriendsOnly_0 = v55.Settings.Changed.isFriendsOnly;
            if l_isFriendsOnly_0 ~= nil then
                l_gamePermissionsController_1:setFriendsOnly(l_gameId_1, l_isFriendsOnly_0);
            end;
        end, 
        function()
            local l_permissions_0 = v55.Settings.Current.permissions;
            local l_permissions_1 = v55.Settings.Changed.permissions;
            if l_permissions_1 ~= nil then
                l_gamePermissionsController_1:setPermissions(l_gameId_1, l_permissions_0, l_permissions_1);
            end;
        end
    };
end;
local function v65(v63, v64)
    return {
        IsActive = v63(l_getIsActiveKeyName_0()), 
        IsFriendsOnly = v63(l_getIsFriendOnlyKeyName_0()), 
        IsCurrentlyActive = v64.Settings.Current.isActive, 
        IsMonetized = v63(l_getIsForSaleKeyName_0()) or v63(l_getVipServersIsEnabledKeyName_0()), 
        IsInitiallyEnabled = (not v64.Settings.Current[l_getIsActiveKeyName_0()] or v64.Settings.Current[l_getIsFriendOnlyKeyName_0()]) and (v64.Settings.Current[l_getIsForSaleKeyName_0()] or v64.Settings.Current[l_getVipServersIsEnabledKeyName_0()]), 
        OwnerId = v64.GameOwnerMetadata.creatorId, 
        OwnerType = v64.GameOwnerMetadata.creatorType, 
        GroupOwnerUserId = v64.GameOwnerMetadata.groupOwnerId
    };
end;
local function v70(v66, v67)
    return {
        IsFriendsOnlyChanged = v66(l_getIsFriendOnlyKeyName_0()), 
        IsActiveChanged = function(v68, v69)
            if not v69 then
                v67(v16(l_getIsActiveKeyName_0()));
            else
                v67(v15(l_getIsActiveKeyName_0()));
            end;
            v67(v14(l_getIsActiveKeyName_0(), v68));
        end
    };
end;
local v71 = v3.PureComponent:extend(script.Name);
v71.isGroupGame = function(v72)
    return v72.props.OwnerType == Enum.CreatorType.Group;
end;
v71.isLoggedInUserGameOwner = function(v73)
    local l_l_StudioService_0_UserId_0 = l_StudioService_0:GetUserId();
    local l_props_0 = v73.props;
    local l_OwnerId_0 = l_props_0.OwnerId;
    local l_GroupOwnerUserId_0 = l_props_0.GroupOwnerUserId;
    if not v73:isGroupGame() then
        return l_l_StudioService_0_UserId_0 == l_OwnerId_0;
    else
        return l_l_StudioService_0_UserId_0 == l_GroupOwnerUserId_0;
    end;
end;
v71.render = function(v78)
    local l_Localization_0 = v78.props.Localization;
    return v3.createElement(v13, {
        SettingsLoadJobs = v52, 
        SettingsSaveJobs = v62, 
        Title = l_Localization_0:getText("General", "Category" .. l_Name_0), 
        PageId = l_Name_0, 
        CreateChildren = function()
            local l_props_1 = v78.props;
            local l_IsFriendsOnly_0 = l_props_1.IsFriendsOnly;
            local l_IsActive_0 = l_props_1.IsActive;
            local l_IsCurrentlyActive_0 = l_props_1.IsCurrentlyActive;
            local l_IsActiveChanged_0 = l_props_1.IsActiveChanged;
            local l_IsFriendsOnlyChanged_0 = l_props_1.IsFriendsOnlyChanged;
            local v86 = l_IsActive_0 and not l_IsFriendsOnly_0;
            local l_IsMonetized_0 = l_props_1.IsMonetized;
            local l_IsInitiallyEnabled_0 = l_props_1.IsInitiallyEnabled;
            local l_Stylizer_0 = l_props_1.Stylizer;
            local v90 = (v78:isLoggedInUserGameOwner() or v78:isGroupGame()) and (not v86 and l_IsInitiallyEnabled_0 or not l_IsMonetized_0);
            local v91 = {
                {
                    Description = l_Localization_0:getText("General", "PlayabilityPublicDesc"), 
                    Disabled = not v90, 
                    Key = true, 
                    Text = l_Localization_0:getText("General", "PlayabilityPublic")
                }, 
                {
                    Description = l_Localization_0:getText("General", "PlayabilityPrivateDesc"), 
                    Disabled = not v90, 
                    Key = false, 
                    Text = l_Localization_0:getText("General", "PlayabilityPrivate")
                }
            };
            if not v78:isGroupGame() then
                table.insert(v91, 1, {
                    Description = l_Localization_0:getText("General", "PlayabilityFriendsDesc"), 
                    Disabled = not v90, 
                    Key = "Friends", 
                    Text = l_Localization_0:getText("General", "PlayabilityFriends")
                });
            end;
            return {
                PlayabilityWidget = v3.createElement(l_Pane_0, {
                    AutomaticSize = Enum.AutomaticSize.Y, 
                    HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                    Layout = Enum.FillDirection.Vertical, 
                    Spacing = l_Stylizer_0.playabilityWidget.spacing
                }, {
                    TitlePane = v3.createElement(l_TitledFrame_0, {
                        LayoutOrder = 1, 
                        Title = l_Localization_0:getText("General", "TitlePlayability")
                    }, {
                        v3.createElement(l_TitledFrame_0, {
                            Title = l_Localization_0:getText("General", "PlayabilityHeader"), 
                            Style = "Subtitle"
                        }, {
                            List = v3.createElement(l_RadioButtonList_0, {
                                Buttons = v91, 
                                OnClick = function(v92)
                                    if v92 == "Friends" then
                                        l_IsFriendsOnlyChanged_0(true);
                                        l_IsActiveChanged_0(true, false);
                                        return ;
                                    else
                                        l_IsFriendsOnlyChanged_0(false);
                                        l_IsActiveChanged_0(v92, l_IsCurrentlyActive_0 and not v92);
                                        return ;
                                    end;
                                end, 
                                SelectedKey = nil, 
                                CurrentSelectedKey = if not l_IsFriendsOnly_0 then l_IsActive_0 else "Friends", 
                                TextSize = {
                                    Description = l_Stylizer_0.fontStyle.Subtext.TextSize, 
                                    MainText = l_Stylizer_0.fontStyle.Normal.TextSize
                                }
                            })
                        })
                    }), 
                    PlayabilityWarning = not v90 and v3.createElement(l_TextLabel_0, {
                        AutomaticSize = Enum.AutomaticSize.XY, 
                        LayoutOrder = 15, 
                        Style = "SubText", 
                        Text = l_Localization_0:getText("AccessPermissions", "PlayabilityWarning"), 
                        TextColor = l_Stylizer_0.warningColor, 
                        TextSize = l_Stylizer_0.fontStyle.Subtitle.TextSize, 
                        TextXAlignment = Enum.TextXAlignment.Left
                    })
                })
            };
        end
    });
end;
v71 = l_withContext_0({
    Localization = l_ContextServices_0.Localization, 
    Stylizer = l_ContextServices_0.Stylizer
})(v71);
local v93 = require(l_Parent_1.Src.Networking.settingFromState);
v71 = v5.connect(function(v94, _)
    if v94 then
        return (v65(function(v96)
            return v93(v94.Settings, v96);
        end, v94));
    else
        return ;
    end;
end, function(v97)
    return (v70(function(v98)
        return function(v99)
            v97(v14(v98, v99));
        end;
    end, v97));
end)(v71);
v71.LocalizationId = l_Name_0;
return v71;
