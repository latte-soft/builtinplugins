local l_script_FirstAncestor_0 = script:FindFirstAncestor("AnimationClipEditor");
local v1 = require(l_script_FirstAncestor_0.Packages.Roact);
local _ = require(l_script_FirstAncestor_0.Packages.RoactRodux);
local v3 = require(l_script_FirstAncestor_0.Packages.Framework);
local _ = require(l_script_FirstAncestor_0.Src.Util.Constants);
local l_ContextServices_0 = v3.ContextServices;
local _ = require(l_script_FirstAncestor_0.Src.Util.DebugFlags);
local v7 = v1.PureComponent:extend("MainProvider");
v7.render = function(v8)
    return l_ContextServices_0.provide({
        v8.props.analytics, 
        v8.props.focusGui and l_ContextServices_0.Focus.new(v8.props.focusGui), 
        v8.props.plugin and l_ContextServices_0.Plugin.new(v8.props.plugin), 
        v8.props.localization, 
        v8.props.theme, 
        v8.props.store and l_ContextServices_0.Store.new(v8.props.store), 
        v8.props.mouse and l_ContextServices_0.Mouse.new(v8.props.mouse), 
        v8.props.pluginActions, 
        v8.props.signals, 
        v8.props.calloutController
    }, v8.props[v1.Children]);
end;
return v7;
