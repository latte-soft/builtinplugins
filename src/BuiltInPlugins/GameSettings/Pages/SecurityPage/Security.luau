local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Roact);
local v2 = require(l_Parent_0.Packages.RoactRodux);
local v3 = require(l_Parent_0.Packages.Framework);
local l_ContextServices_0 = v3.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_TextLabel_0 = v3.UI.TextLabel;
local l_LayoutOrderIterator_0 = v3.Util.LayoutOrderIterator;
local v8 = require(l_Parent_0.Src.Components.ToggleButtonWithTitle);
local v9 = require(l_Parent_0.Src.Actions.AddChange);
local v10 = require(l_Parent_0.Src.Components.SettingsPages.SettingsPage);
local v11 = require(l_Parent_0.Src.Util.Analytics);
local v12 = require(script.Parent.Components.Secrets);
local l_Name_0 = script.Name;
local function v25(v14, v15)
    local v16 = v14:getState();
    local l_game_0 = v16.Metadata.game;
    local l_gameId_0 = v16.Metadata.gameId;
    local l_universePermissionsController_0 = v15.universePermissionsController;
    return {
        function(v20)
            v20.HttpEnabled = l_universePermissionsController_0:GetHttpEnabled(l_game_0);
        end, 
        function(v21)
            v21.StudioAccessToApisAllowed = l_universePermissionsController_0:GetStudioAccessToApisAllowed(l_gameId_0);
        end, 
        function(v22)
            v22.ThirdPartyPurchaseAllowed = l_universePermissionsController_0:GetThirdPartyPurchasesAllowed(l_gameId_0);
        end, 
        function(v23)
            v23.ThirdPartyTeleportAllowed = l_universePermissionsController_0:GetThirdPartyTeleportsAllowed(l_gameId_0);
        end, 
        function(v24)
            v24.Secrets = l_universePermissionsController_0:GetSecrets();
        end or nil
    };
end;
local function _(v26, v27, v28)
    return function()
        local v29 = v26.Settings.Changed[v27];
        if v29 ~= nil then
            v11.onSecuritySettingChange(v27, v29);
            v28(v29);
        end;
    end;
end;
local function v62(v31, v32)
    local v33 = v31:getState();
    local l_gameId_1 = v33.Metadata.gameId;
    local l_universePermissionsController_1 = v32.universePermissionsController;
    local v36 = {};
    local function v38(v37)
        l_universePermissionsController_1:SetHttpEnabled(game, v37);
    end;
    local v39 = "HttpEnabled";
    local l_v39_0 = v39 --[[ copy: 8 -> 13 ]];
    local l_v38_0 = v38 --[[ copy: 7 -> 14 ]];
    local function v43()
        local v42 = v33.Settings.Changed[l_v39_0];
        if v42 ~= nil then
            v11.onSecuritySettingChange(l_v39_0, v42);
            l_v38_0(v42);
        end;
    end;
    local function v45(v44)
        l_universePermissionsController_1:SetSecrets(v44);
    end;
    local v46 = "Secrets";
    local l_v46_0 = v46 --[[ copy: 10 -> 15 ]];
    local l_v45_0 = v45 --[[ copy: 9 -> 16 ]];
    v38 = function()
        local v49 = v33.Settings.Changed[l_v46_0];
        if v49 ~= nil then
            v11.onSecuritySettingChange(l_v46_0, v49);
            l_v45_0(v49);
        end;
    end or nil;
    v45 = function(v50)
        l_universePermissionsController_1:SetStudioAccessToApisAllowed(l_gameId_1, v50);
    end;
    v46 = "StudioAccessToApisAllowed";
    local l_v46_1 = v46 --[[ copy: 10 -> 17 ]];
    local l_v45_1 = v45 --[[ copy: 9 -> 18 ]];
    v39 = function()
        local v53 = v33.Settings.Changed[l_v46_1];
        if v53 ~= nil then
            v11.onSecuritySettingChange(l_v46_1, v53);
            l_v45_1(v53);
        end;
    end;
    v46 = function(v54)
        l_universePermissionsController_1:SetThirdPartyPurchasesAllowed(l_gameId_1, v54);
    end;
    local v55 = "ThirdPartyPurchaseAllowed";
    local l_v55_0 = v55 --[[ copy: 11 -> 19 ]];
    local l_v46_2 = v46 --[[ copy: 10 -> 20 ]];
    v45 = function()
        local v58 = v33.Settings.Changed[l_v55_0];
        if v58 ~= nil then
            v11.onSecuritySettingChange(l_v55_0, v58);
            l_v46_2(v58);
        end;
    end;
    v55 = function(v59)
        l_universePermissionsController_1:SetThirdPartyTeleportsAllowed(l_gameId_1, v59);
    end;
    local v60 = "ThirdPartyTeleportAllowed";
    v46 = function()
        local v61 = v33.Settings.Changed[v60];
        if v61 ~= nil then
            v11.onSecuritySettingChange(v60, v61);
            v55(v61);
        end;
    end;
    setlist { ['R005[1 to 5]'] = 'R006 to R010' };
    return v36;
end;
local function v65(v63, v64)
    return {
        HttpEnabled = v63("HttpEnabled"), 
        Secrets = v63("Secrets"), 
        StudioAccessToApisAllowed = v63("StudioAccessToApisAllowed"), 
        ThirdPartyPurchaseAllowed = v63("ThirdPartyPurchaseAllowed"), 
        ThirdPartyTeleportAllowed = v63("ThirdPartyTeleportAllowed"), 
        HttpEnabledValueChanged = v64("HttpEnabled"), 
        ThirdPartyPurchaseAllowedValueChanged = v64("ThirdPartyPurchaseAllowed"), 
        ThirdPartyTeleportAllowedValueChanged = v64("ThirdPartyTeleportAllowed")
    };
end;
local function v68(v66, _)
    return {
        HttpEnabledChanged = v66("HttpEnabled"), 
        SecretsChanged = v66("Secrets"), 
        StudioApiServicesChanged = v66("StudioAccessToApisAllowed"), 
        ThirdPartyPurchaseChanged = v66("ThirdPartyPurchaseAllowed"), 
        ThirdPartyTeleportAllowedChanged = v66("ThirdPartyTeleportAllowed")
    };
end;
local v69 = v1.PureComponent:extend(script.Name);
v69.render = function(v70)
    return v1.createElement(v10, {
        SettingsLoadJobs = v25, 
        SettingsSaveJobs = v62, 
        Title = v70.props.Localization:getText("General", "Category" .. l_Name_0), 
        PageId = l_Name_0, 
        CreateChildren = function()
            local l_props_0 = v70.props;
            local l_Localization_0 = l_props_0.Localization;
            local v73 = (not not l_props_0.HttpEnabledValueChanged and l_props_0.HttpEnabled or l_props_0.ThirdPartyPurchaseAllowedValueChanged and l_props_0.ThirdPartyPurchaseAllowed) or l_props_0.ThirdPartyTeleportAllowedValueChanged and l_props_0.ThirdPartyTeleportAllowed;
            local l_Stylizer_0 = l_props_0.Stylizer;
            local v75 = l_LayoutOrderIterator_0.new(1);
            return {
                InsecureWarning = v73 and v1.createElement("Frame", {
                    AutomaticSize = Enum.AutomaticSize.XY, 
                    BackgroundTransparency = 1, 
                    BorderSizePixel = 0, 
                    LayoutOrder = v75:getNextOrder()
                }, {
                    UILayout = v1.createElement("UIListLayout", {
                        FillDirection = Enum.FillDirection.Horizontal, 
                        Padding = UDim.new(0, l_Stylizer_0.dialog.spacing), 
                        SortOrder = Enum.SortOrder.LayoutOrder, 
                        VerticalAlignment = Enum.VerticalAlignment.Center
                    }), 
                    Warning = v1.createElement("ImageLabel", {
                        Image = l_Stylizer_0.warningIcon, 
                        LayoutOrder = v75:getNextOrder(), 
                        BackgroundTransparency = 1, 
                        Size = UDim2.new(0, l_Stylizer_0.warningDialog.icon.size, 0, l_Stylizer_0.warningDialog.icon.size)
                    }), 
                    Description = v1.createElement(l_TextLabel_0, {
                        AutomaticSize = Enum.AutomaticSize.XY, 
                        LayoutOrder = v75:getNextOrder(), 
                        Style = "SubText", 
                        Text = l_Localization_0:getText("Security", "InsecureWarning"), 
                        TextXAlignment = Enum.TextXAlignment.Left, 
                        TextColor = l_Stylizer_0.warningColor, 
                        TextSize = l_Stylizer_0.fontStyle.Subtitle.TextSize
                    })
                }), 
                HttpEnabled = v1.createElement(v8, {
                    Description = l_Localization_0:getText("General", "HttpDesc"), 
                    Disabled = l_props_0.HttpEnabled == nil, 
                    LayoutOrder = v75:getNextOrder(), 
                    OnClick = function()
                        l_props_0.HttpEnabledChanged(not l_props_0.HttpEnabled);
                    end, 
                    Selected = l_props_0.HttpEnabled, 
                    Title = l_Localization_0:getText("General", "TitleHttp")
                }), 
                Secrets = l_props_0.HttpEnabled and v1.createElement(v12, {
                    LayoutOrder = v75:getNextOrder(), 
                    Secrets = l_props_0.Secrets, 
                    OnChanged = function(v76)
                        l_props_0.SecretsChanged(v76);
                    end
                }), 
                StudioApiServicesEnabled = v1.createElement(v8, {
                    Description = l_Localization_0:getText("General", "StudioApiServicesDesc"), 
                    Disabled = l_props_0.StudioAccessToApisAllowed == nil, 
                    LayoutOrder = v75:getNextOrder(), 
                    OnClick = function()
                        l_props_0.StudioApiServicesChanged(not l_props_0.StudioAccessToApisAllowed);
                    end, 
                    Selected = l_props_0.StudioAccessToApisAllowed, 
                    Title = l_Localization_0:getText("General", "TitleStudioApiServices")
                }), 
                ThirdPartyPurchasesEnabled = v1.createElement(v8, {
                    Description = l_Localization_0:getText("Security", "EnableThirdPartyPurchasesDescription"), 
                    Disabled = l_props_0.ThirdPartyPurchaseAllowed == nil, 
                    LayoutOrder = v75:getNextOrder(), 
                    OnClick = function()
                        l_props_0.ThirdPartyPurchaseChanged(not l_props_0.ThirdPartyPurchaseAllowed);
                    end, 
                    Selected = l_props_0.ThirdPartyPurchaseAllowed, 
                    Title = l_Localization_0:getText("Security", "EnableThirdPartyPurchases")
                }), 
                ThirdPartyTeleportsEnabled = v1.createElement(v8, {
                    Description = l_Localization_0:getText("Security", "EnableThirdPartyTeleportsDescription"), 
                    Disabled = l_props_0.ThirdPartyTeleportAllowed == nil, 
                    LayoutOrder = v75:getNextOrder(), 
                    OnClick = function()
                        l_props_0.ThirdPartyTeleportAllowedChanged(not l_props_0.ThirdPartyTeleportAllowed);
                    end, 
                    Selected = l_props_0.ThirdPartyTeleportAllowed, 
                    Title = l_Localization_0:getText("Security", "EnableThirdPartyTeleports")
                })
            };
        end
    });
end;
v69 = l_withContext_0({
    Localization = l_ContextServices_0.Localization, 
    Stylizer = l_ContextServices_0.Stylizer
})(v69);
local v77 = require(l_Parent_0.Src.Networking.settingFromState);
v69 = v2.connect(function(v78, _)
    if v78 then
        return (v65(function(v80)
            return v77(v78.Settings, v80);
        end, function(v81)
            return v78.Settings.Changed[v81] ~= nil;
        end));
    else
        return ;
    end;
end, function(v82)
    return (v68(function(v83)
        return function(v84)
            v82(v9(v83, v84));
        end;
    end, v82));
end)(v69);
v69.LocalizationId = l_Name_0;
return v69;
