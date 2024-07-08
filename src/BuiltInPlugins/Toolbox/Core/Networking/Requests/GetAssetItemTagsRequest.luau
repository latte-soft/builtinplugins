local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local l_Actions_0 = l_Parent_0.Core.Actions;
local v2 = require(l_Actions_0.NetworkError);
local v3 = require(l_Parent_0.Core.Types.ConfigTypes);
local v4 = require(l_Actions_0.UpdateAssetConfigData);
return function(v5, v6)
    return function(v7)
        return v5:getAssetItemTags(v6):andThen(function(v8)
            local l_responseBody_0 = v8.responseBody;
            local v10 = {};
            if l_responseBody_0.data and #l_responseBody_0.data > 0 then
                v10.ItemTags = l_responseBody_0.data[1].itemTags;
            end;
            v7:dispatch(v4(v10));
        end, function(v11)
            v7:dispatch(v2(v11, v3.GET_ASSET_DETAIL_FAILURE_ACTION));
        end);
    end;
end;
