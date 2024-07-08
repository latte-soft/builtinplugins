local l_Parent_0 = script.Parent.Parent.Parent;
local l_ContextServices_0 = require(l_Parent_0.Packages.Framework).ContextServices;
local v2 = require(l_Parent_0.Packages.Rodux);
local v3 = v2.Store.new(require(l_Parent_0.Src.Reducers.MainReducer), nil, {
    v2.thunkMiddleware
});
local v4 = require(l_Parent_0.Src.Resources.makeTheme);
local v5 = l_ContextServices_0.Localization.new({
    stringResourceTable = l_Parent_0.Src.Resources.SourceStrings, 
    translationResourceTable = l_Parent_0.Src.Resources.LocalizedStrings, 
    pluginName = "PluginInstallation"
});
local v6 = require(l_Parent_0.Packages.Http);
local v7 = v6.API.new({
    networking = v6.Networking.new({
        isInternal = true, 
        loggingLevel = 0
    })
});
local v8 = require(l_Parent_0.Src.Util.getAnalyticsContextItem)();
local v9 = nil;
return function(v10)
    if v9 ~= nil then
        return v9;
    else
        assert(v10 ~= nil, "getPluginGlobals hasn't been initialized yet");
        v9 = {
            plugin = v10, 
            localization = v5, 
            theme = v4, 
            store = v3, 
            api = v7, 
            mouse = v10:GetMouse(), 
            focusGui = {}, 
            analytics = v8
        };
        return v9;
    end;
end;
