local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Core.Util.DebugFlags);
local v2 = require(l_Parent_0.Core.Actions.NetworkError);
local v3 = require(l_Parent_0.Core.Actions.SetAssetMediaIds);
return function(v4, v5, v6, v7)
    return function(v8)
        if not v7 then
            local v9 = v8:getState();
            if not (not (not (not v6 or not v9) and v9.assetMediaIds) and (((((not v9 or not v9.assets) or not v9.assets.idToAssetMap) or not v9.assets.idToAssetMap[v5]) or not v9.assets.idToAssetMap[v5].Asset) or not v9.assets.idToAssetMap[v5].Asset.AssetMediaIds)) then
                return ;
            end;
        end;
        return v4:getAssetMediaIds(v5):andThen(function(v10)
            local v11 = if (not not v10 and v10.responseBody) and v10.responseBody.data then v10.responseBody.data else {};
            v8:dispatch(v3(v5, v11));
            return v11;
        end, function(v12)
            if v1.shouldDebugWarnings() then
                warn("Could not get asset media for asset id:", v5);
            end;
            v8:dispatch(v2(v12));
        end);
    end;
end;
