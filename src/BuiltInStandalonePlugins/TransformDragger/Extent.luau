local v0 = require(script.Parent.Utility);
unionVector3 = function(v1, v2, v3, v4)
    if v1 then
        v1 = v4:pointToObjectSpace(v1);
        v2 = if v2 then v4:pointToObjectSpace(v2) else v1;
        v3 = if v3 then v4:pointToObjectSpace(v3) else v1;
        if v1.x < v2.x then
            v2 = Vector3.new(v1.x, v2.y, v2.z);
        end;
        if v1.y < v2.y then
            v2 = Vector3.new(v2.x, v1.y, v2.z);
        end;
        if v1.z < v2.z then
            v2 = Vector3.new(v2.x, v2.y, v1.z);
        end;
        if v3.x < v1.x then
            v3 = Vector3.new(v1.x, v3.y, v3.z);
        end;
        if v3.y < v1.y then
            v3 = Vector3.new(v3.x, v1.y, v3.z);
        end;
        if v3.z < v1.z then
            v3 = Vector3.new(v3.x, v3.y, v1.z);
        end;
        return v4:pointToWorldSpace(v2), (v4:pointToWorldSpace(v3));
    else
        return v2, v3;
    end;
end;
unionTuple = function(v5, v6, v7, _)
    if v5.Lower or v5.Upper then
        if not v6 then
            v6 = v5.Lower;
        end;
        if not v7 then
            v7 = v5.Upper;
        end;
        return {
            Lower = v0.minVector3(v5.Lower, v6), 
            Upper = v0.maxVector3(v5.Upper, v7)
        };
    else
        return {
            Lower = nil, 
            Upper = nil
        };
    end;
end;
local v9 = 0;
unionVector3NoSpaceChange = function(v10, v11, v12)
    if v10 then
        if not v11 then
            v11 = v10;
        end;
        if not v12 then
            v12 = v10;
        end;
        if v10.x < v11.x then
            v11 = Vector3.new(v10.x, v11.y, v11.z);
        end;
        if v10.y < v11.y then
            v11 = Vector3.new(v11.x, v10.y, v11.z);
        end;
        if v10.z < v11.z then
            v11 = Vector3.new(v11.x, v11.y, v10.z);
        end;
        if v12.x < v10.x then
            v12 = Vector3.new(v10.x, v12.y, v12.z);
        end;
        if v12.y < v10.y then
            v12 = Vector3.new(v12.x, v10.y, v12.z);
        end;
        if v12.z < v10.z then
            v12 = Vector3.new(v12.x, v12.y, v10.z);
        end;
        return v11, v12;
    else
        return v11, v12;
    end;
end;
getPartBounds = function(v13, v14)
    local v15 = v13.Size / 2;
    local v16, v17 = unionVector3(v13.CFrame:pointToWorldSpace(v15 * Vector3.new(-1, -1, -1)), nil, nil, v14);
    v16, v17 = unionVector3(v13.CFrame:pointToWorldSpace(v15 * Vector3.new(-1, -1, 1)), v16, v17, v14);
    v16, v17 = unionVector3(v13.CFrame:pointToWorldSpace(v15 * Vector3.new(-1, 1, -1)), v16, v17, v14);
    v16, v17 = unionVector3(v13.CFrame:pointToWorldSpace(v15 * Vector3.new(-1, 1, 1)), v16, v17, v14);
    v16, v17 = unionVector3(v13.CFrame:pointToWorldSpace(v15 * Vector3.new(1, -1, -1)), v16, v17, v14);
    v16, v17 = unionVector3(v13.CFrame:pointToWorldSpace(v15 * Vector3.new(1, -1, 1)), v16, v17, v14);
    v16, v17 = unionVector3(v13.CFrame:pointToWorldSpace(v15 * Vector3.new(1, 1, -1)), v16, v17, v14);
    v16, v17 = unionVector3(v13.CFrame:pointToWorldSpace(v15 * Vector3.new(1, 1, 1)), v16, v17, v14);
    return v16, v17;
end;
getExtentsRecursive = function(v18, v19)
    v9 = v9 + 1;
    local v20 = nil;
    local v21 = nil;
    for _, v23 in ipairs((v18:GetChildren())) do
        local v24 = getExtentsRecursive(v23, v19);
        local v25, v26 = unionVector3(v24.Lower, v20, v21, v19);
        v25, v26 = unionVector3(v24.Upper, v25, v26, v19);
        v20 = v25;
        v21 = v26;
    end;
    if v18:IsA("BasePart") then
        local v27 = v18.Size / 2;
        local v28, v29 = unionVector3(v18.CFrame:pointToWorldSpace(v27 * Vector3.new(-1, -1, -1)), v20, v21, v19);
        v28, v29 = unionVector3(v18.CFrame:pointToWorldSpace(v27 * Vector3.new(-1, -1, 1)), v28, v29, v19);
        v28, v29 = unionVector3(v18.CFrame:pointToWorldSpace(v27 * Vector3.new(-1, 1, -1)), v28, v29, v19);
        v28, v29 = unionVector3(v18.CFrame:pointToWorldSpace(v27 * Vector3.new(-1, 1, 1)), v28, v29, v19);
        v28, v29 = unionVector3(v18.CFrame:pointToWorldSpace(v27 * Vector3.new(1, -1, -1)), v28, v29, v19);
        v28, v29 = unionVector3(v18.CFrame:pointToWorldSpace(v27 * Vector3.new(1, -1, 1)), v28, v29, v19);
        v28, v29 = unionVector3(v18.CFrame:pointToWorldSpace(v27 * Vector3.new(1, 1, -1)), v28, v29, v19);
        v28, v29 = unionVector3(v18.CFrame:pointToWorldSpace(v27 * Vector3.new(1, 1, 1)), v28, v29, v19);
        v20 = v28;
        v21 = v29;
    end;
    v9 = v9 - 1;
    return {
        Lower = v20, 
        Upper = v21
    };
end;
local function v39(v30)
    local v31 = game:GetService("Selection"):Get();
    local v32 = nil;
    local v33 = nil;
    for _, v35 in ipairs(v31) do
        if not ((not v35.Parent or not v35.Parent.Parent) or not v35:IsDescendantOf(workspace)) then
            local v36 = getExtentsRecursive(v35, v30);
            local v37, v38 = unionVector3(v36.Lower, v32, v33, v30);
            v37, v38 = unionVector3(v36.Upper, v37, v38, v30);
            v32 = v37;
            v33 = v38;
        end;
    end;
    if not (v32 and v33) then
        v32 = v30.p;
        v33 = v30.p;
    end;
    return v32, v33;
end;
local _ = require(script.Parent.FuzzyMath);
getExtentsOfList = function(v41, v42)
    local v43 = nil;
    local v44 = nil;
    for _, v46 in ipairs(v41) do
        local v47 = getExtentsRecursive(v46, v42);
        local v48, v49 = unionVector3(v47.Lower, v43, v44, v42);
        v48, v49 = unionVector3(v47.Upper, v48, v49, v42);
        v43 = v48;
        v44 = v49;
    end;
    if not v43 then
        v43 = Vector3.new(0, 0, 0);
    end;
    if not v44 then
        v44 = Vector3.new(0, 0, 0);
    end;
    return {
        Lower = v42:pointToObjectSpace(v43), 
        Upper = v42:pointToObjectSpace(v44)
    };
end;
getExtents = function(v50)
    local v51, v52 = v39(v50);
    return {
        Lower = v50:pointToObjectSpace(v51), 
        Upper = v50:pointToObjectSpace(v52)
    };
end;
extentsToCFrameAndSize = function(v53, v54)
    if v53.Lower and v53.Upper then
        local v55 = v0.absVector3(v53.Upper - v53.Lower);
        return v54:toWorldSpace(CFrame.new(v53.Lower + v55 / 2)), v55;
    else
        return nil, nil;
    end;
end;
setPartCFrameToExtents = function(v56, v57)
    local v58 = nil;
    v58 = v57 or CFrame.new((Vector3.new(0, 0, 0)));
    local v59, v60 = extentsToCFrameAndSize(getExtents(v58), v58);
    if v60 then
        v56.Size = v60;
    end;
    if v59 then
        v56.CFrame = v59;
    end;
end;
return {
    setPartCFrameToExtents = setPartCFrameToExtents, 
    unionVector3NoSpaceChange = unionVector3NoSpaceChange, 
    getPartBounds = getPartBounds, 
    getCFrameOfList = function(v61, v62)
        return (extentsToCFrameAndSize(getExtentsOfList(v61, v62), v62));
    end, 
    getSizeOfList = function(v63, v64)
        local _, v66 = extentsToCFrameAndSize(getExtentsOfList(v63, v64), v64);
        return v66;
    end, 
    getCFrameAndSizeOfList = function(v67, v68)
        return extentsToCFrameAndSize(getExtentsOfList(v67, v68), v68);
    end
};
