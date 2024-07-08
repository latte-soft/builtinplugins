local l_HttpService_0 = game:GetService("HttpService");
local v1 = require(script.Parent.Parent.Parent.Core.Actions.SetGroupRoleInfo);
return function(v2, v3)
    return function(v4)
        return v2:getGroupRoleInfo(v3):andThen(function(v5)
            v4:dispatch(v1(l_HttpService_0:JSONDecode(v5.responseBody).roles));
        end, function(_)
        end);
    end;
end;
