local l_StarterPlayer_0 = game:GetService("StarterPlayer");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("AvatarCompatibilityPreviewer");
local _ = require(l_script_FirstAncestor_0.Src.Types);
local _ = require(l_script_FirstAncestor_0.Src.Components.PlacesServiceContext);
local v6 = {
    clearTestingAvatars = function()
        for _, v5 in l_StarterPlayer_0:GetChildren() do
            if v5:GetAttribute("RBX_AvatarPreviewer_TestingAvatar") then
                v5:Destroy();
            end;
        end;
    end
};
v6.reset = function()
    v6.clearTestingAvatars();
    local l_StarterCharacter_Backup_0 = l_StarterPlayer_0:FindFirstChild("StarterCharacter_Backup");
    if not (not (l_StarterCharacter_Backup_0 ~= nil) or not l_StarterCharacter_Backup_0:GetAttribute("RBX_AvatarPreview_TestingBackup")) then
        l_StarterCharacter_Backup_0.Name = "StarterCharacter";
        l_StarterCharacter_Backup_0:SetAttribute("RBX_AvatarPreview_TestingBackup", false);
    end;
end;
v6.test = function(v8, v9)
    v6.clearTestingAvatars();
    local l_StarterCharacter_0 = l_StarterPlayer_0:FindFirstChild("StarterCharacter");
    if l_StarterCharacter_0 ~= nil then
        l_StarterCharacter_0.Name = "StarterCharacter_Backup";
        l_StarterCharacter_0:SetAttribute("RBX_AvatarPreview_TestingBackup", true);
    end;
    local v11 = v9:Clone();
    v11:SetAttribute("RBX_AvatarPreviewer_TestingAvatar", true);
    v11.Name = "StarterCharacter";
    v11.Parent = l_StarterPlayer_0;
    v8.startPlaySolo();
end;
v6.DEPRECATED_test = function(v12, v13)
    v6.clearTestingAvatars();
    local l_StarterCharacter_1 = l_StarterPlayer_0:FindFirstChild("StarterCharacter");
    if l_StarterCharacter_1 ~= nil then
        l_StarterCharacter_1.Name = "StarterCharacter_Backup";
        l_StarterCharacter_1:SetAttribute("RBX_AvatarPreview_TestingBackup", true);
    end;
    local v15 = v13.WorldModel:Clone();
    v15:SetAttribute("RBX_AvatarPreviewer_TestingAvatar", true);
    v15.Name = "StarterCharacter";
    v15.Parent = l_StarterPlayer_0;
    v12.startPlaySolo();
end;
return v6;
