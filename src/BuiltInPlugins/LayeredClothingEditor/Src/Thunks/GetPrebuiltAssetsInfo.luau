local _ = game:GetService("AssetService");
local l_Parent_0 = script.Parent.Parent.Parent;
local v2 = require(l_Parent_0.Packages.Cryo);
local l_isProductionEnvironment_0 = require(l_Parent_0.Packages.AvatarToolsShared).Util.isProductionEnvironment;
local v4 = require(l_Parent_0.Src.Actions.SetPrebuiltAssetsInfo);
local _ = function(v5)
    local v6 = {};
    for _, v8 in pairs(v5) do
        v6[v8.id] = v8;
    end;
    return v6;
end;
local function v15(v10, v11)
    local v12 = {};
    for _, v14 in ipairs(v11) do
        v12[v14] = v10:GetBundleDetailsAsync(v14);
    end;
    return v12;
end;
return function(v16, v17, v18, v19)
    return function(v20)
        if l_isProductionEnvironment_0() then
            v16.api.Develop.V1.Assets.assets(v18):makeRequest():andThen(function(v21)
                local l_data_0 = v21.responseBody.data;
                local v23 = {};
                for _, v25 in pairs(l_data_0) do
                    v23[v25.id] = v25;
                end;
                v20:dispatch(v4((v2.Dictionary.join(v23, (v15(v17, v19))))));
            end, function(v26)
                local v27 = (v26 and v26.responseBody) and v26.responseBody.errors;
                if v27 then
                    for _, v29 in ipairs(v27) do
                        warn("Could not fetch information for assets: " .. tostring(v29.message));
                    end;
                    return ;
                else
                    warn("Could not fetch information for assets");
                    return ;
                end;
            end);
            return ;
        else
            return ;
        end;
    end;
end;
