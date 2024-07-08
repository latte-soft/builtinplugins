local l_Actions_0 = script.Parent.Parent.Parent.Src.Actions;
local v1 = require(l_Actions_0.AddChange);
local v2 = require(l_Actions_0.ClearChange);
return function(v3, v4, v5)
    return function(v6)
        if v4 == v5 then
            v6:dispatch(v2(v3));
            return ;
        else
            v6:dispatch(v1(v3, v5));
            return ;
        end;
    end;
end;
