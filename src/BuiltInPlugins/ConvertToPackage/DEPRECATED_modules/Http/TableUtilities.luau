local v0 = {};
local v1 = {};
v0.ShallowEqual = function(v2, v3, v4)
    if v2 and v3 then
        if v2 == v3 then
            return true;
        else
            if not v4 then
                v4 = v1;
            end;
            for v5, v6 in pairs(v2) do
                if not (not (v3[v5] ~= v6) or v4[v5]) then
                    return false;
                end;
            end;
            for v7, v8 in pairs(v3) do
                if not (not (v2[v7] ~= v8) or v4[v7]) then
                    return false;
                end;
            end;
            return true;
        end;
    else
        return false;
    end;
end;
v0.EqualKey = function(v9, v10, v11)
    if not ((not (not ((not v9 or not v10) or not v11) and v11 ~= "") or not v9[v11]) or not v10[v11]) and v9[v11] == v10[v11] then
        return true;
    else
        return false;
    end;
end;
v0.TableDifference = function(v12, v13)
    local v14 = {};
    for v15, v16 in pairs(v12) do
        if v13[v15] ~= v12[v15] then
            v14[v15] = v16;
        end;
    end;
    return v14;
end;
local function _(v17)
    local v18 = {};
    for v19 = 1, #v17 do
        v18[v17[v19]] = true;
    end;
    return v18;
end;
local _ = function(v21)
    local v22 = {};
    for v23, _ in pairs(v21) do
        table.insert(v22, v23);
    end;
    return v22;
end;
v0.ListDifference = function(v26, v27)
    local l_TableDifference_0 = v0.TableDifference;
    local v29 = {};
    for v30 = 1, #v26 do
        v29[v26[v30]] = true;
    end;
    local l_v29_0 = v29;
    local v32 = {};
    for v33 = 1, #v27 do
        v32[v27[v33]] = true;
    end;
    l_TableDifference_0 = l_TableDifference_0(l_v29_0, v32);
    l_v29_0 = {};
    for v34, _ in pairs(l_TableDifference_0) do
        table.insert(l_v29_0, v34);
    end;
    return l_v29_0;
end;
v0.CheckListConsistency = function(v36)
    local v37 = false;
    local v38 = false;
    local v39 = true;
    local v40 = 1;
    for v41, _ in pairs(v36) do
        if type(v41) == "string" then
            v38 = true;
        elseif type(v41) == "number" then
            if v40 ~= v41 then
                v39 = false;
            end;
            v37 = true;
        else
            return false;
        end;
        if not v38 or not v37 then
            v40 = v40 + 1;
        else
            return false;
        end;
    end;
    if not v37 then
        return true;
    else
        return v39;
    end;
end;
v0.RecursiveToString = function(v43, v44)
    v44 = v44 or "";
    if type(v43) == "table" then
        local v45 = "";
        if not v0.CheckListConsistency(v43) then
            v45 = v45 .. "-- WARNING: this table fails the list consistency test\n";
        end;
        v45 = v45 .. "{\n";
        for v46, v47 in pairs(v43) do
            if type(v46) == "string" then
                v45 = v45 .. "  " .. v44 .. tostring(v46) .. " = " .. v0.RecursiveToString(v47, "  " .. v44) .. ";\n";
            end;
            if type(v46) == "number" then
                v45 = v45 .. "  " .. v44 .. v0.RecursiveToString(v47, "  " .. v44) .. ",\n";
            end;
        end;
        return v45 .. v44 .. "}";
    else
        return (tostring(v43));
    end;
end;
return v0;
