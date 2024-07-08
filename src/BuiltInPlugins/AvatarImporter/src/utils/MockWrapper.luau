local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Roact);
local v2 = require(l_Parent_0.Packages.RoactRodux);
return function(v3)
    return v1.createElement(v2.StoreProvider, {
        store = v3.store
    }, v3[v1.Children]);
end;
