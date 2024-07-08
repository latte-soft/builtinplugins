local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local l_Packages_0 = l_Parent_0.Packages;
local v2 = require(l_Packages_0.Cryo);
local v3 = require(l_Parent_0.Core.Actions.SetPackagePermission);
local v4 = require(l_Parent_0.Core.Actions.NetworkError);
local v5 = require(l_Parent_0.Core.Components.AssetConfiguration.Permissions.PermissionsConstants);
local v6 = require(l_Parent_0.Core.Util.Permissions.KeyConverter);
local v7 = require(l_Parent_0.Core.Util.Analytics.Analytics);
local l_Promise_0 = require(l_Packages_0.Framework).Util.Promise;
local function _(v9, v10)
    if v9 == nil then
        return v10;
    else
        local v11 = {
            [v5.OwnKey] = 4, 
            [v5.EditKey] = 3, 
            [v5.UseViewKey] = 2, 
            [v5.NoAccessKey] = 1
        };
        if v11[v9] < v11[v10] then
            return v10;
        else
            return v9;
        end;
    end;
end;
local function v21(v13)
    local v14 = {};
    for _, v16 in ipairs(v13) do
        local v17 = v6.resolveActionPermission(v16.action, v16.status, v16.assetId);
        if v17 ~= v5.NoneKey then
            local v18 = v14[v16.assetId];
            local v19;
            if v18 == nil then
                v19 = v17;
            else
                local v20 = {
                    [v5.OwnKey] = 4, 
                    [v5.EditKey] = 3, 
                    [v5.UseViewKey] = 2, 
                    [v5.NoAccessKey] = 1
                };
                v19 = if v20[v18] < v20[v17] then v17 else v18;
            end;
            v14 = v2.Dictionary.join(v14, {
                [v16.assetId] = v19
            });
        end;
    end;
    return v14;
end;
return function(v22, v23)
    return function(v24)
        local v25 = {};
        for _, v27 in pairs(v23) do
            v25[v27] = v5.NoAccessKey;
        end;
        v24:dispatch(v3(v25));
        local v28 = {
            "Edit", 
            "Use", 
            "GrantAssetPermissions"
        };
        local v29 = {};
        local v30 = {};
        local l_game_FastInt_0 = game:GetFastInt("MaxPackageAssetIdsPerPermissionRequest");
        for v32 = 1, #v23, l_game_FastInt_0 do
            table.insert(v30, v22:postAssetCheckPermissions(v28, {
                table.unpack(v23, v32, v32 + (l_game_FastInt_0 - 1))
            }):andThen(function(v33)
                v7.sendResultToKibana(v33);
                v29 = v2.List.join(v29, v33.responseBody.results);
            end, function(v34)
                v7.sendResultToKibana(v34);
                v24:dispatch(v4(v34));
            end));
        end;
        l_Promise_0.all(v30):andThen(function()
            if #v29 ~= 0 then
                v24:dispatch(v3((v21(v29))));
            end;
        end);
    end;
end;
