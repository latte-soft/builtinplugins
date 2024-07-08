local v0 = game:DefineFastInt("MaxNameLength", 50);
local v1 = game:DefineFastInt("PaidAccessMinPrice", 25);
local v2 = game:DefineFastInt("PaidAccessMaxPrice", 1000);
local v3 = game:DefineFastInt("PrivateServersMinPrice", 10);
local v4 = game:DefineFastInt("DevProductsMinPrice", 1);
local v5 = game:DefineFastInt("DevProductsMaxPrice", 1000000000);
local v6 = game:DefineFastInt("DeveloperSubscriptionsMaxRobuxPrice", 2000);
local l_Parent_0 = script.Parent;
local l_Parent_1 = script.Parent.Parent.Parent;
local v9 = require(l_Parent_1.Packages.Roact);
local v10 = require(l_Parent_1.Packages.RoactRodux);
local v11 = require(l_Parent_1.Packages.Cryo);
local v12 = require(l_Parent_1.Packages.Framework);
local l_Util_0 = v12.Util;
local l_ContextServices_0 = v12.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local v16 = require(l_Parent_1.Src.Components.Header);
local v17 = require(l_Parent_0.Components.PaidAccess);
local v18 = require(l_Parent_0.Components.VIPServers);
local v19 = require(l_Parent_0.Components.DevProducts);
local v20 = require(l_Parent_1.Src.Components.SettingsPages.SettingsPage);
local v21 = require(l_Parent_0.Components.DevSubList);
local v22 = require(l_Parent_0.Components.DevSubDetails);
local v23 = require(l_Parent_0.Components.Badges);
local l_UI_0 = v12.UI;
local l_Container_0 = l_UI_0.Container;
local l_HoverArea_0 = l_UI_0.HoverArea;
local l_Image_0 = l_UI_0.Image;
local l_LoadingIndicator_0 = l_UI_0.LoadingIndicator;
local l_Separator_0 = l_UI_0.Separator;
local l_TextInput_0 = l_UI_0.TextInput;
local l_TitledFrame_0 = l_UI_0.TitledFrame;
local l_LayoutOrderIterator_0 = l_Util_0.LayoutOrderIterator;
local l_FitFrameOnAxis_0 = l_Util_0.FitFrame.FitFrameOnAxis;
local l_GetTextSize_0 = l_Util_0.GetTextSize;
local v35 = require(l_Parent_1.Src.Components.AutoThumbnails.BadgeIconThumbnail);
local v36 = require(l_Parent_1.Src.Actions.AddChange);
local v37 = require(l_Parent_1.Src.Actions.AddErrors);
local v38 = require(l_Parent_1.Src.Actions.DiscardError);
local v39 = require(l_Parent_1.Src.Actions.SetEditDevProductId);
local v40 = require(l_Parent_1.Src.Actions.SetComponentLoadState);
local v41 = require(l_Parent_0.Thunks.LoadDeveloperProducts);
local v42 = require(l_Parent_0.Thunks.LoadBadges);
local v43 = require(l_Parent_0.Thunks.AddDevSubKeyChange);
local v44 = require(l_Parent_0.Thunks.AddDevSubKeyError);
local v45 = require(l_Parent_0.Thunks.AddDevSubChange);
local v46 = require(l_Parent_1.Src.Util.LoadState);
local l_shouldAllowBadges_0 = require(l_Parent_1.Src.Util.GameSettingsUtilities).shouldAllowBadges;
local l_HttpService_0 = game:GetService("HttpService");
local v49 = require(l_Parent_0.FFlagDeveloperSubscriptionsEnabled);
local v50 = v9.PureComponent:extend(script.Name);
local l_Name_0 = script.Name;
local v52 = {
    BelowMin = "ErrorPriceBelowMin", 
    AboveMax = "ErrorPriceAboveMax", 
    Invalid = "ErrorPriceInvalid"
};
local v53 = {
    Empty = "ErrorNameEmpty"
};
local v54 = "";
local v55 = require(l_Parent_1.Src.Util.KeyProvider);
local l_getIsFriendOnlyKeyName_0 = v55.getIsFriendOnlyKeyName;
local l_getIsActiveKeyName_0 = v55.getIsActiveKeyName;
local l_getIsForSaleKeyName_0 = v55.getIsForSaleKeyName;
local l_getVipServersIsEnabledKeyName_0 = v55.getVipServersIsEnabledKeyName;
local function v86(v60, v61)
    local v62 = v60:getState();
    local l_gameId_0 = v62.Metadata.gameId;
    local l_monetizationController_0 = v61.monetizationController;
    local l_devSubsController_0 = v61.devSubsController;
    local l_gamePermissionsController_0 = v61.gamePermissionsController;
    local v82 = {
        function(v67)
            v67.taxRate = l_monetizationController_0:getTaxRate();
        end, 
        function(v68)
            v68.minimumFee = l_monetizationController_0:getMinimumFee();
        end, 
        function(v69)
            v69[l_getIsForSaleKeyName_0()] = l_monetizationController_0:getPaidAccessEnabled(l_gameId_0);
        end, 
        function(v70)
            v70.price = l_monetizationController_0:getPaidAccessPrice(l_gameId_0);
        end, 
        function(v71)
            v71[l_getVipServersIsEnabledKeyName_0()] = l_monetizationController_0:getVIPServersEnabled(l_gameId_0);
        end, 
        function(v72)
            local v73 = l_monetizationController_0:getVIPServersPrice(l_gameId_0);
            v72.vipServersPrice = not not v73 and v73 or 0;
        end, 
        function(v74)
            v74.vipServersActiveServersCount = l_monetizationController_0:getVIPServersActiveServersCount(l_gameId_0);
        end, 
        function(v75)
            v75.vipServersActiveSubscriptionsCount = l_monetizationController_0:getVIPServersActiveSubscriptionsCount(l_gameId_0);
        end, 
        function(v76)
            local v77, v78 = l_monetizationController_0:getDeveloperProducts(l_gameId_0);
            v76.developerProducts = v77;
            v76.devProductsCursor = v78;
        end, 
        function(v79)
            if v49 then
                v79.DeveloperSubscriptions = l_devSubsController_0:getDevSubs(l_gameId_0, true);
                return ;
            else
                return ;
            end;
        end, 
        function(v80)
            if v62.Settings.Current[l_getIsActiveKeyName_0()] == nil then
                v80[l_getIsActiveKeyName_0()] = l_gamePermissionsController_0:isActive(l_gameId_0);
            end;
        end, 
        function(v81)
            if v62.Settings.Current[l_getIsFriendOnlyKeyName_0()] == nil then
                v81[l_getIsFriendOnlyKeyName_0()] = l_gamePermissionsController_0:isFriendsOnly(l_gameId_0);
            end;
        end
    };
    table.insert(v82, function(v83)
        if l_shouldAllowBadges_0() then
            local v84, v85 = l_monetizationController_0:getBadges(l_gameId_0);
            v83.badges = v84;
            v83.badgesCursor = v85;
        end;
    end);
    return v82;
end;
local function v108(v87, v88)
    local v89 = v87:getState();
    local l_gameId_1 = v89.Metadata.gameId;
    local l_monetizationController_1 = v88.monetizationController;
    local l_devsubs_0 = v88.devsubs;
    local l_unsavedDevProducts_0 = v89.Settings.Changed.unsavedDevProducts;
    local l_editedDeveloperProducts_0 = v89.Settings.Changed.editedDeveloperProducts;
    local l_DeveloperSubscriptions_0 = v89.Settings.Current.DeveloperSubscriptions;
    local v96 = v89.Settings.Changed.DeveloperSubscriptions or {};
    local v101 = {
        function()
            local l_isForSale_0 = v89.Settings.Changed.isForSale;
            if l_isForSale_0 ~= nil then
                l_monetizationController_1:setPaidAccessEnabled(l_gameId_1, l_isForSale_0);
            end;
        end, 
        function()
            local l_price_0 = v89.Settings.Changed.price;
            if l_price_0 ~= nil then
                l_monetizationController_1:setPaidAccessPrice(l_gameId_1, l_price_0);
            end;
        end, 
        function()
            local l_vipServersIsEnabled_0 = v89.Settings.Changed.vipServersIsEnabled;
            if l_vipServersIsEnabled_0 ~= nil then
                l_monetizationController_1:setVIPServersEnabled(l_gameId_1, l_vipServersIsEnabled_0);
            end;
        end, 
        function()
            local l_vipServersPrice_0 = v89.Settings.Changed.vipServersPrice;
            if l_vipServersPrice_0 ~= nil then
                l_monetizationController_1:setVIPServersPrice(l_gameId_1, l_vipServersPrice_0);
            end;
        end
    };
    if l_unsavedDevProducts_0 ~= nil then
        for _, v103 in pairs(l_unsavedDevProducts_0) do
            table.insert(v101, function()
                l_monetizationController_1:createDevProduct(l_gameId_1, v103);
            end);
        end;
    end;
    if l_editedDeveloperProducts_0 ~= nil then
        for _, v105 in pairs(l_editedDeveloperProducts_0) do
            table.insert(v101, function()
                l_monetizationController_1:updateDevProduct(l_gameId_1, v105);
            end);
        end;
    end;
    if v49 and v96 ~= nil then
        for v106, v107 in pairs(v96) do
            if not v107.IsNew then
                if v107.Active == false then
                    table.insert(v101, function()
                        l_devsubs_0:discontinueDevSub(l_DeveloperSubscriptions_0[v106]);
                    end);
                else
                    table.insert(v101, function()
                        l_devsubs_0:changeDevSub(l_DeveloperSubscriptions_0[v106], v107);
                    end);
                end;
            else
                table.insert(v101, function()
                    l_devsubs_0:createDevSub(l_gameId_1, v107);
                end);
            end;
        end;
    end;
    return v101;
end;
local function v114(v109, v110)
    local l_Errors_0 = v110.Settings.Errors;
    local v112 = false;
    local v113 = v110.Settings.Changed.vipServersIsEnabled == false;
    if v110.Settings.Current.vipServersIsEnabled and v110.Settings.Changed.vipServersPrice ~= nil then
        v112 = true;
    end;
    return {
        TaxRate = v109("taxRate"), 
        MinimumFee = v109("minimumFee"), 
        PaidAccess = {
            enabled = v109(l_getIsForSaleKeyName_0()), 
            price = v109("price"), 
            initialPrice = not not v110.Settings.Current.price and v110.Settings.Current.price or 0
        }, 
        VIPServers = {
            isEnabled = v109(l_getVipServersIsEnabledKeyName_0()), 
            price = v109("vipServersPrice"), 
            initialPrice = not not v110.Settings.Current.vipServersPrice and v110.Settings.Current.vipServersPrice or 0, 
            activeServersCount = v109("vipServersActiveServersCount"), 
            activeSubscriptionsCount = v109("vipServersActiveSubscriptionsCount"), 
            changed = v112, 
            willShutdown = v113
        }, 
        UnsavedDevProducts = v109("unsavedDevProducts"), 
        DevProducts = v110.Settings.Current.developerProducts, 
        EditedDevProducts = v110.Settings.Changed.editedDeveloperProducts, 
        EditDevProductId = v110.EditAsset.editDevProductId, 
        AccessPriceError = l_Errors_0.monetizationPrice, 
        DevProductPriceError = l_Errors_0.devProductPrice, 
        DevProductNameError = l_Errors_0.devProductName, 
        isEditingSubscription = v109("isEditingSubscription"), 
        editedSubscriptionKey = v109("editedSubscriptionKey"), 
        Badges = v110.Settings.Current.badges, 
        BadgeLoadState = v110.ComponentLoadState.Badges, 
        isPublic = v109(l_getIsActiveKeyName_0()) and not v109(l_getIsFriendOnlyKeyName_0()), 
        isInitiallyEnabled = (not v110.Settings.Current[l_getIsActiveKeyName_0()] or v110.Settings.Current[l_getIsFriendOnlyKeyName_0()]) and (v110.Settings.Current[l_getIsForSaleKeyName_0()] or v110.Settings.Current[l_getVipServersIsEnabledKeyName_0()])
    };
end;
local function v120(v115, v116, v117, v118)
    if v117 == "Name" and (not (v118 ~= "") or v118 == nil) then
        v115(v44(v116, v117, {
            Empty = "Name can't be empty"
        }));
        return ;
    else
        if v117 == "Price" then
            local v119 = tonumber(v118);
            if not v119 or v119 <= 0 then
                v115(v44(v116, v117, {
                    NotANumber = "Price needs to be a valid number"
                }));
                return ;
            elseif v6 and v6 < v119 then
                v115(v44(v116, v117, {
                    AboveMaxRobuxAmount = "Price must be less than a certain amount"
                }));
                return ;
            end;
        elseif v117 == "Image" and (not (v118 ~= nil) or v118 == "None") then
            v115(v44(v116, v117, {
                Empty = "Image can't be empty"
            }));
        end;
        return ;
    end;
end;
local function _(v121, v122)
    v120(v121, v122.Key, "Name", v122.Name);
    v120(v121, v122.Key, "Image", v122.Image);
    v120(v121, v122.Key, "Price", v122.Price);
end;
local function v152(_, v125)
    return {
        PaidAccessToggled = function(v126, v127)
            v125(v36("price", v127));
            v125(v38("monetizationPrice"));
            v125(v36(l_getIsForSaleKeyName_0(), v126));
        end, 
        PaidAccessPriceChanged = function(v128)
            local v129 = tonumber(v128);
            v125(v36("price", v129));
            v125(v38("monetizationPrice"));
            if v129 then
                if v129 < v1 then
                    v125(v37({
                        monetizationPrice = "BelowMin"
                    }));
                    return ;
                else
                    if v2 < v129 then
                        v125(v37({
                            monetizationPrice = "AboveMax"
                        }));
                    end;
                    return ;
                end;
            else
                v125(v37({
                    monetizationPrice = "Invalid"
                }));
                return ;
            end;
        end, 
        VIPServersToggled = function(v130, v131)
            v125(v36("vipServersPrice", v131));
            v125(v38("monetizationPrice"));
            v125(v36(l_getVipServersIsEnabledKeyName_0(), v130));
        end, 
        VIPServersPriceChanged = function(v132)
            local v133 = tonumber(v132);
            v125(v36("vipServersPrice", v133));
            v125(v38("monetizationPrice"));
            if v133 then
                if v133 ~= 0 and v133 < v3 then
                    v125(v37({
                        monetizationPrice = "BelowMin"
                    }));
                end;
                return ;
            else
                v125(v37({
                    monetizationPrice = "Invalid"
                }));
                return ;
            end;
        end, 
        SetEditDevProductId = function(v134)
            v125(v39(v134));
        end, 
        SetUnsavedDevProducts = function(v135, v136, v137)
            if not v137 then
                if v136 then
                    if type(v136) == "table" then
                        for _, v139 in ipairs(v136) do
                            v125(v38(v139));
                        end;
                    else
                        v125(v38(v136));
                    end;
                end;
            else
                v125(v37({
                    [v136] = v137
                }));
            end;
            v125(v36("unsavedDevProducts", v135));
        end, 
        SetDevProducts = function(v140, v141, v142)
            if not v142 then
                if v141 then
                    if type(v141) == "table" then
                        for _, v144 in ipairs(v141) do
                            v125(v38(v144));
                        end;
                    else
                        v125(v38(v141));
                    end;
                end;
            else
                v125(v37({
                    [v141] = v142
                }));
            end;
            v125(v36("editedDeveloperProducts", v140));
        end, 
        LoadMoreDevProducts = function()
            v125(v41());
        end, 
        LoadMoreBadges = function()
            v125(v42());
        end, 
        RefreshBadges = function()
            v125(v40("Badges", v46.Loading));
            v125(v42(true));
            v125(v40("Badges", v46.Loaded));
        end or nil, 
        SetDevSubKey = function(v145, v146, v147)
            v125(v43(v145, v146, v147));
            v120(v125, v145, v146, v147);
        end, 
        OnDeveloperSubscriptionChanged = function(v148)
            local l_v125_0 = v125;
            v120(l_v125_0, v148.Key, "Name", v148.Name);
            v120(l_v125_0, v148.Key, "Image", v148.Image);
            v120(l_v125_0, v148.Key, "Price", v148.Price);
        end, 
        OnDeveloperSubscriptionCreated = function()
            local v150 = {
                IsNew = true, 
                Key = "TEMPORARY_" .. l_HttpService_0:GenerateGUID(), 
                Price = 0, 
                Subscribers = 0, 
                Active = false, 
                Id = -1, 
                Prepaid = 6
            };
            v125(v45(v150.Key, v150));
            local l_v125_1 = v125;
            v120(l_v125_1, v150.Key, "Name", v150.Name);
            v120(l_v125_1, v150.Key, "Image", v150.Image);
            v120(l_v125_1, v150.Key, "Price", v150.Price);
            v125(v36("isEditingSubscription", true));
            v125(v36("editedSubscriptionKey", v150.Key));
        end
    };
end;
local function v157(v153)
    local v154 = {};
    for v155, v156 in pairs(v153) do
        v154[v156.id] = {
            index = v155, 
            row = {
                v156.name, 
                v156.description
            }, 
            icon = v9.createElement(v35, {
                Id = v156.iconImageId, 
                Size = UDim2.fromScale(1, 1)
            })
        };
    end;
    return v154;
end;
local function v165(v158, v159)
    local v160 = {};
    local v161 = 1;
    for v162, v163 in pairs(v158) do
        local v164 = v163.id ~= nil;
        v160[not not v164 and v163.id or v161] = {
            index = v162, 
            row = {
                not not v164 and v163.id or v159:getText("Monetization", "UnsavedDevProduct"), 
                v163.name, 
                v163.price
            }
        };
        v161 = v161 + 1;
    end;
    return v160, v161 - 1;
end;
local function v177(v166, v167)
    local v168 = {};
    for v169, _ in pairs(v167) do
        table.insert(v168, v169);
    end;
    table.sort(v168);
    local v171 = {};
    local v172 = 1;
    for _, v174 in pairs(v166) do
        table.insert(v171, v172, v174);
        v172 = v172 + 1;
    end;
    for _, v176 in ipairs(v168) do
        table.insert(v171, v172, v167[v176]);
        v172 = v172 + 1;
    end;
    return v171;
end;
local function v184(v178, v179, v180, v181)
    if v178 then
        local v182 = nil;
        if v52[v178] then
            local v183 = nil;
            if v178 == "BelowMin" then
                v183 = if not v179 then if v180 then string.format("%.f", v1) else string.format("%.f", v4) else string.format("%.f", v3);
            elseif v178 == "AboveMax" then
                v183 = if not v180 then string.format("%.f", v5) else string.format("%.f", v2);
            end;
            v182 = v181:getText("Errors", v52[v178], {
                v183
            });
        end;
        return v182;
    else
        return nil;
    end;
end;
local function _(v185, v186)
    if v185 then
        local v187 = nil;
        if v53[v185] and v185 == "Empty" then
            v187 = v186:getText("General", v53[v185]);
        end;
        return v187;
    else
        return nil;
    end;
end;
local function v194(v189, v190)
    local v191 = {};
    local v192 = utf8.len(v189.name);
    local v193 = tonumber(v189.price);
    if not (v192 >= 1) or v0 < v192 then
        v189 = v11.Dictionary.join(v189, {
            name = v190
        });
        table.insert(v191, "devProductName");
    end;
    if not (type(v193) == "number") or v193 < 1 then
        v189 = v11.Dictionary.join(v189, {
            price = 1
        });
        table.insert(v191, "devProductPrice");
    end;
    return v189, v191;
end;
local function v230(v195)
    local l_Localization_0 = v195.Localization;
    local l_Stylizer_0 = v195.Stylizer;
    local l_TaxRate_0 = v195.TaxRate;
    local l_MinimumFee_0 = v195.MinimumFee;
    local l_enabled_0 = v195.PaidAccess.enabled;
    local l_price_1 = v195.PaidAccess.price;
    local l_VIPServers_0 = v195.VIPServers;
    local v203 = not not v195.UnsavedDevProducts and v195.UnsavedDevProducts or {};
    local v204, v205 = v165(v177(v203, (v11.Dictionary.join(not not v195.DevProducts and v195.DevProducts or {}, not not v195.EditedDevProducts and v195.EditedDevProducts or {}))), l_Localization_0);
    local l_PaidAccessToggled_0 = v195.PaidAccessToggled;
    local l_PaidAccessPriceChanged_0 = v195.PaidAccessPriceChanged;
    local l_VIPServersToggled_0 = v195.VIPServersToggled;
    local l_VIPServersPriceChanged_0 = v195.VIPServersPriceChanged;
    local l_SetUnsavedDevProducts_0 = v195.SetUnsavedDevProducts;
    local l_SetEditDevProductId_0 = v195.SetEditDevProductId;
    local l_LoadMoreDevProducts_0 = v195.LoadMoreDevProducts;
    local l_isPublic_0 = v195.isPublic;
    local l_isInitiallyEnabled_0 = v195.isInitiallyEnabled;
    local v215 = nil;
    local v216 = nil;
    local v217 = nil;
    local v218 = nil;
    local v219 = l_shouldAllowBadges_0();
    if v219 then
        v215 = v157(v195.Badges);
        v216 = v195.LoadMoreBadges;
        v217 = v195.RefreshBadges;
        v218 = v195.BadgeLoadState;
    end;
    local l_OnDeveloperSubscriptionCreated_0 = v195.OnDeveloperSubscriptionCreated;
    local v221 = v184(v195.AccessPriceError, l_VIPServers_0.isEnabled, l_enabled_0, l_Localization_0);
    local v222 = l_LayoutOrderIterator_0.new();
    if not l_TaxRate_0 then
        l_enabled_0 = nil;
        l_VIPServers_0.isEnabled = nil;
    end;
    local v223 = {};
    local l_v219_0 = v219;
    if l_v219_0 then
        l_v219_0 = false;
        if v218 == v46.Loading then
            l_v219_0 = v9.createElement(l_Container_0, {
                Size = UDim2.new(1, 0, 0, l_Stylizer_0.table.height / 2)
            }, {
                BadgesLoadingIndicator = v9.createElement(l_LoadingIndicator_0, {
                    AnchorPoint = Vector2.new(0.5, 0.5), 
                    Position = UDim2.fromScale(0.5, 0.5)
                })
            });
        end;
    end;
    v223.BadgesLoadingIndicatorContainer = l_v219_0;
    l_v219_0 = v219;
    if l_v219_0 then
        l_v219_0 = false;
        if v218 ~= v46.Loading then
            l_v219_0 = v9.createElement(v23, {
                BadgeList = v215, 
                LayoutOrder = v222:getNextOrder(), 
                OnLoadMoreBadges = v216, 
                RefreshBadges = v217
            });
        end;
    end;
    v223.Badges = l_v219_0;
    v223.Separator = v219 and v9.createElement(l_Separator_0, {
        LayoutOrder = v222:getNextOrder()
    });
    l_v219_0 = v9.createElement;
    local l_v17_0 = v17;
    local v226 = {
        Price = l_price_1, 
        TaxRate = l_TaxRate_0, 
        MinimumFee = l_MinimumFee_0, 
        PriceError = not not l_enabled_0 and v221 or nil, 
        LayoutOrder = v222:getNextOrder()
    };
    local v227 = false;
    if l_VIPServers_0.isEnabled == false then
        v227 = not not l_enabled_0 and l_isInitiallyEnabled_0 or l_isPublic_0;
    end;
    v226.Enabled = v227;
    v226.Selected = l_enabled_0;
    v226.OnPaidAccessToggle = function(v228)
        return l_PaidAccessToggled_0(v228, (math.max(v195.PaidAccess.initialPrice, v1)));
    end;
    v226.OnPaidAccessPriceChanged = l_PaidAccessPriceChanged_0;
    v223.PaidAccess = l_v219_0(l_v17_0, v226);
    l_v219_0 = v9.createElement;
    l_v17_0 = v18;
    v226 = {
        VIPServersData = l_VIPServers_0, 
        TaxRate = l_TaxRate_0, 
        MinimumFee = l_MinimumFee_0, 
        PriceError = not not l_VIPServers_0.isEnabled and v221 or nil, 
        LayoutOrder = v222:getNextOrder()
    };
    v227 = false;
    if l_enabled_0 == false then
        v227 = not not l_VIPServers_0.isEnabled and l_isInitiallyEnabled_0 or l_isPublic_0;
    end;
    v226.Enabled = v227;
    v226.OnVipServersToggled = function(v229)
        return l_VIPServersToggled_0(v229, (math.max(v195.VIPServers.initialPrice, v3)));
    end;
    v226.OnVipServersPriceChanged = l_VIPServersPriceChanged_0;
    v223.VIPServers = l_v219_0(l_v17_0, v226);
    v223.DevSubsList = v49 and v9.createElement(v21, {
        LayoutOrder = v222:getNextOrder(), 
        OnDeveloperSubscriptionCreated = l_OnDeveloperSubscriptionCreated_0
    });
    v223.DevProducts = v9.createElement(v19, {
        ProductList = v204, 
        ShowTable = v205 ~= 0, 
        LayoutOrder = v222:getNextOrder(), 
        CreateNewDevProduct = function()
            v54 = l_Localization_0:getText("Monetization", "UnsavedDevProductName1", {
                (string.format("%d", v205 + 1))
            });
            table.insert(v203, 1, {
                name = v54, 
                price = 1, 
                iconImageAssetId = "None"
            });
            l_SetUnsavedDevProducts_0(v203, nil, nil);
        end, 
        OnLoadMoreDevProducts = l_LoadMoreDevProducts_0, 
        OnEditDevProductClicked = l_SetEditDevProductId_0
    });
    return v223;
end;
local function v258(v231)
    local l_Stylizer_1 = v231.Stylizer;
    local l_Localization_1 = v231.Localization;
    local v234 = l_LayoutOrderIterator_0.new();
    local l_EditDevProductId_0 = v231.EditDevProductId;
    local v236 = not not v231.UnsavedDevProducts and v231.UnsavedDevProducts or {};
    local v237 = not not v231.DevProducts and v231.DevProducts or {};
    local v238 = nil;
    if not v237[l_EditDevProductId_0] then
        if v236[l_EditDevProductId_0] then
            v238 = v54;
        end;
    else
        v238 = v237[l_EditDevProductId_0].name;
    end;
    local v239 = not not v231.EditedDevProducts and v231.EditedDevProducts or {};
    local v240 = v11.Dictionary.join(v236, (v11.Dictionary.join(v237, v239)))[l_EditDevProductId_0] or {};
    if not v238 then
        v238 = v240.name;
    end;
    local l_name_0 = v240.name;
    local l_price_2 = v240.price;
    local l_SetEditDevProductId_1 = v231.SetEditDevProductId;
    local l_SetDevProducts_0 = v231.SetDevProducts;
    local v245 = v184(v231.DevProductPriceError, nil, nil, l_Localization_1);
    local v246 = nil;
    v246 = if not v245 then {} else l_GetTextSize_0(v245, l_Stylizer_1.fontStyle.SmallError.TextSize, l_Stylizer_1.fontStyle.SmallError.Font);
    local l_DevProductNameError_0 = v231.DevProductNameError;
    local v248;
    if l_DevProductNameError_0 then
        local v249 = nil;
        if v53[l_DevProductNameError_0] and l_DevProductNameError_0 == "Empty" then
            v249 = l_Localization_1:getText("General", v53[l_DevProductNameError_0]);
        end;
        v248 = v249;
    else
        v248 = nil;
    end;
    l_DevProductNameError_0 = v231.SetUnsavedDevProducts;
    return {
        HeaderFrame = v9.createElement(l_FitFrameOnAxis_0, {
            LayoutOrder = v234:getNextOrder(), 
            BackgroundTransparency = 1, 
            axis = l_FitFrameOnAxis_0.Axis.Vertical, 
            minimumSize = UDim2.new(1, 0, 0, 0), 
            contentPadding = UDim.new(0, l_Stylizer_1.settingsPage.headerPadding)
        }, {
            BackButton = v9.createElement("ImageButton", {
                Size = UDim2.new(0, l_Stylizer_1.backButton.size, 0, l_Stylizer_1.backButton.size), 
                LayoutOrder = 0, 
                Image = l_Stylizer_1.backButton.image, 
                BackgroundTransparency = 1, 
                [v9.Event.Activated] = function()
                    local v250, v251 = v194(v240, v238);
                    if not v250.id then
                        v236 = v11.Dictionary.join(v236, {
                            [l_EditDevProductId_0] = v250
                        });
                        l_DevProductNameError_0(v236, v251);
                    else
                        v239 = v11.Dictionary.join(v239, {
                            [l_EditDevProductId_0] = v250
                        });
                        l_SetDevProducts_0(v239, v251);
                    end;
                    l_SetEditDevProductId_1(nil);
                end
            }, {
                v9.createElement(l_HoverArea_0, {
                    Cursor = "PointingHand"
                })
            }), 
            v9.createElement(l_Separator_0, {
                LayoutOrder = 1
            }), 
            Header = v9.createElement(v16, {
                Title = l_Localization_1:getText("Monetization", "EditDeveloperProduct"), 
                LayoutOrder = 2
            })
        }), 
        Name = v9.createElement(l_TitledFrame_0, {
            LayoutOrder = v234:getNextOrder(), 
            Title = l_Localization_1:getText("General", "TitleName")
        }, {
            TextBox = v9.createElement(l_TextInput_0, {
                ErrorText = v248, 
                MaxLength = v0, 
                OnTextChanged = function(v252)
                    local v253 = utf8.len(v252);
                    local v254 = nil;
                    if v253 == 0 then
                        v254 = "Empty";
                    end;
                    v240 = v11.Dictionary.join(v240, {
                        name = tostring(v252)
                    });
                    if not v240.id then
                        v236 = v11.Dictionary.join(v236, {
                            [l_EditDevProductId_0] = v240
                        });
                        l_DevProductNameError_0(v236, "devProductName", v254);
                        return ;
                    else
                        v239 = v11.Dictionary.join(v239, {
                            [l_EditDevProductId_0] = v240
                        });
                        l_SetDevProducts_0(v239, "devProductName", v254);
                        return ;
                    end;
                end, 
                Text = l_name_0
            })
        }), 
        Price = v9.createElement(l_TitledFrame_0, {
            LayoutOrder = v234:getNextOrder(), 
            Title = l_Localization_1:getText("Monetization", "PriceTitle")
        }, {
            VerticalLayout = v9.createElement("UIListLayout", {
                SortOrder = Enum.SortOrder.LayoutOrder, 
                FillDirection = Enum.FillDirection.Vertical
            }), 
            PriceFrame = v9.createElement(l_TextInput_0, {
                OnTextChanged = function(v255)
                    local v256 = tonumber(v255);
                    local v257 = nil;
                    if v256 then
                        if v256 < v4 then
                            v257 = "BelowMin";
                        elseif v5 < v256 then
                            v257 = "AboveMax";
                        end;
                    else
                        v257 = "Invalid";
                    end;
                    v240 = v11.Dictionary.join(v240, {
                        price = tostring(v255)
                    });
                    if not v240.id then
                        v236 = v11.Dictionary.join(v236, {
                            [l_EditDevProductId_0] = v240
                        });
                        l_DevProductNameError_0(v236, "devProductPrice", v257);
                        return ;
                    else
                        v239 = v11.Dictionary.join(v239, {
                            [l_EditDevProductId_0] = v240
                        });
                        l_SetDevProducts_0(v239, "devProductPrice", v257);
                        return ;
                    end;
                end, 
                Size = UDim2.new(0, 200, 0, 32), 
                Text = l_price_2, 
                LeadingComponent = l_Image_0, 
                LeadingComponentProps = {
                    Size = UDim2.new(0, l_Stylizer_1.robuxFeeBase.icon.size, 0, l_Stylizer_1.robuxFeeBase.icon.size), 
                    ImageColor3 = l_Stylizer_1.robuxFeeBase.icon.imageColor, 
                    Image = l_Stylizer_1.robuxFeeBase.icon.image
                }
            }), 
            ErrorMessage = v245 and v9.createElement("TextLabel", v11.Dictionary.join(l_Stylizer_1.fontStyle.SmallError, {
                AutomaticSize = Enum.AutomaticSize.XY, 
                BackgroundTransparency = 1, 
                Text = v245, 
                TextYAlignment = Enum.TextYAlignment.Center, 
                TextXAlignment = Enum.TextXAlignment.Left, 
                TextWrapped = true, 
                LayoutOrder = 2
            }))
        })
    };
end;
local function v260(v259)
    return {
        v9.createElement(v22, {
            SetDevSubKey = v259.SetDevSubKey, 
            OnDeveloperSubscriptionChanged = v259.OnDeveloperSubscriptionChanged
        })
    };
end;
v50.render = function(v261)
    local l_props_0 = v261.props;
    local l_Localization_2 = l_props_0.Localization;
    local l_EditDevProductId_1 = l_props_0.EditDevProductId;
    local l_isEditingSubscription_0 = l_props_0.isEditingSubscription;
    local v266 = nil;
    local v267 = l_EditDevProductId_1 == 0;
    if not l_isEditingSubscription_0 then
        if l_EditDevProductId_1 == nil then
            v267 = true;
            v266 = function()
                return (v230(l_props_0));
            end;
        elseif type(l_EditDevProductId_1) == "number" then
            v267 = false;
            v266 = function()
                return (v258(l_props_0));
            end;
        end;
    else
        v266 = function()
            return (v260(l_props_0));
        end;
    end;
    return v9.createElement(v20, {
        SettingsLoadJobs = v86, 
        SettingsSaveJobs = v108, 
        Title = l_Localization_2:getText("General", "Category" .. l_Name_0), 
        PageId = l_Name_0, 
        CreateChildren = v266, 
        ShowHeader = v267
    });
end;
v50 = l_withContext_0({
    Localization = l_ContextServices_0.Localization, 
    Stylizer = l_ContextServices_0.Stylizer
})(v50);
local v268 = require(l_Parent_1.Src.Networking.settingFromState);
v50 = v10.connect(function(v269, _)
    if v269 then
        return (v114(function(v271)
            return v268(v269.Settings, v271);
        end, v269));
    else
        return ;
    end;
end, function(v272)
    return (v152(function(v273)
        return function(v274)
            v272(v36(v273, v274));
        end;
    end, v272));
end)(v50);
v50.LocalizationId = l_Name_0;
return v50;
