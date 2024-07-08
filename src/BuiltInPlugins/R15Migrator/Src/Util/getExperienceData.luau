local l_MarketplaceService_0 = game:GetService("MarketplaceService");
local function v6(v1, v2, v3)
    v2.Develop.V2.Universes.places(v1):makeRequest():andThen(function(v4)
        v3(v4.responseBody.data[1].id);
    end, function(v5)
        warn("Unable to retrieve details of experience", v5.responseBody);
        v3();
    end);
end;
return function(v7, v8, v9)
    v6(v7, v8, function(v10)
        if v10 then
            v9({
                experienceId = v7, 
                placeId = v10, 
                name = l_MarketplaceService_0:GetProductInfo(v10).Name
            });
            return ;
        else
            v9();
            return ;
        end;
    end);
end;
