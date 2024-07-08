local l_script_FirstAncestor_0 = script:FindFirstAncestor("AvatarCompatibilityPreviewer");
local v1 = require(l_script_FirstAncestor_0.Packages.Dash);
local _ = require(l_script_FirstAncestor_0.Packages.LuaMeshEditingModule.Types);
local _ = require(l_script_FirstAncestor_0.Src.Types);
local v4 = require(script.binarySearchRange);
local function _(v5, v6)
    if math.abs(v5.X - v6.X) <= 1.0E-5 then
        return v5.Y < v6.Y;
    else
        return v5.X < v6.X;
    end;
end;
return function(v8, v9)
    local v10 = require(l_script_FirstAncestor_0.Src.Components.EditingTools.CageEditingTool.SymmetricalUVs);
    assert(buffer.len(v10) / 32 == buffer.len(v10) // 32, "SymmetricalUVs buffer is not divisible by cursor offset");
    local v12 = v1.filter(v8:GetDescendants(), function(v11)
        return v11:IsA("WrapTarget");
    end);
    if v9 == nil then
        v9 = warn;
    end;
    assert(v9 ~= nil, "Luau");
    local v13 = {};
    local v14 = {};
    local function v19(v15, v16, v17, v18)
        if v13[v15] == nil then
            v13[v15] = {};
        end;
        if v13[v15][v16] == nil then
            v13[v15][v16] = {};
        end;
        table.insert(v13[v15][v16], {
            targetName = v17, 
            vertex = v18
        });
    end;
    local function v30(v20)
        local v25 = v4(buffer.len(v10) // 32, function(v21)
            local v22 = buffer.readf64(v10, v21);
            local v23 = buffer.readf64(v10, v21 + 8);
            if not Vector3.new(v22, v23):FuzzyEq(v20, 1.0E-7) then
                if math.abs(v22 - v20.X) > 1.0E-7 then
                    if v20.X < v22 then
                        return "bigger";
                    else
                        return "smaller";
                    end;
                elseif v20.Y < v23 then
                    return "bigger";
                else
                    return "smaller";
                end;
            else
                return "equal";
            end;
        end, function(v24)
            return (v24 - 1) * 32;
        end);
        local v26 = {};
        for _, v28 in v25, nil, nil do
            local v29 = (v28 - 1) * 32;
            table.insert(v26, (Vector3.new(buffer.readf64(v10, v29 + 16), (buffer.readf64(v10, v29 + 24)))));
        end;
        return v26;
    end;
    local function v41(v31)
        local v32 = {};
        for _, v34 in v31, nil, nil do
            for _, v40 in (v4(#v14, function(v35)
                if not v35.uv:FuzzyEq(v34) then
                    local l_uv_0 = v35.uv;
                    local l_v34_0 = v34;
                    if not if math.abs(l_uv_0.X - l_v34_0.X) <= 1.0E-5 then l_uv_0.Y < l_v34_0.Y else l_uv_0.X < l_v34_0.X then
                        return "bigger";
                    else
                        return "smaller";
                    end;
                else
                    return "equal";
                end;
            end, function(v38)
                return v14[v38];
            end)), nil, nil do
                table.insert(v32, v14[v40]);
            end;
        end;
        return v32;
    end;
    debug.profilebegin("Collect points and UVs");
    for _, v43 in v12, nil, nil do
        for v44, v45 in v43:GetUVs(Enum.CageType.Outer) do
            table.insert(v14, {
                targetName = v43.Name, 
                vertex = v44, 
                uv = Vector3.new(v45.X, v45.Y)
            });
        end;
    end;
    debug.profileend();
    debug.profilebegin("Sort points and UVs");
    table.sort(v14, function(v46, v47)
        local l_uv_1 = v46.uv;
        local l_uv_2 = v47.uv;
        if math.abs(l_uv_1.X - l_uv_2.X) <= 1.0E-5 then
            return l_uv_1.Y < l_uv_2.Y;
        else
            return l_uv_1.X < l_uv_2.X;
        end;
    end);
    debug.profileend();
    debug.profilebegin("Create symmetry map");
    for _, v51 in v14, nil, nil do
        debug.profilebegin("Find what UVs are symmetrical");
        local v52 = v30(v51.uv);
        debug.profileend();
        if #v52 == 0 then
            local v53 = nil;
            for v54 = 0, buffer.len(v10) - 32, 32 do
                if Vector3.new(buffer.readf64(v10, v54), (buffer.readf64(v10, v54 + 8))):FuzzyEq(v51.uv, 1.0E-7) then
                    v53 = 1 + v54 // 32;
                    break;
                end;
            end;
            v9((("Couldn't find symmetrical UVs for %*:%* (at %*), was supposed to find it at index %*"):format(v51.targetName, v51.vertex, v51.uv, v53)));
        else
            debug.profilebegin("Find points with UV");
            for _, v56 in v41(v52) do
                v19(v51.targetName, v51.vertex, v56.targetName, v56.vertex);
                v19(v56.targetName, v56.vertex, v51.targetName, v51.vertex);
            end;
            debug.profileend();
        end;
    end;
    debug.profileend();
    return v13;
end;
