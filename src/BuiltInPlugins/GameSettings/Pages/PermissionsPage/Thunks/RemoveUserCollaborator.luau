local l_Parent_0 = script.Parent.Parent;
local l_Parent_1 = script.Parent.Parent.Parent.Parent;
local v2 = require(l_Parent_1.Packages.Cryo);
local v3 = require(l_Parent_1.Src.Actions.AddChange);
local v4 = require(l_Parent_0.Util.PermissionsConstants);
return function(v5, _)
    return function(v7, _)
        local v9 = v7:getState();
        local v10 = v9.Settings.Changed.permissions or v9.Settings.Current.permissions;
        v7:dispatch(v3("permissions", (v2.Dictionary.join(v10, {
            [v4.UserSubjectKey] = v2.Dictionary.join(v10[v4.UserSubjectKey], {
                [v5] = v2.None
            })
        }))));
    end;
end;
