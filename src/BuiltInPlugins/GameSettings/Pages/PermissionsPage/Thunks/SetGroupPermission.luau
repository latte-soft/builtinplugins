local l_Parent_0 = script.Parent.Parent;
local l_Parent_1 = script.Parent.Parent.Parent.Parent;
local v2 = require(l_Parent_0.Util.PermissionsConstants);
local v3 = require(l_Parent_1.Src.Actions.AddChange);
local l_deepJoin_0 = require(l_Parent_1.Packages.Framework).Util.deepJoin;
return function(v5, v6)
    return function(v7, _)
        local v9 = v7:getState();
        local v10 = v9.Settings.Changed.permissions or v9.Settings.Current.permissions;
        local l_v10_0 = v10;
        for v12, v13 in pairs(v10[v2.RoleSubjectKey]) do
            if v13[v2.GroupIdKey] == v5 then
                l_v10_0 = l_deepJoin_0(l_v10_0, {
                    [v2.RoleSubjectKey] = {
                        [v12] = {
                            [v2.ActionKey] = v6
                        }
                    }
                });
            end;
        end;
        v7:dispatch(v3("permissions", l_v10_0));
    end;
end;
