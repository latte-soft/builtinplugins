local v0 = {};
local _ = function(v1)
    local v2 = {};
    if v1 ~= nil then
        for _, v4 in pairs(v1) do
            v2[v4.assetTypeID] = v4;
        end;
    end;
    return v2;
end;
local function v19(v6, v7, v8)
    local v9 = {};
    if v6 ~= nil then
        for _, v11 in pairs(v6) do
            v9[v11.assetTypeID] = v11;
        end;
    end;
    local l_v9_0 = v9;
    local v13 = {};
    if v7 ~= nil then
        for _, v15 in pairs(v7) do
            v13[v15.assetTypeID] = v15;
        end;
    end;
    v9 = v13;
    v13 = {
        assetID = 0, 
        isPlayerChoice = true
    };
    for _, v17 in pairs(v9) do
        local v18 = l_v9_0[v17.assetTypeID] or v13;
        if not (not (not (v17.assetID == v18.assetID) or v17.isPlayerChoice ~= v18.isPlayerChoice) or v8(v17)) then
            return ;
        end;
    end;
end;
v0.isEqual = function(v20, v21)
    local v22 = true;
    v19(v20, v21, function()
        v22 = false;
        return false;
    end);
    return v22;
end;
v0.processSaveData = function(v23, v24)
    local v25 = {};
    v19(v23, v24, function(v26)
        v25[#v25 + 1] = v26;
        return true;
    end);
    return v25;
end;
v0.getErrors = function(v27)
    local v28 = nil;
    for _, v30 in pairs(v27) do
        if not v30.isPlayerChoice then
            local v31 = false;
            if v30.assetID ~= nil then
                v31 = false;
                if v30.assetID ~= 0 then
                    v31 = false;
                    if v30.assetID ~= "0" then
                        v31 = string.len((string.gsub(v30.assetID, " ", ""))) > 0;
                    end;
                end;
            end;
            if not v31 then
                v28 = v28 or {};
                v28[v30.assetTypeID] = "OverrideEmpty";
            end;
        end;
    end;
    return v28;
end;
return v0;
