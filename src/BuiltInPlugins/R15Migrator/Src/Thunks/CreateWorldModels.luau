local l_script_FirstAncestor_0 = script:FindFirstAncestor("R15Migrator");
local v1 = require(l_script_FirstAncestor_0.Src.Modules.NpcManager);
local v2 = require(l_script_FirstAncestor_0.Src.Util.AnimationConversion.resetCharacter);
local v3 = require(l_script_FirstAncestor_0.Src.Actions.SetWorldModels);
local l_RobloxReplicatedStorage_0 = game:GetService("RobloxReplicatedStorage");
local function v13(...)
    local v5 = {
        ...
    };
    local v6 = {};
    for _, v8 in v5, nil, nil do
        local l_WorldModel_0 = Instance.new("WorldModel");
        l_WorldModel_0.Parent = l_RobloxReplicatedStorage_0;
        v8.Parent = l_WorldModel_0;
        table.insert(v6, v8);
    end;
    task.wait();
    for _, v11 in v6, nil, nil do
        v11.PrimaryPart = v11:FindFirstChild("HumanoidRootPart") or v11:FindFirstChild("Torso");
        if not v11.PrimaryPart then
            v11:MoveTo((Vector3.new(0, 0, 0)));
        else
            v11:SetPrimaryPartCFrame(CFrame.new(0, 0, 0));
        end;
        local l_Parent_0 = v11.Parent;
        l_Parent_0:MoveTo((Vector3.new(0, 0, 0)));
        l_Parent_0.Parent = nil;
    end;
end;
local function v17(v14)
    for _, v16 in v14:GetDescendants() do
        if v16:IsA("ModuleScript") and v16.Name == "SetupAdapterParts" then
            v16:ClearAllChildren();
        end;
    end;
end;
return function(v18, v19)
    return function(v20)
        if not v20:getState().CharacterConversion.worldModels[v18] then
            local v21 = v19:Clone();
            local v22 = v19:Clone();
            v1.ConvertR6ToR15(v22);
            v17(v22);
            local v23 = v21:Clone();
            local v24 = v22:Clone();
            v13(v21, v22, v23, v24);
            v2(v23);
            v2(v24);
            v20:dispatch(v3(v18, v21.Parent, v22.Parent, v23.Parent, v24.Parent));
            return ;
        else
            return ;
        end;
    end;
end;
