local v0 = {
    game:GetService("Chat"), 
    game:GetService("Lighting"), 
    game:GetService("ReplicatedFirst"), 
    game:GetService("ReplicatedStorage"), 
    game:GetService("ServerScriptService"), 
    game:GetService("ServerStorage"), 
    game:GetService("StarterGui"), 
    game:GetService("StarterPack"), 
    game:GetService("StarterPlayer"), 
    game:GetService("Workspace")
};
return function(v1)
    local v2 = {};
    for _, v4 in v0, nil, nil do
        for _, v6 in v4:GetDescendants() do
            if not (v1 and not v1(v6)) then
                table.insert(v2, v6);
            end;
        end;
    end;
    return v2;
end;
