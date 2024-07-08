local v0 = require(script.Parent.Parent.Parent.Packages.DraggerFramework.Utility.snapRotationToPrimaryDirection);
local function _(v1)
    return (math.max(v1.X, v1.Y, v1.Z));
end;
local function _(v3, v4)
    local v5, v6 = v3:ToAxisAngle();
    local v7, v8 = v4:ToAxisAngle();
    return v5:FuzzyEq(v7, 0.001) and math.abs(v6 - v8) < 0.001;
end;
local function v25(v10)
    local v11 = {};
    for _, v13 in v10, nil, nil do
        local v14 = false;
        for v15, v16 in v11, nil, nil do
            local v17, v18 = v13:ToAxisAngle();
            local v19, v20 = v15:ToAxisAngle();
            if v17:FuzzyEq(v19, 0.001) and math.abs(v18 - v20) < 0.001 then
                v11[v15] = v16 + 1;
                v14 = true;
                break;
            end;
        end;
        if not v14 then
            v11[v13] = 1;
        end;
    end;
    local v21 = 0;
    local v22 = nil;
    for v23, v24 in v11, nil, nil do
        if v21 < v24 then
            v21 = v24;
            v22 = v23;
        end;
    end;
    return v22;
end;
return function(v26)
    local v27 = {};
    local function v36(v28)
        for v29, v30 in v27, nil, nil do
            local v31, v32 = v28:ToAxisAngle();
            local v33, v34 = v29:ToAxisAngle();
            if v31:FuzzyEq(v33, 0.001) and math.abs(v32 - v34) < 0.001 then
                return v30;
            end;
        end;
        local v35 = {
            RotationList = {}, 
            TotalSize = 0, 
            Count = 0
        };
        v27[v28] = v35;
        return v35;
    end;
    for _, v38 in v26:GetDescendants() do
        if v38:IsA("PVInstance") then
            local l_Rotation_0 = v38:GetPivot().Rotation;
            local v40 = v36(v0(l_Rotation_0):Inverse() * l_Rotation_0);
            table.insert(v40.RotationList, l_Rotation_0);
            v40.Count = v40.Count + 1;
            if v38:IsA("BasePart") then
                local l_TotalSize_0 = v40.TotalSize;
                local l_ExtentsSize_0 = v38.ExtentsSize;
                v40.TotalSize = l_TotalSize_0 + math.max(l_ExtentsSize_0.X, l_ExtentsSize_0.Y, l_ExtentsSize_0.Z);
            end;
        end;
    end;
    local v43 = 0;
    local v44 = 0;
    local v45 = nil;
    local v46 = 0;
    local v47 = nil;
    for _, v49 in v27, nil, nil do
        if v43 < v49.Count then
            v43 = v49.Count;
            v45 = v49.RotationList;
            v44 = v49.TotalSize;
        end;
        if v46 < v49.TotalSize then
            v46 = v49.TotalSize;
            v47 = v49.RotationList;
        end;
    end;
    if not v45 or not v47 then
        return v26.WorldPivot;
    else
        v26.WorldPivot = v25(if not (v44 >= v46) or #v45 == 1 then v47 else v45);
        return v26:GetBoundingBox();
    end;
end;
