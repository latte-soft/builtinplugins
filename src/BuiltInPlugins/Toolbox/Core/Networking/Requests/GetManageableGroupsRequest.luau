local l_script_FirstAncestor_0 = script:FindFirstAncestor("Toolbox");
local v1 = require(l_script_FirstAncestor_0.Core.Actions.SetManageableGroups);
local v2 = require(l_script_FirstAncestor_0.Core.Actions.NetworkError);
local _ = require(l_script_FirstAncestor_0.Core.Types.GroupTypes);
return function(v4)
    return function(v5)
        return v4:getManageableGroups():andThen(function(v6)
            v5:dispatch(v1(v6.responseBody.data));
        end, function(v7)
            v5:dispatch(v2(v7));
        end);
    end;
end;
