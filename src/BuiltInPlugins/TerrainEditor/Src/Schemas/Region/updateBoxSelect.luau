local function _(v0)
    local v1 = v0.Position / 4;
    return (Vector3.new(math.floor(v1.X) * 4, math.floor(v1.Y) * 4, math.floor(v1.Z) * 4));
end;
return function(v3, v4, v5)
    local v6 = v3:viewportPointToRay(Vector2.new(v4.X, v4.Y));
    local v7 = v3:viewportPointToRay(Vector2.new(v5.X, v5.Y));
    local v8 = workspace:Raycast(v6.Origin, v6.Direction * 4096);
    local v9 = workspace:Raycast(v7.Origin, v7.Direction * 4096);
    if v8 and v9 then
        if not v3.selectionOnDragPoint then
            v3.selectionOnDragPoint = v8;
        end;
        local v10 = v3.selectionOnDragPoint.Position / 4;
        local v11 = Vector3.new(math.floor(v10.X) * 4, math.floor(v10.Y) * 4, math.floor(v10.Z) * 4);
        v10 = v9.Position / 4;
        local v12 = Vector3.new(math.floor(v10.X) * 4, math.floor(v10.Y) * 4, math.floor(v10.Z) * 4);
        v10 = v11:Min(v12);
        local v13 = v12:Max(v11);
        v3.updateSelectionOnDrag({
            Size = (v13 - v10):Max((Vector3.new(4, 4, 4))), 
            Transform = CFrame.new((v13 + v10) / 2)
        });
        return ;
    else
        return ;
    end;
end;
