local l_Workspace_0 = game.Workspace;
local l_PublishService_0 = game:GetService("PublishService");
local l_Parent_0 = script.Parent.Parent.Parent;
local l_AccessoryAndBodyToolShared_0 = require(l_Parent_0.Packages.AvatarToolsShared).Util.AccessoryAndBodyToolShared;
local l_AccessoryUtil_0 = l_AccessoryAndBodyToolShared_0.AccessoryUtil;
local l_AvatarUtil_0 = l_AccessoryAndBodyToolShared_0.AvatarUtil;
local l_WrapUtil_0 = l_AccessoryAndBodyToolShared_0.WrapUtil;
local l_getDeformerToPartMap_0 = l_AccessoryAndBodyToolShared_0.getDeformerToPartMap;
local l_ItemCharacteristics_0 = l_AccessoryAndBodyToolShared_0.ItemCharacteristics;
local v9 = require(l_Parent_0.Src.Util.Constants);
local v10 = require(l_Parent_0.Src.Util.AnalyticsGlobals);
local function _(v11)
    if v11 then
        v11.TopSurface = Enum.SurfaceType.Smooth;
        v11.BottomSurface = Enum.SurfaceType.Smooth;
        v11.LeftSurface = Enum.SurfaceType.Smooth;
        v11.RightSurface = Enum.SurfaceType.Smooth;
        v11.FrontSurface = Enum.SurfaceType.Smooth;
        v11.BackSurface = Enum.SurfaceType.Smooth;
        return ;
    else
        return ;
    end;
end;
local function _(v13)
    local v14 = Instance.new("Accessory", l_Workspace_0);
    v13:GetChildren()[1].Parent = v14;
    v14.Name = v13.Name;
    v13:Destroy();
end;
local function _(v16)
    local v17 = Instance.new("Accessory", l_Workspace_0);
    v16.Parent = v17;
    v17.Name = v16.Name;
    v16.Name = "Handle";
    return v17;
end;
local function v32(v19, v20)
    local l_Handle_0 = v19:FindFirstChild("Handle");
    if not (not l_Handle_0 or not l_Handle_0:IsA("MeshPart")) then
        local l_MeshId_0 = l_Handle_0.MeshId;
        local l_TextureID_0 = l_Handle_0.TextureID;
        local l_Part_0 = Instance.new("Part");
        l_Part_0.Size = l_Handle_0.Size;
        l_Part_0.CFrame = l_Handle_0.CFrame;
        l_Part_0.Name = "Handle";
        for _, v26 in l_Handle_0:GetChildren() do
            if not v26:IsA("SurfaceAppearance") then
                if not (not (not v26:IsA("Vector3Value") or v26.Name ~= "OriginalSize") or v26:IsA("TouchTransmitter")) then
                    v26:Clone().Parent = l_Part_0;
                end;
            else
                l_TextureID_0 = v26.ColorMap;
            end;
        end;
        local l_SpecialMesh_0 = Instance.new("SpecialMesh");
        l_SpecialMesh_0.MeshId = l_MeshId_0;
        l_SpecialMesh_0.TextureId = l_TextureID_0;
        l_SpecialMesh_0.Parent = l_Part_0;
        local l_MeshPartAsync_0 = game:GetService("InsertService"):CreateMeshPartAsync(l_MeshId_0, Enum.CollisionFidelity.Default, Enum.RenderFidelity.Automatic);
        if l_MeshPartAsync_0 then
            l_SpecialMesh_0.Scale = v20 / l_MeshPartAsync_0.Size;
            l_MeshPartAsync_0:Destroy();
        end;
        l_Handle_0:Destroy();
        l_Part_0.Parent = v19;
        local l_v19_FirstChild_0 = v19:FindFirstChild("ThumbnailConfiguration", true);
        if not (not l_v19_FirstChild_0 or not l_v19_FirstChild_0:IsA("Configuration")) then
            local l_ThumbnailCameraTarget_0 = l_v19_FirstChild_0:FindFirstChild("ThumbnailCameraTarget");
            if not (not l_ThumbnailCameraTarget_0 or not l_ThumbnailCameraTarget_0:IsA("ObjectValue")) then
                l_ThumbnailCameraTarget_0.Value = l_Part_0;
            end;
        end;
    end;
    l_Handle_0 = v19:FindFirstChild("Handle");
    if l_Handle_0 then
        local l_SpecialMesh_1 = l_Handle_0:FindFirstChildWhichIsA("SpecialMesh");
        if l_SpecialMesh_1 then
            l_SpecialMesh_1.Scale = l_SpecialMesh_1.Scale * (l_Handle_0.Size / v20);
        end;
        return ;
    else
        return ;
    end;
end;
local function _(v33)
    local v34 = Instance.new("Model", l_Workspace_0);
    v34.Name = v33.Name;
    v33.Parent = v34;
    v33.Name = "Handle";
    return v34;
end;
local function _(v36, v37)
    local l_v36_0 = v36;
    if l_ItemCharacteristics_0.isAvatar(v36) then
        l_v36_0 = l_AvatarUtil_0:getRootPart(v36);
    end;
    l_v36_0.CFrame = v37;
end;
local function v48(v40, v41)
    local v42 = v40:clone();
    v42.Anchored = false;
    if not l_ItemCharacteristics_0.isAvatar(v41) then
        local l_CFrame_0 = v41.CFrame;
        local l_v42_0 = v42;
        if l_ItemCharacteristics_0.isAvatar(v42) then
            l_v42_0 = l_AvatarUtil_0:getRootPart(v42);
        end;
        l_v42_0.CFrame = l_CFrame_0;
    else
        local v45 = l_AvatarUtil_0:getRootCFrame(v41);
        local l_v42_1 = v42;
        if l_ItemCharacteristics_0.isAvatar(v42) then
            l_v42_1 = l_AvatarUtil_0:getRootPart(v42);
        end;
        l_v42_1.CFrame = v45;
    end;
    local l_AvatarPartScaleType_0 = v42:FindFirstChild("AvatarPartScaleType");
    if l_AvatarPartScaleType_0 then
        l_AvatarPartScaleType_0:Destroy();
        l_AvatarPartScaleType_0 = nil;
    end;
    l_AvatarPartScaleType_0 = v41:FindFirstChild("AvatarPartScaleType");
    if l_AvatarPartScaleType_0 then
        l_AvatarPartScaleType_0:Clone().Parent = v42;
    end;
    return v42;
end;
local function v60(v49, v50)
    local v51 = {};
    local v52 = {};
    local v53 = l_getDeformerToPartMap_0(v49, not v50);
    if v50 then
        for _, v55 in pairs(v53) do
            v51[v55] = l_PublishService_0:PublishCageMeshAsync(v55, Enum.CageType.Inner);
        end;
    end;
    for _, v57 in pairs(v53) do
        v52[v57] = l_PublishService_0:PublishCageMeshAsync(v57, Enum.CageType.Outer);
    end;
    for _, v59 in ipairs(v49:GetDescendants()) do
        if v51[v59] then
            v59.ReferenceMeshId = v51[v59];
        end;
        if v52[v59] then
            v59.CageMeshId = v52[v59];
        end;
    end;
end;
local function v75(v61, v62, v63, v64)
    local v65 = v61:getState();
    local l_accessoryTypeInfo_0 = v65.selectItem.accessoryTypeInfo;
    local l_attachmentPoint_0 = v65.selectItem.attachmentPoint;
    local l_size_0 = v65.selectItem.size;
    local l_Name_0 = l_accessoryTypeInfo_0.Name;
    local l_AttachmentCFrame_0 = l_attachmentPoint_0.AttachmentCFrame;
    local l_ItemCFrame_0 = l_attachmentPoint_0.ItemCFrame;
    local v72 = v48(v63, v62);
    l_AccessoryUtil_0:createOrReuseAttachmentInstance(v72, v62.Parent, l_Name_0, l_AttachmentCFrame_0, l_ItemCFrame_0);
    v72.Size = l_size_0;
    local v73 = Instance.new("Accessory", l_Workspace_0);
    v72.Parent = v73;
    v73.Name = v72.Name;
    v72.Name = "Handle";
    local l_v73_0 = v73;
    if v64 then
        v32(l_v73_0, v63.Size);
    end;
    v73 = l_v73_0:FindFirstChild("Handle");
    if v73 then
        v73.TopSurface = Enum.SurfaceType.Smooth;
        v73.BottomSurface = Enum.SurfaceType.Smooth;
        v73.LeftSurface = Enum.SurfaceType.Smooth;
        v73.RightSurface = Enum.SurfaceType.Smooth;
        v73.FrontSurface = Enum.SurfaceType.Smooth;
        v73.BackSurface = Enum.SurfaceType.Smooth;
        return ;
    else
        return ;
    end;
end;
local function v91(v76, v77, v78, v79)
    local v80 = v76:getState();
    local v81 = v77:getOuterCageContext():getVertexData();
    local v82 = v77:getInnerCageContext():getVertexData();
    local l_accessoryTypeInfo_1 = v80.selectItem.accessoryTypeInfo;
    local l_attachmentPoint_1 = v80.selectItem.attachmentPoint;
    local l_Name_1 = l_accessoryTypeInfo_1.Name;
    local l_AttachmentCFrame_1 = l_attachmentPoint_1.AttachmentCFrame;
    local l_ItemCFrame_1 = l_attachmentPoint_1.ItemCFrame;
    local v88 = v48(v79, v78);
    l_AccessoryUtil_0:clearWelds(v88);
    l_AccessoryUtil_0:createOrReuseAttachmentInstance(v88, v78.Parent, l_Name_1, l_AttachmentCFrame_1, l_ItemCFrame_1);
    local v89 = Instance.new("Model", l_Workspace_0);
    v89.Name = v88.Name;
    v88.Parent = v89;
    v88.Name = "Handle";
    local l_v89_0 = v89;
    l_WrapUtil_0:deformClothing(v88, v82, Enum.CageType.Inner);
    l_WrapUtil_0:deformClothing(v88, v81, Enum.CageType.Outer);
    v60(v88, true);
    l_WrapUtil_0:renameDeformers(l_v89_0, v79);
    v89 = Instance.new("Accessory", l_Workspace_0);
    l_v89_0:GetChildren()[1].Parent = v89;
    v89.Name = l_v89_0.Name;
    l_v89_0:Destroy();
    if v88 then
        v88.TopSurface = Enum.SurfaceType.Smooth;
        v88.BottomSurface = Enum.SurfaceType.Smooth;
        v88.LeftSurface = Enum.SurfaceType.Smooth;
        v88.RightSurface = Enum.SurfaceType.Smooth;
        v88.FrontSurface = Enum.SurfaceType.Smooth;
        v88.BackSurface = Enum.SurfaceType.Smooth;
        return ;
    else
        return ;
    end;
end;
local function v94(v92)
    if not v92:IsA("MeshPart") then
        if v92:IsA("BasePart") then
            local l_SpecialMesh_2 = v92:FindFirstChildOfClass("SpecialMesh");
            if l_SpecialMesh_2 then
                return l_SpecialMesh_2.MeshId;
            end;
        end;
        return ;
    else
        return v92.MeshId;
    end;
end;
return function(v95, v96, v97, v98, v99)
    return function(v100)
        if v96 and v97 then
            if l_ItemCharacteristics_0.isClothes(v96) then
                if not l_ItemCharacteristics_0.hasAnyCage(v96) then
                    v75(v100, v96, v97, v99);
                    v98:getHandler("RigidAccessoryPublished")(v94(v96));
                    v10.HasPublished = true;
                else
                    v91(v100, v95, v96, v97);
                    v98:getHandler("LayeredAccessoryPublished")(v94(v96));
                    v10.HasPublished = true;
                end;
            end;
            if not (not v10.HasPublished or v10.FirstAction) then
                v10.FirstAction = v9.ACTIONS.Generate;
                v98:getHandler("FirstAction")(v10.FirstAction);
            end;
            return ;
        else
            return ;
        end;
    end;
end;
