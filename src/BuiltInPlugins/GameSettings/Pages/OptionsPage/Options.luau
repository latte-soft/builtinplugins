local l_Parent_0 = script.Parent;
local l_Parent_1 = script.Parent.Parent.Parent;
local v2 = require(l_Parent_1.Packages.Cryo);
local v3 = require(l_Parent_1.Packages.Roact);
local v4 = require(l_Parent_1.Packages.RoactRodux);
local v5 = require(l_Parent_1.Packages.Framework);
local l_ContextServices_0 = v5.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local v8 = require(l_Parent_1.Src.Components.ToggleButtonWithTitle);
local v9 = require(l_Parent_1.Src.ContextServices.Dialog);
local l_Util_0 = v5.Util;
local l_GetTextSize_0 = l_Util_0.GetTextSize;
local l_LayoutOrderIterator_0 = l_Util_0.LayoutOrderIterator;
local l_UI_0 = v5.UI;
local l_Button_0 = l_UI_0.Button;
local l_HoverArea_0 = l_UI_0.HoverArea;
local l_TitledFrame_0 = l_UI_0.TitledFrame;
local v17 = require(l_Parent_1.Src.Components.Dialog.SimpleDialog);
local v18 = require(l_Parent_1.Src.Components.SettingsPages.SettingsPage);
local v19 = require(l_Parent_1.Src.Actions.AddChange);
local v20 = require(l_Parent_0.Thunks.ShutdownAllServers);
local v21 = require(l_Parent_1.Src.Util.KeyProvider);
local v22 = game:DefineFastString("SpatialVoiceChatLink", "https://create.roblox.com/docs/chat/spatial-voice");
local l_GuiService_0 = game:GetService("GuiService");
local v24 = v21.getVoiceChatEnabledKeyName();
local v25 = v21.getScriptCollaborationEnabledOnServerKeyName();
local v26 = v21.getTeamCreateEnabledKeyName();
local v27 = game:DefineFastFlag("AvatarChatSettingsEnabled2", false);
local l_MoveSpatialVoice_0 = game:GetFastFlag("MoveSpatialVoice");
game:GetFastFlag("GameSettingsRenameOptions");
local v29 = if not game:GetFastFlag("GameSettingsRenameOptions") then script.Name else "Other";
local function v41(v30, v31)
    local v32 = v30:getState();
    local l_game_0 = v32.Metadata.game;
    local l_gameId_0 = v32.Metadata.gameId;
    local l_gameOptionsController_0 = v31.gameOptionsController;
    local v39 = {
        function(v36)
            v36.ScriptCollabEnabled = l_gameOptionsController_0:getScriptCollaborationEnabled(l_game_0);
        end, 
        function(v37)
            v37[v25] = l_gameOptionsController_0:getScriptCollaborationEnabledOnServer(l_game_0);
        end, 
        function(v38)
            v38[v26] = l_gameOptionsController_0:getIsTeamCreateEnabled();
        end
    };
    if v27 == false then
        v39[#v39 + 1] = function(v40)
            v40[v24] = l_gameOptionsController_0:getVoiceChatEnabled(l_gameId_0);
        end;
    end;
    return v39;
end;
local function v51(v42, v43)
    local v44 = v42:getState();
    local l_game_1 = v44.Metadata.game;
    local l_gameId_1 = v44.Metadata.gameId;
    local l_gameOptionsController_1 = v43.gameOptionsController;
    local v49 = {
        function()
            local l_ScriptCollabEnabled_0 = v44.Settings.Changed.ScriptCollabEnabled;
            if l_ScriptCollabEnabled_0 ~= nil then
                l_gameOptionsController_1:setScriptCollaborationEnabled(l_game_1, l_ScriptCollabEnabled_0);
            end;
        end
    };
    if v27 == false then
        v49[#v49 + 1] = function()
            local l_VoiceChatEnabled_0 = v44.Settings.Changed.VoiceChatEnabled;
            if l_VoiceChatEnabled_0 ~= nil then
                l_gameOptionsController_1:setVoiceChatEnabled(l_gameId_1, l_VoiceChatEnabled_0);
            end;
        end;
    end;
    return v49;
end;
local function v55(v52, v53)
    local v54 = {
        ScriptCollabEnabled = v52("ScriptCollabEnabled"), 
        CurrentScriptCollabEnabled = v53.Settings.Current.ScriptCollabEnabled, 
        TeamCreateEnabled = v53.Settings.Current.TeamCreateEnabled or nil, 
        ScriptCollabEnabledOnServer = v53.Settings.Current.ScriptCollaborationEnabledOnServer
    };
    if v27 == false then
        v54.VoiceChatEnabled = v52(v24);
    end;
    return v54;
end;
local function v59(v56, v57)
    local v58 = {
        ScriptCollabEnabledChanged = v56("ScriptCollabEnabled"), 
        dispatchShutdownAllServers = function()
            v57(v20());
        end
    };
    if v27 == false then
        v58.VoiceChatEnabledChanged = v56(v24);
    end;
    return v58;
end;
local v60 = v3.PureComponent:extend(script.Name);
v60.render = function(v61)
    local l_props_0 = v61.props;
    local l_Dialog_0 = l_props_0.Dialog;
    local l_Stylizer_0 = l_props_0.Stylizer;
    local l_Localization_0 = l_props_0.Localization;
    local v66 = l_Localization_0:getText("General", "ButtonShutdownAllServers");
    local v67 = l_GetTextSize_0(v66, l_Stylizer_0.fontStyle.Header.TextSize, l_Stylizer_0.fontStyle.Header.Font, (Vector2.new(math.huge, l_Stylizer_0.button.height)));
    local v68 = UDim2.new(0, math.max(v67.X, l_Stylizer_0.button.width), 0, v67.Y + (l_Stylizer_0.button.height - v67.Y));
    local l_dispatchShutdownAllServers_0 = l_props_0.dispatchShutdownAllServers;
    local v70 = l_props_0.TeamCreateEnabled or false;
    local v71 = l_LayoutOrderIterator_0.new();
    local v72 = v70 and l_props_0.ScriptCollabEnabledOnServer ~= l_props_0.ScriptCollabEnabled;
    local v73 = nil;
    v73 = if v70 then if v72 then l_Localization_0:getText("General", "ServerRestartWarning") else l_Localization_0:getText("General", "ScriptDraftsMode") else l_Localization_0:getText("General", "EnableTeamCreateForDraftsMode");
    return v3.createElement(v18, {
        SettingsLoadJobs = v41, 
        SettingsSaveJobs = v51, 
        Title = l_Localization_0:getText("General", "Category" .. v29), 
        PageId = v29, 
        CreateChildren = function()
            local l_props_1 = v61.props;
            local l_Localization_1 = l_props_1.Localization;
            local v76 = {
                EnableScriptCollab = v3.createElement(v8, {
                    Title = l_Localization_1:getText("General", "TitleScriptDraftsMode"), 
                    Description = v73, 
                    LayoutOrder = v71:getNextOrder(), 
                    Disabled = not v70, 
                    Selected = l_props_1.ScriptCollabEnabled, 
                    ShowWarning = v72, 
                    OnClick = function()
                        l_props_1.ScriptCollabEnabledChanged(not l_props_1.ScriptCollabEnabled);
                    end
                }), 
                ShutdownAllServers = v3.createElement(l_TitledFrame_0, {
                    LayoutOrder = v71:getNextOrder(), 
                    Title = l_Localization_1:getText("General", "TitleShutdownAllServers")
                }, {
                    VerticalLayout = v3.createElement("UIListLayout", {
                        FillDirection = Enum.FillDirection.Vertical, 
                        HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                        SortOrder = Enum.SortOrder.LayoutOrder
                    }), 
                    ShutdownButton = v3.createElement(l_Button_0, {
                        Style = "GameSettingsButton", 
                        Text = v66, 
                        Size = v68, 
                        LayoutOrder = 1, 
                        OnClick = function()
                            if l_Dialog_0.showDialog(v17, {
                                Size = Vector2.new(343, 145), 
                                Title = l_Localization_1:getText("General", "ShutdownDialogHeader"), 
                                Header = l_Localization_1:getText("General", "ShutdownDialogBody"), 
                                Buttons = {
                                    l_Localization_1:getText("General", "ReplyNo"), 
                                    l_Localization_1:getText("General", "ReplyYes")
                                }
                            }):await() then
                                l_dispatchShutdownAllServers_0();
                            end;
                        end
                    }, {
                        v3.createElement(l_HoverArea_0, {
                            Cursor = "PointingHand"
                        })
                    }), 
                    ShutdownButtonDescription = v3.createElement("TextLabel", v2.Dictionary.join(l_Stylizer_0.fontStyle.Subtext, {
                        Size = UDim2.new(1, 0, 0, v67.Y + l_Stylizer_0.shutdownButton.PaddingY), 
                        LayoutOrder = 2, 
                        BackgroundTransparency = 1, 
                        Text = l_Localization_1:getText("General", "StudioShutdownAllServicesDesc"), 
                        TextYAlignment = Enum.TextYAlignment.Center, 
                        TextXAlignment = Enum.TextXAlignment.Left, 
                        TextWrapped = true
                    }))
                })
            };
            if v27 == false and l_MoveSpatialVoice_0 == false then
                v76.EnableVoiceChat = v3.createElement(v8, {
                    Title = l_Localization_1:getText("General", "VoiceChatTitle"), 
                    LinkProps = {
                        Text = l_Localization_1:getText("General", "VoiceChatBody"), 
                        LinkText = l_Localization_1:getText("General", "VoiceChatLink"), 
                        OnLinkClicked = function()
                            l_GuiService_0:OpenBrowserWindow(v22);
                        end
                    }, 
                    LayoutOrder = v71:getNextOrder(), 
                    Disabled = false, 
                    Selected = l_props_1.VoiceChatEnabled, 
                    OnClick = function()
                        l_props_1.VoiceChatEnabledChanged(not l_props_1.VoiceChatEnabled);
                    end
                });
            end;
            return v76;
        end
    });
end;
v60 = l_withContext_0({
    Stylizer = l_ContextServices_0.Stylizer, 
    Localization = l_ContextServices_0.Localization, 
    Dialog = v9
})(v60);
local v77 = require(l_Parent_1.Src.Networking.settingFromState);
v60 = v4.connect(function(v78, _)
    if v78 then
        return (v55(function(v80)
            return v77(v78.Settings, v80);
        end, v78));
    else
        return ;
    end;
end, function(v81)
    return (v59(function(v82)
        return function(v83)
            v81(v19(v82, v83));
        end;
    end, v81));
end)(v60);
v60.LocalizationId = v29;
return v60;
