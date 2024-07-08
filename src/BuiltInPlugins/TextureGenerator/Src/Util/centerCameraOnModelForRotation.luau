local v0 = require(script:FindFirstAncestor("TextureGenerator").Src.Util.Constants);
return function(v1, v2, v3, v4)
    local v5 = (v4 or v1:GetExtentsSize().Magnitude) * v0.CAMERA_DISTANCE_SCALE;
    local v6, v7, v8 = v2:ToEulerAnglesYXZ();
    local v9 = CFrame.fromEulerAnglesYXZ(-v6, -v7, -v8) * CFrame.lookAt(Vector3.new(), -v0.INITIAL_FOCUS_DIRECTION);
    local v10 = v5 * -v9.LookVector;
    local v11 = CFrame.new(v3 or Vector3.new());
    return CFrame.new(v11.Position + v10) * v9, v11;
end;
