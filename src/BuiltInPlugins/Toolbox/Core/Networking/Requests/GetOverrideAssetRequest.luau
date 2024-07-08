local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local l_Util_0 = l_Parent_0.Core.Util;
local _ = require(l_Util_0.AssetConfigConstants);
local _ = require(l_Util_0.PagedRequestCursor);
local v4 = require(l_Util_0.DebugFlags);
local l_Actions_0 = l_Parent_0.Core.Actions;
local v6 = require(l_Actions_0.NetworkError);
local v7 = require(l_Actions_0.SetOverrideAssets);
local v8 = require(l_Actions_0.SetLoadingPage);
local v9 = require(l_Actions_0.UpdateOverrideAssetData);
local v10 = require(l_Actions_0.SetCurrentPage);
local v11 = require(l_Actions_0.SetOverrideCursor);
local _ = function(v12, v13)
    local v14 = {};
    for _, v16 in pairs(v12) do
        if v16.Creator.Id == v13 then
            table.insert(v14, v16);
        end;
    end;
    return v14;
end;
local function v22(v18)
    local v19 = {};
    if v18 then
        for _, v21 in pairs(v18) do
            v19[#v19 + 1] = {
                Asset = {
                    Id = v21.id or v21.assetId, 
                    Name = v21.name or ""
                }
            };
        end;
    end;
    return v19;
end;
local function _(v23)
    local l_overrideCursor_0 = v23:getState().overrideCursor;
    local v25 = "";
    if l_overrideCursor_0.nextPageCursor then
        v25 = l_overrideCursor_0.nextPageCursor;
    end;
    return v25;
end;
return function(v27, v28, v29, v30, v31)
    return function(v32)
        local v33 = v32:getState().loadingPage or 0;
        if v4.shouldDebugOverrideAssetLoading() then
            print(string.format("GetOverrideAssetRequest: curr=%s, loading=%s, target=%s", tostring(v32:getState().currentPage), tostring(v32:getState().loadingPage), (tostring(v31))));
        end;
        if v31 > 1 then
            if not v32:getState().fetchedAll then
                if v31 <= v33 then
                    if v4.shouldDebugOverrideAssetLoading() then
                        print("GetOverrideAssetRequest: loadingPage >= targetPage, stopping");
                    end;
                    return ;
                end;
            else
                if v4.shouldDebugOverrideAssetLoading() then
                    print("GetOverrideAssetRequest: fetchedAll, stopping");
                end;
                return ;
            end;
        end;
        if v4.shouldDebugOverrideAssetLoading() then
            print("GetOverrideAssetRequest: continuing to run request");
        end;
        v32:dispatch(v8(v31));
        local function v35(v34)
            v32:dispatch(v6(v34));
            v32:dispatch(v8(0));
        end;
        local function v42(v36)
            if v4.shouldDebugOverrideAssetLoading() then
                print(string.format("handleGetCreationOverrideSuccess: curr=%s, loading=%s, target=%s", tostring(v32:getState().currentPage), tostring(v32:getState().loadingPage), (tostring(v31))));
            end;
            local l_responseBody_0 = v36.responseBody;
            local v38 = v22(l_responseBody_0.data);
            if v31 == 1 then
                v32:dispatch(v7(v38));
                v32:dispatch(v11({
                    nextPageCursor = l_responseBody_0.nextPageCursor
                }));
                v32:dispatch(v10(1));
            else
                local l_overrideCursor_1 = v32:getState().overrideCursor;
                local v40 = l_responseBody_0.nextPageCursor ~= nil;
                local v41 = not v40;
                if v40 then
                    l_overrideCursor_1 = {
                        nextPageCursor = l_responseBody_0.nextPageCursor
                    };
                end;
                v32:dispatch(v9(v38, v41));
                v32:dispatch(v11(l_overrideCursor_1));
                v32:dispatch(v10(v31));
            end;
            v32:dispatch(v8(0));
        end;
        local v43 = nil;
        if v29 == "Group" then
            v43 = v30;
        end;
        if v29 == "Group" then
            local l_overrideCursor_2 = v32:getState().overrideCursor;
            local v45 = "";
            if l_overrideCursor_2.nextPageCursor then
                v45 = l_overrideCursor_2.nextPageCursor;
            end;
            v27:getAssetGroupCreations(nil, v45, v28, v43):andThen(v42, v35);
            return ;
        else
            local l_overrideCursor_3 = v32:getState().overrideCursor;
            local v47 = "";
            if l_overrideCursor_3.nextPageCursor then
                v47 = l_overrideCursor_3.nextPageCursor;
            end;
            return v27:getAssetCreations(nil, v47, v28):andThen(v42, v35);
        end;
    end;
end;
