local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Framework).RobloxAPI.Url.new();
local _ = require(l_Parent_0.Src.Types);
return function(v3, v4, v5, v6)
    return v3:parseJson(v3:handleRetry(v3:get((v1.composeUrl(v1.APIS_URL, string.format("toolbox-service/v1/inventory/user/%d/%d", v4, v5.Value), if not v6 then nil else {
        cursor = v6
    }))), 5));
end;
