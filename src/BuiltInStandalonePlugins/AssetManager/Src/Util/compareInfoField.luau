local v0 = require(script:FindFirstAncestor("AssetManager").Src.Types);
local l_AssetInfoField_0 = v0.AssetInfoField;
local v2 = {};
local function _(v3, v4, v5)
    if v3 == v4 then
        return 0;
    else
        local v6 = not v5 and -1 or 1;
        if v3 < v4 then
            return v6;
        else
            return -v6;
        end;
    end;
end;
local function _(v8, v9, v10, v11)
    local v12 = v8[v11];
    local v13 = v9[v11];
    if v12 == v13 then
        return 0;
    else
        local v14 = not v10 and -1 or 1;
        if v12 < v13 then
            return v14;
        else
            return -v14;
        end;
    end;
end;
v2[l_AssetInfoField_0.Created] = function(v16, v17, v18)
    local l_UnixTimestamp_0 = v16.Created.UnixTimestamp;
    local l_UnixTimestamp_1 = v17.Created.UnixTimestamp;
    if l_UnixTimestamp_0 == l_UnixTimestamp_1 then
        return 0;
    else
        local v21 = not v18 and -1 or 1;
        if l_UnixTimestamp_0 < l_UnixTimestamp_1 then
            return v21;
        else
            return -v21;
        end;
    end;
end;
v2[l_AssetInfoField_0.Modified] = function(v22, v23, v24)
    local l_UnixTimestamp_2 = v22.Modified.UnixTimestamp;
    local l_UnixTimestamp_3 = v23.Modified.UnixTimestamp;
    if l_UnixTimestamp_2 == l_UnixTimestamp_3 then
        return 0;
    else
        local v27 = not v24 and -1 or 1;
        if l_UnixTimestamp_2 < l_UnixTimestamp_3 then
            return v27;
        else
            return -v27;
        end;
    end;
end;
v2[l_AssetInfoField_0.Owner] = function(v28, v29, v30)
    local l_Name_0 = v28.Owner.Name;
    local l_Name_1 = v29.Owner.Name;
    if l_Name_0 == l_Name_1 then
        return 0;
    else
        local v33 = not v30 and -1 or 1;
        if l_Name_0 < l_Name_1 then
            return v33;
        else
            return -v33;
        end;
    end;
end;
for _, v35 in v0.getEnumAsList(l_AssetInfoField_0) do
    if not v2[v35] then
        v2[v35] = function(v36, v37, v38)
            local l_v35_0 = v35;
            local v40 = v36[l_v35_0];
            local v41 = v37[l_v35_0];
            if v40 == v41 then
                return 0;
            else
                local v42 = not v38 and -1 or 1;
                if v40 < v41 then
                    return v42;
                else
                    return -v42;
                end;
            end;
        end;
    end;
end;
return v2;
