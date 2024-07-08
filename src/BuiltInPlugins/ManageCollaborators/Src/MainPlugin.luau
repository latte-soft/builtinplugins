local v0 = game:getFastFlag("ImprovePluginSpeed_ManageCollaborators");
local l_Parent_0 = script.Parent.Parent;
local v2 = require(l_Parent_0.Packages.Roact);
local v3 = require(l_Parent_0.Packages.Rodux);
local v4 = require(l_Parent_0.Packages.Framework);
local l_Util_0 = v4.Util;
local l_CrossPluginCommunication_0 = l_Util_0.CrossPluginCommunication;
local l_Dialog_0 = v4.UI.Dialog;
local l_ContextServices_0 = v4.ContextServices;
local l_Plugin_0 = l_ContextServices_0.Plugin;
local l_Mouse_0 = l_ContextServices_0.Mouse;
local l_Store_0 = l_ContextServices_0.Store;
local v12 = require(l_Parent_0.Src.Reducers.MainReducer);
local v13 = require(l_Parent_0.Src.Resources.MakeTheme);
local l_SourceStrings_0 = l_Parent_0.Src.Resources.Localization.SourceStrings;
local l_LocalizedStrings_0 = l_Parent_0.Src.Resources.Localization.LocalizedStrings;
local l_Components_0 = l_Parent_0.Src.Components;
local v17 = require(l_Components_0.PermissionsView);
local v18 = require(l_Components_0.SaveToRobloxView);
local l_TeamCreateService_0 = game:GetService("TeamCreateService");
local v20 = v2.PureComponent:extend("MainPlugin");
local v21 = require(l_Parent_0.Src.Networking.Networking);
local v22 = require(l_Parent_0.Src.Controllers.GroupMetadataController);
local v23 = require(l_Parent_0.Src.Controllers.GroupRolePermissionsController);
local v24 = require(l_Parent_0.Src.Controllers.GamePermissionsController);
local v25 = require(l_Parent_0.Src.Controllers.GameMetadataController);
local v26 = require(l_Parent_0.Src.Controllers.SocialController);
local v27 = require(l_Parent_0.Src.Actions.ResetStore);
local v28 = require(l_Parent_0.Src.Util.Analytics);
v20.init = function(v29, v30)
    v29.plugin = l_Plugin_0.new(v30.Plugin);
    v29.state = {
        enabled = false
    };
    v29.toggleEnabled = function()
        v29:setState(function(v31)
            return {
                enabled = not v31.enabled
            };
        end);
    end;
    v29.onClose = function()
        v29.store:dispatch(v27());
        v29:setState({
            enabled = false
        });
    end;
    v29.onRestore = function(v32)
        v29:setState({
            enabled = v32
        });
    end;
    v29.onWidgetEnabledChanged = function(v33)
        v29:setState({
            enabled = v33.Enabled
        });
    end;
    local v34 = {};
    local v35 = v21.new();
    local v36 = v22.new(v35:get());
    local v37 = v23.new(v35:get());
    local v38 = v24.new(v35:get());
    local v39 = v25.new(v35:get());
    local v40 = v26.new(v35:get());
    v34.networking = v35:get();
    v34.groupMetadataController = v36;
    v34.groupRolePermisionsController = v37;
    v34.gamePermissionsController = v38;
    v34.gameMetadataController = v39;
    v34.socialController = v40;
    v29.store = v3.Store.new(v12, nil, {
        (l_Util_0.ThunkWithArgsMiddleware(v34))
    });
    v29.localization = l_ContextServices_0.Localization.new({
        stringResourceTable = l_SourceStrings_0, 
        translationResourceTable = l_LocalizedStrings_0, 
        pluginName = "ManageCollaborators"
    });
    v29.analytics = l_ContextServices_0.Analytics.new(function()
        return {};
    end, {});
    local function v41()
        v28.reportCollaborateButtonPressed();
        v29.toggleEnabled();
    end;
    if not v0 then
        l_TeamCreateService_0.ToggleManageCollaborators:Connect(v41);
    else
        v30.PluginLoaderContext.signals["TeamCreateService.ToggleManageCollaborators"]:Connect(v41);
    end;
    v29.communication = l_CrossPluginCommunication_0.new("ManageCollaborators");
    v29.communication:Connect("ToggleManageCollaborators", function()
        v29.toggleEnabled();
    end);
end;
v20.render = function(v42)
    local l_props_0 = v42.props;
    local l_enabled_0 = v42.state.enabled;
    local v45 = game.GameId ~= 0;
    return l_ContextServices_0.provide({
        v42.plugin, 
        l_Store_0.new(v42.store), 
        l_Mouse_0.new(l_props_0.Plugin:getMouse()), 
        v13(), 
        v42.localization, 
        v42.analytics
    }, {
        Dialog = v2.createElement(l_Dialog_0, {
            CreateWidgetImmediately = true, 
            Enabled = l_enabled_0, 
            Modal = true, 
            Title = v42.localization:getText("Plugin", "Title"), 
            Size = Vector2.new(800, 571), 
            OnClose = v42.onClose
        }, {
            PermissionsView = not not v45 and v2.createElement(v17, {
                CloseWidget = v42.onClose, 
                Plugin = v42.plugin, 
                Enabled = l_enabled_0
            }) or nil, 
            SaveToRobloxView = not v45 and v2.createElement(v18, {
                CloseWidget = v42.onClose
            })
        })
    });
end;
return v20;
