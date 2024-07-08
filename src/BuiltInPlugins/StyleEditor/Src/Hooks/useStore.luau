local l_Parent_0 = script.Parent.Parent.Parent;
local _ = require(l_Parent_0.Packages.Rodux);
local v2 = require(l_Parent_0.Packages.RoactRodux);
local l_useContext_0 = require(l_Parent_0.Packages.React).useContext;
return function()
    return (l_useContext_0(v2.StoreContext.Consumer));
end;
