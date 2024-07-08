local v0 = {};
v0.__index = v0;
v0.new = function(v1)
    return (setmetatable({
        __networking = v1
    }, v0));
end;
v0.configurationV2GET = function(v2, v3)
    return v2.__networking:get("develop", "/v2/universes/" .. v3 .. "/configuration"):await();
end;
v0.configurationV2PATCH = function(v4, v5, v6)
    return v4.__networking:patch("develop", "/v2/universes/" .. v5 .. "/configuration", {
        Body = v6
    }):await();
end;
v0.GetPermission = function(v7, v8, v9)
    return v7:configurationV2GET(v8).responseBody.permissions[v9];
end;
v0.SetChangedPermissions = function(v10, v11, v12, v13)
    return v10:configurationV2PATCH(v11, {
        permissions = {
            [v12] = v13
        }
    });
end;
v0.GetThirdPartyPurchasesAllowed = function(v14, v15)
    return v14:GetPermission(v15, "IsThirdPartyPurchaseAllowed");
end;
v0.SetThirdPartyPurchasesAllowed = function(v16, v17, v18)
    return v16:SetChangedPermissions(v17, "IsThirdPartyPurchaseAllowed", v18);
end;
v0.GetThirdPartyTeleportsAllowed = function(v19, v20)
    return v19:GetPermission(v20, "IsThirdPartyTeleportAllowed");
end;
v0.SetThirdPartyTeleportsAllowed = function(v21, v22, v23)
    return v21:SetChangedPermissions(v22, "IsThirdPartyTeleportAllowed", v23);
end;
v0.GetHttpEnabled = function(_, v25)
    return v25:GetService("HttpService"):GetHttpEnabled();
end;
v0.SetHttpEnabled = function(_, v27, v28)
    return v27:GetService("HttpService"):SetHttpEnabled(v28);
end;
v0.GetStudioAccessToApisAllowed = function(v29, v30)
    return v29:configurationV2GET(v30).responseBody.studioAccessToApisAllowed;
end;
v0.SetStudioAccessToApisAllowed = function(v31, v32, v33)
    return v31:configurationV2PATCH(v32, {
        studioAccessToApisAllowed = v33
    });
end;
v0.GetSecrets = function(_)
    return game:GetService("StudioService").Secrets;
end;
v0.SetSecrets = function(_, v36)
    game:GetService("StudioService").Secrets = v36;
end;
return v0;
