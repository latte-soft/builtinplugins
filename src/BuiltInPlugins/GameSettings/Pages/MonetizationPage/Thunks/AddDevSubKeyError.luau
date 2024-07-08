local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local l_deepJoin_0 = require(l_Parent_0.Packages.Framework).Util.deepJoin;
local v2 = require(l_Parent_0.Src.Actions.AddErrors);
return function(v3, v4, v5)
    return function(v6, _)
        v6:dispatch(v2({
            DeveloperSubscriptions = l_deepJoin_0(v6:getState().Settings.Errors.DeveloperSubscriptions or {}, {
                [v3] = {
                    [v4] = v5
                }
            })
        }));
    end;
end;
