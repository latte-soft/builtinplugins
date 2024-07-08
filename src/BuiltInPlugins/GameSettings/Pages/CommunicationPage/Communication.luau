local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Roact);
local v2 = require(l_Parent_0.Packages.RoactRodux);
local v3 = require(l_Parent_0.Packages.Framework);
local v4 = require(l_Parent_0.Src.Flags.getFFlagGameSettingsFixMoreLayoutIssues)();
local l_ContextServices_0 = v3.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local v7 = require(l_Parent_0.Src.Components.ToggleButtonWithTitle);
local v8 = require(l_Parent_0.Src.ContextServices.Dialog);
local l_LayoutOrderIterator_0 = v3.Util.LayoutOrderIterator;
local v10 = require(l_Parent_0.Src.Components.SettingsPages.SettingsPage);
local v11 = require(l_Parent_0.Src.Actions.AddChange);
local v12 = require(l_Parent_0.Src.Util.KeyProvider);
local l_GuiService_0 = game:GetService("GuiService");
local v14 = game:DefineFastFlag("AvatarChatSettingsAudioLinkEnabled", false);
local v15 = game:DefineFastFlag("AvatarChatSettingsVideoLinkEnabled", false);
local l_AvatarChatSettingsEnabled2_0 = game:GetFastFlag("AvatarChatSettingsEnabled2");
local v17 = game:DefineFastFlag("AvatarChatMicCameraCouple", false);
local v18 = game:DefineFastString("AvatarChatSettingsAudioLink", "https://developer.roblox.com/articles/chat-with-avatars-audio");
local v19 = game:DefineFastString("AvatarChatSettingsVideoLink", "https://developer.roblox.com/articles/chat-with-avatars-video");
local v20 = game:DefineFastString("SpatialVoiceChatLink", "https://create.roblox.com/docs/chat/spatial-voice");
local v21 = v12.getAvatarChatAudioEnabledKeyName();
local v22 = v12.getAvatarChatVideoEnabledKeyName();
local l_Name_0 = script.Name;
local function v30(v24, v25)
    local l_gameId_0 = v24:getState().Metadata.gameId;
    local l_communicationController_0 = v25.communicationController;
    return {
        function(v28)
            local v29 = l_communicationController_0:getAvatarChatSettings(l_gameId_0);
            v28[v21] = v29.audioEnabled;
            v28[v22] = v29.videoEnabled;
        end
    };
end;
local function v38(v31, v32)
    local v33 = v31:getState();
    local l_gameId_1 = v33.Metadata.gameId;
    local l_communicationController_1 = v32.communicationController;
    return {
        function()
            local l_AvatarChatAudioEnabled_0 = v33.Settings.Changed.AvatarChatAudioEnabled;
            local l_AvatarChatVideoEnabled_0 = v33.Settings.Changed.AvatarChatVideoEnabled;
            if not (l_AvatarChatAudioEnabled_0 == nil) or l_AvatarChatVideoEnabled_0 ~= nil then
                l_communicationController_1:setAvatarChatSettings(l_gameId_1, l_AvatarChatAudioEnabled_0, l_AvatarChatVideoEnabled_0);
            end;
        end
    };
end;
local _ = function(v39, _)
    return {
        AvatarChatAudioEnabled = v39(v21), 
        AvatarChatVideoEnabled = v39(v22)
    };
end;
local _ = function(v42, _)
    return {
        AvatarChatAudioEnabledChanged = v42(v21), 
        AvatarChatVideoEnabledChanged = v42(v22)
    };
end;
local v45 = v1.PureComponent:extend(script.Name);
v45.render = function(v46)
    local l_props_0 = v46.props;
    local l_Localization_0 = l_props_0.Localization;
    local v49 = l_LayoutOrderIterator_0.new();
    local v50 = false;
    if not (not v17 or l_props_0.AvatarChatAudioEnabled) then
        v50 = true;
    end;
    return v1.createElement(v10, {
        SettingsLoadJobs = v30, 
        SettingsSaveJobs = v38, 
        Title = l_Localization_0:getText("General", "Category" .. l_Name_0), 
        PageId = l_Name_0, 
        CreateChildren = function()
            local l_props_1 = v46.props;
            local l_Localization_1 = l_props_1.Localization;
            if not l_AvatarChatSettingsEnabled2_0 then
                return {
                    EnableAvatarChatAudio = v1.createElement(v7, {
                        Title = l_Localization_1:getText("General", "VoiceChatTitle"), 
                        LinkProps = {
                            Text = l_Localization_1:getText("General", "VoiceChatBody"), 
                            LinkText = l_Localization_1:getText("General", "VoiceChatLink"), 
                            OnLinkClicked = function()
                                l_GuiService_0:OpenBrowserWindow(v20);
                            end
                        }, 
                        LayoutOrder = v49:getNextOrder(), 
                        Disabled = false, 
                        Selected = l_props_1.AvatarChatAudioEnabled, 
                        OnClick = function()
                            l_props_1.AvatarChatAudioEnabledChanged(not l_props_1.AvatarChatAudioEnabled);
                        end
                    })
                };
            else
                local v53 = {
                    Title = l_Localization_1:getText("AvatarChat", "AudioTitle"), 
                    LayoutOrder = v49:getNextOrder(), 
                    Disabled = false, 
                    Selected = l_props_1.AvatarChatAudioEnabled, 
                    OnClick = function()
                        l_props_1.AvatarChatAudioEnabledChanged(not l_props_1.AvatarChatAudioEnabled);
                        if not (not v17 or not l_props_1.AvatarChatVideoEnabled) then
                            l_props_1.AvatarChatVideoEnabledChanged(false);
                        end;
                    end
                };
                if v14 then
                    v53.LinkProps = {
                        Text = l_Localization_1:getText("AvatarChat", "AudioBody"), 
                        LinkText = l_Localization_1:getText("General", "LearnMoreLink"), 
                        OnLinkClicked = function()
                            l_GuiService_0:OpenBrowserWindow(v18);
                        end
                    };
                end;
                local v54 = {
                    Title = l_Localization_1:getText("AvatarChat", "VideoTitle"), 
                    LayoutOrder = v49:getNextOrder(), 
                    Disabled = v50, 
                    Selected = (not v17 or l_props_1.AvatarChatAudioEnabled) and l_props_1.AvatarChatVideoEnabled, 
                    OnClick = function()
                        l_props_1.AvatarChatVideoEnabledChanged(not l_props_1.AvatarChatVideoEnabled);
                    end
                };
                if v15 then
                    v54.LinkProps = {
                        Text = l_Localization_1:getText("AvatarChat", "VideoBody"), 
                        LinkText = l_Localization_1:getText("General", "LearnMoreLink"), 
                        OnLinkClicked = function()
                            l_GuiService_0:OpenBrowserWindow(v19);
                        end
                    };
                end;
                return {
                    EnableAvatarChatAudio = v1.createElement(v7, v53), 
                    EnableAvatarChatVideo = v1.createElement(v7, v54)
                };
            end;
        end
    });
end;
v45 = l_withContext_0({
    Stylizer = if not v4 then l_ContextServices_0.Stylizer else nil, 
    Localization = l_ContextServices_0.Localization, 
    Dialog = v8
})(v45);
local v55 = require(l_Parent_0.Src.Networking.settingFromState);
v45 = v2.connect(function(v56, _)
    if v56 then
        local function v59(v58)
            return v55(v56.Settings, v58);
        end;
        return {
            AvatarChatAudioEnabled = v59(v21), 
            AvatarChatVideoEnabled = v59(v22)
        };
    else
        return ;
    end;
end, function(v60)
    local function v63(v61)
        return function(v62)
            v60(v11(v61, v62));
        end;
    end;
    return {
        AvatarChatAudioEnabledChanged = v63(v21), 
        AvatarChatVideoEnabledChanged = v63(v22)
    };
end)(v45);
v45.LocalizationId = l_Name_0;
return v45;
