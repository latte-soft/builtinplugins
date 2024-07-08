local l_Parent_0 = script.Parent.Parent;
local l_Parent_1 = script.Parent.Parent.Parent.Parent;
local v2 = require(l_Parent_1.Packages.Cryo);
local v3 = require(l_Parent_1.Src.Actions.AddChange);
local v4 = require(l_Parent_0.Util.PermissionsConstants);
return function(v5)
    return function(v6, _)
        local v8 = v6:getState();
        local v9 = v2.Dictionary.join(v8.Settings.Changed.groupMetadata or v8.Settings.Current.groupMetadata, {
            [v5] = v2.None
        });
        local v10 = v8.Settings.Changed.permissions or v8.Settings.Current.permissions;
        for v11, v12 in pairs(v10[v4.RoleSubjectKey]) do
            if v12[v4.GroupIdKey] == v5 then
                v10 = v2.Dictionary.join(v10, {
                    [v4.RoleSubjectKey] = v2.Dictionary.join(v10[v4.RoleSubjectKey], {
                        [v11] = v2.None
                    })
                });
            end;
        end;
        v6:dispatch(v3("permissions", v10));
        v6:dispatch(v3("groupMetadata", v9));
    end;
end;
