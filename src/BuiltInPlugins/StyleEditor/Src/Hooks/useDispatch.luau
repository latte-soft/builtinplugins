local l_Parent_0 = script.Parent.Parent.Parent;
local _ = require(l_Parent_0.Packages.Rodux);
local v2 = require(l_Parent_0.Src.Hooks.useStore);
return function()
    local v3 = v2();
    return function(v4)
        v3:dispatch(v4);
    end;
end;
