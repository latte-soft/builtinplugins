local v0 = require(script.Parent.Parent.Parent.Packages._Index.Dash.Dash.splitOn);
local function v11(v1, v2, v3, v4)
    local l_Humanoid_0 = v3:FindFirstChild("Humanoid");
    if l_Humanoid_0 ~= nil then
        local l_Items_0 = v2:GetBundleDetailsAsync(v4).Items;
        local l_HumanoidDescription_0 = Instance.new("HumanoidDescription");
        l_HumanoidDescription_0.BodyTypeScale = 1;
        l_HumanoidDescription_0.ProportionScale = 0;
        for v8 = 1, #l_Items_0 do
            local l_Id_0 = l_Items_0[v8].Id;
            local l_AssetTypeId_0 = v1:GetProductInfo(l_Id_0).AssetTypeId;
            if l_AssetTypeId_0 == 27 then
                l_HumanoidDescription_0.Torso = l_Id_0;
            elseif l_AssetTypeId_0 == 28 then
                l_HumanoidDescription_0.RightArm = l_Id_0;
            elseif l_AssetTypeId_0 == 29 then
                l_HumanoidDescription_0.LeftArm = l_Id_0;
            elseif l_AssetTypeId_0 == 30 then
                l_HumanoidDescription_0.LeftLeg = l_Id_0;
            elseif l_AssetTypeId_0 == 31 then
                l_HumanoidDescription_0.RightLeg = l_Id_0;
            end;
        end;
        l_HumanoidDescription_0.HeadColor = BrickColor.new("Bright orange").Color;
        l_Humanoid_0:ApplyDescription(l_HumanoidDescription_0);
        v3:PivotTo((CFrame.new(v3.PrimaryPart.Position.X, v3.PrimaryPart.Size.Y / 2 + v3.Humanoid.HipHeight, v3.PrimaryPart.Position.Z)));
    end;
end;
return function(v12)
    local l_RunService_0 = game:GetService("RunService");
    local l_AssetService_0 = game:GetService("AssetService");
    local l_MarketplaceService_0 = game:GetService("MarketplaceService");
    local l_Selection_0 = game:GetService("Selection");
    if l_RunService_0:IsRunning() then
        print("changing body is currently only editor mode.");
        return ;
    else
        local v17 = nil;
        if string.find(v12.bundleIDs, ",") ~= nil then
            v17 = v0(v12.bundleIDs, ",");
        elseif v12.bundleIDs ~= "" then
            v17 = {
                v12.bundleIDs
            };
        end;
        for v18, v19 in pairs(v17) do
            local v20 = l_Selection_0:Get()[1];
            if v18 == 1 then
                v11(l_MarketplaceService_0, l_AssetService_0, v20, (tonumber(v19)));
            elseif v18 >= 1 then
                local v21 = v20:Clone();
                v21.Parent = workspace;
                v11(l_MarketplaceService_0, l_AssetService_0, v21, (tonumber(v19)));
            end;
        end;
        return ;
    end;
end;
