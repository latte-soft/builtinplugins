local v0 = require(script.Parent.Parent.Parent.Src.Actions.SetAssetFavoriteCount);
return function(v1, v2)
    return function(v3)
        v1.Catalog.V1.Favorites.Assets.count(v2):makeRequest():andThen(function(v4)
            local l_responseBody_0 = v4.responseBody;
            if not l_responseBody_0 then
                v3:dispatch(v0(v2, 0));
                return ;
            else
                v3:dispatch(v0(v2, l_responseBody_0));
                return ;
            end;
        end, function()
            error("Failed to get asset favorite count information for asset id: ", v2);
        end);
    end;
end;
