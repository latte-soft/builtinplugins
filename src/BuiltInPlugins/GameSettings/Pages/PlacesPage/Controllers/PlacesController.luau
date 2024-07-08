local l_Promise_0 = require(script.Parent.Parent.Parent.Parent.Packages.Framework).Util.Promise;
local v1 = {};
v1.__index = v1;
v1.new = function(v2)
    return (setmetatable({
        __networking = v2
    }, v1));
end;
v1.placesV2GET = function(v3, v4, v5)
    return v3.__networking:get("develop", "/v2/universes/" .. v4 .. "/places", {
        Params = v5
    });
end;
v1.placesV2PATCH = function(v6, v7, v8)
    return v6.__networking:patch("develop", "/v2/places/" .. v7, {
        Body = v8
    });
end;
v1.getPlaces = function(v9, v10, v11, v12)
    local v13 = {};
    local v14 = v12 == nil and 1 or v12 + 1;
    return l_Promise_0.resolve(v9:placesV2GET(v10, {
        limit = 10, 
        sortOrder = "Asc", 
        cursor = v11, 
        extendedSettings = true
    })):andThen(function(v15)
        local l_responseBody_0 = v15.responseBody;
        for _, v18 in pairs(l_responseBody_0.data) do
            v18.index = v14;
            v13[v18.id] = v18;
            v14 = v14 + 1;
        end;
        local l_nextPageCursor_0 = l_responseBody_0.nextPageCursor;
        if l_nextPageCursor_0 == nil then
            l_nextPageCursor_0 = "";
        end;
        return v13, l_nextPageCursor_0, v14;
    end);
end;
v1.setName = function(v20, v21, v22)
    v20:placesV2PATCH(v21, {
        name = v22
    }):await();
end;
v1.setMaxPlayerCount = function(v23, v24, v25)
    v23:placesV2PATCH(v24, {
        maxPlayerCount = v25
    }):await();
end;
v1.setAllowCopying = function(v26, v27, v28)
    v26:placesV2PATCH(v27, {
        allowCopying = v28
    }):await();
end;
v1.setSocialSlotType = function(v29, v30, v31)
    v29:placesV2PATCH(v30, {
        socialSlotType = v31
    }):await();
end;
v1.setCustomSocialSlotsCount = function(v32, v33, v34)
    v32:placesV2PATCH(v33, {
        customSocialSlotsCount = v34
    }):await();
end;
v1.assetPublishVersionV1GET = function(v35, v36)
    return v35.__networking:get("develop", "/v1/assets/" .. v36 .. "/published-versions");
end;
v1.getAssetPublishedVersions = function(v37, v38)
    return v37:assetPublishVersionV1GET(v38):await().responseBody;
end;
return v1;
