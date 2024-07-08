local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Core.Util.DebugFlags);
local v2 = require(l_Parent_0.Core.Util.getUserId);
local v3 = require(l_Parent_0.Core.Actions.NetworkError);
local v4 = require(l_Parent_0.Core.Actions.SetCanManageAsset);
return function(v5, v6)
    return function(v7)
        if (v7:getState().assets.manageableAssets or {})[tostring(v6)] ~= nil then
            return ;
        else
            return v5:getHasEditPermissionForAsset(v6, (v2())):andThen(function(v8)
                v7:dispatch(v4(v8, v6));
            end, function(v9)
                if v1.shouldDebugWarnings() then
                    warn("Could not get canManage status");
                end;
                v7:dispatch(v3(v9));
            end);
        end;
    end;
end;
