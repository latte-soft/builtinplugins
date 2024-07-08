local l_Parent_0 = script.Parent.Parent;
local l_Parent_1 = script.Parent.Parent.Parent.Parent;
local l_deepJoin_0 = require(l_Parent_1.Packages.Framework).Util.deepJoin;
local v3 = require(l_Parent_1.Src.Actions.AddChange);
local v4 = require(l_Parent_0.Util.PermissionsConstants);
return function(v5, v6)
    return function(v7, _)
        local v9 = v7:getState();
        v7:dispatch(v3("permissions", (l_deepJoin_0(v9.Settings.Changed.permissions or v9.Settings.Current.permissions, {
            [v4.UserSubjectKey] = {
                [v5] = {
                    [v4.ActionKey] = v6
                }
            }
        }))));
    end;
end;
