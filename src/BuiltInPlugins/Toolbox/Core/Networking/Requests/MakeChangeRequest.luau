local l_Actions_0 = script.Parent.Parent.Parent.Parent.Core.Actions;
local v1 = require(l_Actions_0.AddChange);
local v2 = require(l_Actions_0.ClearChange);
return function(v3, v4, v5, v6)
    return function(v7)
        local _ = nil;
        if not if not v6 then v4 == v5 else v6(v4, v5) then
            v7:dispatch(v1(v3, v5));
            return ;
        else
            v7:dispatch(v2(v3));
            return ;
        end;
    end;
end;
