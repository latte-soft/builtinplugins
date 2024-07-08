local function _(v0)
    local v1 = {};
    for v2 in pairs(v0) do
        table.insert(v1, v2);
    end;
    return v1;
end;
local function _(v4)
    local v5 = {};
    for v6 in pairs(v4) do
        table.insert(v5, v6);
    end;
    local l_v5_0 = v5;
    table.sort(l_v5_0);
    return l_v5_0;
end;
return function(v9, v10, v11, v12)
    local v13 = {};
    local v14 = 0;
    local v15 = 0;
    local v16 = {};
    local v17 = {};
    local v18 = {};
    local function _(v19)
        local v20 = v10[v19];
        if not v20 then
            v20 = false;
            if v11 ~= nil then
                v20 = v11[v19] ~= nil;
            end;
        end;
        return v20;
    end;
    local function v28(v22)
        local v23 = {};
        for v24, v25 in pairs(v22) do
            local v26 = v24:lower();
            local v27 = v10[v26];
            if not v27 then
                v27 = false;
                if v11 ~= nil then
                    v27 = v11[v26] ~= nil;
                end;
            end;
            if not v27 then
                v17[v24] = true;
            else
                table.insert(v23, {
                    locale = v26, 
                    translationText = v25
                });
                v16[v26] = true;
                v15 = v15 + 1;
                if v12 ~= nil then
                    v27 = v11[v26] or v26;
                    if not v12[v27] then
                        v18[v27] = true;
                    end;
                end;
            end;
        end;
        return v23;
    end;
    for _, v30 in ipairs(v9) do
        table.insert(v13, {
            identifier = {
                key = v30.Key or "", 
                context = v30.Context or "", 
                source = v30.Source or ""
            }, 
            metadata = {
                example = v30.Example or ""
            }, 
            translations = v28(v30.Values), 
            delete = false
        });
        v14 = v14 + 1;
    end;
    local v31 = {
        entries = v13, 
        totalRows = v14, 
        totalTranslations = v15
    };
    local l_concat_0 = table.concat;
    local v33 = {};
    for v34 in pairs(v16) do
        table.insert(v33, v34);
    end;
    local l_v33_0 = v33;
    table.sort(l_v33_0);
    v31.supportedLocales = l_concat_0(l_v33_0, ", ");
    l_concat_0 = table.concat;
    v33 = {};
    for v36 in pairs(v17) do
        table.insert(v33, v36);
    end;
    l_v33_0 = v33;
    table.sort(l_v33_0);
    v31.unsupportedLocales = l_concat_0(l_v33_0, ", ");
    l_concat_0 = table.concat;
    v33 = {};
    for v37 in pairs(v18) do
        table.insert(v33, v37);
    end;
    l_v33_0 = v33;
    table.sort(l_v33_0);
    v31.newLanguages = l_concat_0(l_v33_0, ", ");
    v31.newLanguagesSet = v18;
    return v31;
end;
