local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Cryo);
local v2 = require(l_Parent_0.Src.Util.Screens);
return function(v3, v4, _, v6, v7)
    local v8 = not not v3.index and v3.index + 1 or 1;
    return function(v9)
        local l_responseBody_0 = v9.responseBody;
        if l_responseBody_0 then
            if not v7 or not v6 then
                v3.previousPageCursor = l_responseBody_0.previousPageCursor;
                v3.nextPageCursor = l_responseBody_0.nextPageCursor;
            elseif l_responseBody_0.FinalPage then
                v3.pageNumber = nil;
            else
                v3.pageNumber = v6 + 1;
            end;
            local v11 = {};
            local v12 = v7 ~= nil and l_responseBody_0.Aliases or l_responseBody_0.data;
            for _, v14 in pairs(v12) do
                local v15 = {};
                if not v7 then
                    v15 = v14;
                else
                    v15.asset = v14.Asset;
                    v15.id = v14.TargetId;
                end;
                v15.assetType = v2[v4].AssetType;
                v15.layoutOrder = v8;
                v8 = v8 + 1;
                local v16 = false;
                if v7 then
                    for v17, v18 in pairs(v7) do
                        if not v18 or not string.find(v14.Name, v17) then
                            if v16 then
                                break;
                            end;
                        else
                            v15.name = string.gsub(v14.Name, v17, "");
                            v16 = true;
                        end;
                    end;
                    if not v16 then
                        continue;
                    end;
                end;
                v11 = v1.Dictionary.join(v11, {
                    [v7 ~= nil and v15.id or tostring(v14.id)] = v15
                });
            end;
            v3.assets = v1.Dictionary.join(v3.assets, v11);
            return v3, v8, l_responseBody_0.FinalPage;
        else
            return ;
        end;
    end;
end;
