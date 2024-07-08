local l_game_FastInt_0 = game:GetFastInt("LuobuDevPublishAnalyticsHundredthsPercentage");
local l_game_FastString_0 = game:GetFastString("TeamCreateLink");
local l_StudioGenreOverhaulPlaceholder_0 = game:GetFastFlag("StudioGenreOverhaulPlaceholder");
local l_game_FastString_1 = game:GetFastString("StudioGenreOverhaulExplainationLink");
local l_StudioGenreOverhaulInfo_0 = game:GetFastFlag("StudioGenreOverhaulInfo");
local l_Parent_0 = script.Parent.Parent.Parent;
local v6 = require(l_Parent_0.Packages.Roact);
local v7 = require(l_Parent_0.Packages.Cryo);
local _ = require(l_Parent_0.Packages.Framework);
local v9 = require(l_Parent_0.Packages.Framework);
local l_UI_0 = v9.UI;
local l_HoverArea_0 = l_UI_0.HoverArea;
local l_LinkText_0 = l_UI_0.LinkText;
local l_SelectInput_0 = l_UI_0.SelectInput;
local l_Separator_0 = v9.UI.Separator;
local l_Image_0 = l_UI_0.Image;
local l_StyledDialog_0 = l_UI_0.StyledDialog;
local l_TextLabel_0 = l_UI_0.TextLabel;
local l_TextInput_0 = l_UI_0.TextInput;
local l_TextWithInlineLink_0 = l_UI_0.TextWithInlineLink;
local l_Tooltip_0 = l_UI_0.Tooltip;
local l_TitledFrame_0 = l_UI_0.TitledFrame;
local l_Pane_0 = l_UI_0.Pane;
local v23 = require(l_Parent_0.Src.Components.TeachingCallout);
local v24 = require(l_Parent_0.Src.Components.Header);
local v25 = require(l_Parent_0.Src.Components.PlatformSelect);
local v26 = require(l_Parent_0.Src.Components.CheckBoxSet);
local v27 = require(l_Parent_0.Src.Components.ToggleButtonWithTitle);
local v28 = require(l_Parent_0.Src.Thunks.GetPlayerAcceptances);
local v29 = require(l_Parent_0.Src.Actions.AddChange);
local v30 = require(l_Parent_0.Src.Actions.AddErrors);
local v31 = require(l_Parent_0.Src.Actions.SetSelectedGroup);
local v32 = require(l_Parent_0.Src.Resources.Constants);
local v33 = require(l_Parent_0.Src.Components.createMenuPage);
local v34 = require(l_Parent_0.Src.Network.Http);
local l_GuiService_0 = game:GetService("GuiService");
local l_shouldShowDevPublishLocations_0 = require(l_Parent_0.Src.Util.PublishPlaceAsUtilities).shouldShowDevPublishLocations;
local l_getOptInLocationsRequirementsLink_0 = require(l_Parent_0.Src.Util.PublishPlaceAsUtilities).getOptInLocationsRequirementsLink;
local l_sendAnalyticsToKibana_0 = require(l_Parent_0.Src.Util.PublishPlaceAsUtilities).sendAnalyticsToKibana;
local l_getPlayerAppDownloadLink_0 = require(l_Parent_0.Src.Util.PublishPlaceAsUtilities).getPlayerAppDownloadLink;
local l_calculateTextSize_0 = require(l_Parent_0.Src.Util.PublishPlaceAsUtilities).calculateTextSize;
local v41 = require(l_Parent_0.Src.Util.KeyProvider);
local v42 = v41.getOptInLocationsKeyName();
local v43 = v41.getChinaKeyName();
local v44 = v41.getLuobuStudioDevPublishKeyName();
local v45 = v41.getCheckboxToggleKeyName();
local v46 = v41.getSelectedKeyName();
local v47 = v41.getTermsOfUseDialogKeyName();
local v48 = v41.getButtonClickedKeyName();
local v49 = require(l_Parent_0.Src.Flags.getFFlagCAP1107);
local v50 = require(l_Parent_0.Src.Flags.getFStringCAP1107DisplayUrl);
local v51 = require(l_Parent_0.Src.Types.DataSharingFetchState);
local l_LayoutOrderIterator_0 = v9.Util.LayoutOrderIterator;
local v53 = false;
local function v110(v54)
    local l_props_0 = v54.props;
    local l_Stylizer_0 = l_props_0.Stylizer;
    local l_Localization_0 = l_props_0.Localization;
    local l_Description_0 = l_props_0.Description;
    local l_DescriptionChanged_0 = l_props_0.DescriptionChanged;
    local l_DescriptionError_0 = l_props_0.DescriptionError;
    local l_Devices_0 = l_props_0.Devices;
    local l_DevicesChanged_0 = l_props_0.DevicesChanged;
    local l_DevicesError_0 = l_props_0.DevicesError;
    local l_Genre_0 = l_props_0.Genre;
    local l_GenreChanged_0 = l_props_0.GenreChanged;
    local l_Name_0 = l_props_0.Name;
    local l_NameChanged_0 = l_props_0.NameChanged;
    local l_NameError_0 = l_props_0.NameError;
    local l_CreatorId_0 = l_props_0.CreatorId;
    local l_Groups_0 = l_props_0.Groups;
    local l_CreatorChanged_0 = l_props_0.CreatorChanged;
    local l_OptInLocations_0 = l_props_0.OptInLocations;
    local l_OptInLocationsChanged_0 = l_props_0.OptInLocationsChanged;
    local l_PlayerAcceptance_0 = l_props_0.PlayerAcceptance;
    local l_SelectedGroup_0 = l_props_0.SelectedGroup;
    local l_OwnedGroups_0 = l_props_0.OwnedGroups;
    if l_SelectedGroup_0 then
        l_CreatorChanged_0(l_SelectedGroup_0);
    end;
    local v78 = v7.List.map(v32.GENRE_IDS, function(v77)
        return {
            Key = v77, 
            Text = l_Localization_0:getText("Genre", v77)
        };
    end);
    local v79 = 1;
    local function v82(_, v81)
        l_GenreChanged_0(v78[v81].Key);
    end;
    local v83 = {};
    for v84, v85 in pairs(v78) do
        table.insert(v83, v85.Text);
        if l_Genre_0 == v85.Key then
            v79 = v84;
        end;
    end;
    local v86 = {
        {
            Key = 0, 
            Type = v32.SUBJECT_TYPE.USER, 
            Text = l_Localization_0:getText("GroupDropdown", "Me")
        }
    };
    local v87 = 1;
    local function v91(_, v89)
        local l_Key_0 = v86[v89].Key;
        l_CreatorChanged_0(l_Key_0);
        l_props_0.DispatchSetSelectedGroup(l_Key_0);
    end;
    if l_Groups_0 and next(l_Groups_0) ~= nil then
        for _, v93 in pairs(l_Groups_0) do
            table.insert(v86, {
                Key = v93.groupId, 
                Type = v32.SUBJECT_TYPE.GROUP, 
                Text = v93.name
            });
        end;
        if not v53 then
            v53 = true;
            for _, v95 in ipairs(v86) do
                if game.CreatorId == v95.Key and game.CreatorType == Enum.CreatorType.Group then
                    l_CreatorChanged_0(v95.Key);
                end;
            end;
        end;
    end;
    local v96 = {};
    for v97, v98 in ipairs(v86) do
        table.insert(v96, v98.Text);
        if l_CreatorId_0 == v98.Key then
            v87 = v97;
        end;
    end;
    local v99 = utf8.len(l_Name_0);
    local v100 = utf8.len(l_Description_0);
    local v101 = l_LayoutOrderIterator_0.new();
    local v102 = l_calculateTextSize_0(l_Localization_0:getText(v42, "RequirementsLinkText"), 14, "SourceSans");
    local v105 = {
        Header = v6.createElement(v24, {
            Title = l_Localization_0:getText("MenuItem", "BasicInfo"), 
            LayoutOrder = v101:getNextOrder()
        }), 
        GenreInfo = if l_StudioGenreOverhaulInfo_0 then v6.createElement(l_Pane_0, {
            LayoutOrder = v101:getNextOrder(), 
            Size = UDim2.new(1, 8, 0, 0), 
            AutomaticSize = Enum.AutomaticSize.Y, 
            HorizontalAlignment = Enum.HorizontalAlignment.Left, 
            VerticalAlignment = Enum.VerticalAlignment.Top, 
            Layout = Enum.FillDirection.Horizontal, 
            Spacing = l_Stylizer_0.genreInfo.imageTextGap, 
            BackgroundColor3 = l_Stylizer_0.genreInfo.paneBackgroundColor, 
            BorderColor3 = l_Stylizer_0.genreInfo.paneBorderColor, 
            BorderSizePixel = l_Stylizer_0.genreInfo.paneBorderSize
        }, {
            UIPadding = v6.createElement("UIPadding", {
                PaddingTop = UDim.new(0, l_Stylizer_0.genreInfo.panePadding), 
                PaddingBottom = UDim.new(0, l_Stylizer_0.genreInfo.panePadding), 
                PaddingLeft = UDim.new(0, l_Stylizer_0.genreInfo.panePadding), 
                PaddingRight = UDim.new(0, l_Stylizer_0.genreInfo.panePadding + 8)
            }), 
            InfoIcon = v6.createElement("Frame", {
                Size = UDim2.fromOffset(l_Stylizer_0.genreInfo.imageSize, l_Stylizer_0.genreInfo.imageSize), 
                BackgroundTransparency = 1, 
                LayoutOrder = v101:getNextOrder()
            }, {
                Padding = v6.createElement("UIPadding", {
                    PaddingTop = UDim.new(0, 2), 
                    PaddingBottom = UDim.new(0, 2), 
                    PaddingLeft = UDim.new(0, 2), 
                    PaddingRight = UDim.new(0, 2)
                }), 
                Image = v6.createElement(l_Image_0, {
                    Size = UDim2.new(1, 0, 1, 0), 
                    Image = l_Stylizer_0.genreInfo.image
                })
            }), 
            TextBox = v6.createElement(l_Pane_0, {
                Layout = Enum.FillDirection.Vertical, 
                LayoutOrder = v101:getNextOrder(), 
                HorizontalAlignment = Enum.HorizontalAlignment.Left
            }, {
                Text = v6.createElement(l_TextLabel_0, v7.Dictionary.join(l_Stylizer_0.genreInfo.BodyBodyDefault, {
                    LayoutOrder = v101:getNextOrder(), 
                    Text = l_Localization_0:getText("General", "GenreOverhaulInfo"), 
                    BackgroundTransparency = 1, 
                    AutomaticSize = Enum.AutomaticSize.XY, 
                    TextXAlignment = Enum.TextXAlignment.Left, 
                    TextWrapped = true
                })), 
                LinkText = v6.createElement(l_LinkText_0, v7.Dictionary.join(l_Stylizer_0.genreInfo.BodyBodyDefault, {
                    LayoutOrder = v101:getNextOrder(), 
                    OnClick = function()
                        l_GuiService_0:OpenBrowserWindow(l_game_FastString_1);
                    end, 
                    Text = l_Localization_0:getText("General", "GenreOverhaulMessageLink")
                }))
            })
        }) else nil, 
        Name = v6.createElement(l_TitledFrame_0, {
            LayoutOrder = v101:getNextOrder(), 
            Title = l_Localization_0:getText("PageTitle", "Name")
        }, {
            TextBox = v6.createElement(l_TextInput_0, {
                ErrorText = l_NameError_0 and l_Localization_0:getText("Error", l_NameError_0, {
                    tostring(v99), 
                    (tostring(50))
                }), 
                MaxLength = 50, 
                OnTextChanged = l_NameChanged_0, 
                Text = l_Name_0
            })
        }), 
        Description = v6.createElement(l_TitledFrame_0, {
            LayoutOrder = v101:getNextOrder(), 
            Title = l_Localization_0:getText("PageTitle", "Description")
        }, {
            TextBox = v6.createElement(l_TextInput_0, {
                ErrorText = l_DescriptionError_0 and l_Localization_0:getText("Error", l_DescriptionError_0, {
                    tostring(v100), 
                    (tostring(1000))
                }), 
                Height = l_Stylizer_0.descriptionBox.textBoxHeight, 
                MaxLength = 1000, 
                MultiLine = true, 
                OnTextChanged = l_DescriptionChanged_0, 
                Text = l_Description_0
            })
        }), 
        Separator1 = v6.createElement(l_Separator_0, {
            LayoutOrder = v101:getNextOrder()
        }), 
        Creator = v6.createElement(l_TitledFrame_0, {
            LayoutOrder = v101:getNextOrder(), 
            Title = l_Localization_0:getText("PageTitle", "Creator")
        }, {
            Selector = v6.createElement(l_SelectInput_0, {
                Items = v96, 
                SelectedIndex = v87, 
                OnItemActivated = v91, 
                Width = l_Stylizer_0.selectInput.width.creator
            })
        }), 
        Separator2 = v6.createElement(l_Separator_0, {
            LayoutOrder = v101:getNextOrder()
        }), 
        Genre = if not l_StudioGenreOverhaulInfo_0 then if l_StudioGenreOverhaulPlaceholder_0 then v6.createElement(l_TitledFrame_0, {
            LayoutOrder = v101:getNextOrder(), 
            Title = l_Localization_0:getText("PageTitle", "Genre")
        }, {
            Body = v6.createElement(l_TextWithInlineLink_0, {
                OnLinkClicked = function()
                    l_GuiService_0:OpenBrowserWindow(l_game_FastString_1);
                end, 
                Text = l_Localization_0:getText("General", "GenreOverhaulMessageBody"), 
                LinkText = l_Localization_0:getText("General", "GenreOverhaulMessageLink"), 
                LinkPlaceholder = "[link]", 
                MaxWidth = l_Stylizer_0.textWithInlineLink.maxWidth, 
                TextProps = v7.Dictionary.join(l_Stylizer_0.fontStyle.Smaller, {
                    BackgroundTransparency = 1, 
                    TextXAlignment = Enum.TextXAlignment.Left, 
                    TextYAlignment = Enum.TextYAlignment.Top
                }), 
                HorizontalAlignment = Enum.HorizontalAlignment.Left
            })
        }) else v6.createElement(l_TitledFrame_0, {
            LayoutOrder = v101:getNextOrder(), 
            Title = l_Localization_0:getText("PageTitle", "Genre")
        }, {
            Selector = v6.createElement(l_SelectInput_0, {
                Items = v83, 
                SelectedIndex = v79, 
                OnItemActivated = v82, 
                Width = l_Stylizer_0.selectInput.width.genre
            })
        }) else nil, 
        Separator4 = if not l_StudioGenreOverhaulInfo_0 then v6.createElement(l_Separator_0, {
            LayoutOrder = v101:getNextOrder()
        }) else nil, 
        Devices = v6.createElement(v25, {
            LayoutOrder = v101:getNextOrder(), 
            Devices = l_Devices_0, 
            DevicesError = l_DevicesError_0, 
            DeviceSelected = function(v103, v104)
                l_DevicesChanged_0((v7.Dictionary.join(l_Devices_0, {
                    [v103] = v104
                })));
            end
        }), 
        Separator3 = v6.createElement(l_Separator_0, {
            LayoutOrder = v101:getNextOrder()
        }), 
        EnableTeamCreate = v6.createElement(v27, {
            Title = l_Localization_0:getText("TeamCreate", "Title"), 
            LayoutOrder = v101:getNextOrder(), 
            Disabled = false, 
            Selected = l_props_0.TeamCreateEnabled, 
            LinkProps = {
                Text = l_Localization_0:getText("TeamCreate", "LinkDescription"), 
                LinkText = l_Localization_0:getText("TeamCreate", "LinkText"), 
                OnLinkClicked = function()
                    l_GuiService_0:OpenBrowserWindow(l_game_FastString_0);
                end
            }, 
            OnClick = function()
                l_props_0.TeamCreateEnabledChanged(not l_props_0.TeamCreateEnabled);
            end
        }, {
            TeachingCallout = v6.createElement(v23, {
                DefinitionId = "PublishPlaceAsTeamCreateToggleCallout", 
                LocationId = "TeamCreateToggle"
            })
        })
    };
    if v49() then
        local v106 = false;
        if l_props_0.DataSharingDefault ~= v51.LOADING then
            v106 = l_props_0.DataSharingDefault ~= v51.INELIGIBLE;
        end;
        local v107 = true;
        if l_CreatorId_0 ~= 0 then
            v107 = v7.List.find(l_OwnedGroups_0, l_CreatorId_0) ~= nil;
        end;
        if not (not v106 or not v107) then
            v105.DataSharing = v6.createElement(v27, {
                Title = l_Localization_0:getText("DataSharing", "Title"), 
                LayoutOrder = v101:getNextOrder(), 
                Disabled = l_props_0.DataSharingEnabled == nil, 
                Selected = l_props_0.DataSharingEnabled == true, 
                LinkProps = {
                    Text = l_Localization_0:getText("DataSharing", "LinkDescription"), 
                    LinkText = l_Localization_0:getText("DataSharing", "LinkText"), 
                    OnLinkClicked = function()
                        l_GuiService_0:OpenBrowserWindow((v34.BuildRobloxUrl("create", v50())));
                    end
                }, 
                OnClick = function()
                    l_props_0.DataSharingEnabledChanged(not l_props_0.DataSharingEnabled);
                end
            }, {});
        end;
    end;
    if not (not l_props_0.IsPublish or not l_shouldShowDevPublishLocations_0()) then
        v105.Separator5 = v6.createElement(l_Separator_0, {
            LayoutOrder = v101:getNextOrder()
        });
        v105.OptInLocations = v6.createElement(v26, {
            Title = l_Localization_0:getText(v42, "TitleOptInLocations"), 
            LayoutOrder = v101:getNextOrder(), 
            MaxHeight = l_Stylizer_0.optInLocations.height, 
            Boxes = {
                {
                    Id = v43, 
                    Title = l_Localization_0:getText(v42, v43), 
                    Selected = not not l_OptInLocations_0 and l_OptInLocations_0.China, 
                    LinkTextFrame = v6.createElement("Frame", {
                        BackgroundTransparency = 1, 
                        Size = UDim2.new(0, l_Stylizer_0.requirementsLink.length, 0, l_Stylizer_0.requirementsLink.height), 
                        Position = UDim2.new(0, 0, 0, l_Stylizer_0.requirementsLink.paddingY)
                    }, {
                        LinkTextLabel = v6.createElement(l_TextLabel_0, {
                            Position = UDim2.new(0, v102.X, 0, 0), 
                            Size = UDim2.new(1, -v102.X, 1, 0), 
                            Style = "Body", 
                            Text = l_Localization_0:getText(v42, "ChinaRequirements"), 
                            TextXAlignment = Enum.TextXAlignment.Left, 
                            TextYAlignment = Enum.TextYAlignment.Top
                        }), 
                        LinkText = v6.createElement(l_LinkText_0, {
                            OnClick = function()
                                l_GuiService_0:OpenBrowserWindow((l_getOptInLocationsRequirementsLink_0(v43)));
                            end, 
                            Size = UDim2.new(0, v102.X, 0, v102.Y), 
                            Style = "Body", 
                            Text = l_Localization_0:getText(v42, "RequirementsLinkText")
                        })
                    })
                }
            }, 
            Enabled = l_OptInLocations_0 ~= nil, 
            EntryClicked = function(v108)
                if l_PlayerAcceptance_0 then
                    local v109 = v7.Dictionary.join(l_OptInLocations_0, {
                        [v108.Id] = not not v108.Selected and v7.None or not v108.Selected
                    });
                    l_sendAnalyticsToKibana_0(v44, l_game_FastInt_0, v45, {
                        [v42] = v108.Id, 
                        [v46] = not v108.Selected
                    });
                    l_OptInLocationsChanged_0(v109);
                    return ;
                else
                    v54:setState({
                        showDialog = true
                    });
                    return ;
                end;
            end, 
            Tooltip = v6.createElement(l_Image_0, {
                Size = UDim2.fromOffset(l_Stylizer_0.tooltipIcon.size, l_Stylizer_0.tooltipIcon.size), 
                Position = UDim2.new(0, 0, 0, l_Stylizer_0.tooltipIcon.paddingY), 
                Style = "TooltipStyle", 
                StyleModifier = v54.state.StyleModifier
            }, {
                v6.createElement(l_Tooltip_0, {
                    Text = l_Localization_0:getText(v42, "Tooltip")
                }), 
                v6.createElement(l_HoverArea_0, {
                    Cursor = "PointingHand", 
                    MouseEnter = v54.onMouseEnter, 
                    MouseLeave = v54.onMouseLeave
                })
            })
        });
        v105.Dialog = v6.createElement(l_StyledDialog_0, {
            Enabled = v54.state.showDialog, 
            Modal = true, 
            Title = "", 
            MinContentSize = Vector2.new(l_Stylizer_0.dialog.minSize.width, l_Stylizer_0.dialog.minSize.height), 
            Buttons = {
                {
                    Key = "OK", 
                    Text = l_Localization_0:getText("General", "ReplyOK")
                }
            }, 
            OnButtonPressed = function()
                v54:setState({
                    showDialog = false
                });
                l_sendAnalyticsToKibana_0(v44, l_game_FastInt_0, v47, {
                    [v48] = "OK"
                });
            end, 
            OnClose = function()
                v54:setState({
                    showDialog = false
                });
                l_sendAnalyticsToKibana_0(v44, l_game_FastInt_0, v47, {
                    [v48] = "Close"
                });
            end, 
            ButtonHorizontalAlignment = Enum.HorizontalAlignment.Center
        }, {
            Layout = v6.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Vertical, 
                VerticalAlignment = Enum.VerticalAlignment.Center, 
                HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                SortOrder = Enum.SortOrder.LayoutOrder
            }), 
            Header = v6.createElement("TextLabel", v7.Dictionary.join(l_Stylizer_0.fontStyle.Title, {
                Position = UDim2.new(0.5, 0, 0, 45), 
                AnchorPoint = Vector2.new(0.5, 0.5), 
                Size = UDim2.new(1, 0, 0, 60), 
                BackgroundTransparency = 1, 
                Text = l_Localization_0:getText("General", "TermsDialogHeader"), 
                TextWrapped = true
            })), 
            Body = v6.createElement(l_TextWithInlineLink_0, {
                OnLinkClicked = function()
                    l_GuiService_0:OpenBrowserWindow((l_getPlayerAppDownloadLink_0("China")));
                end, 
                Text = l_Localization_0:getText("General", "TermsDialogBody"), 
                LinkText = l_Localization_0:getText("General", "TermsDialogBodyLink"), 
                LinkPlaceholder = "[link]", 
                MaxWidth = l_Stylizer_0.textWithInlineLink.maxWidth, 
                TextProps = v7.Dictionary.join(l_Stylizer_0.fontStyle.Normal, {
                    BackgroundTransparency = 1
                })
            })
        });
    end;
    return v105;
end;
local v134 = v33(function(v111, v112)
    local l_errors_0 = v112.NewGameSettings.errors;
    local l_groupInfo_0 = v112.GroupsHavePermission.groupInfo;
    local l_selectedGroup_0 = v112.SelectedGroup.selectedGroup;
    local v116 = nil;
    local v117 = nil;
    local v118 = nil;
    if v49() then
        v116 = v111("dataSharingDefault");
        v117 = v111("dataSharingEnabled");
        v118 = l_groupInfo_0.ownedGroups;
    end;
    return {
        NameError = l_errors_0.name, 
        DescriptionError = l_errors_0.description, 
        DevicesError = l_errors_0.playableDevices, 
        IsCurrentlyActive = v112.NewGameSettings.current.isActive, 
        Groups = l_groupInfo_0.groups, 
        SelectedGroup = l_selectedGroup_0, 
        OwnedGroups = v118, 
        Name = v111("name"), 
        Description = v111("description"), 
        Genre = v111("genre"), 
        Devices = v111("playableDevices") or {}, 
        RootPlaceId = v111("rootPlaceId"), 
        IsActive = v111("isActive"), 
        IsFriendsOnly = v111("isFriendsOnly"), 
        CreatorId = v111("creatorId"), 
        OptInLocations = not not l_shouldShowDevPublishLocations_0() and v111(v42) or {}, 
        PlayerAcceptance = v112.Policy.PlayerAcceptance, 
        TeamCreateEnabled = v111("teamCreateEnabled"), 
        DataSharingDefault = v116, 
        DataSharingEnabled = v117
    };
end, function(v119, v120)
    return {
        CreatorChanged = v119("creatorId"), 
        GenreChanged = v119("genre"), 
        NameChanged = function(v121)
            v120(v29("name", v121));
            local v122 = utf8.len(v121);
            local v123, _ = string.gsub(v121, " ", "");
            if not (v122 ~= 0) or string.len(v123) == 0 then
                v120(v30({
                    name = "NameEmpty"
                }));
                return ;
            else
                if v122 > 50 then
                    v120(v30({
                        name = "NameTooLong"
                    }));
                end;
                return ;
            end;
        end, 
        DescriptionChanged = function(v125)
            v120(v29("description", v125));
            if utf8.len(v125) > 1000 then
                v120(v30({
                    description = "DescriptionTooLong"
                }));
            end;
        end, 
        DevicesChanged = function(v126)
            v120(v29("playableDevices", v126));
            for _, v128 in pairs(v126) do
                if v128 then
                    return ;
                end;
            end;
            v120(v30({
                playableDevices = "NoDevices"
            }));
        end, 
        OptInLocationsChanged = function(v129)
            if l_shouldShowDevPublishLocations_0() then
                v120(v29(v42, v129));
            end;
        end, 
        IsFriendsOnlyChanged = v119("isFriendsOnly"), 
        IsActiveChanged = v119("isActive"), 
        GetPlayerAcceptances = function(v130)
            if l_shouldShowDevPublishLocations_0() then
                v120(v28(v130));
                return ;
            else
                return ;
            end;
        end, 
        TeamCreateEnabledChanged = function(v131)
            v120(v29("teamCreateEnabled", v131));
        end, 
        DataSharingEnabledChanged = function(v132)
            assert(v49());
            v120(v29("dataSharingEnabled", v132));
        end, 
        DispatchSetSelectedGroup = function(v133)
            v120(v31(v133));
        end
    };
end);
return function(v135)
    return v6.createElement(v134, {
        Content = v110, 
        AddLayout = true, 
        IsPublish = v135.IsPublish
    });
end;
