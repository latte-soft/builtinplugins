local v0 = {};
local l_StarterPlayer_0 = game:GetService("StarterPlayer");
local function v3()
    while true do
        local l_StarterCharacter_0 = l_StarterPlayer_0:FindFirstChild("StarterCharacter");
        if l_StarterCharacter_0 then
            l_StarterCharacter_0:Destroy();
        else
            break;
        end;
    end;
end;
local function v7(v4)
    for _, v6 in pairs(workspace:GetChildren()) do
        if v6:IsA("Accessory") then
            v6:Clone().Parent = v4;
        end;
    end;
end;
v0.SetupCharacterForTesting = function(v8)
    if v8 then
        v3();
        local v9 = v8:Clone();
        v7(v9);
        v9.Name = "StarterCharacter";
        v9.Parent = l_StarterPlayer_0;
        return ;
    else
        return ;
    end;
end;
return v0;
