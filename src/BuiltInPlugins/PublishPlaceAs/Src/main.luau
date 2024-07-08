local l_StudioPublishService_0 = game:GetService("StudioPublishService");
local l_DebugBuiltInPluginModalsNotBlocking_0 = game:GetFastFlag("DebugBuiltInPluginModalsNotBlocking");
return function(v2, v3)
    if v2 then
        local l_Parent_0 = script.Parent.Parent;
        local v5 = require(l_Parent_0.Packages.Roact);
        local v6 = require(l_Parent_0.Packages.Rodux);
        local l_ContextServices_0 = require(l_Parent_0.Packages.Framework).ContextServices;
        local v8 = require(l_Parent_0.Src.Components.ServiceWrapper);
        local v9 = require(l_Parent_0.Src.Components.ScreenSelect);
        local v10 = require(l_Parent_0.Src.Reducers.MainReducer);
        local v11 = require(l_Parent_0.Src.Middleware.MainMiddleware);
        local v12 = require(l_Parent_0.Src.Actions.ResetInfo);
        local v13 = require(l_Parent_0.Src.Resources.MakeTheme);
        local l_SourceStrings_0 = l_Parent_0.Src.Resources.SourceStrings;
        local l_LocalizedStrings_0 = l_Parent_0.Src.Resources.LocalizedStrings;
        local v16 = v6.Store.new(v10, {}, v11);
        local v17 = l_ContextServices_0.Localization.new({
            pluginName = l_Parent_0.Name, 
            stringResourceTable = l_SourceStrings_0, 
            translationResourceTable = l_LocalizedStrings_0
        });
        local v18 = nil;
        local v19 = nil;
        local v20 = require(l_Parent_0.Src.Actions.SetIsPublishing);
        local function v21()
            if v18 then
                v5.unmount(v18);
            end;
            v19.Enabled = false;
        end;
        local function v22()
            v19 = v2:CreateQWidgetPluginGui(l_Parent_0.Name, {
                Size = Vector2.new(960, 720), 
                MinSize = Vector2.new(890, 550), 
                MaxSize = Vector2.new(960, 750), 
                Resizable = true, 
                Modal = not l_DebugBuiltInPluginModalsNotBlocking_0, 
                InitialEnabled = false
            });
            v19.Name = l_Parent_0.Name;
            v19.Title = v17:getText("General", "PublishPlace");
            v19.ZIndexBehavior = Enum.ZIndexBehavior.Sibling;
            v19:BindToClose(function()
                if v18 then
                    v5.unmount(v18);
                end;
                v19.Enabled = false;
            end);
        end;
        local v23 = require(l_Parent_0.Src.Util.CalloutController).new();
        v23:defineCallout("PublishPlaceAsTeamCreateToggleCallout", v17:getText("TcToggleCallout", "Title"), v17:getText("TcToggleCallout", "Description"), (game:GetFastString("TeamCreateLink")));
        local function v28(v24, v25, v26)
            local v27 = v5.createElement(v8, {
                focusGui = v19, 
                localization = v17, 
                mouse = v2:getMouse(), 
                plugin = v2, 
                store = v16, 
                theme = v13(), 
                calloutController = v23
            }, {
                v5.createElement(v9, {
                    OnClose = v21, 
                    IsPublish = v25, 
                    CloseMode = v26, 
                    IsSaveOrPublishAs = v24
                })
            });
            v16:dispatch(v12(v17:getText("General", "UntitledGame"), v24));
            v18 = v5.mount(v27, v19);
            v19.Enabled = true;
        end;
        (function()
            v2.Name = l_Parent_0.Name;
            v22();
            v3.signals["StudioPublishService.OnSaveOrPublishPlaceToRoblox"]:Connect(function(v29, v30, v31)
                if not v30 then
                    v19.Title = v17:getText("General", "SaveGame");
                else
                    v19.Title = v17:getText("General", "PublishGame");
                end;
                v28(v29, v30, v31);
            end);
            v3.signals["StudioPublishService.GamePublishFinished"]:Connect(function(_)
                v16:dispatch(v20(false));
            end);
            v3.signals["StudioPublishService.GamePublishCancelled"]:Connect(function()
                l_StudioPublishService_0:clearUploadNames();
                if v18 then
                    v5.unmount(v18);
                end;
                v19.Enabled = false;
            end);
        end)();
        return ;
    else
        return ;
    end;
end;
