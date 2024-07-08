local l_Actions_0 = script.Parent.Parent.Parent.Parent.Core.Actions;
local v1 = require(l_Actions_0.CreateFavorite);
local v2 = require(l_Actions_0.DeleteFavorite);
local v3 = require(l_Actions_0.NetworkError);
return function(v4, v5, v6, v7)
    return function(v8)
        if not v7 then
            return v4:postFavorite(v5, v6):andThen(function(_)
                v8:dispatch(v1(v6));
            end, function(v10)
                v8:dispatch(v3(v10));
            end);
        else
            return v4:deleteFavorite(v5, v6):andThen(function(_)
                v8:dispatch(v2(v6));
            end, function(v12)
                v8:dispatch(v3(v12));
            end);
        end;
    end;
end;
