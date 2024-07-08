local l_script_FirstAncestor_0 = script:FindFirstAncestor("AvatarCompatibilityPreviewer");
local v1 = require(l_script_FirstAncestor_0.Packages.AvatarToolsShared);
local v2 = require(l_script_FirstAncestor_0.Packages.Cryo);
local v3 = require(l_script_FirstAncestor_0.Packages.React);
local _ = require(l_script_FirstAncestor_0.Src.Types);
local v5 = require(l_script_FirstAncestor_0.Src.Components.AnimationPreview);
local v6 = require(l_script_FirstAncestor_0.Src.Resources.BuiltinItems);
local v7 = require(l_script_FirstAncestor_0.Src.Components.CatalogPreviewBasic);
local v8 = require(l_script_FirstAncestor_0.Src.Util.Constants);
local v9 = require(l_script_FirstAncestor_0.Src.Components.SkinPreview);
local v10 = require(l_script_FirstAncestor_0.Src.Util.find);
local l_AssetTypeAttachmentInfo_0 = v1.Util.AccessoryAndBodyToolShared.AssetTypeAttachmentInfo;
local v12 = game:DefineFastFlag("AvatarPreviewerFixShoesReordering", false);
local v13 = {};
local function v14()
    return nil;
end;
local function v15()
    error("Attempting to wear an instance from something that has no custom instance implementation");
end;
local function v26(v16, v17)
    if v16.Archivable then
        if v16:IsA("Accessory") then
            assert(v16:IsA("Accessory"), v8.LUAU_ANALYZE_ERROR);
            if v16.AccessoryType ~= Enum.AccessoryType.Unknown and v16.AccessoryType ~= v8.ASSET_TYPE_TO_ACCESSORY_TYPE[v17] then
                return nil;
            else
                local l_Handle_0 = v16:FindFirstChild("Handle");
                if l_Handle_0 ~= nil and l_Handle_0.Archivable then
                    for _, v20 in v2.Dictionary.join(l_AssetTypeAttachmentInfo_0.Accessory, l_AssetTypeAttachmentInfo_0.Clothing) do
                        local l_status_0, l_result_0 = pcall(function()
                            return Enum.AssetType[v20.AssetType];
                        end);
                        if l_status_0 and l_result_0 == v17 then
                            for _, v24 in v20.Attachments, nil, nil do
                                if l_Handle_0:FindFirstChild(v24.Name) then
                                    local v25 = v16:Clone();
                                    v25.Handle.Position = Vector3.new();
                                    return v25;
                                end;
                            end;
                        end;
                    end;
                    return nil;
                else
                    return nil;
                end;
            end;
        else
            return nil;
        end;
    else
        return nil;
    end;
end;
local function v32(v27, v28, v29)
    local v30 = v27:Clone();
    if v30:FindFirstChild("Handle") == nil then
        return nil;
    else
        local l_WrapLayer_0 = v30.Handle:FindFirstChildWhichIsA("WrapLayer");
        if l_WrapLayer_0 ~= nil then
            l_WrapLayer_0.Order = v29;
        end;
        v28.Humanoid:AddAccessory(v30);
        return {
            v30
        };
    end;
end;
local function v39(v33, v34)
    for _, v36 in v33, nil, nil do
        local l_v36_FirstChildWhichIsA_0 = v36:FindFirstChildWhichIsA("WrapLayer", true);
        if l_v36_FirstChildWhichIsA_0 ~= nil then
            l_v36_FirstChildWhichIsA_0.Order = v34;
            task.defer(function()
                local l_l_v36_FirstChildWhichIsA_0_0 = l_v36_FirstChildWhichIsA_0;
                l_l_v36_FirstChildWhichIsA_0_0.Order = l_l_v36_FirstChildWhichIsA_0_0.Order + 1;
                l_l_v36_FirstChildWhichIsA_0_0 = l_v36_FirstChildWhichIsA_0;
                l_l_v36_FirstChildWhichIsA_0_0.Order = l_l_v36_FirstChildWhichIsA_0_0.Order - 1;
            end);
        end;
    end;
end;
local function v43(v40)
    local v42 = v10(v6.allItems, function(v41)
        return v41.id == v40;
    end);
    if v42 == nil then
        error((("Couldn't getBuiltinItemDataFromId: %*"):format(v40)));
    end;
    assert(v42 ~= nil, v8.LUAU_ANALYZE_ERROR);
    return v42;
end;
v13.basicAccessoryPalette = function(v44, v45, v46)
    return {
        Key = v44, 
        Items = v46, 
        PreviewComponent = v7, 
        PublishAssetType = v45, 
        WearBuiltin = function(v47, v48)
            v48.accessories[v45] = v47;
        end, 
        WearInstance = v32, 
        CreateCustomInstanceFromSelection = function(v49)
            return (v26(v49, v45));
        end, 
        GetBuiltinItemData = v43, 
        UpdateInstances = v39
    };
end;
v13.layeredClothingPalette = function(v50, v51, v52, v53)
    return {
        Key = v50, 
        Items = v52, 
        PreviewComponent = v7, 
        PublishAssetType = v51, 
        WearBuiltin = function(v54, v55, v56)
            for v57, v58 in v55.clothing, nil, nil do
                if v58.AssetType == v51 then
                    v55.clothing[v57] = {
                        AssetId = v54, 
                        AssetType = v51
                    };
                    return ;
                end;
            end;
            table.insert(v55.clothing, {
                AssetId = v54, 
                AssetType = v51, 
                Order = v56
            });
        end, 
        CreateCustomInstanceFromSelection = function(v59)
            return (v26(v59, v51));
        end, 
        WearInstance = v32, 
        UpdateInstances = v39, 
        GetBuiltinItemData = v43, 
        PreferredLayer = v53
    };
end;
v13.createBodyPalette = function(v60, v61, v62, v63)
    return {
        Key = v60, 
        PreviewComponent = v7, 
        Items = v62, 
        WearBuiltin = function(v64, v65)
            v65.patches[v61] = v64;
        end, 
        CreateCustomInstanceFromSelection = v63.CreateCustomInstanceFromSelection, 
        GetBuiltinItemData = function()
            return nil;
        end, 
        WearInstance = v63.WearInstance
    };
end;
v13.createBodyCategory = function(v66)
    local v67 = {};
    for _, v69 in v66, nil, nil do
        for v70, v71 in v69, nil, nil do
            if v67[v70] == nil then
                v67[v70] = {
                    v71
                };
            else
                table.insert(v67[v70], v71);
            end;
        end;
    end;
    return {
        v13.createBodyPalette("Torso", Enum.AssetType.Torso, v67.Torso, {
            CreateCustomInstanceFromSelection = v14, 
            WearInstance = v15
        }), 
        v13.createBodyPalette("LeftArm", Enum.AssetType.LeftArm, v67.LeftArm, {
            CreateCustomInstanceFromSelection = v14, 
            WearInstance = v15
        }), 
        v13.createBodyPalette("RightArm", Enum.AssetType.RightArm, v67.RightArm, {
            CreateCustomInstanceFromSelection = v14, 
            WearInstance = v15
        }), 
        v13.createBodyPalette("LeftLeg", Enum.AssetType.LeftLeg, v67.LeftLeg, {
            CreateCustomInstanceFromSelection = v14, 
            WearInstance = v15
        }), 
        (function(v72)
            return v13.createBodyPalette(v72, Enum.AssetType[v72], v67[v72], {
                CreateCustomInstanceFromSelection = v14, 
                WearInstance = v15
            });
        end)("RightLeg")
    };
end;
v13.createHeadPalette = function(v73)
    return v13.createBodyPalette("HeadBodyPart", Enum.AssetType.Head, v73, {
        CreateCustomInstanceFromSelection = function(v74)
            if v74.Name == "Head" and v74:IsA("MeshPart") then
                local v75 = v74:Clone();
                v75.Position = Vector3.new();
                return v75;
            else
                return nil;
            end;
        end, 
        WearInstance = function(v76, v77)
            local v78 = v76:Clone();
            v78.Name = "Head";
            v77.Humanoid:ReplaceBodyPartR15(Enum.BodyPartR15.Head, v78);
            return {};
        end
    });
end;
v13.createBodyAnimationPalette = function(v79, v80)
    return {
        Key = v79, 
        OverrideEquipKey = "animations", 
        Items = v80, 
        PreviewComponent = function(v81)
            return v3.createElement(v5, {
                AnimationId = v81.Item, 
                AnimateTargetAsset = v8.BODY_PREVIEW_PATH, 
                Style = "BodyPreview", 
                Transparency = v81.Transparency
            });
        end, 
        WearBuiltin = function(v82, v83)
            v83.animation = v82;
        end, 
        CreateCustomInstanceFromSelection = v14, 
        GetBuiltinItemData = function()
            return nil;
        end, 
        WearInstance = v15
    };
end;
v13.shoesPalette = function(v84)
    return {
        Key = "Shoes", 
        Items = v84, 
        PreviewComponent = function(v85)
            return v3.createElement(v7, {
                Item = v85.Item.right, 
                Transparency = v85.Transparency
            });
        end, 
        WearBuiltin = function(v86, v87, v88)
            table.insert(v87.clothing, {
                AssetId = v86.left, 
                AssetType = Enum.AssetType.LeftShoeAccessory, 
                Order = v88
            });
            table.insert(v87.clothing, {
                AssetId = v86.right, 
                AssetType = Enum.AssetType.RightShoeAccessory, 
                Order = v88
            });
        end, 
        CreateCustomInstanceFromSelection = function(v89)
            if not v89:IsA("Folder") then
                return v26(v89, Enum.AssetType.LeftShoeAccessory) or v26(v89, Enum.AssetType.RightShoeAccessory);
            else
                local l_v89_Children_0 = v89:GetChildren();
                if #l_v89_Children_0 == 2 then
                    local v91 = nil;
                    local v92 = nil;
                    for _, v94 in l_v89_Children_0, nil, nil do
                        v91 = v91 or v26(v94, Enum.AssetType.LeftShoeAccessory);
                        v92 = v92 or v26(v94, Enum.AssetType.RightShoeAccessory);
                    end;
                    if v91 ~= nil and v92 ~= nil then
                        return (v89:Clone());
                    else
                        return "InvalidPair";
                    end;
                elseif #l_v89_Children_0 > 2 and #l_v89_Children_0 < 10 then
                    for _, v96 in l_v89_Children_0, nil, nil do
                        if v26(v96, Enum.AssetType.LeftShoeAccessory) == nil and v26(v96, Enum.AssetType.RightShoeAccessory) == nil then
                            return nil;
                        end;
                    end;
                    return "NeedTwoShoes";
                elseif #l_v89_Children_0 == 1 then
                    return v26(l_v89_Children_0[1], Enum.AssetType.LeftShoeAccessory) or v26(l_v89_Children_0[1], Enum.AssetType.RightShoeAccessory);
                else
                    return nil;
                end;
            end;
        end, 
        WearInstance = function(v97, v98, v99)
            if not v97:IsA("Folder") then
                return (v32(v97, v98, v99));
            else
                local v100 = {};
                for _, v102 in v97:GetChildren() do
                    if v102:IsA("Accessory") then
                        table.insert(v100, v32(v102, v98, v99)[1]);
                    end;
                end;
                return v100;
            end;
        end, 
        UpdateInstances = if not v12 then nil else v39, 
        GetBuiltinItemData = function(v103)
            local l_left_0 = v103.left;
            local v106 = v10(v6.allItems, function(v105)
                return v105.id == l_left_0;
            end);
            if v106 == nil then
                error((("Couldn't getBuiltinItemDataFromId: %*"):format(l_left_0)));
            end;
            assert(v106 ~= nil, v8.LUAU_ANALYZE_ERROR);
            return v106;
        end, 
        Serializer = {
            serialize = function(v107)
                return v107.left;
            end, 
            deserialize = function(v108)
                for _, v110 in v84, nil, nil do
                    if v110.left == v108 then
                        return v110;
                    end;
                end;
                error((("Invalid pair of shoes for %*"):format(v108)));
            end
        }, 
        PreferredLayer = v8.PREFERRED_LAYERS.Shoes
    };
end;
v13.emotionPalette = function(v111)
    return {
        Key = "Emotions", 
        Items = v111, 
        PreviewComponent = function(v112)
            return v3.createElement(v5, {
                AnimationId = v112.Item, 
                AnimateTargetAsset = v8.HEAD_PREVIEW_PATH, 
                Style = "FacePreview", 
                Transparency = v112.Transparency
            });
        end, 
        WearBuiltin = function(v113, v114)
            v114.emotion = v113;
        end, 
        GetBuiltinItemData = function()
            return nil;
        end, 
        CreateCustomInstanceFromSelection = v14, 
        WearInstance = v15
    };
end;
v13.skinPalette = function(v115)
    return {
        Key = "Skin", 
        Items = v115, 
        PreviewAspectRatio = 2, 
        PreviewComponent = v9, 
        CreateCustomInstanceFromSelection = v14, 
        WearBuiltin = function(v116, v117)
            v117.skinTone = v116;
        end, 
        WearInstance = v15, 
        GetBuiltinItemData = function()
            return nil;
        end, 
        Serializer = {
            serialize = function(v118)
                return {
                    v118.R, 
                    v118.G, 
                    v118.B
                };
            end, 
            deserialize = function(v119)
                return Color3.new(v119[1], v119[2], v119[3]);
            end
        }
    };
end;
return v13;
