local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Core.Actions.GetFavorited);
local v2 = require(l_Parent_0.Core.Actions.NetworkError);
local function _(v3)
    if v3.responseBody == "null" then
        return false;
    else
        return true;
    end;
end;
return function(v5, v6, v7)
    return function(v8)
        return v5:getFavorited(v6, v7):andThen(function(v9)
            v8:dispatch(v1(v7, v9.responseBody ~= "null"));
        end, function(v10)
            v8:dispatch(v2(v10));
        end);
    end;
end;
