local l_script_FirstAncestor_0 = script:FindFirstAncestor("FileSync");
local v1 = require(l_script_FirstAncestor_0.Packages.React);
local l_ContextServices_0 = require(l_script_FirstAncestor_0.Packages.Framework).ContextServices;
local v3 = v1.PureComponent:extend("ServiceWrapper");
v3.render = function(v4)
    return l_ContextServices_0.provide({
        v4.props.analytics, 
        l_ContextServices_0.Focus.new(v4.props.focusGui), 
        l_ContextServices_0.Plugin.new(v4.props.plugin), 
        v4.props.localization, 
        v4.props.theme, 
        l_ContextServices_0.Store.new(v4.props.store), 
        l_ContextServices_0.API.new(), 
        l_ContextServices_0.Mouse.new(v4.props.mouse), 
        v4.props.calloutController, 
        v4.props.insertAsset, 
        v4.props.pluginActions
    }, v4.props.children);
end;
return v3;
