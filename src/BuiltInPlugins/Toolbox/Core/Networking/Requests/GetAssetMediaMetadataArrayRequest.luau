local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local l_Util_0 = l_Parent_0.Core.Util;
local v2 = require(l_Util_0.DebugFlags);
local v3 = require(l_Util_0.createAssetMediaMetadata);
local l_Actions_0 = l_Parent_0.Core.Actions;
local v5 = require(l_Actions_0.NetworkError);
local v6 = require(l_Actions_0.SetAssetMediaMetadataArray);
local v7 = require(l_Parent_0.Core.Networking.Requests.GetAssetMediaIdsRequest);
local l_HttpService_0 = game:GetService("HttpService");
return function(v9, v10)
    return function(v11)
        return v11:dispatch(v7(v9, v10, true, true)):andThen(function(v12)
            if v12 ~= nil and #v12 > 0 then
                return v9:getDevelopAssetMetadata(v12);
            else
                return ;
            end;
        end):andThen(function(v13)
            if v13 == nil then
                return nil;
            else
                local v14 = l_HttpService_0:JSONDecode(v13.responseBody);
                local v15 = {};
                for _, v17 in ipairs(v14.data) do
                    table.insert(v15, v3.fromDevelop(v17));
                end;
                return v15;
            end;
        end, function(v18)
            if v2.shouldDebugWarnings() then
                warn("Failed to get asset media metadata: ", v18);
            end;
            v11:dispatch(v5(v18));
        end):andThen(function(v19)
            if v19 ~= nil and #v19 > 0 then
                v11:dispatch(v6(v19));
            end;
        end);
    end;
end;
