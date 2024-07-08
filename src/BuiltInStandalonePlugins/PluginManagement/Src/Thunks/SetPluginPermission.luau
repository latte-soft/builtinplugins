local v0 = require(script.Parent.Parent.Parent.Src.Thunks.GetAllPluginPermissions);
return function(v1, v2, v3, v4)
    return function(v5)
        local v6 = tostring(v3);
        local l_v1_Permissions_0 = v1:GetPermissions(v6);
        l_v1_Permissions_0[v4.index] = {
            Type = v4.type, 
            Data = {
                Allowed = not v4.allowed, 
                Domain = v4.data.domain
            }
        };
        v1:SetPermissions(v6, l_v1_Permissions_0);
        v5:dispatch(v0(v1, v2));
    end;
end;
