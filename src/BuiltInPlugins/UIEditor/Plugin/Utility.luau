local v0 = require(script.Parent.Error);
local v9 = {
    tablesAreEquivalent = function(_, v2, v3)
        if #v2 ~= #v3 then
            return false;
        else
            for v4 = 1, #v2 do
                if v2[v4] ~= v3[v4] then
                    return false;
                end;
            end;
            return true;
        end;
    end, 
    findItemInTable = function(_, v6, v7)
        if v6 then
            for v8 = 1, #v7 do
                if v7[v8] == v6 then
                    return v8;
                end;
            end;
            return 0;
        else
            return 0;
        end;
    end
};
v9.removeItemFromTable = function(_, v11, v12)
    local v13 = v9:findItemInTable(v11, v12);
    if v13 > 0 then
        table.remove(v12, v13);
        return true;
    else
        return false;
    end;
end;
v9.manhattanDistance = function(_, v15)
    return math.abs(v15.X) + math.abs(v15.Y);
end;
v9.crossVector2 = function(_, v17, v18)
    return v17.X * v18.Y - v17.Y * v18.X;
end;
v9.angleVector2 = function(_, v20, v21)
    return (math.atan2(v9:crossVector2(v20, v21), (v20:Dot(v21))));
end;
v9.floorVector2 = function(_, v23)
    return Vector2.new(math.floor(v23.X), (math.floor(v23.Y)));
end;
v9.minVector2 = function(_, v25, v26)
    return Vector2.new(math.min(v25.X, v26.X), (math.min(v25.Y, v26.Y)));
end;
v9.maxVector2 = function(_, v28, v29)
    return Vector2.new(math.max(v28.X, v29.X), (math.max(v28.Y, v29.Y)));
end;
v9.vector2ToUDim2Offset = function(_, v31)
    return UDim2.new(0, v31.X, 0, v31.Y);
end;
v9.minOrNil = function(_, v33, v34)
    if v33 then
        if v34 then
            return (math.min(v33, v34));
        else
            return v33;
        end;
    else
        return v34;
    end;
end;
v9.maxOrNil = function(_, v36, v37)
    if v36 then
        if v37 then
            return (math.max(v36, v37));
        else
            return v36;
        end;
    else
        return v37;
    end;
end;
v9.isOnlyScaleUDim2 = function(_, v39)
    local v40 = false;
    if v39.X.Offset == 0 then
        v40 = false;
        if v39.Y.Offset == 0 then
            v40 = true;
            if v39.X.Scale == 0 then
                v40 = v39.Y.Scale ~= 0;
            end;
        end;
    end;
    return v40;
end;
v9.isOnlyOffsetUDim2 = function(_, v42)
    local v43 = false;
    if v42.X.Scale == 0 then
        v43 = false;
        if v42.Y.Scale == 0 then
            v43 = true;
            if v42.X.Offset == 0 then
                v43 = v42.Y.Offset ~= 0;
            end;
        end;
    end;
    return v43;
end;
v9.distance = function(_, v45, v46)
    local v47 = type(v45) == "number";
    local v48 = type(v46) == "number";
    if not v47 or not v48 then
        if not v47 and not v48 then
            return (v46 - v45).magnitude;
        else
            v0("passed in one number and one non number");
            return ;
        end;
    else
        return (math.abs(v46 - v45));
    end;
end;
v9.cloneTable = function(_, v50)
    local v51 = {};
    local v52 = getmetatable(v50);
    local v53 = nil;
    for v54, v55 in pairs(v50) do
        if type(v55) == "table" then
            if v55 == v52 then
                v55 = v9:cloneTable(v55);
                v53 = v55;
            else
                v55 = v9:cloneTable(v55);
            end;
        end;
        v51[v54] = v55;
    end;
    if v52 ~= nil and v53 == nil then
        v53 = v9:cloneTable(v52);
    end;
    if v53 then
        setmetatable(v51, v53);
    end;
    return v51;
end;
v9.joinTables = function(_, v57, v58)
    local v59 = v9:cloneTable(v57);
    for v60 = 1, #v58 do
        table.insert(v59, v58[v60]);
    end;
    return v59;
end;
v9.rotate = function(_, v62, v63, v64)
    if v64 == 0 then
        return v62;
    else
        local v65 = math.rad(v64);
        return Vector2.new(((v62.X - v63.X) * math.cos(v65) - (v62.Y - v63.Y) * math.sin(v65)) + v63.X, ((v62.X - v63.X) * math.sin(v65) + (v62.Y - v63.Y) * math.cos(v65)) + v63.Y);
    end;
end;
v9.multUDimWithVector = function(_, v67, v68)
    return Vector2.new(v67.X.Offset, v67.Y.Offset) + Vector2.new(v67.X.Scale, v67.Y.Scale) * v68;
end;
return v9;
