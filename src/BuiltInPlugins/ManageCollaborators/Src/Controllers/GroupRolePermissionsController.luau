local l_RbxAnalyticsService_0 = game:GetService("RbxAnalyticsService");
local v1 = {};
v1.__index = v1;
v1.new = function(v2)
    return (setmetatable({
        __networking = v2, 
        __permissionsCache = {}
    }, v1));
end;
v1.groupRolePermissionsV1GET = function(v3, v4)
    return v3.__networking:get("groups", "/v1/groups/" .. v4 .. "/roles/permissions");
end;
v1.getGroupRolePermissions = function(v5, v6)
    if not v5.__permissionsCache[v6] then
        local v7 = v5:groupRolePermissionsV1GET(v6):await();
        if v7.responseCode ~= 200 then
            l_RbxAnalyticsService_0:reportCounter("ManageCollaboratorsPlugin.FetchRolePermsFailed", 1);
            return {};
        elseif not v5.__permissionsCache[v6] then
            local v8 = {};
            for _, v10 in ipairs(v7.responseBody.data) do
                v8[v10.role.id] = v10.permissions;
            end;
            v5.__permissionsCache[v6] = v8;
        end;
    end;
    return v5.__permissionsCache[v6];
end;
v1.clearCache = function(v11)
    v11.__permissionsCache = {};
end;
return v1;
