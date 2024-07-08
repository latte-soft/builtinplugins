local v9 = {
    createConfig = function(v0)
        local v1 = true;
        if type(v0) ~= "table" then
            v1 = v0 == nil;
        end;
        assert(v1, "Bad config");
        v0 = v0 or {};
        if v0.caseSensitive == nil then
            v0.caseSensitive = false;
        elseif type(v0.caseSensitive) ~= "boolean" then
            error("Bad config.caseSensitive");
        end;
        v0.gapLeadingScore = v0.gapLeadingScore or -0.005;
        v0.gapTrailingScore = v0.gapTrailingScore or -0.005;
        v0.gapInnerScore = v0.gapInnerScore or -0.01;
        v0.consecutiveMatchScore = v0.consecutiveMatchScore or 1;
        v0.slashMatchScore = v0.slashMatchScore or 0.9;
        v0.wordMatchScore = v0.wordMatchScore or 0.8;
        v0.capitalMatchScore = v0.capitalMatchScore or 0.7;
        v0.dotMatchScore = v0.dotMatchScore or 0.6;
        v0.maxMatchLength = v0.maxMatchLength or 1024;
        return v0;
    end, 
    isFzyConfig = function(v2)
        local v3 = false;
        if type(v2) == "table" then
            v3 = false;
            if type(v2.gapLeadingScore) == "number" then
                v3 = false;
                if type(v2.gapTrailingScore) == "number" then
                    v3 = false;
                    if type(v2.gapInnerScore) == "number" then
                        v3 = false;
                        if type(v2.consecutiveMatchScore) == "number" then
                            v3 = false;
                            if type(v2.slashMatchScore) == "number" then
                                v3 = false;
                                if type(v2.wordMatchScore) == "number" then
                                    v3 = false;
                                    if type(v2.capitalMatchScore) == "number" then
                                        v3 = false;
                                        if type(v2.dotMatchScore) == "number" then
                                            v3 = false;
                                            if type(v2.maxMatchLength) == "number" then
                                                v3 = type(v2.caseSensitive) == "boolean";
                                            end;
                                        end;
                                    end;
                                end;
                            end;
                        end;
                    end;
                end;
            end;
        end;
        return v3;
    end, 
    hasMatch = function(v4, v5, v6)
        if not v4.caseSensitive then
            v5 = string.lower(v5);
            v6 = string.lower(v6);
        end;
        local v7 = 1;
        for v8 = 1, string.len(v5) do
            v7 = string.find(v6, v5:sub(v8, v8), v7, true);
            if v7 then
                v7 = v7 + 1;
            else
                return false;
            end;
        end;
        return true;
    end
};
local function _(v10)
    return string.match(v10, "%l");
end;
local function _(v12)
    return string.match(v12, "%u");
end;
local function v20(v14, v15)
    local v16 = {};
    local v17 = "/";
    for v18 = 1, string.len(v15) do
        local v19 = v15:sub(v18, v18);
        if not (v17 ~= "/") or v17 == "\\" then
            v16[v18] = v14.slashMatchScore;
        elseif not (v17 ~= "-" and v17 ~= "_") or v17 == " " then
            v16[v18] = v14.wordMatchScore;
        elseif v17 == "." then
            v16[v18] = v14.dotMatchScore;
        elseif not string.match(v17, "%l") or not string.match(v19, "%u") then
            v16[v18] = 0;
        else
            v16[v18] = v14.capitalMatchScore;
        end;
        v17 = v19;
    end;
    return v16;
end;
local function v37(v21, v22, v23, v24, v25)
    local v26 = v20(v21, v23);
    local v27 = string.len(v22);
    local v28 = string.len(v23);
    if not v21.caseSensitive then
        v22 = string.lower(v22);
        v23 = string.lower(v23);
    end;
    local v29 = {};
    for v30 = 1, v28 do
        v29[v30] = v23:sub(v30, v30);
    end;
    for v31 = 1, v27 do
        v24[v31] = {};
        v25[v31] = {};
        local v32 = -math.huge;
        local v33 = v31 == v27 and v21.gapTrailingScore or v21.gapInnerScore;
        local v34 = v22:sub(v31, v31);
        for v35 = 1, v28 do
            if v34 == v29[v35] then
                local v36 = -math.huge;
                if v31 == 1 then
                    v36 = (v35 - 1) * v21.gapLeadingScore + v26[v35];
                elseif v35 > 1 then
                    v36 = math.max(v25[v31 - 1][v35 - 1] + v26[v35], v24[v31 - 1][v35 - 1] + v21.consecutiveMatchScore);
                end;
                v24[v31][v35] = v36;
                v32 = math.max(v36, v32 + v33);
                v25[v31][v35] = v32;
            else
                v24[v31][v35] = -math.huge;
                v32 = v32 + v33;
                v25[v31][v35] = v32;
            end;
        end;
    end;
end;
v9.isPerfectMatch = function(v38, v39, v40)
    if not v38.caseSensitive then
        return string.lower(v39) == string.lower(v40);
    else
        return v39 == v40;
    end;
end;
v9.score = function(v41, v42, v43)
    local v44 = string.len(v42);
    local v45 = string.len(v43);
    if not ((v44 ~= 0 and v45 ~= 0) and v41.maxMatchLength >= v45) or v45 < v44 then
        return -math.huge;
    elseif not v9.isPerfectMatch(v41, v42, v43) then
        local v46 = {};
        local v47 = {};
        v37(v41, v42, v43, v46, v47);
        return v47[v44][v45];
    else
        return math.huge;
    end;
end;
v9.positions = function(v48, v49, v50)
    local v51 = string.len(v49);
    local v52 = string.len(v50);
    if not ((v51 ~= 0 and v52 ~= 0) and v48.maxMatchLength >= v52) or v52 < v51 then
        return {}, -math.huge;
    elseif not v9.isPerfectMatch(v48, v49, v50) then
        local v53 = {};
        local v54 = {};
        v37(v48, v49, v50, v53, v54);
        local v55 = {};
        local v56 = false;
        local l_v52_0 = v52;
        for v58 = v51, 1, -1 do
            while l_v52_0 >= 1 do
                if v53[v58][l_v52_0] ~= -math.huge and (v56 or v53[v58][l_v52_0] == v54[v58][l_v52_0]) then
                    local v59 = false;
                    if v58 ~= 1 then
                        v59 = false;
                        if l_v52_0 ~= 1 then
                            v59 = v54[v58][l_v52_0] == v53[v58 - 1][l_v52_0 - 1] + v48.consecutiveMatchScore;
                        end;
                    end;
                    v56 = v59;
                    v55[v58] = l_v52_0;
                    l_v52_0 = l_v52_0 - 1;
                    break;
                else
                    l_v52_0 = l_v52_0 - 1;
                end;
            end;
        end;
        return v55, v54[v51][v52];
    else
        local v60 = {};
        for v61 = 1, v51 do
            v60[v61] = v61;
        end;
        return v60, math.huge;
    end;
end;
v9.filter = function(v62, v63, v64)
    local v65 = {};
    for v66, v67 in ipairs(v64) do
        if v9.hasMatch(v62, v63, v67) then
            local v68, v69 = v9.positions(v62, v63, v67);
            table.insert(v65, {
                v66, 
                v68, 
                v69
            });
        end;
    end;
    return v65;
end;
v9.getMinScore = function()
    return -math.huge;
end;
v9.getMaxScore = function()
    return math.huge;
end;
v9.getMaxLength = function(v70)
    assert(v9.isFzyConfig(v70), "Bad config");
    return v70.maxMatchLength;
end;
v9.getScoreFloor = function(v71)
    assert(v9.isFzyConfig(v71), "Bad config");
    return v71.maxMatchLength * v71.gapInnerScore;
end;
v9.getScoreCeiling = function(v72)
    assert(v9.isFzyConfig(v72), "Bad config");
    return v72.maxMatchLength * v72.consecutiveMatchScore;
end;
return v9;
