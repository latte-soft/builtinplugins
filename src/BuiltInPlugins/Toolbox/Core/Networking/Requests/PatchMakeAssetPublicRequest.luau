local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Core.Util.DebugFlags);
local v2 = require(l_Parent_0.Core.Actions.NetworkError);
local l_webKeys_0 = require(l_Parent_0.Core.Util.Permissions.Constants).webKeys;
return function(v4, v5)
    return function(v6)
        return v4:grantAssetPermissions(v5, {
            [l_webKeys_0.SubjectType] = l_webKeys_0.All, 
            [l_webKeys_0.SubjectId] = "", 
            [l_webKeys_0.Action] = l_webKeys_0.UseAction
        }):andThen(function()
        end, function(v7)
            if v1.shouldDebugWarnings() then
                warn("Patch make asset public unsuccessful");
            end;
            v6:dispatch(v2(v7));
        end);
    end;
end;
