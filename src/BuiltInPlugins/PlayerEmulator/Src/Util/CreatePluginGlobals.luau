local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Rodux);
local l_ContextServices_0 = require(l_Parent_0.Packages.Framework).ContextServices;
return {
    theme = require(l_Parent_0.Src.Resources.MakeTheme)(), 
    localization = l_ContextServices_0.Localization.new({
        stringResourceTable = l_Parent_0.Src.Resources.SourceStrings, 
        translationResourceTable = l_Parent_0.Src.Resources.LocalizedStrings, 
        pluginName = "PlayerEmulator"
    }), 
    store = l_ContextServices_0.Store.new((v1.Store.new(require(l_Parent_0.Src.Reducers.createMainReducer)(), nil, {
        v1.thunkMiddleware
    }))), 
    networking = require(l_Parent_0.Src.ContextServices.NetworkingContext).new((require(l_Parent_0.Packages.Http).Networking.new({
        isInternal = true, 
        loggingLevel = 0
    })))
};
