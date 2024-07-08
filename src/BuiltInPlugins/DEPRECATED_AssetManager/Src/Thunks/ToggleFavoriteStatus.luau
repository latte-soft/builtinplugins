local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Src.Actions.IncrementAssetFavoriteCount);
local v2 = require(l_Parent_0.Src.Actions.SetAssetFavorited);
return function(v3, v4, v5, v6)
    return function(v7)
        v3.Catalog.V1.Favorites.Assets.favorite(v4, v5, v6):makeRequest():andThen(function(v8)
            local l_responseBody_0 = v8.responseBody;
            if not (l_responseBody_0 ~= "{}") or l_responseBody_0 == "null" then
                v7:dispatch(v2(v4, not v6));
                if not v6 then
                    v7:dispatch(v1(v4, 1));
                else
                    v7:dispatch(v1(v4, -1));
                    return ;
                end;
            end;
        end, function()
            error("Failed to get asset favorite information for asset id: ", v4);
        end);
    end;
end;
