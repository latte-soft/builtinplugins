local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local l_HttpService_0 = game:GetService("HttpService");
local v2 = require(l_Parent_0.Core.Actions.NetworkError);
local v3 = require(l_Parent_0.Core.Actions.SetVersionHistoryData);
local v4 = require(l_Parent_0.Core.Actions.SetPackageDescriptions);
local v5 = require(l_Parent_0.Core.Flags.getFFlagToolboxAddPackageVersionDescriptions);
return function(v6, v7)
    return function(v8)
        if not v5() then
            return v6:getVersionsHistory(v7):andThen(function(v9)
                v8:dispatch(v3(l_HttpService_0:JSONDecode(v9.responseBody).data));
            end, function(v10)
                v8:dispatch(v2(v10));
            end);
        else
            return v6:getVersionsHistory(v7, 50):andThen(function(v11)
                local v12 = l_HttpService_0:JSONDecode(v11.responseBody);
                local v13 = {};
                for _, v15 in pairs(v12.data) do
                    table.insert(v13, {
                        assetId = v7, 
                        assetVersionNumber = v15.assetVersionNumber
                    });
                end;
                v6:getVersionDescriptions(v13):andThen(function(v16)
                    local l_responseBody_0 = v16.responseBody;
                    local v18 = {};
                    for _, v20 in pairs(l_responseBody_0.data) do
                        if v20.message:gsub("%s+", "") ~= "" then
                            v18[v20.assetVersionNumber] = v20.message;
                        else
                            v18[v20.assetVersionNumber] = "";
                        end;
                    end;
                    for _, v22 in pairs(v12.data) do
                        if not v18[v22.assetVersionNumber] then
                            v18[v22.assetVersionNumber] = "";
                        end;
                    end;
                    if not l_responseBody_0.data or #l_responseBody_0.data == 0 then
                        for _, v24 in pairs(v12.data) do
                            v18[v24.assetVersionNumber] = "";
                        end;
                    end;
                    v8:dispatch(v4(v18));
                end);
                v8:dispatch(v3(v12.data));
            end, function(v25)
                v8:dispatch(v2(v25));
            end);
        end;
    end;
end;
