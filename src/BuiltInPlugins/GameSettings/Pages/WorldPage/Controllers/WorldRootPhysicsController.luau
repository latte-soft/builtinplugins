local v0 = {};
v0.__index = v0;
v0.new = function()
    return (setmetatable({}, v0));
end;
v0.convertStudsToMeters = function(v1)
    return v1 * 0.28;
end;
v0.calculateJumpDistance = function(v2, v3, v4)
    return workspace:CalculateJumpDistance(v2, v3, v4);
end;
v0.calculateJumpHeight = function(v5, v6)
    return workspace:CalculateJumpHeight(v5, v6);
end;
v0.calculateJumpPower = function(v7, v8)
    return workspace:CalculateJumpPower(v7, v8);
end;
v0.getGravity = function(_, v10)
    return v10:GetService("Workspace").Gravity;
end;
v0.setGravity = function(_, v12, v13)
    v12:GetService("Workspace").Gravity = v13;
end;
v0.getUseJumpPower = function(_, v15)
    return v15:GetService("StarterPlayer").CharacterUseJumpPower;
end;
v0.setUseJumpPower = function(_, v17, v18)
    v17:GetService("StarterPlayer").CharacterUseJumpPower = v18;
end;
v0.getJumpHeight = function(v19, v20)
    local l_StarterPlayer_0 = v20:GetService("StarterPlayer");
    local l_Workspace_0 = v20:GetService("Workspace");
    if not v19:getUseJumpPower(v20) then
        return l_StarterPlayer_0.CharacterJumpHeight;
    else
        return l_Workspace_0:CalculateJumpHeight(v19:getGravity(v20), v19:getJumpPower(v20));
    end;
end;
v0.setJumpHeight = function(v23, v24, v25)
    local l_StarterPlayer_1 = v24:GetService("StarterPlayer");
    local l_Workspace_1 = v24:GetService("Workspace");
    local v28 = v23:getGravity(v24);
    l_StarterPlayer_1.CharacterJumpHeight = v25;
    l_StarterPlayer_1.CharacterJumpPower = l_Workspace_1:CalculateJumpPower(v28, v25);
end;
v0.getJumpPower = function(v29, v30)
    local l_StarterPlayer_2 = v30:GetService("StarterPlayer");
    local v32 = v29:getGravity(v30);
    if not v29:getUseJumpPower(v30) then
        return workspace:CalculateJumpPower(v32, v29:getJumpHeight(v30));
    else
        return l_StarterPlayer_2.CharacterJumpPower;
    end;
end;
v0.setJumpPower = function(v33, v34, v35)
    local l_StarterPlayer_3 = v34:GetService("StarterPlayer");
    l_StarterPlayer_3.CharacterJumpPower = v35;
    l_StarterPlayer_3.CharacterJumpHeight = workspace:CalculateJumpHeight(v33:getGravity(v34), v35);
end;
v0.getWalkspeed = function(_, v38)
    return v38:GetService("StarterPlayer").CharacterWalkSpeed;
end;
v0.setWalkspeed = function(_, v40, v41)
    v40:GetService("StarterPlayer").CharacterWalkSpeed = v41;
end;
v0.getMaxSlopeAngle = function(_, v43)
    return v43:GetService("StarterPlayer").CharacterMaxSlopeAngle;
end;
v0.setMaxSlopeAngle = function(_, v45, v46)
    v45:GetService("StarterPlayer").CharacterMaxSlopeAngle = v46;
end;
return v0;
