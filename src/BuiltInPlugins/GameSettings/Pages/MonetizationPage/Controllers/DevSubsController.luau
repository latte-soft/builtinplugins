local v0 = {};
v0.__index = v0;
v0.new = function(v1)
    return (setmetatable({
        __networking = v1
    }, v0));
end;
v0.devSubsV1GET = function(v2, v3, v4)
    return v2.__networking:get("apis", "/developer-subscriptions/v1/universes/" .. v3 .. "/plans", {
        Params = v4
    });
end;
v0.moderationV1GET = function(v5, v6)
    return v5.__networking:get("apis", "/developer-subscriptions/v1/universes/plans/check-name-and-description", {
        Params = {
            name = v6
        }, 
        CachePolicy = Enum.HttpCachePolicy.None
    });
end;
v0.uploadImagePOST = function(v7, v8)
    return v7.__networking:post("www", "/ide/publish/UploadNewImage", {
        Params = {
            name = "DevSubImage", 
            description = "None"
        }, 
        Body = v8:GetBinaryContents(), 
        CachePolicy = Enum.HttpCachePolicy.None, 
        Headers = {
            ["Content-Type"] = "multipart/form-data; boundary=EA0A21C3-8388-4038-9BD5-92C8B1B7BF8E"
        }
    });
end;
v0.devSubsCreateV1POST = function(v9, v10, v11, v12, v13, v14)
    return v9.__networking:post("apis", "/developer-subscriptions/v1/universes/" .. v10 .. "/plans", {
        Body = {
            imageAssetId = v14, 
            name = v11, 
            prepaidOptions = v12, 
            priceInRobux = v13
        }, 
        CachePolicy = Enum.HttpCachePolicy.None
    });
end;
v0.devSubsDiscontinueV1PATCH = function(v15, v16)
    return v15.__networking:patch("apis", "/developer-subscriptions/v1/universes/plans/" .. v16, {
        Body = {
            status = "Closed"
        }, 
        CachePolicy = Enum.HttpCachePolicy.None
    });
end;
v0.devSubsChangeV1PATCH = function(v17, v18, v19, v20, v21, v22, v23, v24)
    local l___networking_0 = v17.__networking;
    if v24 == nil then
        v24 = string.match(v21, "%d+");
    end;
    return l___networking_0:patch("apis", "/developer-subscriptions/v1/universes/plans/" .. v18, {
        Body = {
            imageAssetId = v24, 
            name = v22 or v19, 
            prepaidOptions = v23 or v20
        }, 
        CachePolicy = Enum.HttpCachePolicy.None
    });
end;
v0.getDevSubs = function(v26, v27, v28, v29)
    local v30 = {};
    local l_responseBody_0 = v26:devSubsV1GET(v27, {
        status = not v28 and "Closed" or "Open", 
        sortOrder = "Asc", 
        cursor = v29
    }):await().responseBody;
    for _, v33 in pairs(l_responseBody_0.data) do
        local v34 = {
            IsNew = false, 
            Key = tostring(v33.id), 
            Id = v33.id, 
            Image = "rbxassetid://" .. v33.imageAssetId, 
            Name = v33.name, 
            Price = v33.priceInRobux, 
            CreationDate = v33.created, 
            Active = v33.status == "Open", 
            Subscribers = 999, 
            PendingEarning = 9999, 
            Prepaid = 6
        };
        v30[v34.Key] = v34;
    end;
    local l_nextPageCursor_0 = l_responseBody_0.nextPageCursor;
    if l_nextPageCursor_0 == nil then
        l_nextPageCursor_0 = "";
    end;
    return v30, l_nextPageCursor_0;
end;
v0.createDevSub = function(v36, v37, v38)
    v36:devSubsCreateV1POST(v37, v38.Name, v38.Prepaid, v38.Price, v36:uploadImagePOST(v38.Image):await().responseBody):await();
end;
v0.changeDevSub = function(v39, v40, v41)
    if not v41.Image then
        v39:devSubsChangeV1PATCH(v40.Id, v40.Name, v40.Prepaid, v40.Image, v41.Name, v41.Prepaid):await();
        return ;
    else
        v39:devSubsChangeV1PATCH(v40.Id, v40.Name, v40.Prepaid, v40.Image, v41.Name, v41.Prepaid, v39:uploadImagePOST(v41.Image):await().responseBody):await();
        return ;
    end;
end;
v0.discontinueDevSub = function(v42, v43)
    v42:devSubsDiscontinueV1PATCH(v43.Id):await();
end;
v0.getFilteredDevSub = function(v44, v45)
    if not (v45.Name ~= nil) or v45.Name == "" then
        return true, nil, nil;
    else
        local l_responseBody_1 = v44:moderationV1GET(v45.Name):await().responseBody;
        local l_isAcceptable_0 = l_responseBody_1.isAcceptable;
        local l_filteredName_0 = l_responseBody_1.filteredName;
        if l_filteredName_0 == "" then
            l_filteredName_0 = nil;
        end;
        return l_isAcceptable_0, l_filteredName_0;
    end;
end;
return v0;
