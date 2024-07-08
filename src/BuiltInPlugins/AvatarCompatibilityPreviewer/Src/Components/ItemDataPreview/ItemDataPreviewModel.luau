local l_script_FirstAncestor_0 = script:FindFirstAncestor("AvatarCompatibilityPreviewer");
local v1 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagAvatarPreviewerEquippedHoverMenu);
local v2 = require(l_script_FirstAncestor_0.Packages.Framework);
local v3 = require(l_script_FirstAncestor_0.Packages.React);
local _ = require(l_script_FirstAncestor_0.Src.Resources.Theme);
local l_AssetRenderModel_0 = v2.UI.AssetRenderModel;
local l_Stylizer_0 = v2.ContextServices.Stylizer;
local function v10(v7)
    if not v7:IsA("Model") then
        if not v7:IsA("Accessory") then
            if not v7:IsA("BasePart") then
                if v7:IsA("Folder") then
                    local l_Handle_0 = v7:FindFirstChildWhichIsA("Accessory"):FindFirstChild("Handle");
                    if l_Handle_0:IsA("BasePart") then
                        return l_Handle_0;
                    end;
                end;
            else
                return v7;
            end;
        else
            local l_Handle_1 = v7:FindFirstChild("Handle");
            if l_Handle_1:IsA("BasePart") then
                return l_Handle_1;
            end;
        end;
        return nil;
    else
        return v7.PrimaryPart;
    end;
end;
return function(v11)
    local v12 = l_Stylizer_0:use("ItemDataPreviewModel");
    local v16 = v3.useMemo(function()
        local v13 = v11.Instance:Clone();
        local v14 = v10(v13);
        local l_Model_0 = Instance.new("Model");
        v13.Parent = l_Model_0;
        assert(v14:IsDescendantOf(l_Model_0), "The primary part we're about to use should have been moved");
        l_Model_0.PrimaryPart = v14;
        return l_Model_0;
    end, {
        v11.Instance
    });
    return v3.createElement(l_AssetRenderModel_0, {
        FocusDirection = v16.PrimaryPart and v16.PrimaryPart.CFrame.LookVector, 
        Model = v16, 
        Static = true, 
        Ambient = v12.InstanceAmbient, 
        LightColor = Color3.new(1, 1, 1), 
        LightDirection = v16.PrimaryPart and -v16.PrimaryPart.CFrame.LookVector, 
        ImageTransparency = if not v1() then nil else v11.Transparency
    });
end;
