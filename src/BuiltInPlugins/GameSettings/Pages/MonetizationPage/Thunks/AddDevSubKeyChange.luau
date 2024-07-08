local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local l_deepJoin_0 = require(l_Parent_0.Packages.Framework).Util.deepJoin;
local v2 = require(l_Parent_0.Src.Actions.AddChange);
return function(v3, v4, v5)
    return function(v6, _)
        local v8 = v6:getState();
        v6:dispatch(v2("DeveloperSubscriptions", (l_deepJoin_0(v8.Settings.Changed.DeveloperSubscriptions or v8.Settings.Current.DeveloperSubscriptions, {
            [v3] = {
                [v4] = v5
            }
        }))));
    end;
end;
