local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Rodux);
local v2 = require(l_Parent_0.Packages.Framework);
local l_TestHelpers_0 = v2.TestHelpers;
local l_ContextServices_0 = v2.ContextServices;
local l_Http_0 = v2.Http;
local v6 = require(l_Parent_0.Src.Reducers.MainReducer);
local v7 = require(l_Parent_0.Src.Resources.MakeTheme);
local l_Controllers_0 = l_Parent_0.Src.Controllers;
local v9 = require(l_Controllers_0.GeneralServiceController);
local v10 = require(l_Controllers_0.ImageLoader);
local v11 = require(l_Controllers_0.ImageUploader);
local v12 = require(l_Controllers_0.ImportAssetHandler);
local v13 = require(l_Controllers_0.MaterialServiceController);
local v14 = require(l_Controllers_0.PluginController);
local v15 = l_ContextServices_0.Store.new(v1.Store.new(v6, nil, {
    v1.thunkMiddleware
}, nil));
local v16 = {
    l_ContextServices_0.Analytics.mock(), 
    l_ContextServices_0.Localization.mock(), 
    v15, 
    v9.mock(), 
    v12.mock((v11.new((l_Http_0.Networking.new({
        isInternal = true
    }))))), 
    v10.mock(), 
    v13.mock(v15.store), 
    v14.mock(), 
    v7(true)
};
return function(v17)
    assert(type(v17) == "table", "Expected story to be a table");
    return l_TestHelpers_0.provideMockContext(v16, v17);
end;
