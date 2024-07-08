return function(v0, v1, v2)
    return {
        TopFront = {
            CFrame = v0 * CFrame.new(0, v1.Y / 2, v1.Z / 2), 
            Size = Vector3.new(v1.X + v2, v2, v2)
        }, 
        BottomFront = {
            CFrame = v0 * CFrame.new(0, -v1.Y / 2, v1.Z / 2), 
            Size = Vector3.new(v1.X + v2, v2, v2)
        }, 
        LeftFront = {
            CFrame = v0 * CFrame.new(-v1.X / 2, 0, v1.Z / 2), 
            Size = Vector3.new(v2, v1.Y + v2, v2)
        }, 
        RightFront = {
            CFrame = v0 * CFrame.new(v1.X / 2, 0, v1.Z / 2), 
            Size = Vector3.new(v2, v1.Y + v2, v2)
        }, 
        TopBack = {
            CFrame = v0 * CFrame.new(0, v1.Y / 2, -v1.Z / 2), 
            Size = Vector3.new(v1.X + v2, v2, v2)
        }, 
        BottomBack = {
            CFrame = v0 * CFrame.new(0, -v1.Y / 2, -v1.Z / 2), 
            Size = Vector3.new(v1.X + v2, v2, v2)
        }, 
        LeftBack = {
            CFrame = v0 * CFrame.new(-v1.X / 2, 0, -v1.Z / 2), 
            Size = Vector3.new(v2, v1.Y + v2, v2)
        }, 
        RightBack = {
            CFrame = v0 * CFrame.new(v1.X / 2, 0, -v1.Z / 2), 
            Size = Vector3.new(v2, v1.Y + v2, v2)
        }, 
        TopLeft = {
            CFrame = v0 * CFrame.new(-v1.X / 2, v1.Y / 2, 0), 
            Size = Vector3.new(v2, v2, v1.Z + v2)
        }, 
        BottomLeft = {
            CFrame = v0 * CFrame.new(-v1.X / 2, -v1.Y / 2, 0), 
            Size = Vector3.new(v2, v2, v1.Z + v2)
        }, 
        TopRight = {
            CFrame = v0 * CFrame.new(v1.X / 2, v1.Y / 2, 0), 
            Size = Vector3.new(v2, v2, v1.Z + v2)
        }, 
        BottomRight = {
            CFrame = v0 * CFrame.new(v1.X / 2, -v1.Y / 2, 0), 
            Size = Vector3.new(v2, v2, v1.Z + v2)
        }
    };
end;
