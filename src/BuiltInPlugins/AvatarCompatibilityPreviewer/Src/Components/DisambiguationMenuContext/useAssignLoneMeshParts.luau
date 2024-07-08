local l_script_FirstAncestor_0 = script:FindFirstAncestor("AvatarCompatibilityPreviewer");
local v1 = require(l_script_FirstAncestor_0.Packages.React);
local v2 = require(l_script_FirstAncestor_0.Src.Util.Constants);
local _ = require(l_script_FirstAncestor_0.Src.Types);
local function v10(v4, v5)
    for _, v7 in v2.LIMBS, nil, nil do
        local l_v4_FirstChild_0 = v4:FindFirstChild(v7);
        if l_v4_FirstChild_0 ~= nil then
            local l_l_v4_FirstChild_0_FirstChild_0 = l_v4_FirstChild_0:FindFirstChild(v5);
            if not (not (l_l_v4_FirstChild_0_FirstChild_0 ~= nil) or not l_l_v4_FirstChild_0_FirstChild_0:IsA("Attachment")) then
                return l_l_v4_FirstChild_0_FirstChild_0;
            end;
        end;
    end;
    return nil;
end;
return function()
    return v1.useCallback(function(v11)
        assert(#v11 > 0, "assignLoneMeshParts called with no lone mesh part assignments");
        for _, v13 in v11, nil, nil do
            if v13.assetType ~= nil then
                assert(v13.assetType ~= nil, v2.LUAU_ANALYZE_ERROR);
                local l_Parent_0 = v13.meshPart.Parent;
                if l_Parent_0 ~= nil then
                    assert(l_Parent_0 ~= nil, v2.LUAU_ANALYZE_ERROR);
                    local l_Humanoid_0 = l_Parent_0:FindFirstChildWhichIsA("Humanoid");
                    if l_Humanoid_0 ~= nil then
                        local v16 = assert(l_Humanoid_0, v2.LUAU_ANALYZE_ERROR);
                        local v17 = v10(l_Parent_0, v13.attachmentName);
                        if v17 == nil then
                            warn((("Could not find attachment %*"):format(v13.attachmentName)));
                        else
                            assert(v17 ~= nil, v2.LUAU_ANALYZE_ERROR);
                            local l_Accessory_0 = Instance.new("Accessory");
                            l_Accessory_0.Name = v13.meshPart.Name;
                            l_Accessory_0.AccessoryType = assert(v2.ASSET_TYPE_TO_ACCESSORY_TYPE[v13.assetType], "Couldn't find accessory type for asset type");
                            local v19 = nil;
                            if v13.meshPart:FindFirstChildWhichIsA("WrapLayer") == nil then
                                v19 = Instance.new("Part");
                                v19.TopSurface = Enum.SurfaceType.Smooth;
                                v19.BottomSurface = Enum.SurfaceType.Smooth;
                                v19.Name = "Handle";
                                v19.CFrame = v13.meshPart.CFrame;
                                v19.Size = v13.meshPart.Size;
                                local l_SpecialMesh_0 = Instance.new("SpecialMesh");
                                l_SpecialMesh_0.MeshId = v13.meshPart.MeshId;
                                local l_SurfaceAppearance_0 = v13.meshPart:FindFirstChildWhichIsA("SurfaceAppearance");
                                if not l_SurfaceAppearance_0 then
                                    l_SpecialMesh_0.TextureId = v13.meshPart.TextureID;
                                else
                                    l_SpecialMesh_0.TextureId = l_SurfaceAppearance_0.ColorMap;
                                end;
                                l_SpecialMesh_0.MeshType = Enum.MeshType.FileMesh;
                                l_SpecialMesh_0.Parent = v19;
                                v19.Parent = l_Accessory_0;
                            else
                                v19 = v13.meshPart:Clone();
                                v19.Name = "Handle";
                                v19.Parent = l_Accessory_0;
                            end;
                            local v22 = assert(v17.Parent, "No parent");
                            local l_Vector3Value_0 = Instance.new("Vector3Value");
                            l_Vector3Value_0.Name = "OriginalSize";
                            l_Vector3Value_0.Value = v19.Size / v16:GetAccessoryHandleScale(v13.meshPart, v16:GetBodyPartR15(v22));
                            l_Vector3Value_0.Parent = v19;
                            local l_Attachment_0 = Instance.new("Attachment");
                            l_Attachment_0.Name = v13.attachmentName;
                            l_Attachment_0.CFrame = v13.meshPart.CFrame:ToObjectSpace(v17.WorldCFrame);
                            l_Attachment_0.Parent = v19;
                            v13.meshPart:Destroy();
                            l_Accessory_0.Parent = l_Parent_0;
                        end;
                    end;
                end;
            end;
        end;
    end, {});
end;
