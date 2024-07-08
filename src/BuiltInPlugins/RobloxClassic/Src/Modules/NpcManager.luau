local v0 = {};
local l_InsertService_0 = game:GetService("InsertService");
local l_CollectionService_0 = game:GetService("CollectionService");
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local v4 = require(script.Parent.Parent.Parent.Src.Util.findAllInServices);
local v5 = {
    RobloxClassic_SetupPhysicsParts = {
        "ModuleScript", 
        "SetupPhysicsParts.lua"
    }, 
    RobloxClassic_UnificationScale = {
        "ModuleScript", 
        "UnificationScale.lua"
    }
};
local v6 = {
    RobloxClassic_ServerScript = {
        "Script", 
        "RobloxClassicServerScript.lua"
    }, 
    Animate = {
        "LocalScript", 
        "humanoidClassicAnimate.lua"
    }
};
local function v12(v7, v8, v9, v10)
    if not (v7 == "Animate") or not v10:FindFirstChild(v7) then
        local v11 = Instance.new(v8);
        v11.Name = v7;
        v11.Source = l_InsertService_0:GetLocalFileContents("rbxasset://avatar/unification/" .. v9);
        v11.Parent = v10;
        l_CollectionService_0:AddTag(v11, "RobloxClassicCollectionTag");
        return false;
    else
        return true;
    end;
end;
v0.GetNpcs = function()
    return v4(function(v13)
        if not v13:IsA("Model") then
            return false;
        else
            local l_Humanoid_0 = v13:FindFirstChildOfClass("Humanoid");
            if l_Humanoid_0 then
                return l_Humanoid_0.RigType == Enum.HumanoidRigType.R15;
            else
                return false;
            end;
        end;
    end);
end;
v0.DoClassicScriptsExist = function(v15, v16)
    for v17, _ in v6, nil, nil do
        local l_v15_FirstChild_0 = v15:FindFirstChild(v17);
        if not (not l_v15_FirstChild_0 or not l_v15_FirstChild_0:IsA("LuaSourceContainer")) then
            if v17 == "Animate" then
                warn(string.format(v16:getText("InsertComponents", "AnimateExists"), v15.Name));
            else
                return true;
            end;
        end;
    end;
    return false;
end;
v0.InsertComponents = function(v20, _, v22)
    if v22 then
        local v23 = Instance.new("Folder", l_ReplicatedStorage_0);
        v23.Name = "RobloxClassic";
        l_CollectionService_0:AddTag(v23, "RobloxClassicCollectionTag");
        for v24, v25 in v5, nil, nil do
            v12(v24, v25[1], v25[2], v23);
        end;
    end;
    local v26 = false;
    for v27, v28 in v6, nil, nil do
        local v29 = v12(v27, v28[1], v28[2], v20);
        if not (v26 or not v29) then
            v26 = true;
        end;
    end;
    if not v26 then
        local l_Animate_0 = v20:FindFirstChild("Animate");
        for _, v32 in l_InsertService_0:LoadLocalAsset("rbxasset://avatar/unification/humanoidClassicAnimateDefaultChildren.rbxm"):GetChildren() do
            v32.Parent = l_Animate_0;
        end;
    end;
    l_InsertService_0:LoadLocalAsset("rbxasset://avatar/unification/PhysicsReference.rbxm").Parent = v20:FindFirstChild("RobloxClassic_ServerScript");
end;
v0.RemoveComponents = function(v33)
    local l_l_CollectionService_0_Tagged_0 = l_CollectionService_0:GetTagged("RobloxClassicCollectionTag");
    if next(l_l_CollectionService_0_Tagged_0) == nil then
        warn(v33:getText("RemoveComponents", "NotExist"));
        return ;
    else
        for _, v36 in l_l_CollectionService_0_Tagged_0, nil, nil do
            v36:Destroy();
        end;
        print(string.format(v33:getText("RemoveComponents", "Removed")));
        return ;
    end;
end;
v0.FindInstanceFromFullName = function(v37, v38)
    local v39 = v37:split(".");
    local v40 = v38 or game;
    local v41 = 1;
    if v38 then
        for v42, v43 in v39, nil, nil do
            if v43 == v38.Name then
                v41 = v42 + 1;
            end;
        end;
    end;
    for v44 = v41, #v39 do
        v40 = v40[v39[v44]];
        if not v40 then
            return nil;
        end;
    end;
    return v40;
end;
v0.UpdateModel = function(v45, v46)
    if not v0.DoClassicScriptsExist(v45, v46) then
        v0.InsertComponents(v45, v46, false);
        return ;
    else
        warn(string.format(v46:getText("InsertComponents", "AlreadyExist"), v45.Name));
        return ;
    end;
end;
return v0;
