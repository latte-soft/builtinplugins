local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Core.Actions.SetIsVerifiedCreator);
local v2 = require(l_Parent_0.Core.Actions.NetworkError);
return function(v3)
    return function(v4)
        return v3:getIsVerifiedCreator():andThen(function(v5)
            v4:dispatch(v1(v5.responseBody.isVerifiedCreator));
        end, function(v6)
            v4:dispatch(v2(v6));
        end);
    end;
end;
