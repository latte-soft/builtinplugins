local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Rodux);
local v2 = require(l_Parent_0.Src.ContextServices.Dialog);
local v3 = require(l_Parent_0.Src.Reducers.MainReducer);
local l_provideMockContext_0 = require(l_Parent_0.Packages.Framework).TestHelpers.provideMockContext;
local v5 = require(l_Parent_0.Src.Util.MakeTheme);
local v6 = {
    v1.thunkMiddleware
};
return function(v7, v8)
    if not v7 then
        v7 = {};
    end;
    local v9 = {};
    if not v7.ShowDialog then
        table.insert(v9, v2.new(function()
        end));
    end;
    local l_Store_0 = v7.Store;
    if l_Store_0 then
        table.insert(v9, l_Store_0);
    else
        l_Store_0 = v1.Store.new(v3, nil, v6);
    end;
    if not v7.Theme then
        table.insert(v9, (v5(true)));
    end;
    return l_provideMockContext_0(v9, v8);
end;
