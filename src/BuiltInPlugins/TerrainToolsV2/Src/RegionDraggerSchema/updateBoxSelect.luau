local v0 = require(script.Parent.Parent.Parent.Src.Util.Constants);
return function(v1, v2, v3)
    local v4 = v1:viewportPointToRay(Vector2.new(v2.X, v2.Y));
    local v5 = v1:viewportPointToRay(Vector2.new(v3.X, v3.Y));
    local v6 = workspace:Raycast(v4.Origin, v4.Direction * v0.RAY_CAST_LENGTH);
    local v7 = workspace:Raycast(v5.Origin, v5.Direction * v0.RAY_CAST_LENGTH);
    if v6 and v7 then
        v1.updateSelectionOnDrag(v6, v7);
        return ;
    else
        return ;
    end;
end;
