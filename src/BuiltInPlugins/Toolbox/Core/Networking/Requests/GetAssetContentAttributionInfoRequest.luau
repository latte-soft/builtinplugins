local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local l_HttpService_0 = game:GetService("HttpService");
local v2 = require(l_Parent_0.Core.Actions.NetworkError);
local v3 = require(l_Parent_0.Packages.Cryo);
local v4 = require(l_Parent_0.Core.Actions.GetAssetContentAttributionInfo);
return function(v5, v6)
    return function(v7)
        if v6 then
            local v8 = nil;
            local v9 = nil;
            v5:getUniverseInfo(v6):andThen(function(v10)
                local v11 = l_HttpService_0:JSONDecode(v10.responseBody);
                v8 = v11.name or v3.None;
                v9 = v11.rootPlaceId or v3.None;
                v7:dispatch(v4(v8, v9));
            end, function(v12)
                v7:dispatch(v2(v12));
            end);
            return ;
        else
            v7:dispatch(v4(v3.None, v3.None));
            return ;
        end;
    end;
end;
