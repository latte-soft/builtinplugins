local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Roact);
local v2 = require(l_Parent_0.Packages.RoactRodux);
local v3 = require(l_Parent_0.Packages.Framework);
local l_ContextServices_0 = v3.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_ScrollingFrame_0 = v3.UI.ScrollingFrame;
local v7 = require(l_Parent_0.Src.Network.Requests.SettingsImpl);
local v8 = require(l_Parent_0.Src.Resources.Constants);
local l_Separator_0 = v3.UI.Separator;
local v10 = require(l_Parent_0.Src.Components.Menu.MenuBar);
local v11 = require(l_Parent_0.Src.Components.Footer);
local v12 = require(l_Parent_0.Src.Components.BasicInfo);
local v13 = require(l_Parent_0.Src.Actions.AddChange);
local v14 = require(l_Parent_0.Src.Actions.SetIsPublishing);
local v15 = require(l_Parent_0.Src.Actions.SetScreen);
local v16 = require(l_Parent_0.Src.Actions.SetPublishInfo);
local v17 = require(l_Parent_0.Src.Thunks.LoadGroups);
local v18 = require(l_Parent_0.Src.Thunks.LoadDataSharingDefault);
local l_shouldShowDevPublishLocations_0 = require(l_Parent_0.Src.Util.PublishPlaceAsUtilities).shouldShowDevPublishLocations;
local l_sendAnalyticsToKibana_0 = require(l_Parent_0.Src.Util.PublishPlaceAsUtilities).sendAnalyticsToKibana;
local l_game_FastInt_0 = game:GetFastInt("LuobuDevPublishAnalyticsHundredthsPercentage");
local v22 = require(l_Parent_0.Src.Flags.getFFlagCAP1107);
local l_TextInputDialog_0 = v3.UI.TextInputDialog;
local v24 = require(l_Parent_0.Src.Util.KeyProvider);
local v25 = v24.getOptInLocationsKeyName();
local v26 = v24.getChinaKeyName();
local v27 = v24.getLuobuStudioDevPublishKeyName();
local v28 = v24.getSelectedKeyName();
local v29 = v24.getCreateNewGameKeyName();
local l_StudioPublishService_0 = game:GetService("StudioPublishService");
local v31 = {
    "BasicInfo"
};
local v32 = v1.PureComponent:extend("ScreenCreateNewGame");
v32.init = function(v33)
    v33.state = {
        selected = 1, 
        showEmailDialog = false, 
        bottomText = ""
    };
    v33.finishedConnection = nil;
    v33.changeSelection = function(v34)
        v33:setState({
            selected = v34
        });
    end;
    v33.scrollingFrameRef = v1.createRef();
    v33.shouldShowEmailDialog = function()
        local l_ChangedOptInLocations_0 = v33.props.ChangedOptInLocations;
        if l_ChangedOptInLocations_0 and l_ChangedOptInLocations_0[v26] ~= nil then
            return l_ChangedOptInLocations_0[v26];
        else
            return false;
        end;
    end;
end;
v32.didMount = function(v36)
    v36.finishedConnection = l_StudioPublishService_0.GamePublishFinished:connect(function(v37, v38)
        if v37 and v38 ~= 0 then
            v36.props.OpenPublishSuccessfulPage(v36.props.Changed);
            return ;
        else
            v36.props.OpenPublishFailPage(v36.props.Changed);
            return ;
        end;
    end);
    v36.props.DispatchLoadGroups();
    if v22() then
        v36.props.DispatchDataSharingDefault();
    end;
end;
v32.willUnmount = function(v39)
    if v39.finishedConnection then
        v39.finishedConnection:disconnect();
    end;
end;
v32.render = function(v40)
    local l_props_0 = v40.props;
    local l_Stylizer_0 = l_props_0.Stylizer;
    local l_Localization_0 = l_props_0.Localization;
    local v44 = l_props_0.API:get();
    local l_OnClose_0 = l_props_0.OnClose;
    local l_ReadyToSave_0 = l_props_0.ReadyToSave;
    local l_IsPublishing_0 = l_props_0.IsPublishing;
    local l_Changed_0 = l_props_0.Changed;
    local l_IsPublish_0 = l_props_0.IsPublish;
    local l_dispatchSetIsPublishing_0 = l_props_0.dispatchSetIsPublishing;
    local l_selected_0 = v40.state.selected;
    local _ = nil;
    local v56 = {
        MenuBar = v1.createElement(v10, {
            Entries = v31, 
            Selected = l_selected_0, 
            SelectionChanged = v40.changeSelection
        }), 
        Separator = v1.createElement(l_Separator_0, {
            Position = UDim2.new(0, l_Stylizer_0.MENU_BAR_WIDTH, 0.5, 0), 
            DominantAxis = Enum.DominantAxis.Height
        }), 
        Page = v1.createElement("Frame", {
            BackgroundTransparency = 1, 
            Position = UDim2.new(0, l_Stylizer_0.MENU_BAR_WIDTH, 0, 0), 
            Size = UDim2.new(1, -l_Stylizer_0.MENU_BAR_WIDTH, 1, -l_Stylizer_0.FOOTER_HEIGHT)
        }, {
            v1.createElement(v12, {
                IsPublish = l_IsPublish_0
            })
        }), 
        Footer = v1.createElement(v11, {
            MainButton = {
                Name = not l_IsPublish_0 and "Save" or "Create", 
                Active = l_ReadyToSave_0 and not l_IsPublishing_0, 
                OnActivated = function()
                    if not l_shouldShowDevPublishLocations_0() or not v40.shouldShowEmailDialog() then
                        if l_shouldShowDevPublishLocations_0() then
                            l_sendAnalyticsToKibana_0(v27, l_game_FastInt_0, v29, {
                                [v25] = v26, 
                                [v28] = false
                            });
                        end;
                        l_dispatchSetIsPublishing_0(true);
                        v7.saveAll(l_Changed_0, l_Localization_0, v44, nil, l_IsPublish_0, l_props_0.OwnedGroups);
                        return ;
                    else
                        v40:setState({
                            showEmailDialog = true
                        });
                        return ;
                    end;
                end
            }, 
            OnClose = l_OnClose_0, 
            NextScreen = v8.SCREENS.CHOOSE_GAME, 
            NextScreenText = "UpdateExistingGame", 
            IsPublish = l_IsPublish_0
        }, {
            EmailDialog = v1.createElement(l_TextInputDialog_0, {
                Enabled = v40.state.showEmailDialog, 
                Size = Vector2.new(l_Stylizer_0.emailDialog.Size.X, l_Stylizer_0.emailDialog.Size.Y), 
                Title = l_Localization_0:getText(v25, "EmailDialogHeader"), 
                Header = l_Localization_0:getText(v25, "EmailDialogHeader"), 
                Buttons = {
                    {
                        Key = "Submit", 
                        Text = l_Localization_0:getText("Button", "Submit")
                    }, 
                    {
                        Key = "Cancel", 
                        Text = l_Localization_0:getText("Button", "Cancel")
                    }
                }, 
                Body = l_Localization_0:getText(v25, "EmailDialogBody"), 
                Description = l_Localization_0:getText(v25, "EmailDialogDescription"), 
                TextInput = {
                    {
                        PlaceholderText = l_Localization_0:getText(v25, "EmailAddress")
                    }, 
                    {
                        PlaceholderText = l_Localization_0:getText(v25, "ConfirmEmailAddress"), 
                        BottomText = v40.state.bottomText
                    }
                }, 
                OnClose = function()
                    v40:setState({
                        showEmailDialog = false, 
                        bottomText = ""
                    });
                end, 
                OnButtonPressed = function(v53, v54, v55)
                    if not (v53 == "Submit") then
                        v40:setState({
                            showEmailDialog = false, 
                            bottomText = ""
                        });
                        return ;
                    else
                        l_sendAnalyticsToKibana_0(v27, l_game_FastInt_0, v29, {
                            [v25] = v26, 
                            [v28] = true
                        });
                        if v54 == v55 then
                            v40:setState({
                                showEmailDialog = false, 
                                bottomText = ""
                            });
                            l_dispatchSetIsPublishing_0(true);
                            v7.saveAll(l_Changed_0, l_Localization_0, v44, v54, l_IsPublish_0, l_props_0.OwnedGroups);
                            return ;
                        else
                            v40:setState({
                                bottomText = l_Localization_0:getText(v25, "ErrorEmailNotEqual")
                            });
                            return ;
                        end;
                    end;
                end
            })
        })
    };
    if not (not v22() and not l_IsPublish_0) then
        v56.Page = v1.createElement(l_ScrollingFrame_0, {
            BackgroundTransparency = 1, 
            Position = UDim2.new(0, l_Stylizer_0.MENU_BAR_WIDTH, 0, 0), 
            Size = UDim2.new(1, -l_Stylizer_0.MENU_BAR_WIDTH, 1, -l_Stylizer_0.FOOTER_HEIGHT), 
            CanvasSize = UDim2.new(1, -l_Stylizer_0.MENU_BAR_WIDTH, 0, 0), 
            AutomaticCanvasSize = Enum.AutomaticSize.Y, 
            [v1.Ref] = v40.scrollingFrameRef
        }, {
            v1.createElement(v12, {
                IsPublish = l_IsPublish_0
            })
        });
    end;
    return v1.createElement("Frame", {
        Size = UDim2.new(1, 0, 1, 0), 
        BackgroundColor3 = l_Stylizer_0.backgroundColor
    }, v56);
end;
return v2.connect(function(v57, _)
    local l_NewGameSettings_0 = v57.NewGameSettings;
    local v60 = nil;
    if v22() then
        v60 = v57.GroupsHavePermission.groupInfo.ownedGroups;
    end;
    return {
        Changed = l_NewGameSettings_0.changed, 
        ReadyToSave = next(l_NewGameSettings_0.errors) == nil, 
        IsPublishing = v57.PublishedPlace.isPublishing, 
        ChangedOptInLocations = l_NewGameSettings_0.changed.OptInLocations, 
        OwnedGroups = v60
    };
end, function(v61)
    return {
        OpenPublishSuccessfulPage = function(v62)
            v61(v16({
                id = game.GameId, 
                name = v62.name, 
                parentGameName = v62.name
            }));
            v61(v15(v8.SCREENS.PUBLISH_SUCCESSFUL));
        end, 
        OpenPublishFailPage = function(v63)
            v61(v16({
                id = game.GameId, 
                name = v63.name, 
                parentGameName = v63.name, 
                parentGameId = 0, 
                settings = v63, 
                failed = true
            }));
            v61(v15(v8.SCREENS.PUBLISH_FAIL));
        end, 
        DispatchLoadGroups = function()
            v61(v17());
        end, 
        DispatchDataSharingDefault = function()
            assert(v22());
            v61(v18());
        end, 
        dispatchSetIsPublishing = function(v64)
            v61(v14(v64));
        end, 
        dispatchSetExistingUniverseConfiguration = function(v65)
            v61(v13("name", v65.name));
            if v65.description then
                v61(v13("description", v65.description));
            end;
            if v65.genre then
                v61(v13("genre", v65.genre));
            end;
        end
    };
end)((l_withContext_0({
    Stylizer = l_ContextServices_0.Stylizer, 
    Localization = l_ContextServices_0.Localization, 
    API = l_ContextServices_0.API
})(v32)));
