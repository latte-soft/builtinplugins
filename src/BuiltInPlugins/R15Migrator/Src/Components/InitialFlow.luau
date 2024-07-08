local l_GuiService_0 = game:GetService("GuiService");
local l_HttpRbxApiService_0 = game:GetService("HttpRbxApiService");
local l_MarketplaceService_0 = game:GetService("MarketplaceService");
local l_AssetManagerService_0 = game:GetService("AssetManagerService");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("R15Migrator");
local v5 = require(l_script_FirstAncestor_0.Packages.Framework);
local v6 = require(l_script_FirstAncestor_0.Packages.Roact);
local v7 = require(l_script_FirstAncestor_0.Packages.RoactRodux);
local v8 = require(l_script_FirstAncestor_0.Src.Util.UILayoutHelpers);
local l_ContextServices_0 = v5.ContextServices;
local l_UI_0 = v5.UI;
local l_Pane_0 = l_UI_0.Pane;
local l_TextWithLinks_0 = l_UI_0.TextWithLinks;
local l_Button_0 = l_UI_0.Button;
local l_Image_0 = l_UI_0.Image;
local l_TextLabel_0 = l_UI_0.TextLabel;
local l_LoadingIndicator_0 = l_UI_0.LoadingIndicator;
local l_LayoutOrderIterator_0 = v5.Util.LayoutOrderIterator;
local l_Util_0 = l_script_FirstAncestor_0.Src.Util;
local v19 = require(l_Util_0.saveCopyOfExperience);
local v20 = require(l_Util_0.PluginSettings);
local v21 = require(l_Util_0.getExperienceData);
local v22 = require(l_Util_0.getLocalDateTime);
local l_R15MigShowLinkedText_0 = game:GetFastFlag("R15MigShowLinkedText");
local v24 = v6.PureComponent:extend("InitialFlow");
v24.getR15ConvertedExperienceData = function(v25, v26, v27)
    local l_props_0 = v25.props;
    local v29 = l_props_0.Plugin:get();
    if v25.isExperiencePublished or v26 then
        if not v26 then
            v26 = v20.CorrespondingR15Experience:getSetting(v29, game.GameId);
        end;
        if v26 then
            v21(v26, l_props_0.API:get(), function(v30)
                v27(v30);
            end);
            return ;
        else
            v27();
            return ;
        end;
    else
        v27();
        return ;
    end;
end;
v24.getGameName = function(v31, v32)
    local v33 = false;
    if v31.isExperiencePublished ~= nil then
        v33 = v31.gameName;
    end;
    assert(v33);
    if not v31.isExperiencePublished then
        if not (v32 ~= nil) then
            v32 = true;
        end;
        if not v32 then
            return v31.gameName;
        else
            return (string.gsub(v31.gameName, "%.rbxl$", ""));
        end;
    else
        return v31.gameName;
    end;
end;
v24.init = function(v34, _)
    v34.state = {
        isGettingInitialData = true, 
        isConverting = false, 
        paneSize = Vector2.new()
    };
    v34.hasCreatedCopy = false;
    local v36 = false;
    if game.GameId ~= 0 then
        v36 = game.PlaceId ~= 0;
    end;
    v34.isExperiencePublished = v36;
    if not v34.isExperiencePublished then
        v34.gameName = game.Name;
    else
        v36 = l_MarketplaceService_0:GetProductInfo(game.PlaceId);
        v34.gameName = v36.Name;
        local v37 = v22((DateTime.fromIsoDate(v36.Created)));
        v34.gameCreatedDate = ("%*/%*/%*"):format(v37.month, v37.day, v37.year);
    end;
    v34:getR15ConvertedExperienceData(nil, function(v38)
        v34:setState({
            isGettingInitialData = false, 
            convertedExperience = v38 or v6.None
        });
    end);
    v34.createNewExperience = function()
        local l_props_1 = v34.props;
        local l_Localization_0 = l_props_1.Localization;
        local v41 = l_props_1.API:get();
        local v42 = l_props_1.Plugin:get();
        v34:setState({
            isConverting = true
        });
        local function v49(v43)
            local l_convertedExperience_0 = v34.state.convertedExperience;
            local v45 = l_Localization_0:getText("InitialFlow", not v34:isPublishedR15PlayerChoiceExperience() and "CopyR6Local" or "CopyR15", {
                experienceName = v34:getGameName()
            });
            if not (not l_convertedExperience_0 or not string.match(l_convertedExperience_0.name, "^" .. v45)) then
                local v46 = tonumber(string.match(l_convertedExperience_0.name, "%[(%d+)%]$"));
                v45 = v45 .. "_[" .. (not v46 and "2" or tostring(v46 + 1)) .. "]";
            end;
            v43.teamCreateEnabled = false;
            v43.name = v45;
            v43.universeAvatarType = "MorphToR15";
            local v47 = v19(l_Localization_0, v41, v43);
            if not v47 or v47 == 0 then
                warn("Failed to create new experience");
                v34:setState({
                    isConverting = false
                });
                return ;
            else
                if v34.isExperiencePublished then
                    v20.CorrespondingR15Experience:setSetting(v42, game.GameId, v47);
                end;
                v20.IsR15ConvertedExperience:setSetting(v42, v47, true);
                v34:getR15ConvertedExperienceData(v47, function(v48)
                    if v48 then
                        v48.name = v45;
                    end;
                    v34.hasCreatedCopy = not not v48 or false;
                    v34:setState({
                        isConverting = false, 
                        convertedExperience = v48 or v6.None
                    });
                end);
                return ;
            end;
        end;
        task.spawn(function()
            if not v34.isExperiencePublished then
                v49({
                    description = "", 
                    genre = "All", 
                    name = v34:getGameName(), 
                    playableDevices = {
                        Computer = true, 
                        Phone = true, 
                        Tablet = true, 
                        VR = true
                    }, 
                    isFriendsOnly = false
                });
                return ;
            else
                v41.Develop.V2.Universes.configuration(game.GameId):makeRequest():andThen(function(v50)
                    v49(v50.responseBody);
                end, function(v51)
                    warn("Unable to retrieve details of current experience", v51.responseBody);
                    v34:setState({
                        isConverting = false
                    });
                end);
                return ;
            end;
        end);
    end;
    v34.openExperience = function()
        local l_convertedExperience_1 = v34.state.convertedExperience;
        assert(l_convertedExperience_1, "Converted experience should be set");
        v20.InitiallyEnabled:setSetting(v34.props.Plugin:get(), l_convertedExperience_1.experienceId, true);
        l_AssetManagerService_0:OpenPlace(l_convertedExperience_1.placeId);
    end;
    v34.ref = v6.createRef();
end;
v24.initRef = function(v53)
    local v54 = v53.ref:getValue();
    if v54 then
        v53:setState({
            paneSize = v54.AbsoluteSize
        });
        v53.onPaneSizeChanged = v54:GetPropertyChangedSignal("AbsoluteSize"):Connect(function()
            v53:setState({
                paneSize = v54.AbsoluteSize
            });
        end);
        return ;
    else
        return ;
    end;
end;
v24.didMount = function(v55)
    v55:initRef();
end;
v24.willUnmount = function(v56)
    if v56.onPaneSizeChanged then
        v56.onPaneSizeChanged:Disconnect();
        v56.onPaneSizeChanged = nil;
    end;
end;
v24.didUpdate = function(v57)
    if not (not v57.ref.current or v57.onPaneSizeChanged) then
        v57:initRef();
    end;
end;
v24.renderConvertingPanel = function(v58)
    local l_props_2 = v58.props;
    local l_Stylizer_0 = l_props_2.Stylizer;
    local l_Localization_1 = l_props_2.Localization;
    return {
        v6.createElement(l_TextWithLinks_0, {
            Text = l_Localization_1:getText("InitialFlow", "InProgress", {
                experienceName = v58:getGameName(false)
            }), 
            Size = UDim2.new(1, 0, 0, v8.getTextHeight(l_Localization_1:getText("InitialFlow", "InProgress", {
                experienceName = v58:getGameName(false)
            }), l_Stylizer_0.TextSize, l_Stylizer_0.Font)), 
            BackgroundTransparency = 1, 
            TextWrapped = true, 
            TextProps = {
                TextSize = l_Stylizer_0.TextSize, 
                Font = l_Stylizer_0.Font, 
                RichText = true, 
                TextXAlignment = Enum.TextXAlignment.Left
            }, 
            LinkMap = {}, 
            HorizontalAlignment = Enum.HorizontalAlignment.Left
        }); 
        LoadingIndicatorPane = v6.createElement(l_Pane_0, {
            Padding = {
                Top = l_Stylizer_0.LoadingIndicatorPadding
            }, 
            Size = UDim2.new(1, 0, 0, l_Stylizer_0.LoadingIndicatorHeight + l_Stylizer_0.LoadingIndicatorPadding), 
            Layout = Enum.FillDirection.Vertical, 
            HorizontalAlignment = Enum.HorizontalAlignment.Center, 
            VerticalAlignment = Enum.VerticalAlignment.Top
        }, {
            LoadingIndicator = v6.createElement(l_LoadingIndicator_0)
        })
    };
end;
v24.renderOpenPanel = function(v62)
    local l_props_3 = v62.props;
    local l_Stylizer_1 = l_props_3.Stylizer;
    local l_Localization_2 = l_props_3.Localization;
    local l_convertedExperience_2 = v62.state.convertedExperience;
    assert(l_convertedExperience_2, "Converted experience should be set");
    local v67 = l_Localization_2:getText("InitialFlow", "Confirmation", {
        experienceNameR15Font = ("<font color = \"%*\"> %*_R15 </font>"):format(l_Stylizer_1.ConfirmationExperienceNameColor, (v62:getGameName())), 
        date = v62.gameCreatedDate
    });
    local v68 = l_LayoutOrderIterator_0.new();
    return {
        CompleteLabel = v6.createElement(l_TextWithLinks_0, {
            LayoutOrder = v68:getNextOrder(), 
            Text = l_Localization_2:getText("InitialFlow", "Ready", {
                experienceName = l_convertedExperience_2.name
            }), 
            Size = UDim2.new(1, 0, 0, v8.getTextHeight(l_Localization_2:getText("InitialFlow", "Ready", {
                experienceName = l_convertedExperience_2.name
            }), l_Stylizer_1.TextSize, l_Stylizer_1.Font)), 
            BackgroundTransparency = 1, 
            TextWrapped = true, 
            TextProps = {
                TextSize = l_Stylizer_1.ReadyTextSize, 
                Font = l_Stylizer_1.Font, 
                RichText = true, 
                TextXAlignment = Enum.TextXAlignment.Left
            }, 
            LinkMap = {}, 
            HorizontalAlignment = Enum.HorizontalAlignment.Left
        }), 
        ConfirmationLabel = v6.createElement(l_TextLabel_0, {
            LayoutOrder = v68:getNextOrder(), 
            Text = v67, 
            Size = UDim2.new(1, 0, 0, l_Stylizer_1.ConfirmationLabelYPadding * v8.getTextHeight(v67, l_Stylizer_1.TextSize, l_Stylizer_1.Font)), 
            BackgroundTransparency = 1, 
            TextWrapped = true, 
            TextSize = l_Stylizer_1.TextSize, 
            Font = l_Stylizer_1.Font, 
            TextXAlignment = Enum.TextXAlignment.Left, 
            TextYAlignment = Enum.TextYAlignment.Center, 
            RichText = true
        }), 
        OpenButtonPane = v6.createElement(l_Pane_0, {
            Size = UDim2.new(1, 0, 0, v8.getTextHeight(l_Localization_2:getText("InitialFlow", "OpenR15Copy"), l_Stylizer_1.TextSize, l_Stylizer_1.Font, l_Stylizer_1.ButtonPanePadding)), 
            LayoutOrder = v68:getNextOrder(), 
            BackgroundTransparency = 1, 
            HorizontalAlignment = Enum.HorizontalAlignment.Right, 
            Layout = Enum.FillDirection.Horizontal, 
            VerticalAlignment = Enum.VerticalAlignment.Center, 
            Spacing = l_Stylizer_1.OpenPaneButtonsSpaceing
        }, {
            CreateNewCopyButton = if not v62.hasCreatedCopy then v6.createElement(l_Button_0, {
                Size = v8.getTextSize(l_Localization_2:getText("InitialFlow", "CreateNewR15Copy"), l_Stylizer_1.TextSize, l_Stylizer_1.Font, l_Stylizer_1.ButtonPadding), 
                Text = l_Localization_2:getText("InitialFlow", "CreateNewR15Copy"), 
                OnClick = v62.createNewExperience, 
                Style = "Round", 
                LayoutOrder = v68:getNextOrder()
            }) else nil, 
            OpenButton = v6.createElement(l_Button_0, {
                Size = v8.getTextSize(l_Localization_2:getText("InitialFlow", "OpenR15Copy"), l_Stylizer_1.TextSize, l_Stylizer_1.Font, l_Stylizer_1.ButtonPadding), 
                Text = l_Localization_2:getText("InitialFlow", "OpenR15Copy"), 
                OnClick = v62.openExperience, 
                Style = "RoundPrimary"
            })
        }), 
        CreateNewCopyButtonPane = if not v62.hasCreatedCopy then v6.createElement(l_Pane_0, {
            Size = UDim2.new(1, 0, 0, v8.getTextHeight(l_Localization_2:getText("InitialFlow", "CreateNewR15Copy"), l_Stylizer_1.TextSize, l_Stylizer_1.Font, l_Stylizer_1.ButtonPanePadding)), 
            LayoutOrder = v68:getNextOrder(), 
            BackgroundTransparency = 1, 
            HorizontalAlignment = Enum.HorizontalAlignment.Right, 
            Layout = Enum.FillDirection.Horizontal, 
            VerticalAlignment = Enum.VerticalAlignment.Center
        }, {
            CreateNewCopyButton = v6.createElement(l_Button_0, {
                Size = v8.getTextSize(l_Localization_2:getText("InitialFlow", "CreateNewR15Copy"), l_Stylizer_1.TextSize, l_Stylizer_1.Font, l_Stylizer_1.ButtonPadding), 
                Text = l_Localization_2:getText("InitialFlow", "CreateNewR15Copy"), 
                OnClick = v62.createNewExperience, 
                Style = "RoundPrimary"
            })
        }) else nil
    };
end;
v24.renderGetStartedPanel = function(v69)
    local l_props_4 = v69.props;
    local l_Stylizer_2 = l_props_4.Stylizer;
    local l_Localization_3 = l_props_4.Localization;
    local v73 = l_LayoutOrderIterator_0.new();
    local v74 = nil;
    local v75 = nil;
    local v76 = nil;
    assert(not v69:isWaitingForInitialData());
    if not v69:isLocalPlace() then
        if not v69:isPublishedR6Experience() then
            assert(v69:isPublishedR15PlayerChoiceExperience());
            v74 = l_Localization_3:getText("InitialFlow", "ExperienceExplanationR15");
            v75 = l_Localization_3:getText("InitialFlow", "ExperienceInstructionsR15");
            v76 = l_Localization_3:getText("InitialFlow", "ExperienceGetStartedButtonR15");
        else
            v74 = l_Localization_3:getText("InitialFlow", "ExperienceExplanationR6", {
                experienceName = v69:getGameName()
            });
            v75 = l_Localization_3:getText("InitialFlow", "ExperienceInstructionsR6");
            v76 = l_Localization_3:getText("InitialFlow", "ExperienceGetStartedButtonR6");
        end;
    else
        v74 = l_Localization_3:getText("InitialFlow", "PlacefileExplanation");
        v75 = l_Localization_3:getText("InitialFlow", "PlacefileInstructions");
        v76 = l_Localization_3:getText("InitialFlow", "PlacefileGetStartedButton");
    end;
    if not l_R15MigShowLinkedText_0 then
        v74 = string.gsub(v74, "%[link1%]", "");
    end;
    return {
        ThumbnailPane = v6.createElement(l_Pane_0, {
            Size = UDim2.new(1, 0, 0, l_Stylizer_2.ThumbnailPanelHeight), 
            LayoutOrder = v73:getNextOrder(), 
            BackgroundTransparency = 1, 
            Spacing = l_Stylizer_2.ThumbnailPanelVerticalTextSpacing, 
            Layout = Enum.FillDirection.Vertical, 
            HorizontalAlignment = Enum.HorizontalAlignment.Left, 
            VerticalAlignment = Enum.VerticalAlignment.Top
        }, {
            ImagePane = v6.createElement(l_Pane_0, {
                Size = UDim2.new(1, 0, 0, l_Stylizer_2.ThumbnailHeight), 
                LayoutOrder = v73:getNextOrder(), 
                BackgroundColor = Color3.fromRGB(0, 0, 0), 
                BackgroundTransparency = 0
            }, {
                v6.createElement("VideoFrame", {
                    Video = "rbxasset://textures/R15Migrator/start-page-anim.mp4", 
                    Size = UDim2.new(1, 0, 1, 0), 
                    Looped = true, 
                    Playing = true
                })
            }), 
            ThumbnailSubTextLabel = v6.createElement(l_TextWithLinks_0, {
                LayoutOrder = v73:getNextOrder(), 
                Text = l_Localization_3:getText("InitialFlow", "ThumbnailSubText"), 
                Size = UDim2.new(1, 0, 0, v8.getTextHeight(l_Localization_3:getText("InitialFlow", "ThumbnailSubText"), l_Stylizer_2.SubTextSize, l_Stylizer_2.Font)), 
                BackgroundTransparency = 1, 
                TextWrapped = true, 
                TextProps = {
                    TextSize = l_Stylizer_2.SubTextSize, 
                    Font = l_Stylizer_2.Font, 
                    TextXAlignment = Enum.TextXAlignment.Left
                }, 
                LinkMap = {}, 
                HorizontalAlignment = Enum.HorizontalAlignment.Left
            })
        }), 
        ExplanationLabelR15Only = if not v69:isPublishedR15PlayerChoiceExperience() then nil else v6.createElement(l_TextLabel_0, {
            LayoutOrder = v73:getNextOrder(), 
            Text = l_Localization_3:getText("InitialFlow", "R15OnlyMessage", {
                experienceName = v69:getGameName()
            }), 
            Size = UDim2.new(1, 0, 0, v8.getTextHeight(l_Localization_3:getText("InitialFlow", "R15OnlyMessage", {
                experienceName = v69:getGameName()
            }), l_Stylizer_2.TextSize, l_Stylizer_2.Font)), 
            BackgroundTransparency = 1, 
            TextWrapped = true, 
            TextSize = l_Stylizer_2.TextSize, 
            Font = l_Stylizer_2.Font, 
            RichText = true, 
            TextXAlignment = Enum.TextXAlignment.Left, 
            TextYAlignment = Enum.TextYAlignment.Center
        }), 
        ExplanationLabel = v6.createElement(l_TextWithLinks_0, {
            LayoutOrder = v73:getNextOrder(), 
            Text = v74, 
            BackgroundTransparency = 1, 
            TextWrapped = true, 
            TextProps = {
                TextSize = l_Stylizer_2.TextSize, 
                Font = l_Stylizer_2.Font, 
                RichText = true, 
                TextXAlignment = Enum.TextXAlignment.Left
            }, 
            LinkMap = {
                ["[link1]"] = {
                    LinkText = l_Localization_3:getText("AdapterPane", "LearnMore"), 
                    LinkCallback = function()
                        l_GuiService_0:OpenBrowserWindow(l_HttpRbxApiService_0:GetDocumentationUrl(""));
                    end
                }
            }, 
            HorizontalAlignment = Enum.HorizontalAlignment.Left
        }), 
        InstructionLabel = v6.createElement(l_TextWithLinks_0, {
            LayoutOrder = v73:getNextOrder(), 
            Text = v75, 
            BackgroundTransparency = 1, 
            TextWrapped = true, 
            TextProps = {
                TextSize = l_Stylizer_2.TextSize, 
                Font = l_Stylizer_2.Font, 
                TextXAlignment = Enum.TextXAlignment.Left
            }, 
            LinkMap = {}, 
            HorizontalAlignment = Enum.HorizontalAlignment.Left
        }), 
        GetStartedButtonPane = v6.createElement(l_Pane_0, {
            Size = UDim2.new(1, 0, 0, v8.getTextHeight(v76, l_Stylizer_2.TextSize, l_Stylizer_2.Font, l_Stylizer_2.ButtonPanePadding)), 
            LayoutOrder = v73:getNextOrder(), 
            BackgroundTransparency = 1, 
            HorizontalAlignment = Enum.HorizontalAlignment.Right, 
            Layout = Enum.FillDirection.Horizontal, 
            VerticalAlignment = Enum.VerticalAlignment.Center
        }, {
            GetStartedButton = v6.createElement(l_Button_0, {
                Size = v8.getTextSize(v76, l_Stylizer_2.TextSize, l_Stylizer_2.Font, l_Stylizer_2.ButtonPadding), 
                Text = v76, 
                OnClick = v69.createNewExperience, 
                Style = "RoundPrimary"
            })
        })
    };
end;
v24.isWaitingForInitialData = function(v77)
    local l_isGettingInitialData_0 = v77.state.isGettingInitialData;
    local l_avatarType_0 = v77.props.avatarType;
    if not l_isGettingInitialData_0 and (not v77.isExperiencePublished or l_avatarType_0) then
        return false;
    else
        return true;
    end;
end;
v24.isPublishedR6Experience = function(v80)
    local l_avatarType_1 = v80.props.avatarType;
    assert(not v80:isWaitingForInitialData());
    if not v80.isExperiencePublished then
        return false;
    else
        return l_avatarType_1 == Enum.GameAvatarType.R6;
    end;
end;
v24.isPublishedR15PlayerChoiceExperience = function(v82)
    local l_avatarType_2 = v82.props.avatarType;
    assert(not v82:isWaitingForInitialData());
    if not v82.isExperiencePublished then
        return false;
    else
        return l_avatarType_2 ~= Enum.GameAvatarType.R6;
    end;
end;
v24.isLocalPlace = function(v84)
    return not v84.isExperiencePublished;
end;
v24.render = function(v85)
    local l_state_0 = v85.state;
    local l_isConverting_0 = l_state_0.isConverting;
    local l_convertedExperience_3 = l_state_0.convertedExperience;
    local l_Stylizer_3 = v85.props.Stylizer;
    local v90 = nil;
    local v91 = false;
    if not l_isConverting_0 then
        if not l_convertedExperience_3 then
            if not v85:isWaitingForInitialData() then
                v90 = v85:renderGetStartedPanel();
            end;
        else
            v91 = true;
            v90 = v85:renderOpenPanel();
        end;
    else
        v90 = v85:renderConvertingPanel();
    end;
    return v6.createElement(l_Pane_0, {
        BackgroundTransparency = 0, 
        BackgroundColor = l_Stylizer_3.BackgroundColor, 
        Padding = {
            Top = l_Stylizer_3.PanePadding.Top
        }, 
        [v6.Ref] = v85.ref
    }, {
        IconPane = if not v91 then nil else v6.createElement(l_Pane_0, {
            Size = UDim2.new(0, (l_state_0.paneSize.X - l_Stylizer_3.Width) / 2, 1, 0)
        }, {
            v6.createElement(l_Image_0, {
                Size = l_Stylizer_3.IconSize, 
                AnchorPoint = Vector2.new(0.5, 0), 
                Position = UDim2.new(0.5, 0, 0, 0), 
                BackgroundTransparency = 1, 
                Image = l_Stylizer_3.CompleteIcon
            })
        }), 
        MainPane = v6.createElement(l_Pane_0, {
            BackgroundTransparency = 0, 
            BackgroundColor = l_Stylizer_3.BackgroundColor, 
            Layout = Enum.FillDirection.Vertical, 
            HorizontalAlignment = Enum.HorizontalAlignment.Center, 
            VerticalAlignment = Enum.VerticalAlignment.Top, 
            Padding = {
                Left = l_Stylizer_3.PanePadding.Left
            }, 
            Spacing = l_Stylizer_3.Spacing
        }, {
            ContentPane = v6.createElement(l_Pane_0, {
                Size = UDim2.new(0, l_Stylizer_3.Width, 1, 0), 
                Spacing = l_Stylizer_3.VerticalTextSpacing, 
                Layout = Enum.FillDirection.Vertical, 
                HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                VerticalAlignment = Enum.VerticalAlignment.Top
            }, v90)
        })
    });
end;
return v7.connect(function(v92)
    return {
        avatarType = v92.AvatarType
    };
end)((l_ContextServices_0.withContext({
    Stylizer = l_ContextServices_0.Stylizer, 
    Localization = l_ContextServices_0.Localization, 
    API = l_ContextServices_0.API, 
    Plugin = l_ContextServices_0.Plugin
})(v24)));
