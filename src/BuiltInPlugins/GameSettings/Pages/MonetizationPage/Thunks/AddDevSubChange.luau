local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local l_deepJoin_0 = require(l_Parent_0.Packages.Framework).Util.deepJoin;
local v2 = require(l_Parent_0.Src.Actions.AddChange);
return function(v3, v4)
    return function(v5, _)
        local v7 = v5:getState();
        v5:dispatch(v2("DeveloperSubscriptions", (l_deepJoin_0(v7.Settings.Changed.DeveloperSubscriptions or v7.Settings.Current.DeveloperSubscriptions, {
            [v3] = v4
        }))));
    end;
end;
