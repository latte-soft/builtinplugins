local l_Actions_0 = script.Parent.Parent.Parent.Parent.Core.Actions;
local v1 = require(l_Actions_0.SetAssetConfigThumbnailStatus);
local v2 = require(l_Actions_0.NetworkError);
return function(v3, v4)
    return function(v5)
        v3:getThumbnailStatus(v4):andThen(function(v6)
            v5:dispatch(v1(v6.responseBody.data[1].state));
        end, function(v7)
            v5:dispatch(v2(v7));
        end);
    end;
end;
