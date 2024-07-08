local l_script_FirstAncestor_0 = script:FindFirstAncestor("DynamicHeadExportTool");
local l_Workspace_0 = game:GetService("Workspace");
local l_CollectionService_0 = game:GetService("CollectionService");
local v3 = require(l_script_FirstAncestor_0.Src.Constants);
local v4 = require(l_script_FirstAncestor_0.Src.Util.createSurfaceAppearance);
local v5 = require(l_script_FirstAncestor_0.Src.Util.fail);
local function v20(v6, v7, v8)
    local l_Head_0 = v7:FindFirstChild("Head");
    if l_Head_0 and l_Head_0:IsA("MeshPart") then
        local l_Folder_0 = Instance.new("Folder");
        l_Folder_0.Name = "Head";
        l_CollectionService_0:AddTag(l_Folder_0, v3.Tag);
        local v11 = l_Head_0:Clone();
        v11.Parent = l_Folder_0;
        if v8 then
            v8.Parent = v11;
            v11.TextureID = "";
        end;
        local l_AvatarPartScaleType_0 = v11:FindFirstChild("AvatarPartScaleType");
        if l_AvatarPartScaleType_0 and l_AvatarPartScaleType_0:IsA("StringValue") then
            local l_FaceCenterAttachment_0 = v11:FindFirstChild("FaceCenterAttachment");
            if l_FaceCenterAttachment_0 and l_FaceCenterAttachment_0:IsA("Attachment") then
                local l_FaceFrontAttachment_0 = v11:FindFirstChild("FaceFrontAttachment");
                if l_FaceFrontAttachment_0 and l_FaceFrontAttachment_0:IsA("Attachment") then
                    local l_HairAttachment_0 = v11:FindFirstChild("HairAttachment");
                    if l_HairAttachment_0 and l_HairAttachment_0:IsA("Attachment") then
                        local l_HatAttachment_0 = v11:FindFirstChild("HatAttachment");
                        if l_HatAttachment_0 and l_HatAttachment_0:IsA("Attachment") then
                            local l_NeckRigAttachment_0 = v11:FindFirstChild("NeckRigAttachment");
                            if l_NeckRigAttachment_0 and l_NeckRigAttachment_0:IsA("Attachment") then
                                if v11:FindFirstChildOfClass("WrapTarget") then
                                    if v11:FindFirstChildOfClass("FaceControls") then
                                        for _, v19 in v11:GetDescendants() do
                                            if not v19:IsA("Motor6D") then
                                                if v19:IsA("Vector3Value") and v19.Name == "OriginalSize" then
                                                    v19:Destroy();
                                                elseif v19:IsA("Vector3Value") and v19.Name == "OriginalPosition" then
                                                    v19:Destroy();
                                                end;
                                            else
                                                v19:Destroy();
                                            end;
                                        end;
                                        l_Folder_0.Parent = l_Workspace_0;
                                        return true;
                                    else
                                        return v5(v6, "Unable to find FaceControls");
                                    end;
                                else
                                    return v5(v6, "Unable to find WrapTarget");
                                end;
                            else
                                return v5(v6, "Unable to find NeckRigAttachment");
                            end;
                        else
                            return v5(v6, "Unable to find HatAttachment");
                        end;
                    else
                        return v5(v6, "Unable to find HairAttachment");
                    end;
                else
                    return v5(v6, "Unable to find FaceFrontAttachment");
                end;
            else
                return v5(v6, "Unable to find FaceCenterAttachment");
            end;
        else
            return v5(v6, "Unable to find AvatarPartScaleType");
        end;
    else
        return v5(v6, "Unable to find MeshPart named \"Head\"");
    end;
end;
local function v31(v21, v22, v23)
    local l_Head_1 = v22:FindFirstChild("Head");
    if l_Head_1 and l_Head_1:IsA("MeshPart") then
        local l_Folder_1 = Instance.new("Folder");
        l_Folder_1.Name = "Head_Special";
        l_CollectionService_0:AddTag(l_Folder_1, v3.Tag);
        local l_SpecialMesh_0 = Instance.new("SpecialMesh");
        l_SpecialMesh_0.Parent = l_Folder_1;
        l_SpecialMesh_0.MeshId = l_Head_1.MeshId;
        if not v23 then
            l_SpecialMesh_0.TextureId = l_Head_1.TextureID;
        else
            l_SpecialMesh_0.TextureId = v23.ColorMap;
        end;
        if not (l_Head_1:FindFirstChild("face") or l_Head_1:FindFirstChild("Face")) then
            l_CollectionService_0:AddTag(l_SpecialMesh_0, "NoFace");
        end;
        for _, v28 in l_Head_1:GetChildren() do
            if v28.ClassName == "Attachment" then
                local l_Vector3Value_0 = Instance.new("Vector3Value");
                l_Vector3Value_0.Name = v28.Name;
                l_Vector3Value_0.Value = v28.Position;
                l_Vector3Value_0.Parent = l_SpecialMesh_0;
            end;
        end;
        local l_AvatarPartScaleType_1 = l_Head_1:FindFirstChild("AvatarPartScaleType");
        if l_AvatarPartScaleType_1 then
            l_AvatarPartScaleType_1:Clone().Parent = l_SpecialMesh_0;
        end;
        l_Folder_1.Parent = l_Workspace_0;
        return true;
    else
        return v5(v21, "Unable to find MeshPart named \"Head\"");
    end;
end;
return function()
    return function(v32)
        local l_rig_0 = v32:getState().PluginReducer.rig;
        local v34 = v4(v32);
        if v20(v32, l_rig_0, v34) then
            if v31(v32, l_rig_0, v34) then
                return ;
            else
                return ;
            end;
        else
            return ;
        end;
    end;
end;
