return function(v0, v1)
    if v0 then
        local l_DebugBuiltInPluginModalsNotBlocking_0 = game:GetFastFlag("DebugBuiltInPluginModalsNotBlocking");
        local l_DeveloperSubscriptionsEnabled_0 = game:GetFastFlag("DeveloperSubscriptionsEnabled");
        local v4 = game:DefineFastFlag("GameSettingsRoactInspector", false);
        local v5 = game:DefineFastFlag("TranslateGameModeratedErrors", false);
        local l_GameSettingsEvictIfLostPerms_0 = game:GetFastFlag("GameSettingsEvictIfLostPerms");
        local l_RunService_0 = game:GetService("RunService");
        local l_Parent_0 = script.Parent.Parent;
        local v9 = require(l_Parent_0.Packages.Roact);
        local v10 = require(l_Parent_0.Packages.Rodux);
        local v11 = require(l_Parent_0.Packages.Cryo);
        local v12 = require(l_Parent_0.Packages.Framework);
        local l_ContextServices_0 = v12.ContextServices;
        local l_Util_0 = v12.Util;
        local l_Promise_0 = l_Util_0.Promise;
        local v16 = require(l_Parent_0.Src.Components.MainView);
        local v17 = require(l_Parent_0.Src.Components.Dialog.SimpleDialog);
        local v18 = require(l_Parent_0.Src.Reducers.MainReducer);
        local v19 = require(l_Parent_0.Src.Components.ExternalServicesWrapper);
        local v20 = require(l_Parent_0.Src.Util.MakeTheme);
        local v21 = require(l_Parent_0.Src.ContextServices.Networking);
        local v22 = require(l_Parent_0.Pages.WorldPage.ContextServices.WorldRootPhysics);
        local v23 = require(l_Parent_0.Src.Controllers.GameInfoController);
        local v24 = require(l_Parent_0.Src.Controllers.GameMetadataController);
        local v25 = require(l_Parent_0.Src.Controllers.GroupMetadataController);
        local v26 = require(l_Parent_0.Pages.PermissionsPage.Controllers.GamePermissionsController);
        local v27 = require(l_Parent_0.Pages.OptionsPage.Controllers.GameOptionsController);
        local v28 = require(l_Parent_0.Pages.CommunicationPage.Controllers.CommunicationController);
        local v29 = require(l_Parent_0.Pages.MonetizationPage.Controllers.MonetizationController);
        local v30 = require(l_Parent_0.Pages.MonetizationPage.Controllers.DevSubsController);
        local v31 = require(l_Parent_0.Pages.PlacesPage.Controllers.PlacesController);
        local v32 = require(l_Parent_0.Src.Controllers.PolicyInfoController);
        local v33 = require(l_Parent_0.Pages.SecurityPage.Controllers.SecurityController);
        local v34 = require(l_Parent_0.Pages.PermissionsPage.Controllers.SocialController);
        local v35 = require(l_Parent_0.Pages.AvatarPage.Controllers.UniverseAvatarController);
        local v36 = require(l_Parent_0.Pages.LocalizationPage.Controllers.LocalizationPageController);
        local v37 = require(l_Parent_0.Src.Util.CurrentStatus);
        local v38 = require(l_Parent_0.Src.Actions.ResetStore);
        local v39 = require(l_Parent_0.Src.Actions.SetCurrentStatus);
        local v40 = require(l_Parent_0.Src.Actions.DiscardChanges);
        local v41 = require(l_Parent_0.Src.Actions.SetGameId);
        local v42 = require(l_Parent_0.Src.Actions.SetGame);
        local v43 = require(l_Parent_0.Src.Util.isEmpty);
        local v44 = require(l_Parent_0.Src.Util.Analytics);
        local v45 = nil;
        local v46 = nil;
        local v47 = nil;
        local v48 = nil;
        local v49 = v22.new();
        local v50 = {};
        local v51 = v21.new();
        local v52 = v23.new(v51:get());
        local v53 = v24.new(v51:get());
        local v54 = v25.new(v51:get());
        local v55 = v26.new(v51:get());
        local v56 = v29.new(v51:get());
        local v57 = not not l_DeveloperSubscriptionsEnabled_0 and v30.new(v51:get()) or nil;
        local v58 = v27.new(v51:get());
        local v59 = v28.new(v51:get());
        local v60 = v33.new(v51:get());
        local v61 = v34.new(v51:get());
        local v62 = v35.new(v51:get());
        local v63 = v31.new(v51:get());
        local v64 = v36.new(v51:get());
        local v65 = v32.new(v51:get());
        v50.networking = v51:get();
        v50.worldRootPhysicsController = v49:get();
        v50.gameInfoController = v52;
        v50.gameMetadataController = v53;
        v50.groupMetadataController = v54;
        v50.gamePermissionsController = v55;
        v50.gameOptionsController = v58;
        v50.communicationController = v59;
        v50.monetizationController = v56;
        v50.devSubsController = v57;
        v50.universePermissionsController = v60;
        v50.socialController = v61;
        v50.universeAvatarController = v62;
        v50.placesController = v63;
        v50.localizationPageController = v64;
        v50.policyInfoController = v65;
        local v66 = v10.Store.new(v18, nil, {
            (l_Util_0.ThunkWithArgsMiddleware(v50))
        });
        local l_Open_0 = v37.Open;
        local v68 = l_ContextServices_0.Localization.new({
            pluginName = l_Parent_0.Name, 
            stringResourceTable = l_Parent_0.Src.Resources.SourceStrings, 
            translationResourceTable = l_Parent_0.Src.Resources.LocalizedStrings, 
            libraries = {
                [v12.Resources.LOCALIZATION_PROJECT_NAME] = {
                    stringResourceTable = v12.Resources.SourceStrings, 
                    translationResourceTable = v12.Resources.LocalizedStrings
                }
            }
        });
        if v5 then
            v50.localization = v68;
        end;
        local function v72(v69)
            if v46 then
                for _, v71 in pairs(v46:GetDescendants()) do
                    if v71:IsA("GuiObject") then
                        v71.Active = v69;
                    end;
                end;
            end;
        end;
        local function v82(v73, v74)
            return l_Promise_0.new(function(v75, _)
                spawn(function()
                    v72(false);
                    local v77 = nil;
                    local v78 = v74.Size or Vector2.new(473, 197);
                    local v79 = nil;
                    v79 = v0:CreateQWidgetPluginGui(v74.Title, {
                        Size = v78, 
                        Modal = not l_DebugBuiltInPluginModalsNotBlocking_0
                    });
                    v79.Enabled = true;
                    v79.Title = v74.Title;
                    local v81 = v9.createElement(v19, {
                        theme = v20(), 
                        mouse = v0:GetMouse(), 
                        localization = v68, 
                        pluginGui = v46, 
                        plugin = v0
                    }, {
                        Content = v9.createElement(v73, v11.Dictionary.join(v74, {
                            OnResult = function(v80)
                                v9.unmount(v77);
                                v79:Destroy();
                                v72(true);
                                v75(v80);
                            end
                        }))
                    });
                    v79:BindToClose(function()
                        v9.unmount(v77);
                        v79:Destroy();
                        v72(true);
                        v75(false);
                    end);
                    v77 = v9.mount(v81, v79);
                end);
            end);
        end;
        local function _(v83)
            if v47 then
                local v84 = tick() - v47;
                v47 = nil;
                v44.onCloseEvent(not v83 and "Cancel" or "Save", v84);
            end;
        end;
        local function v105(v86)
            local v87 = v66:getState();
            local l_Status_0 = v87.Status;
            local function v91()
                v66:dispatch(v40());
                v66:dispatch(v39(v37.Closed));
                v46.Enabled = false;
                v9.unmount(v45);
                if not (not v4 or not v48) then
                    v48:destroy();
                end;
                local l_v86_0 = v86;
                if v47 then
                    local v90 = tick() - v47;
                    v47 = nil;
                    v44.onCloseEvent(not l_v86_0 and "Cancel" or "Save", v90);
                end;
            end;
            if not (l_Status_0 == v37.Working) or v86 then
                if l_Status_0 ~= v37.Closed then
                    if not (l_Status_0 == v37.Error) or not v86 then
                        local l_Changed_0 = v87.Settings.Changed;
                        if not (l_Changed_0 and not v43(l_Changed_0)) or v86 then
                            v66:dispatch(v39(v37.Closed));
                            v46.Enabled = false;
                            v9.unmount(v45);
                            if not (not v4 or not v48) then
                                v48:destroy();
                            end;
                            if v47 then
                                local v93 = tick() - v47;
                                v47 = nil;
                                v44.onCloseEvent(not v86 and "Cancel" or "Save", v93);
                            end;
                        else
                            local v94 = nil;
                            v94 = {
                                Size = Vector2.new(343, 145), 
                                Title = v68:getText("General", "CancelDialogHeader"), 
                                Header = v68:getText("General", "CancelDialogBody"), 
                                Buttons = {
                                    v68:getText("General", "ReplyNo"), 
                                    v68:getText("General", "ReplyYes")
                                }
                            };
                            local l_v17_0 = v17;
                            local l_v94_0 = v94;
                            l_Promise_0.new(function(v97, _)
                                spawn(function()
                                    v72(false);
                                    local v99 = nil;
                                    local v100 = l_v94_0.Size or Vector2.new(473, 197);
                                    local v101 = nil;
                                    v101 = v0:CreateQWidgetPluginGui(l_v94_0.Title, {
                                        Size = v100, 
                                        Modal = not l_DebugBuiltInPluginModalsNotBlocking_0
                                    });
                                    v101.Enabled = true;
                                    v101.Title = l_v94_0.Title;
                                    local v103 = v9.createElement(v19, {
                                        theme = v20(), 
                                        mouse = v0:GetMouse(), 
                                        localization = v68, 
                                        pluginGui = v46, 
                                        plugin = v0
                                    }, {
                                        Content = v9.createElement(l_v17_0, v11.Dictionary.join(l_v94_0, {
                                            OnResult = function(v102)
                                                v9.unmount(v99);
                                                v101:Destroy();
                                                v72(true);
                                                v97(v102);
                                            end
                                        }))
                                    });
                                    v101:BindToClose(function()
                                        v9.unmount(v99);
                                        v101:Destroy();
                                        v72(true);
                                        v97(false);
                                    end);
                                    v99 = v9.mount(v103, v101);
                                end);
                            end):andThen(function(v104)
                                if not v104 then
                                    v66:dispatch(v39(v37.Open));
                                    if not v46.Enabled then
                                        v46.Enabled = true;
                                    end;
                                    return ;
                                else
                                    v91();
                                    return ;
                                end;
                            end);
                            return ;
                        end;
                    else
                        v66:dispatch(v39(v37.Open));
                        return ;
                    end;
                end;
                return ;
            else
                v91();
                return ;
            end;
        end;
        local function v108()
            local l_Name_0 = l_Parent_0.Name;
            local v107 = Vector2.new(960, 600);
            v46 = v0:CreateQWidgetPluginGui(l_Name_0, {
                Size = v107, 
                MinSize = v107, 
                Resizable = true, 
                Modal = not l_DebugBuiltInPluginModalsNotBlocking_0, 
                InitialEnabled = false
            });
            v46.Name = l_Parent_0.Name;
            v46.Title = v68:getText("General", "PluginName");
            v46.ZIndexBehavior = Enum.ZIndexBehavior.Sibling;
            v46:BindToClose(function()
                v105(false);
            end);
        end;
        local function v113(v109, v110, v111)
            if l_GameSettingsEvictIfLostPerms_0 then
                game:GetService("TeamCreateService"):CloseGameIfUserDoesntHavePerms();
            end;
            if v66 and v66:getState().Status ~= v37.Closed then
                return ;
            else
                local v112 = v9.createElement(v19, {
                    store = v66, 
                    showDialog = v82, 
                    theme = v20(), 
                    mouse = v0:GetMouse(), 
                    localization = v68, 
                    pluginGui = v46, 
                    plugin = v0, 
                    worldRootPhysics = v49
                }, {
                    mainView = v9.createElement(v16, {
                        OnClose = v105, 
                        FirstSelectedId = v111
                    })
                });
                v66:dispatch(v38());
                v66:dispatch(v41(v109));
                v66:dispatch(v42(v110));
                v66:dispatch(v39(v37.Open));
                v45 = v9.mount(v112, v46);
                v46.Enabled = true;
                if not (not v4 or not game:GetService("StudioService"):HasInternalPermission()) then
                    v48 = v12.DeveloperTools.forPlugin("Game Settings", v0);
                    v48:addRoactTree("Roact tree", v45, v9);
                end;
                v44.onOpenEvent(v0:GetStudioUserId(), v109);
                v47 = tick();
                return ;
            end;
        end;
        (function()
            v0.Name = l_Parent_0.Name;
            local l_mainButton_0 = v1.mainButton;
            if not l_RunService_0:IsEdit() then
                l_mainButton_0.Enabled = false;
                return ;
            else
                v108();
                l_mainButton_0.ClickableWhenViewportHidden = true;
                l_mainButton_0.Enabled = true;
                v1.mainButtonClickedSignal:Connect(function()
                    v113(game.GameId, game);
                end);
                v66.changed:connect(function(v115)
                    if v115.Status ~= l_Open_0 then
                        l_mainButton_0:SetActive(v115.Status ~= v37.Closed);
                        v72(v115.Status ~= v37.Working);
                        l_Open_0 = v115.Status;
                    end;
                end);
                v1.signals["StudioService.OnOpenGameSettings"]:Connect(function(v116)
                    v113(game.GameId, game, v116);
                end);
                return ;
            end;
        end)();
        return ;
    else
        return ;
    end;
end;
