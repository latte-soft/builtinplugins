local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Promise);
local v2 = require(l_Parent_0.Src.Actions.SetLoadedPluginData);
local function v3(v4, v5, v6)
    return function(v7)
        if v6 then
            v6 = v6 + 1;
            if v6 > 4 then
                return ;
            end;
        else
            v6 = 1;
        end;
        local v8 = 0;
        local v9 = 0;
        local v10 = {};
        local v11 = {};
        local v12 = {};
        for v13, v14 in pairs(v5) do
            table.insert(v12, (v1.new(function(v15, v16)
                spawn(function()
                    local l_status_0, l_result_0 = pcall(v4.GetProductInfo, v4, v14.assetId);
                    if not l_status_0 then
                        v16();
                        return ;
                    else
                        v15(l_result_0);
                        return ;
                    end;
                end);
            end):andThen(function(v19)
                if v19 then
                    v14.creator = v19.Creator;
                end;
                v10[v13] = v14;
                v8 = v8 + 1;
            end, function()
                v11[v13] = v14;
                v9 = v9 + 1;
            end)));
        end;
        v1.all(v12):await();
        if v8 > 0 then
            v7:dispatch(v2(v10));
        end;
        if v9 > 0 then
            spawn(function()
                wait((v6 - 1) * 8);
                v7:dispatch(v3(v4, v11, v6));
            end);
        end;
    end;
end;
return v3;
