local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Core.Util.DebugFlags);
local v2 = require(l_Parent_0.Core.Util.getUserId);
local v3 = require(l_Parent_0.Core.Actions.NetworkError);
local v4 = require(l_Parent_0.Core.Actions.SetOwnsAsset);
local v5 = require(l_Parent_0.Packages.Framework);
local l_RobloxAPI_0 = v5.RobloxAPI;
local l_Networking_0 = v5.Http.Networking;
local l_Promise_0 = v5.Util.Promise;
local v9 = l_RobloxAPI_0.new({
    networking = l_Networking_0.new({
        isInternal = true, 
        loggingLevel = if not v1.shouldDebugUrls() then nil else 1
    })
});
return function(_, v11)
    return function(v12)
        local v13 = v12:getState().purchase.cachedOwnedAssets[tostring(v11)];
        if v13 ~= nil then
            v12:dispatch(v4(v13, v11));
            return l_Promise_0.resolve(v13);
        else
            local v14 = v2();
            if typeof(v11) == "string" then
                v11 = tonumber(v11) or 0;
            end;
            return (v9.Inventory.V1.Users.Items.isOwned(v14, Enum.AvatarItemType.Asset, v11):makeRequest():andThen(function(v15)
                local v16 = tostring(v15.responseBody) == "true";
                v11 = tonumber(v11);
                v12:dispatch(v4(v16, v11));
                return v16;
            end, function(v17)
                if v1.shouldDebugWarnings() then
                    warn("Could not get asset ownership");
                end;
                v12:dispatch(v3(v17));
            end));
        end;
    end;
end;
