local l_Parent_0 = script.Parent.Parent;
local l_Parent_1 = script.Parent.Parent.Parent.Parent;
local v2 = require(l_Parent_1.Packages.Roact);
local v3 = require(l_Parent_1.Packages.Rodux);
local v4 = require(l_Parent_1.Packages.RoactRodux);
local v5 = require(l_Parent_0.Reducers.MorpherEditorRoot);
local v6 = require(l_Parent_0.Components.RootPanel);
local v7 = v2.Component:extend("ComponentRootApp");
v7.init = function(v8)
    v8.state = {
        store = v3.Store.new(v5, nil, {
            v3.thunkMiddleware
        })
    };
end;
v7.render = function(v9)
    return v2.createElement(v4.StoreProvider, {
        store = v9.state.store
    }, {
        v2.createElement(v6, {
            Mouse = v9.props.Mouse
        })
    });
end;
return v7;
