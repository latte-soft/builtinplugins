local l_StudioService_0 = game:GetService("StudioService");
local l_StudioPublishService_0 = game:GetService("StudioPublishService");
local l_PublishTags_0 = require(script:FindFirstAncestor("R15Migrator").Src.Resources.Constants).PublishTags;
local l_DebugBuiltInPluginModalsNotBlocking_0 = game:GetFastFlag("DebugBuiltInPluginModalsNotBlocking");
return function(v4, v5)
    if v4 then
        require(script.Parent.defineLuaFlags);
        local l_script_FirstAncestor_0 = script:FindFirstAncestor("R15Migrator");
        local v7 = require(l_script_FirstAncestor_0.Packages.Roact);
        local v8 = require(l_script_FirstAncestor_0.Packages.Framework);
        local l_CrossPluginCommunication_0 = v8.Util.CrossPluginCommunication;
        local v10 = require(l_script_FirstAncestor_0.Src.Resources.Constants);
        local v11 = require(l_script_FirstAncestor_0.Src.PublishBlockedPlugin);
        local v12 = require(l_script_FirstAncestor_0.Src.PublishWarningPlugin);
        local v13 = require(l_script_FirstAncestor_0.Src.Util.PublishTagging);
        local v14 = require(l_script_FirstAncestor_0.Src.Util.prepareToPublish);
        local v15 = require(l_script_FirstAncestor_0.Src.Contexts.NetworkInterface).new();
        local v16 = require(l_script_FirstAncestor_0.Src.Resources.createAnalyticsHandlers);
        local v17 = nil;
        local v18 = nil;
        local v19 = false;
        local function v20()
            if v17 then
                v7.unmount(v17);
            end;
            v18.Enabled = false;
        end;
        local function v21()
            if v17 then
                v7.unmount(v17);
            end;
            v18.Enabled = false;
            v14();
            if not v19 then
                l_StudioService_0:ShowPublishToRoblox();
            else
                l_StudioPublishService_0:ShowSaveOrPublishPlaceToRoblox(false, true, Enum.StudioCloseMode.None);
            end;
            l_CrossPluginCommunication_0.new(v10.CrossPluginCommunicationName):Fire(v10.CrossPluginCommunicationInstructions.Published);
        end;
        local l_ContextServices_0 = v8.ContextServices;
        local v23 = l_ContextServices_0.Localization.new({
            pluginName = l_script_FirstAncestor_0.Name, 
            stringResourceTable = l_script_FirstAncestor_0.Src.Resources.Localization.SourceStrings, 
            translationResourceTable = l_script_FirstAncestor_0.Src.Resources.Localization.LocalizedStrings
        });
        local v24 = l_ContextServices_0.Analytics.new(v16);
        local function v25()
            v18 = v4:CreateQWidgetPluginGui("PublishBlocked", {
                Size = Vector2.new(400, 160), 
                Resizable = false, 
                Modal = not l_DebugBuiltInPluginModalsNotBlocking_0, 
                InitialEnabled = false
            });
            v18.Name = l_script_FirstAncestor_0.Name;
            v18.Title = v23:getText("PublishingBlocked", "Title");
            v18.ZIndexBehavior = Enum.ZIndexBehavior.Sibling;
            v18:BindToClose(function()
                if v17 then
                    v7.unmount(v17);
                end;
                v18.Enabled = false;
            end);
        end;
        local function v28(v26)
            local _ = nil;
            v17 = v7.mount(if not v26 then v7.createElement(v12, {
                OnCancel = v20, 
                OnContinue = v21, 
                PluginLoaderContext = v5, 
                Localization = v23
            }) else v7.createElement(v11, {
                OnClose = v20, 
                PluginLoaderContext = v5, 
                Localization = v23
            }), v18);
            v18.Enabled = true;
        end;
        local function _()
            v4.Name = l_script_FirstAncestor_0.Name;
            v25();
            v5.signals["StudioPublishService.OnPublishAttempt"]:Connect(function(v29)
                local v30 = v13:publishingIsBlocked();
                if v30 ~= nil then
                    local v31 = false;
                    local v32 = {};
                    local v33 = false;
                    for v34, v35 in l_PublishTags_0, nil, nil do
                        table.insert(v32, {
                            name = v35.Name, 
                            blocking = v13[v34]:isBlocking()
                        });
                    end;
                    v31 = v31 or v30 ~= 0;
                    v33 = v15:getAvatarType(game) == Enum.GameAvatarType.R6;
                    table.insert(v32, {
                        name = "AvatarTypeIsR6", 
                        blocking = v33
                    });
                    v31 = v31 or v33;
                    v24:getHandler("onPublish")(v32);
                    v19 = v29;
                    v28(v31);
                end;
            end);
        end;
        v4.Name = l_script_FirstAncestor_0.Name;
        v25();
        v5.signals["StudioPublishService.OnPublishAttempt"]:Connect(function(v37)
            local v38 = v13:publishingIsBlocked();
            if v38 ~= nil then
                local v39 = false;
                local v40 = {};
                local v41 = false;
                for v42, v43 in l_PublishTags_0, nil, nil do
                    table.insert(v40, {
                        name = v43.Name, 
                        blocking = v13[v42]:isBlocking()
                    });
                end;
                v39 = v39 or v38 ~= 0;
                v41 = v15:getAvatarType(game) == Enum.GameAvatarType.R6;
                table.insert(v40, {
                    name = "AvatarTypeIsR6", 
                    blocking = v41
                });
                v39 = v39 or v41;
                v24:getHandler("onPublish")(v40);
                v19 = v37;
                v28(v39);
            end;
        end);
        return ;
    else
        return ;
    end;
end;
