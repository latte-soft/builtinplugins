local l_script_FirstAncestor_0 = script:FindFirstAncestor("DynamicHeadExportTool");
local v1 = require(l_script_FirstAncestor_0.Packages.React);
local v2 = require(l_script_FirstAncestor_0.Packages.Rodux);
local l_ContextServices_0 = require(l_script_FirstAncestor_0.Packages.Framework).ContextServices;
local l_Plugin_0 = l_ContextServices_0.Plugin;
local l_Mouse_0 = l_ContextServices_0.Mouse;
local l_Store_0 = l_ContextServices_0.Store;
local v7 = require(l_script_FirstAncestor_0.Src.Reducers.MainReducer);
local v8 = require(l_script_FirstAncestor_0.Src.Resources.MakeTheme);
local l_SourceStrings_0 = l_script_FirstAncestor_0.Src.Resources.Localization.SourceStrings;
local l_LocalizedStrings_0 = l_script_FirstAncestor_0.Src.Resources.Localization.LocalizedStrings;
local v11 = require(l_script_FirstAncestor_0.Src.MainPlugin);
local v12 = v1.PureComponent:extend("PluginWrapper");
v12.init = function(v13, _)
    v13.store = v2.Store.new(v7, nil, {
        v2.thunkMiddleware
    }, nil);
    v13.localization = l_ContextServices_0.Localization.new({
        stringResourceTable = l_SourceStrings_0, 
        translationResourceTable = l_LocalizedStrings_0, 
        pluginName = "DynamicHeadExportTool"
    });
    v13.analytics = l_ContextServices_0.Analytics.new(function()
        return {};
    end, {});
end;
v12.render = function(v15)
    local l_Plugin_1 = v15.props.Plugin;
    return l_ContextServices_0.provide({
        l_Plugin_0.new(l_Plugin_1), 
        l_Store_0.new(v15.store), 
        l_Mouse_0.new(l_Plugin_1:getMouse()), 
        v8(), 
        v15.localization, 
        v15.analytics
    }, {
        MainPlugin = v1.createElement(v11)
    });
end;
return v12;
