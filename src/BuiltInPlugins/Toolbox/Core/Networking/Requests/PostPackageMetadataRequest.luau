local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local _ = game:GetService("HttpService");
local l_Actions_0 = l_Parent_0.Core.Actions;
local v3 = require(l_Parent_0.Core.Util.Analytics.Analytics);
local v4 = require(l_Actions_0.SetIsPackage);
local v5 = require(l_Actions_0.NetworkError);
local l_NewPackageAnalyticsWithRefactor2_0 = game:GetFastFlag("NewPackageAnalyticsWithRefactor2");
return function(v7, v8)
    return function(v9)
        return v7:postForPackageMetadata(v8):andThen(function(v10)
            if l_NewPackageAnalyticsWithRefactor2_0 then
                v3.sendResultToKibana(v10);
            end;
            local v11 = v10.responseBody.data[1];
            if (not v11 or not v11.assetId) or not v11.assetVersionNumber then
                v9:dispatch(v4(false));
                return ;
            else
                v9:dispatch(v4(true));
                return ;
            end;
        end, function(v12)
            if l_NewPackageAnalyticsWithRefactor2_0 then
                v3.sendResultToKibana(v12);
            end;
            v9:dispatch(v4(false));
            v9:dispatch(v5(v12));
        end);
    end;
end;
