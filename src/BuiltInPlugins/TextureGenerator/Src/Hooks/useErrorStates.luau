local l_script_FirstAncestor_0 = script:FindFirstAncestor("TextureGenerator");
local v1 = require(l_script_FirstAncestor_0.Packages.React);
local _ = require(l_script_FirstAncestor_0.Src.Types);
return function()
    local v3, v4 = v1.useState({});
    local function _(v5, v6)
        for v7, v8 in v5, nil, nil do
            if v8.id == v6 then
                return v7;
            end;
        end;
        return nil;
    end;
    return {
        addError = v1.useCallback(function(v10, v11, v12, v13, v14)
            v4(function(v15)
                if v15[v10] ~= nil then
                    local v16 = v15[v10];
                    local l_v11_0 = v11;
                    local v18;
                    for v19, v20 in v16, nil, nil do
                        if v20.id == l_v11_0 then
                            v18 = v19;
                            goto label0 --[[  true, false  ]];
                        end;
                    end;
                    v18 = nil;
                    ::label0::;
                    if v18 ~= nil then
                        return v15;
                    end;
                end;
                v15 = table.clone(v15);
                v15[v10] = if not v15[v10] then {} else table.clone(v15[v10]);
                table.insert(v15[v10], table.freeze({
                    id = v11, 
                    message = v13, 
                    title = v12, 
                    errorType = v14
                }));
                return v15;
            end);
        end, {}), 
        popError = v1.useCallback(function(v21)
            v4(function(v22)
                assert(v22[v21] ~= nil, "Popping error from mesh that doesn't have one");
                v22 = table.clone(v22);
                if #v22[v21] == 1 then
                    v22[v21] = nil;
                    return v22;
                else
                    v22[v21] = table.clone(v22[v21]);
                    table.remove(v22[v21], 1);
                    return v22;
                end;
            end);
        end, {}), 
        removeErrorById = v1.useCallback(function(v23, v24)
            v4(function(v25)
                if v25[v23] then
                    local v26 = v25[v23];
                    local l_v24_0 = v24;
                    local v28;
                    for v29, v30 in v26, nil, nil do
                        if v30.id == l_v24_0 then
                            v28 = v29;
                            goto label1 --[[  true, false  ]];
                        end;
                    end;
                    v28 = nil;
                    ::label1::;
                    if v28 then
                        v25 = table.clone(v25);
                        if #v25[v23] == 1 then
                            v25[v23] = nil;
                            return v25;
                        else
                            v25[v23] = table.clone(v25[v23]);
                            table.remove(v25[v23], v28);
                            return v25;
                        end;
                    else
                        return v25;
                    end;
                else
                    return v25;
                end;
            end);
        end, {}), 
        getTopError = v1.useCallback(function(v31)
            return v3[v31] and v3[v31][1];
        end, {
            v3
        })
    };
end;
