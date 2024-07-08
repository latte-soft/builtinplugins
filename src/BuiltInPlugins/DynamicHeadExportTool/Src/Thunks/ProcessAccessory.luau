local l_script_FirstAncestor_0 = script:FindFirstAncestor("DynamicHeadExportTool");
local l_Workspace_0 = game:GetService("Workspace");
local l_CollectionService_0 = game:GetService("CollectionService");
local v3 = require(l_script_FirstAncestor_0.Src.Constants);
local v4 = require(l_script_FirstAncestor_0.Src.Util.fail);
local v5 = require(l_script_FirstAncestor_0.Src.Util.createSurfaceAppearance);
local function _(v6, v7)
    local v8 = true;
    if v7 ~= "" then
        v8 = string.sub(v6, -#v7) == v7;
    end;
    return v8;
end;
local v10 = {
    [Enum.AccessoryType.Hat] = Enum.AssetType.Hat, 
    [Enum.AccessoryType.Hair] = Enum.AssetType.HairAccessory, 
    [Enum.AccessoryType.Face] = Enum.AssetType.FaceAccessory, 
    [Enum.AccessoryType.Neck] = Enum.AssetType.NeckAccessory, 
    [Enum.AccessoryType.Shoulder] = Enum.AssetType.ShoulderAccessory, 
    [Enum.AccessoryType.Front] = Enum.AssetType.FrontAccessory, 
    [Enum.AccessoryType.Back] = Enum.AssetType.BackAccessory, 
    [Enum.AccessoryType.Waist] = Enum.AssetType.WaistAccessory, 
    [Enum.AccessoryType.TShirt] = Enum.AssetType.TShirtAccessory, 
    [Enum.AccessoryType.Shirt] = Enum.AssetType.ShirtAccessory, 
    [Enum.AccessoryType.Pants] = Enum.AssetType.PantsAccessory, 
    [Enum.AccessoryType.Jacket] = Enum.AssetType.JacketAccessory, 
    [Enum.AccessoryType.Sweater] = Enum.AssetType.SweaterAccessory, 
    [Enum.AccessoryType.Shorts] = Enum.AssetType.ShortsAccessory, 
    [Enum.AccessoryType.LeftShoe] = Enum.AssetType.LeftShoeAccessory, 
    [Enum.AccessoryType.RightShoe] = Enum.AssetType.RightShoeAccessory, 
    [Enum.AccessoryType.DressSkirt] = Enum.AssetType.DressSkirtAccessory, 
    [Enum.AccessoryType.Eyebrow] = Enum.AssetType.EyebrowAccessory, 
    [Enum.AccessoryType.Eyelash] = Enum.AssetType.EyelashAccessory
};
return function()
    return function(v11)
        local l_PluginReducer_0 = v11:getState().PluginReducer;
        local l_rig_0 = l_PluginReducer_0.rig;
        local l_accessoryType_0 = l_PluginReducer_0.accessoryType;
        local v15 = {};
        for _, v17 in l_rig_0:GetDescendants() do
            if v17:IsA("WrapLayer") then
                table.insert(v15, v17);
            end;
        end;
        if #v15 == 0 then
            return v4(v11, "Layered Clothing items not found");
        else
            local l_RootPart_0 = l_rig_0:FindFirstChild("RootPart");
            if l_RootPart_0 then
                local l_FaceFront_0 = l_RootPart_0:FindFirstChild("FaceFront");
                if l_FaceFront_0 and l_FaceFront_0:IsA("Attachment") then
                    for _, v21 in v15, nil, nil do
                        local l_Parent_0 = v21.Parent;
                        if l_Parent_0 and l_Parent_0:IsA("MeshPart") then
                            local l_Folder_0 = Instance.new("Folder");
                            l_Folder_0.Name = v10[l_accessoryType_0].Name;
                            l_CollectionService_0:AddTag(l_Folder_0, v3.Tag);
                            local l_Accessory_0 = Instance.new("Accessory");
                            local v25 = l_Parent_0:Clone();
                            local v26 = 0;
                            for _, v28 in v25:GetDescendants() do
                                if not v28:IsA("Attachment") then
                                    if not ((v28:IsA("WrapLayer") or v28:IsA("SurfaceAppearance")) or v28:IsA("Attachment")) then
                                        v28:Destroy();
                                    end;
                                else
                                    v26 = v26 + 1;
                                    if not (string.sub(v28.Name, -10) == "Attachment") then
                                        v28.Name = v28.Name .. "Attachment";
                                    end;
                                end;
                            end;
                            local l_WrapLayer_0 = v25:FindFirstChildOfClass("WrapLayer");
                            assert(l_WrapLayer_0);
                            l_WrapLayer_0.Name = "WrapLayer";
                            local v30 = v5(v11);
                            if v30 then
                                v25.TextureID = "";
                                v30.Parent = v25;
                            end;
                            if l_Parent_0.TextureID == "" and (not (v30 ~= nil) or v30.ColorMap == "") then
                                v25.BrickColor = BrickColor.new("Really black");
                            end;
                            l_FaceFront_0:Clone().Parent = v25;
                            v25.Name = "Handle";
                            v25.Parent = l_Accessory_0;
                            l_Accessory_0.Parent = l_Folder_0;
                            l_Folder_0.Parent = l_Workspace_0;
                        else
                            warn("Ignoring '" .. v21:GetFullName() .. "'");
                        end;
                    end;
                    return nil;
                else
                    return v4(v11, "Unable to find Attachment named \"FaceFront\" in RootPart");
                end;
            else
                return v4(v11, "Unable to find Part named \"RootPart\"");
            end;
        end;
    end;
end;
