local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local l_Actions_0 = l_Parent_0.Core.Actions;
local v2 = require(l_Actions_0.NetworkError);
local v3 = require(l_Actions_0.SetLoading);
local v4 = require(l_Actions_0.GetAssets);
local v5 = require(l_Actions_0.SetCurrentPage);
local l_Util_0 = l_Parent_0.Core.Util;
local _ = require(l_Util_0.Analytics.AssetAnalytics);
local v8 = require(l_Util_0.PageInfoHelper);
local v9 = require(l_Parent_0.Core.Models.AssetInfo);
return function(v10, v11, v12, _, v14, v15, v16, v17)
    return function(v18)
        if not v8.isPageInfoStale(v16, v18) then
            v18:dispatch(v3(true));
            local function v25(v19)
                if not v8.isPageInfoStale(v16, v18) then
                    local l_responseBody_0 = v19.responseBody;
                    local v21 = {};
                    for _, v23 in pairs(l_responseBody_0.data) do
                        local v24 = v9.fromItemDetailsRequest(v23);
                        if not (not v24.Asset or not v24.Asset.Id) then
                            v24 = v9.AddContextToItemDetails(v24, v17[v24.Asset.Id]);
                        end;
                        table.insert(v21, v24);
                    end;
                    v18:dispatch(v4(v21, v12, v15));
                    v18:dispatch(v5(v14));
                    v18:dispatch(v3(false));
                    return ;
                else
                    return ;
                end;
            end;
            local function v27(v26)
                if not v8.isPageInfoStale(v16, v18) then
                    v18:dispatch(v3(false));
                    v18:dispatch(v2(v26));
                    return ;
                else
                    return ;
                end;
            end;
            if #v11 == 0 then
                return v25({
                    responseBody = {
                        data = {}
                    }
                });
            else
                return v10:getItemDetails(v11):andThen(v25, v27);
            end;
        else
            return ;
        end;
    end;
end;
