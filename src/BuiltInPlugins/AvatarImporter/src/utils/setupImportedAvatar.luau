local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.src.FastFlags);
local v2 = require(l_Parent_0.src.Constants);
local v3 = require(l_Parent_0.src.Globals);
local v4 = nil;
if v1:isBundleConfigurationEnabled() then
    local l_CoreGui_0 = game:GetService("CoreGui");
    local l_ScreenGui_0 = Instance.new("ScreenGui");
    l_ScreenGui_0.Name = "AvatarImporterConfigurer";
    l_ScreenGui_0.Parent = l_CoreGui_0;
    v4 = require(l_Parent_0.src.configurer.Configurer).new(l_ScreenGui_0);
    v4:createButtons(v3.plugin, v3.toolbar);
end;
local l_Workspace_0 = game:GetService("Workspace");
local l_Selection_0 = game:GetService("Selection");
local function v13(v9)
    local l_Camera_0 = l_Workspace_0:FindFirstChild("Camera");
    if not l_Camera_0 then
        return (Vector3.new(0, 5.2, 0));
    else
        local _, v12 = l_Workspace_0:FindPartOnRay((Ray.new(l_Camera_0.CFrame.p, l_Camera_0.CFrame.lookVector * v9)));
        l_Camera_0.Focus = CFrame.new(v12);
        return v12;
    end;
end;
local function v20(v14, v15)
    local v16 = v2.SCALE_VALUES_DEFAULTS[v15];
    if v16 then
        v14.AutomaticScalingEnabled = false;
        for v17, v18 in pairs(v16) do
            if not v14:FindFirstChild(v17) then
                local l_NumberValue_0 = Instance.new("NumberValue");
                l_NumberValue_0.Name = v17;
                l_NumberValue_0.Value = v18;
                l_NumberValue_0.Parent = v14;
            end;
        end;
        v14.AutomaticScalingEnabled = true;
        return ;
    else
        return ;
    end;
end;
local function _(v21)
    local l_Head_0 = v21:FindFirstChild("Head");
    if (l_Head_0 and l_Head_0.TextureID == "") and l_Head_0:FindFirstChildWhichIsA("FaceControls") == nil then
        local l_Decal_0 = Instance.new("Decal");
        l_Decal_0.Name = "face";
        l_Decal_0.Texture = "rbxasset://textures/face.png";
        l_Decal_0.Parent = l_Head_0;
    end;
end;
local function v31(v25, v26)
    local v27 = v2.TYPE_TO_SCALE[v26];
    if v27 then
        for _, v29 in pairs(v25:GetChildren()) do
            if v29:IsA("MeshPart") then
                local l_StringValue_0 = Instance.new("StringValue");
                l_StringValue_0.Name = "AvatarPartScaleType";
                l_StringValue_0.Value = v27;
                l_StringValue_0.Parent = v29;
            end;
        end;
    end;
end;
return function(v32, v33)
    local l_Humanoid_0 = v32:FindFirstChildOfClass("Humanoid");
    if l_Humanoid_0 then
        v32.Name = "Imported" .. v33 .. "Rig";
        local l_Head_1 = v32:FindFirstChild("Head");
        if (l_Head_1 and l_Head_1.TextureID == "") and l_Head_1:FindFirstChildWhichIsA("FaceControls") == nil then
            local l_Decal_1 = Instance.new("Decal");
            l_Decal_1.Name = "face";
            l_Decal_1.Texture = "rbxasset://textures/face.png";
            l_Decal_1.Parent = l_Head_1;
        end;
        v31(v32, v33);
        v20(l_Humanoid_0, v33);
        if v33 == v2.AVATAR_TYPE.CUSTOM then
            l_Humanoid_0.HipHeight = 2;
        end;
        v32:MoveTo((v13(10)));
        l_Selection_0:Set({
            v32
        });
        if v4 then
            v4:ConfigureImportedAvatar(v32);
        end;
        return ;
    else
        v32:MoveTo((v13(10)));
        return ;
    end;
end;
