local l_Parent_0 = script.Parent.Parent;
local l_Parent_1 = script.Parent.Parent.Parent.Parent;
local l_deepJoin_0 = require(l_Parent_1.Packages.Framework).Util.deepJoin;
local v3 = require(l_Parent_1.Src.Actions.AddChange);
local v4 = require(l_Parent_0.Util.PermissionsConstants);
return function(v5, v6, v7)
    return function(v8, _)
        local v10 = v8:getState();
        v8:dispatch(v3("permissions", (l_deepJoin_0(v10.Settings.Changed.permissions or v10.Settings.Current.permissions, {
            [v4.UserSubjectKey] = {
                [v5] = {
                    [v4.SubjectNameKey] = v6, 
                    [v4.SubjectIdKey] = v5, 
                    [v4.ActionKey] = v7
                }
            }
        }))));
    end;
end;
