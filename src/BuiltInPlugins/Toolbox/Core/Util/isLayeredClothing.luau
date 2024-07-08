return function(v0)
    if not (not (v0 and typeof(v0) == "Instance") or not v0:IsA("Accessory")) then
        local l_Handle_0 = v0:FindFirstChild("Handle");
        if not ((not l_Handle_0 or not l_Handle_0:IsA("MeshPart")) or not l_Handle_0:FindFirstChildOfClass("WrapLayer")) then
            return true;
        end;
    end;
    return false;
end;
