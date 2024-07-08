local l_Parent_0 = script.Parent;
local v1 = require(l_Parent_0.Constants);
local v2 = require(l_Parent_0.StringUtil);
local v3 = {};
local v4 = {
    "\").", 
    "').", 
    "\"].", 
    "'].", 
    ".", 
    "[\"", 
    ":FindFirstChild(\"", 
    ":FindFirstChild\"", 
    ":WaitForChild(\"", 
    ":WaitForChild\""
};
local _ = function(v5)
    for _, v7 in v4, nil, nil do
        if v5 == v7 then
            return true;
        end;
    end;
    return false;
end;
local function _(v9, v10)
    local v11, v12 = string.find(v9, v10, nil, true);
    if (not v11 or not v12) or not v2.MatchBefore(v9, v11, "[[%s.,(=+-*/\"']", true) then
        return nil;
    else
        return v11, v12;
    end;
end;
local function v26(v14)
    local v15 = {};
    local v16 = nil;
    local v17 = nil;
    local v18 = nil;
    local v19 = nil;
    local v20 = nil;
    local v21 = false;
    local v22 = false;
    local v23 = {};
    for v24 = 1, string.len(v14) do
        local v25 = v2.CharAt(v14, v24);
        if not string.match(v25, "%S") then
            if not (not ((not (not v16 or not string.match(v16, "%p")) and v16 ~= "=") and v16 ~= ",") or v22) then
                v22 = true;
                if not v19 then
                    if v17 then
                        v18 = v24 - 1;
                    end;
                else
                    v20 = v24 - 1;
                end;
            end;
        else
            if v22 then
                if not (not v17 or not v18) then
                    v23.Left = {
                        [v1.StartKey] = v17, 
                        [v1.EndKey] = v18
                    };
                end;
                if not (not v19 or not v20) then
                    v23.Right = {
                        [v1.StartKey] = v19, 
                        [v1.EndKey] = v20
                    };
                end;
                table.insert(v15, v23);
                v23 = {};
                v17 = nil;
                v18 = nil;
                v19 = nil;
                v20 = nil;
                v22 = false;
            end;
            if not v17 then
                v17 = v24;
            end;
            if v21 then
                if v25 ~= "=" then
                    v19 = v24;
                    if not (not v17 or not v18) then
                        v23.Left = {
                            [v1.StartKey] = v17, 
                            [v1.EndKey] = v18
                        };
                    end;
                else
                    v18 = nil;
                end;
                v21 = false;
            elseif v25 == "=" and v16 ~= "~" then
                v18 = v24 - 1;
                v21 = true;
            end;
        end;
        v16 = v25;
    end;
    v23 = {};
    if v17 then
        v23.Left = {
            [v1.StartKey] = v17, 
            [v1.EndKey] = v18 or string.len(v14)
        };
    end;
    if v19 then
        v23.Right = {
            [v1.StartKey] = v19, 
            [v1.EndKey] = v20 or string.len(v14)
        };
    end;
    if next(v23) then
        table.insert(v15, v23);
    end;
    return v15;
end;
local function _(v27, v28)
    local l_v27_0 = v27;
    if l_v27_0 then
        l_v27_0 = v27.Left;
        if l_v27_0 then
            l_v27_0 = false;
            if v27.Left[v1.StartKey] <= v28 then
                l_v27_0 = v28 <= v27.Left[v1.EndKey];
            end;
        end;
    end;
    return l_v27_0;
end;
local function _(v31, v32)
    local l_v31_0 = v31;
    if l_v31_0 then
        l_v31_0 = v31.Right;
        if l_v31_0 then
            l_v31_0 = false;
            if v31.Right[v1.StartKey] <= v32 then
                l_v31_0 = v32 <= v31.Right[v1.EndKey];
            end;
        end;
    end;
    return l_v31_0;
end;
v3.GetStatement = function(_, v36, v37)
    for _, v39 in ipairs((v26(v36))) do
        local l_v39_0 = v39;
        if l_v39_0 then
            l_v39_0 = v39.Left;
            if l_v39_0 then
                l_v39_0 = false;
                if v39.Left[v1.StartKey] <= v37 then
                    l_v39_0 = v37 <= v39.Left[v1.EndKey];
                end;
            end;
        end;
        if not l_v39_0 then
            l_v39_0 = v39;
            if l_v39_0 then
                l_v39_0 = v39.Right;
                if l_v39_0 then
                    l_v39_0 = false;
                    if v39.Right[v1.StartKey] <= v37 then
                        l_v39_0 = v37 <= v39.Right[v1.EndKey];
                    end;
                end;
            end;
            if not l_v39_0 then
                continue;
            end;
        end;
        return v39;
    end;
    return nil;
end;
v3.GetLeftSide = function(v41, v42, v43)
    local l_v41_Statement_0 = v41:GetStatement(v42, v43);
    if not l_v41_Statement_0 then
        return nil;
    else
        return l_v41_Statement_0.Left;
    end;
end;
v3.GetRightSide = function(v45, v46, v47)
    local l_v45_Statement_0 = v45:GetStatement(v46, v47);
    if l_v45_Statement_0 then
        local l_l_v45_Statement_0_0 = l_v45_Statement_0;
        if l_l_v45_Statement_0_0 then
            l_l_v45_Statement_0_0 = l_v45_Statement_0.Right;
            if l_l_v45_Statement_0_0 then
                l_l_v45_Statement_0_0 = false;
                if l_v45_Statement_0.Right[v1.StartKey] <= v47 then
                    l_l_v45_Statement_0_0 = v47 <= l_v45_Statement_0.Right[v1.EndKey];
                end;
            end;
        end;
        if l_l_v45_Statement_0_0 then
            return l_v45_Statement_0.Right;
        end;
    end;
    return nil;
end;
v3.FindVariableAssignment = function(v50, v51, v52, v53)
    local l_v50_LeftSide_0 = v50:GetLeftSide(v52, v53);
    if l_v50_LeftSide_0 then
        local v55 = string.sub(v52, l_v50_LeftSide_0.start, l_v50_LeftSide_0[v1.EndKey]);
        for v56, v57 in pairs(v51) do
            local v58, v59 = string.find(v55, v56, nil, true);
            if if (not not v58 and v59) and v2.MatchBefore(v55, v58, "[[%s.,(=+-*/\"']", true) then v58 else nil ~= nil then
                return v56, v57;
            end;
        end;
        return nil;
    else
        return nil;
    end;
end;
v3.FindVariableAccess = function(v60, v61, v62, v63)
    local v64 = v60:GetRightSide(v61, v62) or v60:GetLeftSide(v61, v62);
    if v64 then
        local v65 = string.sub(v61, v64.start, v62 - 1);
        local l_v65_0 = v65;
        local v67, v68 = string.find(l_v65_0, v63, nil, true);
        local v69, v70;
        if (not v67 or not v68) or not v2.MatchBefore(l_v65_0, v67, "[[%s.,(=+-*/\"']", true) then
            v69 = nil;
            v70 = nil;
        else
            v69 = v67;
            v70 = v68;
        end;
        while v69 ~= nil and v70 ~= nil do
            v68 = v2.RemoveWhitespace((string.sub(v65, v70 + 1, v62)));
            for _, v72 in v4, nil, nil do
                if v68 == v72 then
                    v67 = true;
                    goto label0 --[[  true, false  ]];
                end;
            end;
            v67 = false;
            ::label0::;
            if not v67 then
                v65 = string.sub(v65, v70 + 1, (string.len(v65)));
                local l_v65_1 = v65;
                local v74, v75 = string.find(l_v65_1, v63, nil, true);
                if (not v74 or not v75) or not v2.MatchBefore(l_v65_1, v74, "[[%s.,(=+-*/\"']", true) then
                    v67 = nil;
                    v68 = nil;
                else
                    v67 = v74;
                    v68 = v75;
                end;
                v69 = v67;
                v70 = v68;
            else
                return v63;
            end;
        end;
    end;
    return nil;
end;
return v3;
