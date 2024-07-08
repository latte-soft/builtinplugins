local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Src.Util.KeyProvider);
local l_getEditKeyName_0 = v1.getEditKeyName;
local l_getVersionHistoryKeyName_0 = v1.getVersionHistoryKeyName;
local l_Parent_1 = script.Parent;
local v5 = require(l_Parent_0.Packages.Roact);
local v6 = require(l_Parent_0.Packages.RoactRodux);
local v7 = require(l_Parent_0.Packages.Cryo);
local v8 = require(l_Parent_0.Packages.Framework);
local l_ContextServices_0 = v8.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_Util_0 = v8.Util;
local l_deepJoin_0 = l_Util_0.deepJoin;
local l_FitFrameOnAxis_0 = l_Util_0.FitFrame.FitFrameOnAxis;
local l_GetTextSize_0 = l_Util_0.GetTextSize;
local l_LayoutOrderIterator_0 = l_Util_0.LayoutOrderIterator;
local l_UI_0 = v8.UI;
local l_Button_0 = l_UI_0.Button;
local l_HoverArea_0 = l_UI_0.HoverArea;
local l_Separator_0 = l_UI_0.Separator;
local l_LinkText_0 = l_UI_0.LinkText;
local l_TextInput_0 = l_UI_0.TextInput;
local l_TitledFrame_0 = l_UI_0.TitledFrame;
local v23 = require(l_Parent_0.Src.Components.Header);
local v24 = require(l_Parent_1.Components.ServerFill);
local v25 = require(l_Parent_0.Src.Components.TableWithMenu);
local v26 = require(l_Parent_0.Src.Components.RadioButtonSet);
local v27 = require(l_Parent_0.Src.Components.SettingsPages.SettingsPage);
local v28 = require(l_Parent_0.Src.Actions.AddChange);
local v29 = require(l_Parent_0.Src.Actions.AddErrors);
local v30 = require(l_Parent_0.Src.Actions.DiscardChanges);
local v31 = require(l_Parent_0.Src.Actions.DiscardError);
local v32 = require(l_Parent_0.Src.Actions.DiscardErrors);
local v33 = require(l_Parent_0.Src.Actions.SetEditPlaceId);
local v34 = require(l_Parent_1.Thunks.ReloadPlaces);
local v35 = v5.PureComponent:extend(script.Name);
local l_Name_0 = script.Name;
local v37 = game:DefineFastInt("StudioPlaceConfigurationMaxPlayerCount", 200);
local v38 = 0;
local v39 = nil;
v39 = if v37 > 100 then math.floor(v37 * 0.2) else math.min(20, v37 - 1);
local l_AssetManagerService_0 = game:GetService("AssetManagerService");
local l_StudioService_0 = game:GetService("StudioService");
local l_TextService_0 = game:GetService("TextService");
local l_GuiService_0 = game:GetService("GuiService");
local v44 = {
    Empty = "ErrorNameEmpty"
};
local function v53(v45, v46)
    local l_gameId_0 = v45:getState().Metadata.gameId;
    local l_placesController_0 = v46.placesController;
    return {
        function(v49)
            local v50, v51, v52 = l_placesController_0:getPlaces(l_gameId_0):await();
            v49.places = v50;
            v49.placesPageCursor = v51;
            v49.placesIndex = v52;
        end
    };
end;
local function v65(v54, v55)
    local v56 = v54:getState();
    local l_placesController_1 = v55.placesController;
    local l_editPlaceId_0 = v56.EditAsset.editPlaceId;
    local v59 = v56.Settings.Changed.places or {};
    return {
        function()
            local v60 = v59[l_editPlaceId_0];
            if not (not (v60 ~= nil) or not v60.name) then
                l_placesController_1:setName(l_editPlaceId_0, v60.name);
            end;
        end, 
        function()
            local v61 = v59[l_editPlaceId_0];
            if not (not (v61 ~= nil) or not v61.maxPlayerCount) then
                l_placesController_1:setMaxPlayerCount(l_editPlaceId_0, v61.maxPlayerCount);
            end;
        end, 
        function()
            local v62 = v59[l_editPlaceId_0];
            if v62 ~= nil and v62.allowCopying ~= nil then
                l_placesController_1:setAllowCopying(l_editPlaceId_0, v62.allowCopying);
            end;
        end, 
        function()
            local v63 = v59[l_editPlaceId_0];
            if not (not (v63 ~= nil) or not v63.socialSlotType) then
                l_placesController_1:setSocialSlotType(l_editPlaceId_0, v63.socialSlotType);
            end;
        end, 
        function()
            local v64 = v59[l_editPlaceId_0];
            if not (not (v64 ~= nil) or not v64.customSocialSlotsCount) then
                l_placesController_1:setCustomSocialSlotsCount(l_editPlaceId_0, v64.customSocialSlotsCount);
            end;
        end
    };
end;
local function _(v66, v67)
    local l_Errors_0 = v67.Settings.Errors;
    return {
        Places = v66("places"), 
        EditPlaceId = v67.EditAsset.editPlaceId, 
        PlaceNameError = l_Errors_0.placeName, 
        PlacePlayerCountError = l_Errors_0.placePlayerCount, 
        PlaceCustomSocialSlotCountError = l_Errors_0.placeCustomSocialSlotsCount
    };
end;
local function v88(_, v71)
    return {
        dispatchReloadPlaces = function(v72)
            v71(v34(v72));
        end, 
        dispatchSetEditPlaceId = function(v73)
            v71(v33(v73));
        end, 
        dispatchSetPlaceName = function(v74, v75, v76)
            local v77 = utf8.len(v76);
            if v77 == 0 then
                v71(v29({
                    placeName = "Empty"
                }));
                return ;
            else
                v71(v28("places", (l_deepJoin_0(v74, {
                    [v75] = {
                        name = v76
                    }
                }))));
                v71(v31("placeName"));
                if v77 > 50 then
                    v71(v29({
                        placeName = "TooLong"
                    }));
                end;
                return ;
            end;
        end, 
        dispatchUpdateServerSizeAndServerSlots = function(v78, v79, v80, v81, v82)
            v71(v31("placePlayerCount"));
            v71(v31("placeCustomSocialSlotsCount"));
            local v83 = tonumber(v80);
            local v84 = tonumber(v81);
            v71(v28("places", (l_deepJoin_0(v78, {
                [v79] = {
                    maxPlayerCount = v83 or "", 
                    customSocialSlotsCount = v84 or "", 
                    socialSlotType = v82
                }
            }))));
            if v83 and v84 then
                if v83 == 1 then
                    v38 = 0;
                    v39 = 0;
                elseif v83 > 1 and v83 <= 100 then
                    v38 = 1;
                    v39 = math.min(v83 - 1, 20);
                else
                    v38 = 1;
                    v39 = math.floor(v83 * 0.2);
                end;
                if not (v83 >= 1) or v37 < v83 then
                    v71(v29({
                        placePlayerCount = "Error"
                    }));
                else
                    v71(v31("placePlayerCount"));
                end;
                if v83 and (not ((not (v83 <= 100) or math.min(v83 - 1, 20) >= v84) and (not (v83 > 100) or math.floor(v83 * 0.2) >= v84)) or v83 > 1 and v84 < 1) then
                    if v82 == "Custom" then
                        v71(v29({
                            placeCustomSocialSlotsCount = "Error"
                        }));
                        return ;
                    end;
                else
                    v71(v31("placeCustomSocialSlotsCount"));
                end;
            else
                if v83 then
                    if v83 == 1 then
                        v38 = 0;
                        v39 = 0;
                    elseif v83 > 1 and v83 <= 100 then
                        v38 = 1;
                        v39 = math.min(v83 - 1, 20);
                    else
                        v38 = 1;
                        v39 = math.floor(v83 * 0.2);
                    end;
                else
                    v71(v29({
                        placePlayerCount = "Error"
                    }));
                end;
                if not (not (v82 == "Custom") or v84) then
                    v71(v29({
                        placeCustomSocialSlotsCount = "Error"
                    }));
                    return ;
                end;
            end;
        end, 
        dispatchSetAllowCopyingEnabled = function(v85, v86, v87)
            v71(v28("places", (l_deepJoin_0(v85, {
                [v86] = {
                    allowCopying = v87
                }
            }))));
        end, 
        dispatchDiscardChanges = function()
            v71(v30());
        end, 
        dispatchDiscardErrors = function()
            v71(v32());
        end
    };
end;
local function v93(v89)
    local v90 = {};
    for _, v92 in pairs(v89) do
        v90[v92.id] = {
            index = v92.index + 1, 
            row = {
                v92.currentSavedVersion, 
                v92.name, 
                v92.maxPlayerCount
            }
        };
    end;
    return v90;
end;
local function v105(v94, v95)
    local l_Stylizer_0 = v94.Stylizer;
    local v97 = l_LayoutOrderIterator_0.new();
    local v98 = v95:getText("General", "ButtonCreate");
    local v99 = l_GetTextSize_0(v98, l_Stylizer_0.fontStyle.Header.TextSize, l_Stylizer_0.fontStyle.Header.Font);
    local l_dispatchReloadPlaces_0 = v94.dispatchReloadPlaces;
    return {
        CreateButton = v5.createElement(l_Button_0, {
            Style = "GameSettingsPrimaryButton", 
            Text = v98, 
            Size = UDim2.new(0, v99.X + l_Stylizer_0.createButton.PaddingX, 0, v99.Y + l_Stylizer_0.createButton.PaddingY), 
            LayoutOrder = v97:getNextOrder(), 
            OnClick = function()
                local l_status_0, _ = pcall(function()
                    l_AssetManagerService_0:AddNewPlace();
                end);
                if l_status_0 then
                    l_dispatchReloadPlaces_0(true);
                end;
            end
        }, {
            v5.createElement(l_HoverArea_0, {
                Cursor = "PointingHand"
            })
        }), 
        PlacesTable = v5.createElement(v25, {
            LayoutOrder = v97:getNextOrder(), 
            Headers = {
                v95:getText("Places", "PlaceVersion"), 
                v95:getText("Places", "PlaceName"), 
                v95:getText("Places", "MaxPlayers")
            }, 
            Data = v93(not not v94.Places and v94.Places or {}), 
            MenuItems = {
                {
                    Key = l_getEditKeyName_0(), 
                    Text = v95:getText("Places", "ConfigurePlace")
                }, 
                {
                    Key = l_getVersionHistoryKeyName_0(), 
                    Text = v95:getText("Places", "VersionHistory")
                }
            }, 
            OnItemClicked = function(v103, v104)
                if v103 == l_getEditKeyName_0() then
                    v94.dispatchSetEditPlaceId(v104);
                    return ;
                else
                    if v103 == l_getVersionHistoryKeyName_0() then
                        l_StudioService_0:ShowPlaceVersionHistoryDialog(v104);
                    end;
                    return ;
                end;
            end, 
            NextPageFunc = function()
                l_dispatchReloadPlaces_0();
            end
        })
    };
end;
local function v136(v106, v107)
    local l_Stylizer_1 = v106.Stylizer;
    local v109 = l_LayoutOrderIterator_0.new();
    local v110 = v107:getText("Places", "MaxPlayersSubText");
    local v111 = l_GetTextSize_0(v110, l_Stylizer_1.fontStyle.Subtext.TextSize, l_Stylizer_1.fontStyle.Subtext.Font);
    local v112 = v107:getText("General", "ButtonView");
    local v113 = l_GetTextSize_0(v112, l_Stylizer_1.fontStyle.Header.TextSize, l_Stylizer_1.fontStyle.Header.Font, (Vector2.new(math.huge, l_Stylizer_1.button.height)));
    local v114 = UDim2.new(0, math.max(v113.X, l_Stylizer_1.button.width), 0, v113.Y + (l_Stylizer_1.button.height - v113.Y));
    local v115 = v106.Places or {};
    local l_EditPlaceId_0 = v106.EditPlaceId;
    local v117 = v115[l_EditPlaceId_0] or {};
    local l_name_0 = v117.name;
    local v119 = nil;
    if not (not v106.PlaceNameError or not v44[v106.PlaceNameError]) then
        v119 = v107:getText("General", v44[v106.PlaceNameError]);
    end;
    local l_maxPlayerCount_0 = v117.maxPlayerCount;
    local v121 = nil;
    if v106.PlacePlayerCountError then
        v121 = v107:getText("Places", "NumberError", {
            minRange = 1, 
            maxRange = v37
        });
    end;
    local l_allowCopying_0 = v117.allowCopying;
    local l_socialSlotType_0 = v117.socialSlotType;
    local l_customSocialSlotsCount_0 = v117.customSocialSlotsCount;
    local v125 = nil;
    if v106.PlaceCustomSocialSlotCountError then
        v125 = if tonumber(l_customSocialSlotsCount_0) or tonumber(l_maxPlayerCount_0) then if l_maxPlayerCount_0 > 0 and l_maxPlayerCount_0 <= 2 then v107:getText("Places", "SocialSlotAllowedError", {
            socialSlot = v39
        }) else v107:getText("Places", "SocialSlotError", {
            minRange = v38, 
            maxRange = v39
        }) else v107:getText("Places", "SocialSlotInvalidError");
    end;
    local l_dispatchUpdateServerSizeAndServerSlots_0 = v106.dispatchUpdateServerSizeAndServerSlots;
    local l_dispatchSetPlaceName_0 = v106.dispatchSetPlaceName;
    local l_dispatchSetAllowCopyingEnabled_0 = v106.dispatchSetAllowCopyingEnabled;
    local v129 = v107:getText("General", "AllowCopyingDesc");
    local l_l_TextService_0_TextSize_0 = l_TextService_0:GetTextSize(v129, l_Stylizer_1.fontStyle.Subtext.TextSize, l_Stylizer_1.fontStyle.Subtext.Font, Vector2.new(l_Stylizer_1.radioButton.descriptionWidth, math.huge));
    return {
        HeaderFrame = v5.createElement(l_FitFrameOnAxis_0, {
            LayoutOrder = v109:getNextOrder(), 
            BackgroundTransparency = 1, 
            axis = l_FitFrameOnAxis_0.Axis.Vertical, 
            minimumSize = UDim2.new(1, 0, 0, 0), 
            contentPadding = UDim.new(0, l_Stylizer_1.settingsPage.headerPadding)
        }, {
            BackButton = v5.createElement("ImageButton", {
                Size = UDim2.new(0, l_Stylizer_1.backButton.size, 0, l_Stylizer_1.backButton.size), 
                LayoutOrder = 0, 
                Image = l_Stylizer_1.backButton.image, 
                BackgroundTransparency = 1, 
                [v5.Event.Activated] = function()
                    v106.dispatchDiscardChanges();
                    v106.dispatchDiscardErrors();
                    v106.dispatchSetEditPlaceId(0);
                end
            }, {
                v5.createElement(l_HoverArea_0, {
                    Cursor = "PointingHand"
                })
            }), 
            v5.createElement(l_Separator_0, {
                LayoutOrder = 1
            }), 
            Header = v5.createElement(v23, {
                Title = v107:getText("Places", "ConfigurePlace"), 
                LayoutOrder = 2
            })
        }), 
        Name = v5.createElement(l_TitledFrame_0, {
            LayoutOrder = v109:getNextOrder(), 
            Title = v107:getText("General", "TitleName")
        }, {
            TextBox = v5.createElement(l_TextInput_0, {
                ErrorText = v119, 
                MaxLength = 50, 
                OnTextChanged = function(v131)
                    l_dispatchSetPlaceName_0(v115, l_EditPlaceId_0, v131);
                end, 
                Text = l_name_0
            })
        }), 
        MaxPlayers = v5.createElement(l_TitledFrame_0, {
            LayoutOrder = v109:getNextOrder(), 
            Title = v107:getText("Places", "MaxPlayers")
        }, {
            HeaderLayout = v5.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Vertical, 
                HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                SortOrder = Enum.SortOrder.LayoutOrder
            }), 
            TextBox = v5.createElement(l_TextInput_0, {
                LayoutOrder = 1, 
                Text = l_maxPlayerCount_0, 
                ErrorText = v121, 
                OnTextChanged = function(v132)
                    l_dispatchUpdateServerSizeAndServerSlots_0(v115, l_EditPlaceId_0, v132, l_customSocialSlotsCount_0, l_socialSlotType_0);
                end, 
                Width = l_Stylizer_1.placePage.textBox.length
            }), 
            MaxPlayersSubText = not v121 and v5.createElement("TextLabel", v7.Dictionary.join(l_Stylizer_1.fontStyle.Subtext, {
                Size = UDim2.new(1, 0, 0, v111.Y), 
                LayoutOrder = 2, 
                BackgroundTransparency = 1, 
                Text = v110, 
                TextYAlignment = Enum.TextYAlignment.Center, 
                TextXAlignment = Enum.TextXAlignment.Left, 
                TextWrapped = true
            }))
        }), 
        ServerFill = v5.createElement(v24, {
            LayoutOrder = v109:getNextOrder(), 
            Enabled = true, 
            CustomSocialSlotsCount = l_customSocialSlotsCount_0, 
            Selected = l_socialSlotType_0, 
            ErrorMessage = v125, 
            OnSocialSlotTypeChanged = function(v133)
                l_dispatchUpdateServerSizeAndServerSlots_0(v115, l_EditPlaceId_0, l_maxPlayerCount_0, l_customSocialSlotsCount_0, v133.Id);
            end, 
            OnCustomSocialSlotsCountChanged = function(v134)
                l_dispatchUpdateServerSizeAndServerSlots_0(v115, l_EditPlaceId_0, l_maxPlayerCount_0, v134, l_socialSlotType_0);
            end
        }), 
        AllowCopying = v5.createElement(v26, {
            Title = v107:getText("General", "TitleAllowCopying"), 
            Buttons = {
                {
                    Id = true, 
                    Title = v107:getText("General", "SettingOn"), 
                    Children = {
                        LinkText = v5.createElement(l_LinkText_0, {
                            Text = v129, 
                            Size = UDim2.new(0, l_l_TextService_0_TextSize_0.X, 0, l_l_TextService_0_TextSize_0.Y), 
                            TextWrapped = true, 
                            TextXAlignment = Enum.TextXAlignment.Left, 
                            TextYAlignment = Enum.TextYAlignment.Top, 
                            OnClick = function()
                                l_GuiService_0:OpenBrowserWindow(l_StudioService_0:GetTermsOfUseUrl());
                            end
                        })
                    }
                }, 
                {
                    Id = false, 
                    Title = v107:getText("General", "SettingOff")
                }
            }, 
            Enabled = true, 
            LayoutOrder = v109:getNextOrder(), 
            Selected = l_allowCopying_0, 
            SelectionChanged = function(v135)
                l_dispatchSetAllowCopyingEnabled_0(v115, l_EditPlaceId_0, v135.Id);
            end
        }), 
        VersionHistory = v5.createElement(l_TitledFrame_0, {
            LayoutOrder = v109:getNextOrder(), 
            Title = v107:getText("Places", "VersionHistory")
        }, {
            ViewButton = v5.createElement(l_Button_0, {
                Style = "GameSettingsButton", 
                Text = v112, 
                Size = v114, 
                LayoutOrder = v109:getNextOrder(), 
                OnClick = function()
                    l_StudioService_0:ShowPlaceVersionHistoryDialog(l_EditPlaceId_0);
                end
            }, {
                v5.createElement(l_HoverArea_0, {
                    Cursor = "PointingHand"
                })
            })
        })
    };
end;
v35.render = function(v137)
    local l_props_0 = v137.props;
    local l_Localization_0 = l_props_0.Localization;
    local l_EditPlaceId_1 = l_props_0.EditPlaceId;
    local _ = nil;
    return v5.createElement(v27, {
        SettingsLoadJobs = v53, 
        SettingsSaveJobs = v65, 
        Title = l_Localization_0:getText("General", "Category" .. l_Name_0), 
        PageId = l_Name_0, 
        CreateChildren = l_EditPlaceId_1 == 0 and function()
            return (v105(l_props_0, l_Localization_0));
        end or function()
            return (v136(l_props_0, l_Localization_0));
        end, 
        ShowHeader = l_EditPlaceId_1 == 0
    });
end;
v35 = l_withContext_0({
    Localization = l_ContextServices_0.Localization, 
    Stylizer = l_ContextServices_0.Stylizer
})(v35);
local v142 = require(l_Parent_0.Src.Networking.settingFromState);
v35 = v6.connect(function(v143, _)
    if v143 then
        local function v146(v145)
            return v142(v143.Settings, v145);
        end;
        local l_Errors_1 = v143.Settings.Errors;
        return {
            Places = v146("places"), 
            EditPlaceId = v143.EditAsset.editPlaceId, 
            PlaceNameError = l_Errors_1.placeName, 
            PlacePlayerCountError = l_Errors_1.placePlayerCount, 
            PlaceCustomSocialSlotCountError = l_Errors_1.placeCustomSocialSlotsCount
        };
    else
        return ;
    end;
end, function(v148)
    return (v88(function(v149)
        return function(v150)
            v148(v28(v149, v150));
        end;
    end, v148));
end)(v35);
v35.LocalizationId = l_Name_0;
return v35;
