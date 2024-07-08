local v0 = require(script.Parent.Parent.Util.ConstantAvatar);
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local v2 = {};
v2.__index = v2;
v2.new = function(v3, v4)
    local v5 = {};
    setmetatable(v5, v2);
    v5.r6 = v3:clone();
    v5.r6.Archivable = false;
    v5.r15 = v4:clone();
    v5.r15.Archivable = false;
    v5.rigs = {
        [v0.AvatarType.R6] = v5.r6, 
        [v0.AvatarType.R15] = v5.r15
    };
    v5.currentCharacter = v5.r15;
    v5.characterRoot = Instance.new("Folder");
    v5.characterRoot.Archivable = false;
    v5.characterRoot.Parent = game:GetService("StarterPlayer");
    v5.characterRoot.Name = "CharacterRoot";
    v5.r15:SetPrimaryPartCFrame(v5.r6.PrimaryPart.CFrame);
    game:GetService("StarterPlayer"):ClearDefaults();
    v5.r6.Parent = v5.characterRoot;
    v5.r6.Humanoid:CacheDefaults();
    v5.r6.Parent = nil;
    v5.r15.Parent = v5.characterRoot;
    v5.r15.Humanoid:CacheDefaults();
    v5.characterRoot.Parent = game.Workspace;
    return v5;
end;
v2.applyDescription = function(v6, v7)
    pcall(function()
        v6.currentCharacter.Humanoid:ApplyDescription(v7);
    end);
end;
v2.updateAvatarType = function(v8, v9)
    local v10 = v8.rigs[v9] ~= nil;
    if not (not (v8.rigs[v9] ~= v8.currentCharacter) or not v10) then
        local v11 = nil;
        local v12 = nil;
        if v9 == v0.AvatarType.R6 then
            v11 = v8.r6;
            v12 = v8.r15;
        else
            v11 = v8.r15;
            v12 = v8.r6;
        end;
        v11.Parent = v8.characterRoot;
        v12.Parent = l_ReplicatedStorage_0;
        v8.currentCharacter = v11;
        v8.currentCharacter.HumanoidRootPart.CFrame = v12.HumanoidRootPart.CFrame;
    end;
end;
v2.setPosition = function(v13, v14)
    if v13.currentCharacter then
        v13.currentCharacter.HumanoidRootPart.CFrame = v14;
    end;
end;
v2.stop = function(v15)
    v15.r6.Parent = nil;
    v15.r6:Destroy();
    v15.r6 = nil;
    v15.r15.Parent = nil;
    v15.r15:Destroy();
    v15.r15 = nil;
    v15.characterRoot.Parent = nil;
    v15.characterRoot:Destroy();
    v15.characterRoot = nil;
    game:GetService("StarterPlayer"):ClearDefaults();
end;
return v2;
