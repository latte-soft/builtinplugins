return function(v0)
    if v0 == nil then
        return Instance.new("Model");
    elseif not v0:IsA("Model") then
        local l_Model_0 = Instance.new("Model");
        v0.Parent = l_Model_0;
        return l_Model_0;
    else
        return v0;
    end;
end;
