local l_StudioService_0 = game:GetService("StudioService");
local l_Parent_0 = script.Parent;
local l_Parent_1 = script.Parent.Parent.Parent;
local v3 = require(l_Parent_1.Packages.Roact);
local v4 = require(l_Parent_1.Packages.RoactRodux);
local l_ContextServices_0 = require(l_Parent_1.Packages.Framework).ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local v7 = require(l_Parent_1.Src.Util.Thread);
local v8 = require(l_Parent_1.Src.Actions.AddChange);
local v9 = require(l_Parent_1.Src.Actions.AddWarning);
local v10 = require(l_Parent_1.Src.Actions.DiscardWarning);
local v11 = require(l_Parent_0.Actions.SettingsSaveScaleBoundaries);
local v12 = require(l_Parent_1.Src.Util.AssetOverrides);
local v13 = require(l_Parent_1.Src.Actions.AddErrors);
local v14 = require(l_Parent_0.Components.RootPanelExternal);
local v15 = require(l_Parent_1.Src.Components.SettingsPages.SettingsPage);
local v16 = require(l_Parent_1.Src.Components.SettingsPages.InsufficientPermissionsPage);
local l_Name_0 = script.Name;
local function v58(v18, v19)
    local l_game_0 = v18:getState().Metadata.game;
    local l_universeAvatarController_0 = v19.universeAvatarController;
    return {
        function(v22)
            local v23 = l_universeAvatarController_0:getAvatarType(l_game_0);
            local _ = nil;
            v22.universeAvatarType = v23 == Enum.GameAvatarType.R6 and "MorphToR6" or (v23 == Enum.GameAvatarType.R15 and "MorphToR15" or "PlayerChoice");
        end, 
        function(v25)
            v25.universeAnimationType = l_universeAvatarController_0:getAnimationType(l_game_0);
        end, 
        function(v26)
            v26.universeCollisionType = l_universeAvatarController_0:getCollisionType(l_game_0).Name;
        end, 
        function(v27)
            local v28 = {};
            local v29 = {};
            local v35 = {
                v7.new(function()
                    local v30 = l_universeAvatarController_0:getHeightRange(l_game_0);
                    v28.height = v30.Min;
                    v29.height = v30.Max;
                end), 
                v7.new(function()
                    local v31 = l_universeAvatarController_0:getWidthRange(l_game_0);
                    v28.width = v31.Min;
                    v29.width = v31.Max;
                end), 
                v7.new(function()
                    local v32 = l_universeAvatarController_0:getHeadScaleRange(l_game_0);
                    v28.head = v32.Min;
                    v29.head = v32.Max;
                end), 
                v7.new(function()
                    local v33 = l_universeAvatarController_0:getBodyTypeRange(l_game_0);
                    v28.bodyType = v33.Min;
                    v29.bodyType = v33.Max;
                end), 
                v7.new(function()
                    local v34 = l_universeAvatarController_0:getProportionsRange(l_game_0);
                    v28.proportion = v34.Min;
                    v29.proportion = v34.Max;
                end)
            };
            for _, v37 in ipairs(v35) do
                v37:start();
            end;
            for _, v39 in ipairs(v35) do
                v39:join();
            end;
            v27.universeAvatarMinScales = v28;
            v27.universeAvatarMaxScales = v29;
        end, 
        function(v40)
            v40.universeAvatarAssetOverrides = l_universeAvatarController_0:getAssetOverrides(l_game_0);
        end, 
        function(_)
            local v42 = {};
            local v53 = {
                v7.new(function()
                    local v43, v44 = l_universeAvatarController_0:getHeightRules();
                    v42.height = {
                        min = v43.Min, 
                        max = v43.Max, 
                        increment = v44
                    };
                end), 
                v7.new(function()
                    local v45, v46 = l_universeAvatarController_0:getWidthRules();
                    v42.width = {
                        min = v45.Min, 
                        max = v45.Max, 
                        increment = v46
                    };
                end), 
                v7.new(function()
                    local v47, v48 = l_universeAvatarController_0:getHeadScaleRules();
                    v42.head = {
                        min = v47.Min, 
                        max = v47.Max, 
                        increment = v48
                    };
                end), 
                v7.new(function()
                    local v49, v50 = l_universeAvatarController_0:getBodyTypeRules();
                    v42.bodyType = {
                        min = v49.Min, 
                        max = v49.Max, 
                        increment = v50
                    };
                end), 
                v7.new(function()
                    local v51, v52 = l_universeAvatarController_0:getProportionsRules();
                    v42.proportion = {
                        min = v51.Min, 
                        max = v51.Max, 
                        increment = v52
                    };
                end)
            };
            for _, v55 in ipairs(v53) do
                v55:start();
            end;
            for _, v57 in ipairs(v53) do
                v57:join();
            end;
            v18:dispatch(v11({
                scales = v42
            }));
        end
    };
end;
local function v76(v59, v60)
    local v61 = v59:getState();
    local l_game_1 = v61.Metadata.game;
    local l_universeAvatarController_1 = v60.universeAvatarController;
    return {
        function()
            local l_universeAvatarType_0 = v61.Settings.Changed.universeAvatarType;
            if l_universeAvatarType_0 ~= nil then
                local _ = nil;
                l_universeAvatarController_1:setAvatarType(l_game_1, if l_universeAvatarType_0 == "MorphToR6" then Enum.GameAvatarType.R6 else if l_universeAvatarType_0 == "MorphToR15" then Enum.GameAvatarType.R15 else Enum.GameAvatarType.PlayerChoice);
            end;
        end, 
        function()
            local l_universeAnimationType_0 = v61.Settings.Changed.universeAnimationType;
            if l_universeAnimationType_0 ~= nil then
                l_universeAvatarController_1:setAnimationType(l_game_1, l_universeAnimationType_0);
            end;
        end, 
        function()
            local l_universeCollisionType_0 = v61.Settings.Changed.universeCollisionType;
            if l_universeCollisionType_0 ~= nil then
                l_universeAvatarController_1:setCollisionType(l_game_1, Enum.R15CollisionType[l_universeCollisionType_0]);
            end;
        end, 
        function()
            local l_universeAvatarAssetOverrides_0 = v61.Settings.Changed.universeAvatarAssetOverrides;
            if l_universeAvatarAssetOverrides_0 ~= nil then
                l_universeAvatarController_1:setAssetOverrides(l_game_1, l_universeAvatarAssetOverrides_0);
            end;
        end, 
        function()
            local l_universeAvatarMinScales_0 = v61.Settings.Changed.universeAvatarMinScales;
            local l_universeAvatarMaxScales_0 = v61.Settings.Changed.universeAvatarMaxScales;
            if not (l_universeAvatarMinScales_0 == nil) or l_universeAvatarMaxScales_0 ~= nil then
                l_universeAvatarMinScales_0 = l_universeAvatarMinScales_0 or v61.Settings.Current.universeAvatarMinScales;
                l_universeAvatarMaxScales_0 = l_universeAvatarMaxScales_0 or v61.Settings.Current.universeAvatarMaxScales;
                local v71 = {
                    v7.new(function()
                        l_universeAvatarController_1:setHeightRange(l_game_1, NumberRange.new(l_universeAvatarMinScales_0.height, l_universeAvatarMaxScales_0.height));
                    end), 
                    v7.new(function()
                        l_universeAvatarController_1:setWidthRange(l_game_1, NumberRange.new(l_universeAvatarMinScales_0.width, l_universeAvatarMaxScales_0.width));
                    end), 
                    v7.new(function()
                        l_universeAvatarController_1:setHeadScaleRange(l_game_1, NumberRange.new(l_universeAvatarMinScales_0.head, l_universeAvatarMaxScales_0.head));
                    end), 
                    v7.new(function()
                        l_universeAvatarController_1:setBodyTypeRange(l_game_1, NumberRange.new(l_universeAvatarMinScales_0.bodyType, l_universeAvatarMaxScales_0.bodyType));
                    end), 
                    v7.new(function()
                        l_universeAvatarController_1:setProportionsRange(l_game_1, NumberRange.new(l_universeAvatarMinScales_0.proportion, l_universeAvatarMaxScales_0.proportion));
                    end)
                };
                for _, v73 in ipairs(v71) do
                    v73:start();
                end;
                for _, v75 in ipairs(v71) do
                    v75:join();
                end;
            end;
        end
    };
end;
local function v79(v77, v78)
    return {
        AvatarType = v77("universeAvatarType"), 
        AvatarAnimation = v77("universeAnimationType"), 
        AvatarCollision = v77("universeCollisionType"), 
        AvatarAssetOverrides = v77("universeAvatarAssetOverrides"), 
        AvatarScalingMin = v77("universeAvatarMinScales"), 
        AvatarScalingMax = v77("universeAvatarMaxScales"), 
        CurrentAvatarType = v78.Settings.Current.universeAvatarType, 
        AssetOverrideErrors = v78.Settings.Errors.universeAvatarAssetOverrides, 
        OwnerId = v78.GameOwnerMetadata.creatorId, 
        OwnerType = v78.GameOwnerMetadata.creatorType
    };
end;
local function v87(v80, v81)
    return {
        AvatarAnimationChanged = v80("universeAnimationType"), 
        AvatarCollisionChanged = v80("universeCollisionType"), 
        AvatarScalingMinChanged = v80("universeAvatarMinScales"), 
        AvatarScalingMaxChanged = v80("universeAvatarMaxScales"), 
        AvatarTypeChanged = function(v82, v83)
            if not v83 then
                v81(v10("universeAvatarType"));
            else
                v81(v9("universeAvatarType"));
            end;
            v81(v8("universeAvatarType", v82));
        end, 
        AvatarAssetOverridesChanged = function(v84)
            v81(v8("universeAvatarAssetOverrides", v84));
            local v85 = v12.getErrors(v84);
            if v85 then
                v81(v13({
                    universeAvatarAssetOverrides = v85
                }));
            end;
        end, 
        SaveScaleBoundaries = function(v86)
            v81(v11({
                scales = v86
            }));
        end
    };
end;
local _ = function(_)
    return game.GameId ~= 0;
end;
local function _(v90, v91)
    local v92 = false;
    if v90 ~= "PlayerChoice" then
        v92 = v91 ~= v90;
    end;
    return v92;
end;
local v94 = v3.PureComponent:extend(script.Name);
v94.hasPermissionToEdit = function(v95)
    local l_props_0 = v95.props;
    local l_OwnerId_0 = l_props_0.OwnerId;
    local l_OwnerType_0 = l_props_0.OwnerType;
    local v99 = true;
    if l_OwnerType_0 ~= Enum.CreatorType.Group then
        v99 = l_OwnerId_0 == l_StudioService_0:GetUserId();
    end;
    return v99;
end;
v94.createChildren = function(v100)
    local l_props_1 = v100.props;
    local l_Stylizer_0 = l_props_1.Stylizer;
    local l_Mouse_0 = l_props_1.Mouse;
    local v104 = {};
    local l_createElement_0 = v3.createElement;
    local l_v14_0 = v14;
    local v107 = {
        ThemeData = l_Stylizer_0, 
        IsEnabled = true
    };
    local l_CurrentAvatarType_0 = l_props_1.CurrentAvatarType;
    local l_AvatarType_0 = l_props_1.AvatarType;
    local v110 = false;
    if l_CurrentAvatarType_0 ~= "PlayerChoice" then
        v110 = l_AvatarType_0 ~= l_CurrentAvatarType_0;
    end;
    v107.IsGameShutdownRequired = v110;
    v107.AssetOverrideErrors = l_props_1.AssetOverrideErrors;
    v107.Mouse = l_Mouse_0:get();
    v107.IsPlacePublished = game.GameId ~= 0;
    v107.AvatarType = l_props_1.AvatarType;
    v107.AvatarAnimation = l_props_1.AvatarAnimation;
    v107.AvatarCollision = l_props_1.AvatarCollision;
    v107.AvatarAssetOverrides = l_props_1.AvatarAssetOverrides;
    v107.AvatarScalingMin = l_props_1.AvatarScalingMin;
    v107.AvatarScalingMax = l_props_1.AvatarScalingMax;
    v107.OnAvatarTypeChanged = function(v111)
        local l_l_props_1_0 = l_props_1;
        if not (game.GameId ~= 0) then
            l_props_1.AvatarTypeChanged(v111);
            return ;
        else
            l_l_props_1_0 = l_props_1.CurrentAvatarType;
            local v113 = false;
            if l_l_props_1_0 ~= "PlayerChoice" then
                v113 = v111 ~= l_l_props_1_0;
            end;
            l_props_1.AvatarTypeChanged(v111, v113);
            return ;
        end;
    end;
    v107.OnAvatarAnimationChanged = l_props_1.AvatarAnimationChanged;
    v107.OnAvatarCollisionChanged = l_props_1.AvatarCollisionChanged;
    v107.OnAvatarAssetOverridesChanged = l_props_1.AvatarAssetOverridesChanged;
    v107.OnAvatarScalingMinChanged = l_props_1.AvatarScalingMinChanged;
    v107.OnAvatarScalingMaxChanged = l_props_1.AvatarScalingMaxChanged;
    v104.Morpher = l_createElement_0(l_v14_0, v107);
    return v104;
end;
v94.render = function(v114)
    local l_Localization_0 = v114.props.Localization;
    if v114:hasPermissionToEdit() then
        return v3.createElement(v15, {
            SettingsLoadJobs = v58, 
            SettingsSaveJobs = v76, 
            Title = l_Localization_0:getText("General", "Category" .. l_Name_0), 
            PageId = l_Name_0, 
            CreateChildren = function()
                return v114:createChildren();
            end
        });
    else
        return v3.createElement(v16);
    end;
end;
v94 = l_withContext_0({
    Localization = l_ContextServices_0.Localization, 
    Stylizer = l_ContextServices_0.Stylizer, 
    Mouse = l_ContextServices_0.Mouse
})(v94);
local v116 = require(l_Parent_1.Src.Networking.settingFromState);
v94 = v4.connect(function(v117, _)
    if v117 then
        return (v79(function(v119)
            return v116(v117.Settings, v119);
        end, v117));
    else
        return ;
    end;
end, function(v120)
    return (v87(function(v121)
        return function(v122)
            v120(v8(v121, v122));
        end;
    end, v120));
end)(v94);
v94.LocalizationId = l_Name_0;
return v94;
