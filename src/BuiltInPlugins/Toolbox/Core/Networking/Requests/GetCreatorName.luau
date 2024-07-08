local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local l_Actions_0 = l_Parent_0.Core.Actions;
local v2 = require(l_Actions_0.NetworkError);
local v3 = require(l_Actions_0.SetCachedCreatorInfo);
local v4 = require(l_Parent_0.Core.Util.CreatorInfoHelper);
return function(v5, v6, v7)
    return function(v8)
        return v5:getCreatorInfo(v6, v7):andThen(function(v9)
            v8:dispatch(v3({
                Id = v6, 
                Name = v4.getNameFromResult(v9, v7), 
                Type = v7
            }));
        end, function(v10)
            v8:dispatch(v2(v10));
        end);
    end;
end;
