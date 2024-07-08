local _ = require(script.Parent.Parent.Parent.Parent.Src.Types);
local v19 = {
    string = function(v1)
        return string.format("'%s'", v1);
    end, 
    number = function(v2)
        return string.format("%.3f", v2);
    end, 
    UDim = function(v3)
        return string.format("{%.3f, %d}", v3.Scale, v3.Offset);
    end, 
    UDim2 = function(v4)
        return string.format("{%.3f, %d}, {%.3f, %d}", v4.X.Scale, v4.X.Offset, v4.Y.Scale, v4.Y.Offset);
    end, 
    Vector2 = function(v5)
        return string.format("{%.3f, %.3f}", v5.X, v5.Y);
    end, 
    Vector3 = function(v6)
        return string.format("{%.3f, %.3f, %.3f}", v6.X, v6.Y, v6.Z);
    end, 
    Rect = function(v7)
        return string.format("{%.3f, %.3f}, {%.3f, %.3f}", v7.Min.X, v7.Min.Y, v7.Max.X, v7.Max.Y);
    end, 
    Color3 = function(v8)
        return string.format("#%s", v8:ToHex());
    end, 
    Font = function(v9, v10)
        local v11 = v10.Fonts[v9.Family];
        if not v11 then
            return v9.Family:match("/([^%s/]+)%.json") or v9.Family;
        else
            return v11.Name;
        end;
    end, 
    BrickColor = function(v12)
        return v12.Name;
    end, 
    CFrame = function(v13)
        local v14, v15, v16 = v13:ToEulerAnglesXYZ();
        return string.format("{%.3f, %.3f, %.3f}, {%.3f, %.3f, %.3f}", v13.Position.X, v13.Position.Y, v13.Position.Z, v14, v15, v16);
    end, 
    NumberSequence = function(v17)
        if not (#v17.Keypoints <= 2) or v17.Keypoints[1].Value ~= v17.Keypoints[2].Value then
            return "<NumberSequence>";
        else
            return string.format("%.3f", v17.Keypoints[1].Value);
        end;
    end, 
    ColorSequence = function(v18)
        if not (#v18.Keypoints <= 2) or v18.Keypoints[1].Value ~= v18.Keypoints[2].Value then
            return "<ColorSequence>";
        else
            return string.format("#%s", v18.Keypoints[1].Value:ToHex());
        end;
    end
};
return function(v20, v21)
    local v22 = v19[typeof(v20)];
    if not v22 then
        return (tostring(v20));
    else
        return v22(v20, v21);
    end;
end;
