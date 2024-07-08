local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Roact);
local v2 = require(l_Parent_0.Packages.Framework);
local v3 = require(l_Parent_0.Src.Resources.MakeTheme);
local v4 = require(l_Parent_0.Src.Resources.Constants);
local l_CrossPluginCommunication_0 = v2.Util.CrossPluginCommunication;
local v6 = require(l_Parent_0.Src.Components.PublishBlocked.PublishBlockedDialog);
local v7 = v1.PureComponent:extend("PublishBlockedPlugin");
local l_ContextServices_0 = v2.ContextServices;
local l_Plugin_0 = l_ContextServices_0.Plugin;
v7.init = function(v10)
    v10.connection = l_CrossPluginCommunication_0.new(v4.CrossPluginCommunicationName);
end;
v7.render = function(v11)
    local l_props_0 = v11.props;
    local l_OnClose_0 = l_props_0.OnClose;
    return l_ContextServices_0.provide({
        l_Plugin_0.new(plugin), 
        v3(), 
        l_props_0.Localization
    }, {
        v1.createElement(v6, {
            OnClose = l_OnClose_0, 
            OnOpen = function()
                v11.connection:Fire(v4.CrossPluginCommunicationInstructions.Open);
                l_OnClose_0();
            end
        })
    });
end;
return v7;
