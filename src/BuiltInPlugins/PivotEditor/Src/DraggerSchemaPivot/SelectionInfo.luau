local _ = script.Parent.Parent.Parent;
local function v4(_, v2)
    local v3 = v2[1];
    if not v3 or not v3:IsA("PVInstance") then
        return {
            _primaryObject = nil, 
            _isEmpty = true, 
            _basisCFrame = CFrame.new()
        };
    else
        return {
            _primaryObject = v3, 
            _isEmpty = false, 
            _basisCFrame = v3:GetPivot()
        };
    end;
end;
local v5 = {};
v5.__index = v5;
v5.new = function(v6, v7)
    return (setmetatable(v4(v6, v7), v5));
end;
v5.isEmpty = function(v8)
    return v8._isEmpty;
end;
v5.getBoundingBox = function(v9)
    return v9._basisCFrame, Vector3.new(), (Vector3.new());
end;
v5.doesContainItem = function(v10, v11)
    local l__primaryObject_0 = v10._primaryObject;
    local v13 = not v10._isEmpty;
    if v13 then
        v13 = true;
        if v11 ~= l__primaryObject_0 then
            v13 = v11:IsDescendantOf(v10._primaryObject);
        end;
    end;
    return v13;
end;
v5.getPrimaryObject = function(v14)
    return v14._primaryObject;
end;
v5.isDynamic = function(_)
    return false;
end;
return v5;
