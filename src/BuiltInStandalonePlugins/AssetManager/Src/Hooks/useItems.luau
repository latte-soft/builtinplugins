local l_script_FirstAncestor_0 = script:FindFirstAncestor("AssetManager");
local v1 = require(l_script_FirstAncestor_0.Packages.Dash);
local _ = v1.keys;
local l_copy_0 = v1.copy;
local v4 = require(l_script_FirstAncestor_0.Packages.React);
local l_useState_0 = v4.useState;
local l_useEffect_0 = v4.useEffect;
local v7 = require(l_script_FirstAncestor_0.Src.Util.compareInfoField);
local v8 = require(l_script_FirstAncestor_0.Src.Util.applyInfoFieldFilter);
local _ = require(l_script_FirstAncestor_0.Src.Types);
local function v14(v10, v11)
    for v12, v13 in v11, nil, nil do
        assert(v8[v12], (("No filter function for field %*"):format(v12)));
        if not v8[v12](v10, v13) then
            return false;
        end;
    end;
    return true;
end;
return function(v15)
    local v16, v17 = l_useState_0((v15:getItems()));
    local function v23(v18)
        local v19 = v15:getFilters();
        if next(v19, nil) == nil then
            return l_copy_0(v18);
        else
            local v20 = {};
            for _, v22 in v18, nil, nil do
                if v14(v22, v19) then
                    table.insert(v20, v22);
                end;
            end;
            return v20;
        end;
    end;
    local _ = function(v24)
        local v25 = v15:getSorts();
        if #v25 == 0 then
            return ;
        else
            table.sort(v24, function(v26, v27)
                for _, v29 in v25, nil, nil do
                    local v30 = v7[v29.Key](v26, v27, v29.IsAscending);
                    if v30 ~= 0 then
                        return v30 == 1;
                    end;
                end;
                return false;
            end);
            return ;
        end;
    end;
    l_useEffect_0(function()
        local v40 = v15.OnItemsChanged:Connect(function(v32)
            local v33 = v23(v32);
            local v34 = v15:getSorts();
            if not (#v34 == 0) then
                table.sort(v33, function(v35, v36)
                    for _, v38 in v34, nil, nil do
                        local v39 = v7[v38.Key](v35, v36, v38.IsAscending);
                        if v39 ~= 0 then
                            return v39 == 1;
                        end;
                    end;
                    return false;
                end);
            end;
            v17(v33);
        end);
        return function()
            v40:Disconnect();
        end;
    end, {});
    return v16;
end;
