local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.MaterialFramework);
local v2 = require(l_Parent_0.Packages.Rodux);
local l_StudioServices_0 = v1.Context.StudioServices;
local l_Actions_0 = l_Parent_0.Src.Actions;
local v5 = require(l_Actions_0.SetSelectedMaterial);
local v6 = require(l_Actions_0.SetTextPrompt);
local v7 = require(l_Parent_0.Src.Reducers.MainReducer);
local v8 = require(l_Parent_0.Src.Thunks.GenerateImages);
return function()
    local v9 = v2.Store.new(v7, nil, {
        v2.thunkMiddleware
    });
    v9:dispatch(v6("ancient stone wall"));
    v9:dispatch(v8((l_StudioServices_0.new(true))));
    v9:dispatch(v5(v9:getState().MaterialsReducer.materials[1]));
    return v9;
end;
