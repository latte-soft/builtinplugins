local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Core.Util.AssetConfigConstants);
local v2 = require(l_Parent_0.Core.Actions.NetworkError);
local v3 = require(l_Parent_0.Core.Actions.UploadResult);
local v4 = require(l_Parent_0.Core.Util.DebugFlags);
local v5 = require(l_Parent_0.Core.Networking.Requests.ConfigureItemTagsRequest);
return function(v6, v7, v8, v9, v10, v11, v12, v13)
    return function(v14)
        local function v16(_)
            v14:dispatch(v5(v6, v7, v12, v13));
        end;
        local function v18(v17)
            if v4.shouldDebugWarnings() then
                warn("Lua toolbox: Could not configure sales");
            end;
            v14:dispatch(v2(v17));
            v14:dispatch(v3(false));
        end;
        local v19 = v9 == v1.ASSET_STATUS.OnSale;
        local v20 = not not v19 and v1.ASSET_STATUS.OnSale or v1.ASSET_STATUS.OffSale;
        local v21 = not not v19 and v11 or nil;
        if v8 ~= v9 then
            v6:configureSales(v7, v20, v21):andThen(v16, v18);
            return ;
        elseif v8 == v1.ASSET_STATUS.OnSale and v10 ~= v11 then
            v6:updateSales(v7, v21):andThen(v16, v18);
            return ;
        else
            v14:dispatch(v5(v6, v7, v12, v13));
            return ;
        end;
    end;
end;
