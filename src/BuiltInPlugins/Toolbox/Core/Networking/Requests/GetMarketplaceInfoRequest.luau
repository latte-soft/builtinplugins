local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local l_Util_0 = l_Parent_0.Core.Util;
local v2 = require(l_Util_0.DebugFlags);
local v3 = require(l_Util_0.firstToUpper);
local l_Actions_0 = l_Parent_0.Core.Actions;
local v5 = require(l_Actions_0.NetworkError);
local v6 = require(l_Actions_0.UpdateAssetConfigData);
local v7 = require(l_Parent_0.Core.Types.ConfigTypes);
local l_Promise_0 = require(l_Parent_0.Packages.Framework).Util.Promise;
local l_HttpService_0 = game:GetService("HttpService");
return function(v10, v11)
    return function(v12)
        local v13 = {};
        l_Promise_0.all({
            v10:getDevelopAssetMetadata(v11):andThen(function(v14)
                for v15, v16 in pairs(l_HttpService_0:JSONDecode(v14.responseBody).data[1]) do
                    v13[v3(v15)] = v16;
                end;
            end, function(v17)
                if v2.shouldDebugWarnings() then
                    warn("failed with onAssetConfigDataGet in GetMarketplaceInfoRequest");
                end;
                v12:dispatch(v5(v17, v7.NetworkErrors.GET_ASSET_DETAIL_FAILURE));
            end), 
            v10:getAssetCreationDetails({
                v11
            }):andThen(function(v18)
                local l_responseBody_0 = v18.responseBody;
                if (l_responseBody_0 and #l_responseBody_0 > 0) and l_responseBody_0[1].assetId == v11 then
                    for v20, v21 in pairs(l_responseBody_0[1]) do
                        v13[v3(v20)] = v21;
                    end;
                end;
            end, function(v22)
                if v2.shouldDebugWarnings() then
                    warn("failed with onPriceDataFailed in GetMarketplaceInfoRequest");
                end;
                v12:dispatch(v5(v22, v7.NetworkErrors.GET_ASSET_DETAIL_FAILURE));
            end), 
            v10:getAssetPermissions(v11):andThen(function(v23)
                local l_responseBody_1 = v23.responseBody;
                if l_responseBody_1 then
                    v13.AssetPermissions = l_responseBody_1.results;
                end;
            end, function(v25)
                if v2.shouldDebugWarnings() then
                    warn("failed with onAssetPermissionsFailed in GetMarketplaceInfoRequest");
                end;
                v12:dispatch(v5(v25, v7.NetworkErrors.GET_ASSET_DETAIL_FAILURE));
            end)
        }):andThen(function()
            v12:dispatch(v6(v13));
        end);
    end;
end;
