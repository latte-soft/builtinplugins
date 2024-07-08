local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Src.Actions.SetMyGroups);
local v2 = require(l_Parent_0.Src.Actions.NetworkError);
local l_sendResultToKibana_0 = require(l_Parent_0.Packages.Framework).Util.sendResultToKibana;
local l_NewPackageAnalyticsWithRefactor2_0 = game:GetFastFlag("NewPackageAnalyticsWithRefactor2");
return function(v5)
    return function(v6)
        return v5:getMyGroups():andThen(function(v7)
            local l_responseBody_0 = v7.responseBody;
            if l_NewPackageAnalyticsWithRefactor2_0 then
                l_sendResultToKibana_0(v7);
            end;
            v6:dispatch(v1(l_responseBody_0.data));
        end, function(v9)
            v6:dispatch(v2(v9));
        end);
    end;
end;
