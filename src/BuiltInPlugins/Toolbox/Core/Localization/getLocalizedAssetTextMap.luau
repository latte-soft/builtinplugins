local v0 = require(script:FindFirstAncestor("Toolbox").Core.Flags.getFFlagToolboxAddNewUGCAssetTypes);
return function(v1)
    local v2 = {
        [Enum.AssetType.Model] = v1:getText("General", "AssetTypeModel"), 
        [Enum.AssetType.Decal] = v1:getText("General", "AssetTypeDecal"), 
        [Enum.AssetType.Mesh] = v1:getText("General", "AssetTypeMesh"), 
        [Enum.AssetType.Audio] = v1:getText("General", "AssetTypeAudio"), 
        [Enum.AssetType.Hat] = v1:getText("General", "AssetTypeHat"), 
        [Enum.AssetType.TShirt] = v1:getText("General", "AssetTypeTeeShirt"), 
        [Enum.AssetType.Shirt] = v1:getText("General", "AssetTypeShirt"), 
        [Enum.AssetType.Pants] = v1:getText("General", "AssetTypePants"), 
        [Enum.AssetType.Plugin] = v1:getText("General", "AssetTypePlugin"), 
        [Enum.AssetType.HairAccessory] = v1:getText("General", "AssetTypeHairAccessory"), 
        [Enum.AssetType.FaceAccessory] = v1:getText("General", "AssetTypeFaceAccessory"), 
        [Enum.AssetType.NeckAccessory] = v1:getText("General", "AssetTypeNeckAccessory"), 
        [Enum.AssetType.ShoulderAccessory] = v1:getText("General", "AssetTypeShoulderAccessory"), 
        [Enum.AssetType.FrontAccessory] = v1:getText("General", "AssetTypeFrontAccessory"), 
        [Enum.AssetType.BackAccessory] = v1:getText("General", "AssetTypeBackAccessory"), 
        [Enum.AssetType.WaistAccessory] = v1:getText("General", "AssetTypeWaistAccessory"), 
        [Enum.AssetType.TShirtAccessory] = v1:getText("General", "AssetTypeTShirtAccessory"), 
        [Enum.AssetType.ShirtAccessory] = v1:getText("General", "AssetTypeShirtAccessory"), 
        [Enum.AssetType.PantsAccessory] = v1:getText("General", "AssetTypePantsAccessory"), 
        [Enum.AssetType.JacketAccessory] = v1:getText("General", "AssetTypeJacketAccessory"), 
        [Enum.AssetType.SweaterAccessory] = v1:getText("General", "AssetTypeSweaterAccessory"), 
        [Enum.AssetType.ShortsAccessory] = v1:getText("General", "AssetTypeShortsAccessory"), 
        [Enum.AssetType.LeftShoeAccessory] = v1:getText("General", "AssetTypeLeftShoeAccessory"), 
        [Enum.AssetType.RightShoeAccessory] = v1:getText("General", "AssetTypeRightShoeAccessory"), 
        [Enum.AssetType.DressSkirtAccessory] = v1:getText("General", "AssetTypeDressSkirtAccessory")
    };
    if v0() then
        v2[Enum.AssetType.Torso] = v1:getText("General", "AssetTypeTorso");
        v2[Enum.AssetType.RightArm] = v1:getText("General", "AssetTypeRightArm");
        v2[Enum.AssetType.LeftArm] = v1:getText("General", "AssetTypeLeftArm");
        v2[Enum.AssetType.LeftLeg] = v1:getText("General", "AssetTypeLeftLeg");
        v2[Enum.AssetType.RightLeg] = v1:getText("General", "AssetTypeRightLeg");
        v2[Enum.AssetType.DynamicHead] = v1:getText("General", "AssetTypeDynamicHead");
        v2[Enum.AssetType.EyebrowAccessory] = v1:getText("General", "AssetTypeEyebrowAccessory");
        v2[Enum.AssetType.EyelashAccessory] = v1:getText("General", "AssetTypeEyelashAccessory");
    end;
    return v2;
end;
