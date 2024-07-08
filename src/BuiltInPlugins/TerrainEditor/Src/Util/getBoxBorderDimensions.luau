return function(v0, v1, v2)
    return {
        TopFront = {
            Transform = v0 * CFrame.new(0, v1.Y / 2, v1.Z / 2), 
            Size = Vector3.new(v1.X + v2, v2, v2)
        }, 
        BottomFront = {
            Transform = v0 * CFrame.new(0, -v1.Y / 2, v1.Z / 2), 
            Size = Vector3.new(v1.X + v2, v2, v2)
        }, 
        LeftFront = {
            Transform = v0 * CFrame.new(-v1.X / 2, 0, v1.Z / 2), 
            Size = Vector3.new(v2, v1.Y + v2, v2)
        }, 
        RightFront = {
            Transform = v0 * CFrame.new(v1.X / 2, 0, v1.Z / 2), 
            Size = Vector3.new(v2, v1.Y + v2, v2)
        }, 
        TopBack = {
            Transform = v0 * CFrame.new(0, v1.Y / 2, -v1.Z / 2), 
            Size = Vector3.new(v1.X + v2, v2, v2)
        }, 
        BottomBack = {
            Transform = v0 * CFrame.new(0, -v1.Y / 2, -v1.Z / 2), 
            Size = Vector3.new(v1.X + v2, v2, v2)
        }, 
        LeftBack = {
            Transform = v0 * CFrame.new(-v1.X / 2, 0, -v1.Z / 2), 
            Size = Vector3.new(v2, v1.Y + v2, v2)
        }, 
        RightBack = {
            Transform = v0 * CFrame.new(v1.X / 2, 0, -v1.Z / 2), 
            Size = Vector3.new(v2, v1.Y + v2, v2)
        }, 
        TopLeft = {
            Transform = v0 * CFrame.new(-v1.X / 2, v1.Y / 2, 0), 
            Size = Vector3.new(v2, v2, v1.Z + v2)
        }, 
        BottomLeft = {
            Transform = v0 * CFrame.new(-v1.X / 2, -v1.Y / 2, 0), 
            Size = Vector3.new(v2, v2, v1.Z + v2)
        }, 
        TopRight = {
            Transform = v0 * CFrame.new(v1.X / 2, v1.Y / 2, 0), 
            Size = Vector3.new(v2, v2, v1.Z + v2)
        }, 
        BottomRight = {
            Transform = v0 * CFrame.new(v1.X / 2, -v1.Y / 2, 0), 
            Size = Vector3.new(v2, v2, v1.Z + v2)
        }
    };
end;
