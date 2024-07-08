local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Src.Thunks.FetchMarketplaceAssetInfo);
local v2 = require(l_Parent_0.Src.Util.cleanTimestamp);
local function v3(v4, v5, v6, v7)
    return function(v8)
        if #v6 > 50 then
            local v9 = {};
            for v10 = #v6, 50, -1 do
                table.insert(v9, v6[v10]);
                table.remove(v6, v10);
                if #v9 == 50 then
                    v8:dispatch(v3(v4, v5, v9, v7));
                    v9 = {};
                end;
            end;
            if #v9 > 0 then
                v8:dispatch(v3(v4, v5, v9, v7));
            end;
        end;
        return v4.Develop.v1.Plugins(v6):andThen(function(v11)
            local l_responseBody_0 = v11.responseBody;
            local v13 = {};
            for _, v15 in pairs(l_responseBody_0.data) do
                v13[v15.id] = {
                    assetId = v15.id, 
                    name = v15.name, 
                    description = v15.description, 
                    latestVersion = v15.versionId, 
                    updated = v2(v15.updated)
                };
            end;
            for _, v17 in pairs(v7) do
                if v13[v17.assetId] then
                    local v18 = v13[v17.assetId];
                    v18.enabled = v17.enabled;
                    v18.installedVersion = v17.installedVersion;
                    v18.isModerated = v17.isModerated;
                    v18.autoUpdateEnabled = v17.autoUpdateEnabled;
                    if not (#v6 ~= 0) then
                        break;
                    end;
                end;
            end;
            v8:dispatch(v1(v5, v13));
        end, function(_)
        end);
    end;
end;
return v3;
