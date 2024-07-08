local _ = game:GetService("PhysicsService");
return function(v1)
    local v2 = {};
    for _, v4 in pairs(workspace:GetDescendants()) do
        if v4:IsA("BasePart") and v4.CollisionGroup == v1 then
            table.insert(v2, v4);
        end;
    end;
    return v2;
end;
