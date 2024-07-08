local v0 = require(script.Parent.Parent.Parent.Src.Actions.SetAssetFavorited);
return function(v1, v2, v3)
    return function(v4)
        v1.Catalog.V1.Favorites.Assets.favorite(v2, v3):makeRequest():andThen(function(v5)
            if v5.responseBody ~= "null" then
                v4:dispatch(v0(v2, true));
                return ;
            else
                v4:dispatch(v0(v2, false));
                return ;
            end;
        end, function()
            error("Failed to get asset favorite information for asset id: ", v2);
        end);
    end;
end;
