local _ = Vector2.new(400, 217);
local _ = Vector2.new(120, 32);
local l_Parent_0 = script.Parent.Parent.Parent;
local v3 = require(l_Parent_0.Packages.Roact);
local v4 = require(l_Parent_0.Packages.RoactRodux);
local _ = require(l_Parent_0.Packages.Cryo);
local v6 = require(l_Parent_0.Src.Constants.PluginInstalledStatus);
local v7 = require(l_Parent_0.Packages.Framework);
local l_ContextServices_0 = v7.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local _ = l_ContextServices_0.Localization;
local l_StyledDialog_0 = v7.UI.StyledDialog;
local v12 = v3.PureComponent:extend("InstallationDialog");
v12.init = function(v13)
    v13.state = {
        hasDataLoaded = false
    };
end;
v12.didUpdate = function(v14)
    local v15 = v14.props.info.installStatus ~= v6.UNKNOWN;
    local v16 = v14.state.hasDataLoaded == false;
    if not (not v15 or not v16) then
        spawn(function()
            v14:setState({
                hasDataLoaded = true
            });
        end);
    end;
end;
v12.render = function(v17)
    local l_hasDataLoaded_0 = v17.state.hasDataLoaded;
    local l_Localization_1 = v17.props.Localization;
    return l_hasDataLoaded_0 and v3.createElement(l_StyledDialog_0, {
        Title = l_Localization_1:getText("DialogTitle", "InstallPlugin"), 
        Buttons = {
            {
                Key = true, 
                Text = l_Localization_1:getText("Dialog", "Ok"), 
                Style = "RoundPrimary"
            }
        }, 
        Resizable = false, 
        MinContentSize = Vector2.new(400, 120), 
        OnButtonPressed = v17.props.OnButtonClicked, 
        OnClose = v17.props.OnClose
    }, v17.props[v3.Children]);
end;
return v4.connect(function(v20, v21)
    return {
        info = v20.PluginInfo.plugins[v21.pluginId]
    };
end)((l_withContext_0({
    Localization = l_ContextServices_0.Localization
})(v12)));
