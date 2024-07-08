local function v3(v0, v1)
    for v2 = 1, #v1 do
        if v1[v2] == v0 then
            return true;
        end;
    end;
    return false;
end;
local function v11(v4, v5)
    if v4 then
        local v6 = {};
        for v7 = 1, #v5 do
            local v8 = v5[v7];
            local v9;
            for v10 = 1, #v4 do
                if v4[v10] == v8 then
                    v9 = true;
                    goto label0 --[[  true, false  ]];
                end;
            end;
            v9 = false;
            ::label0::;
            if not v9 then
                table.insert(v6, v5[v7]);
            end;
        end;
        return v6;
    else
        return v5;
    end;
end;
local function v17(v12, v13)
    local v14 = {};
    for v15 = 1, #v13 do
        v14[v13[v15]] = true;
    end;
    for v16 = 1, #v12 do
        if v14[v12[v16]] then
            return true;
        end;
    end;
    return false;
end;
local function v23(v18, v19)
    if v19 or not v18 then
        if v19 or v18 then
            local v20 = {};
            for v21 = 1, #v19 do
                v20[v19[v21]] = true;
            end;
            for v22 = 1, #v18 do
                if not v20[v18[v22]] then
                    return true;
                end;
            end;
            return false;
        else
            return false;
        end;
    else
        return true;
    end;
end;
local function v28(v24, v25)
    for _, v27 in ipairs(v25) do
        table.insert(v24, v27);
    end;
    return v24;
end;
local function v29(v30, v31)
    local l_v30_Children_0 = v30:GetChildren();
    local v33 = {};
    for _, v35 in ipairs(l_v30_Children_0) do
        if v35:IsA("PartInstance") then
            local v36;
            for v37 = 1, #v31 do
                if v31[v37] == v35 then
                    v36 = true;
                    goto label1 --[[  true, false  ]];
                end;
            end;
            v36 = false;
            ::label1::;
            if not v36 then
                table.insert(v33, v35);
            end;
        end;
        if not (not v35:IsA("PVInstance") or v35:IsA("Workspace")) then
            local l_v33_0 = v33;
            for _, v40 in ipairs((v29(v35, v31))) do
                table.insert(l_v33_0, v40);
            end;
            v33 = l_v33_0;
        end;
    end;
    return v33;
end;
return {
    itemExistsInList = v3, 
    filterOutItems = v11, 
    combineLists = v28, 
    createIgnoreListGivenWhiteList = v29, 
    removeDuplicates = function(v41)
        local v42 = {};
        local v43 = {};
        for v44 = 1, #v41 do
            if not v43[v41[v44]] then
                v43[v41[v44]] = true;
                table.insert(v42, v41[v44]);
            end;
        end;
        return v42;
    end, 
    listDoesNotContainType = function(v45, v46)
        for v47 = 1, #v45 do
            if v45[v47]:IsA(v46) then
                return false;
            end;
        end;
        return true;
    end, 
    listContainsAnyItems = v17, 
    itemsHasItemNotInList = v23
};
