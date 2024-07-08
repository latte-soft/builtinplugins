local l_ToolboxSetMarketplaceModelsAsPackagesForAll_0 = game:GetFastFlag("ToolboxSetMarketplaceModelsAsPackagesForAll");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("Toolbox");
local v2 = require(l_script_FirstAncestor_0.Core.Util.CreatorInfoHelper);
local v3 = require(l_script_FirstAncestor_0.Core.Util.FiatUtil);
local v4 = require(l_script_FirstAncestor_0.Core.Util.DebugFlags);
local v5 = require(l_script_FirstAncestor_0.Core.Util.getAllowedAssetTypeEnums);
local _ = l_script_FirstAncestor_0.Packages;
local l_showRobloxCreatedAssets_0 = require(l_script_FirstAncestor_0.Core.Util.ToolboxUtilities).showRobloxCreatedAssets;
local l_disableMarketplaceAndRecents_0 = require(l_script_FirstAncestor_0.Core.Util.ToolboxUtilities).disableMarketplaceAndRecents;
local l_getMarketplaceDisabledCategories_0 = require(l_script_FirstAncestor_0.Core.Util.ToolboxUtilities).getMarketplaceDisabledCategories;
local v10 = require(l_script_FirstAncestor_0.Core.Util.SharedFlags.getIsIXPEnabledForListView);
local v11 = require(l_script_FirstAncestor_0.Core.Util.SharedFlags.getFFlagToolboxContentManagementCombineTabs);
local v12 = require(l_script_FirstAncestor_0.Core.Util.SharedFlags.getFFlagToolboxFixDefaultTabForCreations);
local v13 = require(l_script_FirstAncestor_0.Core.Util.SharedFlags.getFFlagToolboxAssetConfigOnboardingLink);
local v14 = {
    OwnershipType = {
        FREE = 0, 
        MY = 1, 
        RECENT = 2, 
        GROUP = 3
    }, 
    AssetType = {
        MODEL = 0, 
        DECAL = 1, 
        MESH = 2, 
        MESHPART = 3, 
        AUDIO = 4, 
        PACKAGE = 5, 
        PLUGIN = 6, 
        HAT = 7, 
        TEE_SHIRT = 8, 
        SHIRT = 9, 
        PANTS = 10, 
        HAIR_ACCESSORY = 11, 
        FACE_ACCESSORY = 12, 
        NECK_ACCESSORY = 13, 
        SHOULDER_ACCESSORY = 14, 
        FRONT_ACCESSORY = 15, 
        BACK_ACCESSORY = 16, 
        WAIST_ACCESSORY = 17, 
        VIDEO = 18, 
        TSHIRT_ACCESSORY = 19, 
        SHIRT_ACCESSORY = 20, 
        PANTS_ACCESSORY = 21, 
        JACKET_ACCESSORY = 22, 
        SWEATER_ACCESSORY = 23, 
        SHORTS_ACCESSORY = 24, 
        LEFT_SHOE_ACCESSORY = 25, 
        RIGHT_SHOE_ACCESSORY = 26, 
        DRESS_SKIRT_ACCESSORY = 27, 
        ANIMATION = 28, 
        FONT_FAMILY = 73, 
        MUSIC = 300, 
        SOUND_EFFECT = 301, 
        UNKNOWN_AUDIO = 302
    }, 
    AssetTypeInverted = {}
};
for v15, v16 in pairs(v14.AssetType) do
    v14.AssetTypeInverted[v16] = v15;
end;
v14.MUSIC = {
    name = "Music", 
    category = "Music", 
    ownershipType = v14.OwnershipType.FREE, 
    assetType = v14.AssetType.MUSIC
};
v14.SOUND_EFFECTS = {
    name = "SoundEffect", 
    category = "SoundEffect", 
    ownershipType = v14.OwnershipType.FREE, 
    assetType = v14.AssetType.SOUND_EFFECT
};
v14.UNKNOWN_AUDIO = {
    name = "UnknownAudio", 
    category = "UnknownAudio", 
    ownershipType = v14.OwnershipType.FREE, 
    assetType = v14.AssetType.UNKNOWN_AUDIO
};
v14.ToolboxAssetTypeToEngine = {
    [v14.AssetType.MODEL] = Enum.AssetType.Model, 
    [v14.AssetType.DECAL] = Enum.AssetType.Decal, 
    [v14.AssetType.MESH] = Enum.AssetType.Mesh, 
    [v14.AssetType.MESHPART] = Enum.AssetType.MeshPart, 
    [v14.AssetType.AUDIO] = Enum.AssetType.Audio, 
    [v14.AssetType.PACKAGE] = Enum.AssetType.Package, 
    [v14.AssetType.PLUGIN] = Enum.AssetType.Plugin, 
    [v14.AssetType.HAT] = Enum.AssetType.Hat, 
    [v14.AssetType.TEE_SHIRT] = Enum.AssetType.TShirt, 
    [v14.AssetType.SHIRT] = Enum.AssetType.Shirt, 
    [v14.AssetType.PANTS] = Enum.AssetType.Pants, 
    [v14.AssetType.HAIR_ACCESSORY] = Enum.AssetType.HairAccessory, 
    [v14.AssetType.FACE_ACCESSORY] = Enum.AssetType.FaceAccessory, 
    [v14.AssetType.NECK_ACCESSORY] = Enum.AssetType.NeckAccessory, 
    [v14.AssetType.SHOULDER_ACCESSORY] = Enum.AssetType.ShoulderAccessory, 
    [v14.AssetType.FRONT_ACCESSORY] = Enum.AssetType.FrontAccessory, 
    [v14.AssetType.BACK_ACCESSORY] = Enum.AssetType.BackAccessory, 
    [v14.AssetType.WAIST_ACCESSORY] = Enum.AssetType.WaistAccessory, 
    [v14.AssetType.VIDEO] = Enum.AssetType.Video, 
    [v14.AssetType.ANIMATION] = Enum.AssetType.Animation, 
    [v14.AssetType.TSHIRT_ACCESSORY] = Enum.AssetType.TShirtAccessory, 
    [v14.AssetType.SHIRT_ACCESSORY] = Enum.AssetType.ShirtAccessory, 
    [v14.AssetType.PANTS_ACCESSORY] = Enum.AssetType.PantsAccessory, 
    [v14.AssetType.JACKET_ACCESSORY] = Enum.AssetType.JacketAccessory, 
    [v14.AssetType.SWEATER_ACCESSORY] = Enum.AssetType.SweaterAccessory, 
    [v14.AssetType.SHORTS_ACCESSORY] = Enum.AssetType.ShortsAccessory, 
    [v14.AssetType.LEFT_SHOE_ACCESSORY] = Enum.AssetType.LeftShoeAccessory, 
    [v14.AssetType.RIGHT_SHOE_ACCESSORY] = Enum.AssetType.RightShoeAccessory, 
    [v14.AssetType.DRESS_SKIRT_ACCESSORY] = Enum.AssetType.DressSkirtAccessory, 
    [v14.AssetType.FONT_FAMILY] = Enum.AssetType.FontFamily
};
v14.EngineAssetTypeIdToToolboxAssetType = {};
for v17, v18 in pairs(v14.ToolboxAssetTypeToEngine) do
    v14.EngineAssetTypeIdToToolboxAssetType[v18.Value] = v17;
end;
v14.ToolboxMarketplaceAssetTypes = {
    [v14.AssetType.ANIMATION] = Enum.AssetType.Animation, 
    [v14.AssetType.AUDIO] = Enum.AssetType.Audio, 
    [v14.AssetType.DECAL] = Enum.AssetType.Decal, 
    [v14.AssetType.FONT_FAMILY] = Enum.AssetType.FontFamily, 
    [v14.AssetType.MESH] = Enum.AssetType.Mesh, 
    [v14.AssetType.MESHPART] = Enum.AssetType.MeshPart, 
    [v14.AssetType.MODEL] = Enum.AssetType.Model, 
    [v14.AssetType.PACKAGE] = Enum.AssetType.Package, 
    [v14.AssetType.PLUGIN] = Enum.AssetType.Plugin, 
    [v14.AssetType.VIDEO] = Enum.AssetType.Video
};
v14.FREE_MODELS = {
    name = "FreeModels", 
    category = "FreeModels", 
    ownershipType = v14.OwnershipType.FREE, 
    assetType = v14.AssetType.MODEL
};
v14.FREE_DECALS = {
    name = "FreeDecals", 
    category = "FreeDecals", 
    ownershipType = v14.OwnershipType.FREE, 
    assetType = v14.AssetType.DECAL
};
v14.FREE_MESHES = {
    name = "FreeMeshes", 
    category = "FreeMeshes", 
    ownershipType = v14.OwnershipType.FREE, 
    assetType = v14.AssetType.MESH
};
v14.FREE_AUDIO = {
    name = "FreeAudio", 
    category = "FreeAudio", 
    ownershipType = v14.OwnershipType.FREE, 
    assetType = v14.AssetType.AUDIO
};
v14.WHITELISTED_PLUGINS = {
    name = "PaidPlugins", 
    category = "WhitelistedPlugins", 
    ownershipType = v14.OwnershipType.FREE, 
    assetType = v14.AssetType.PLUGIN
};
v14.FREE_FONTS = {
    name = "FreeFonts", 
    category = "FreeFonts", 
    ownershipType = v14.OwnershipType.FREE, 
    assetType = v14.AssetType.FONT_FAMILY
};
v14.MY_MODELS = {
    name = "MyModels", 
    category = "MyModelsExceptPackage", 
    ownershipType = v14.OwnershipType.MY, 
    assetType = v14.AssetType.MODEL
};
v14.MY_DECALS = {
    name = "MyDecals", 
    category = "MyDecals", 
    ownershipType = v14.OwnershipType.MY, 
    assetType = v14.AssetType.DECAL
};
v14.MY_MESHES = {
    name = "MyMeshes", 
    category = "MyMeshes", 
    ownershipType = v14.OwnershipType.MY, 
    assetType = v14.AssetType.MESH
};
v14.MY_AUDIO = {
    name = "MyAudio", 
    category = "MyAudio", 
    ownershipType = v14.OwnershipType.MY, 
    assetType = v14.AssetType.AUDIO
};
v14.MY_PLUGINS = {
    name = "MyPlugins", 
    category = "MyPlugins", 
    ownershipType = v14.OwnershipType.MY, 
    assetType = v14.AssetType.PLUGIN
};
v14.MY_ANIMATIONS = {
    name = "MyAnimations", 
    category = "MyAnimations", 
    ownershipType = v14.OwnershipType.MY, 
    assetType = v14.AssetType.ANIMATION
};
v14.MY_FONTS = {
    name = "MyFonts", 
    category = "MyFonts", 
    ownershipType = v14.OwnershipType.MY, 
    assetType = v14.AssetType.FONT_FAMILY
};
v14.MARKETPLACE_VIDEOS = {
    name = "FreeVideo", 
    category = "FreeVideo", 
    ownershipType = v14.OwnershipType.FREE, 
    assetType = v14.AssetType.VIDEO
};
v14.MY_VIDEOS = {
    name = "MyVideo", 
    category = "MyVideo", 
    ownershipType = v14.OwnershipType.MY, 
    assetType = v14.AssetType.VIDEO
};
v14.RECENT_VIDEO = {
    name = "RecentVideo", 
    category = "RecentVideo", 
    ownershipType = v14.OwnershipType.RECENT, 
    assetType = v14.AssetType.VIDEO
};
v14.RECENT_MODELS = {
    name = "RecentModels", 
    category = "RecentModels", 
    ownershipType = v14.OwnershipType.RECENT, 
    assetType = v14.AssetType.MODEL
};
v14.RECENT_DECALS = {
    name = "RecentDecals", 
    category = "RecentDecals", 
    ownershipType = v14.OwnershipType.RECENT, 
    assetType = v14.AssetType.DECAL
};
v14.RECENT_MESHES = {
    name = "RecentMeshes", 
    category = "RecentMeshes", 
    ownershipType = v14.OwnershipType.RECENT, 
    assetType = v14.AssetType.MESH
};
v14.RECENT_AUDIO = {
    name = "RecentAudio", 
    category = "RecentAudio", 
    ownershipType = v14.OwnershipType.RECENT, 
    assetType = v14.AssetType.AUDIO
};
v14.RECENT_ANIMATIONS = {
    name = "RecentAnimations", 
    category = "RecentAnimations", 
    ownershipType = v14.OwnershipType.RECENT, 
    assetType = v14.AssetType.ANIMATION
};
v14.GROUP_MODELS = {
    name = "GroupModels", 
    category = "GroupModelsExceptPackage", 
    ownershipType = v14.OwnershipType.GROUP, 
    assetType = v14.AssetType.MODEL
};
v14.GROUP_DECALS = {
    name = "GroupDecals", 
    category = "GroupDecals", 
    ownershipType = v14.OwnershipType.GROUP, 
    assetType = v14.AssetType.DECAL
};
v14.GROUP_MESHES = {
    name = "GroupMeshes", 
    category = "GroupMeshes", 
    ownershipType = v14.OwnershipType.GROUP, 
    assetType = v14.AssetType.MESH
};
v14.GROUP_AUDIO = {
    name = "GroupAudio", 
    category = "GroupAudio", 
    ownershipType = v14.OwnershipType.GROUP, 
    assetType = v14.AssetType.AUDIO
};
v14.GROUP_PLUGINS = {
    name = "GroupPlugins", 
    category = "GroupPlugins", 
    ownershipType = v14.OwnershipType.GROUP, 
    assetType = v14.AssetType.PLUGIN
};
v14.MY_PACKAGES = {
    name = "MyPackages", 
    category = "MyPackages", 
    ownershipType = v14.OwnershipType.MY, 
    assetType = v14.AssetType.PACKAGE
};
v14.GROUP_PACKAGES = {
    name = "GroupPackages", 
    category = "GroupPackages", 
    ownershipType = v14.OwnershipType.GROUP, 
    assetType = v14.AssetType.PACKAGE
};
v14.CREATIONS_DEVELOPMENT_SECTION_DIVIDER = {
    name = "CreationsDevelopmentSectionDivider", 
    selectable = false
};
v14.CREATIONS_GROUP_MODELS = {
    name = "CreationsGroupModels", 
    category = "GroupModelsExceptPackage", 
    ownershipType = v14.OwnershipType.GROUP, 
    assetType = v14.AssetType.MODEL
};
v14.CREATIONS_GROUP_PACKAGES = {
    name = "CreationsGroupPackages", 
    category = "GroupPackages", 
    ownershipType = v14.OwnershipType.GROUP, 
    assetType = v14.AssetType.PACKAGE
};
v14.CREATIONS_MODELS = {
    name = "CreationsModels", 
    category = "CreationsModels", 
    assetType = v14.AssetType.MODEL, 
    ownershipType = v14.OwnershipType.MY
};
v14.CREATIONS_DECALS = {
    name = "CreationsDecals", 
    category = "CreationsDecals", 
    assetType = v14.AssetType.DECAL, 
    ownershipType = v14.OwnershipType.MY
};
v14.CREATIONS_AUDIO = {
    name = "CreationsAudio", 
    category = "CreationsAudio", 
    assetType = v14.AssetType.AUDIO, 
    ownershipType = v14.OwnershipType.MY
};
v14.CREATIONS_MESHES = {
    name = "CreationsMeshes", 
    category = "CreationsMeshes", 
    assetType = v14.AssetType.MESHPART, 
    ownershipType = v14.OwnershipType.MY
};
v14.CREATIONS_PLUGIN = {
    name = "CreationsPlugins", 
    category = "CreationsPlugins", 
    assetType = v14.AssetType.PLUGIN, 
    ownershipType = v14.OwnershipType.MY
};
v14.CREATIONS_ANIMATIONS = {
    name = "CreationsAnimations", 
    category = "CreationsAnimations", 
    assetType = v14.AssetType.ANIMATION, 
    ownershipType = v14.OwnershipType.MY
};
v14.CREATIONS_GROUP_DECALS = {
    name = "CreationsGroupDecals", 
    category = "CreationsGroupDecals", 
    assetType = v14.AssetType.DECAL, 
    ownershipType = v14.OwnershipType.GROUP
};
v14.CREATIONS_GROUP_AUDIO = {
    name = "CreationsGroupAudio", 
    category = "CreationsGroupAudio", 
    assetType = v14.AssetType.AUDIO, 
    ownershipType = v14.OwnershipType.GROUP
};
v14.CREATIONS_GROUP_MESHES = {
    name = "CreationsGroupMeshes", 
    category = "CreationsGroupMeshes", 
    assetType = v14.AssetType.MESHPART, 
    ownershipType = v14.OwnershipType.GROUP
};
v14.CREATIONS_GROUP_PLUGIN = {
    name = "CreationsGroupPlugins", 
    category = "CreationsGroupPlugins", 
    assetType = v14.AssetType.PLUGIN, 
    ownershipType = v14.OwnershipType.GROUP
};
v14.CREATIONS_GROUP_ANIMATIONS = {
    name = "CreationsGroupAnimations", 
    category = "CreationsGroupAnimations", 
    assetType = v14.AssetType.ANIMATION, 
    ownershipType = v14.OwnershipType.GROUP
};
v14.CREATIONS_CATALOG_SECTION_DIVIDER = {
    name = "CreationsCatalogSectionDivider", 
    selectable = false
};
v14.CREATIONS_HATS = {
    name = "CreationsHats", 
    category = "CreationsHats", 
    assetType = v14.AssetType.HAT, 
    ownershipType = v14.OwnershipType.MY
};
v14.CREATIONS_TEE_SHIRT = {
    name = "CreationsTeeShirts", 
    category = "CreationsTeeShirts", 
    assetType = v14.AssetType.TEE_SHIRT, 
    ownershipType = v14.OwnershipType.MY
};
v14.CREATIONS_SHIRT = {
    name = "CreationsShirts", 
    category = "CreationsShirts", 
    assetType = v14.AssetType.SHIRT, 
    ownershipType = v14.OwnershipType.MY
};
v14.CREATIONS_PANTS = {
    name = "CreationsPants", 
    category = "CreationsPants", 
    assetType = v14.AssetType.PANTS, 
    ownershipType = v14.OwnershipType.MY
};
v14.CREATIONS_HAIR = {
    name = "CreationsHair", 
    category = "CreationsHair", 
    assetType = v14.AssetType.HAIR_ACCESSORY, 
    ownershipType = v14.OwnershipType.MY
};
v14.CREATIONS_FACE_ACCESSORIES = {
    name = "CreationsFaceAccessories", 
    category = "CreationsFaceAccessories", 
    assetType = v14.AssetType.FACE_ACCESSORY, 
    ownershipType = v14.OwnershipType.MY
};
v14.CREATIONS_NECK_ACCESSORIES = {
    name = "CreationsNeckAccessories", 
    category = "CreationsNeckAccessories", 
    assetType = v14.AssetType.NECK_ACCESSORY, 
    ownershipType = v14.OwnershipType.MY
};
v14.CREATIONS_SHOULDER_ACCESSORIES = {
    name = "CreationsShoulderAccessories", 
    category = "CreationsShoulderAccessories", 
    assetType = v14.AssetType.SHOULDER_ACCESSORY, 
    ownershipType = v14.OwnershipType.MY
};
v14.CREATIONS_FRONT_ACCESSORIES = {
    name = "CreationsFrontAccessories", 
    category = "CreationsFrontAccessories", 
    assetType = v14.AssetType.FRONT_ACCESSORY, 
    ownershipType = v14.OwnershipType.MY
};
v14.CREATIONS_BACK_ACCESSORIES = {
    name = "CreationsBackAccessories", 
    category = "CreationsBackAccessories", 
    assetType = v14.AssetType.BACK_ACCESSORY, 
    ownershipType = v14.OwnershipType.MY
};
v14.CREATIONS_WAIST_ACCESSORIES = {
    name = "CreationsWaistAccessories", 
    category = "CreationsWaistAccessories", 
    assetType = v14.AssetType.WAIST_ACCESSORY, 
    ownershipType = v14.OwnershipType.MY
};
v14.CREATIONS_TSHIRT_ACCESSORIES = {
    name = "CreationsTShirtAccessories", 
    category = "CreationsTShirtAccessories", 
    assetType = v14.AssetType.TSHIRT_ACCESSORY, 
    ownershipType = v14.OwnershipType.MY
};
v14.CREATIONS_SHIRT_ACCESSORIES = {
    name = "CreationsShirtAccessories", 
    category = "CreationsShirtAccessories", 
    assetType = v14.AssetType.SHIRT_ACCESSORY, 
    ownershipType = v14.OwnershipType.MY
};
v14.CREATIONS_PANTS_ACCESSORIES = {
    name = "CreationsPantsAccessories", 
    category = "CreationsPantsAccessories", 
    assetType = v14.AssetType.PANTS_ACCESSORY, 
    ownershipType = v14.OwnershipType.MY
};
v14.CREATIONS_JACKET_ACCESSORIES = {
    name = "CreationsJacketAccessories", 
    category = "CreationsJacketAccessories", 
    assetType = v14.AssetType.JACKET_ACCESSORY, 
    ownershipType = v14.OwnershipType.MY
};
v14.CREATIONS_SWEATER_ACCESSORIES = {
    name = "CreationsSweaterAccessories", 
    category = "CreationsSweaterAccessories", 
    assetType = v14.AssetType.SWEATER_ACCESSORY, 
    ownershipType = v14.OwnershipType.MY
};
v14.CREATIONS_SHORTS_ACCESSORIES = {
    name = "CreationsShortsAccessories", 
    category = "CreationsShortsAccessories", 
    assetType = v14.AssetType.SHORTS_ACCESSORY, 
    ownershipType = v14.OwnershipType.MY
};
v14.CREATIONS_LEFT_SHOE_ACCESSORIES = {
    name = "CreationsLeftShoeAccessories", 
    category = "CreationsLeftShoeAccessories", 
    assetType = v14.AssetType.LEFT_SHOE_ACCESSORY, 
    ownershipType = v14.OwnershipType.MY
};
v14.CREATIONS_RIGHT_SHOE_ACCESSORIES = {
    name = "CreationsRightShoeAccessories", 
    category = "CreationsRightShoeAccessories", 
    assetType = v14.AssetType.RIGHT_SHOE_ACCESSORY, 
    ownershipType = v14.OwnershipType.MY
};
v14.CREATIONS_DRESS_SKIRT_ACCESSORIES = {
    name = "CreationsDressSkirtAccessories", 
    category = "CreationsDressSkirtAccessories", 
    assetType = v14.AssetType.DRESS_SKIRT_ACCESSORY, 
    ownershipType = v14.OwnershipType.MY
};
v14.CREATIONS_GROUP_HATS = {
    name = "CreationsGroupHats", 
    category = "CreationsGroupHats", 
    assetType = v14.AssetType.HAT, 
    ownershipType = v14.OwnershipType.GROUP
};
v14.CREATIONS_GROUP_HAIR = {
    name = "CreationsGroupHair", 
    category = "CreationsGroupHair", 
    assetType = v14.AssetType.HAIR_ACCESSORY, 
    ownershipType = v14.OwnershipType.GROUP
};
v14.CREATIONS_GROUP_FACE_ACCESSORIES = {
    name = "CreationsGroupFaceAccessories", 
    category = "CreationsGroupFaceAccessories", 
    assetType = v14.AssetType.FACE_ACCESSORY, 
    ownershipType = v14.OwnershipType.GROUP
};
v14.CREATIONS_GROUP_NECK_ACCESSORIES = {
    name = "CreationsGroupNeckAccessories", 
    category = "CreationsGroupNeckAccessories", 
    assetType = v14.AssetType.NECK_ACCESSORY, 
    ownershipType = v14.OwnershipType.GROUP
};
v14.CREATIONS_GROUP_SHOULDER_ACCESSORIES = {
    name = "CreationsGroupShoulderAccessories", 
    category = "CreationsGroupShoulderAccessories", 
    assetType = v14.AssetType.SHOULDER_ACCESSORY, 
    ownershipType = v14.OwnershipType.GROUP
};
v14.CREATIONS_GROUP_FRONT_ACCESSORIES = {
    name = "CreationsGroupFrontAccessories", 
    category = "CreationsGroupFrontAccessories", 
    assetType = v14.AssetType.FRONT_ACCESSORY, 
    ownershipType = v14.OwnershipType.GROUP
};
v14.CREATIONS_GROUP_BACK_ACCESSORIES = {
    name = "CreationsGroupBackAccessories", 
    category = "CreationsGroupBackAccessories", 
    assetType = v14.AssetType.BACK_ACCESSORY, 
    ownershipType = v14.OwnershipType.GROUP
};
v14.CREATIONS_GROUP_WAIST_ACCESSORIES = {
    name = "CreationsGroupWaistAccessories", 
    category = "CreationsGroupWaistAccessories", 
    assetType = v14.AssetType.WAIST_ACCESSORY, 
    ownershipType = v14.OwnershipType.GROUP
};
v14.CREATIONS_GROUP_TSHIRT_ACCESSORIES = {
    name = "CreationsGroupTShirtAccessories", 
    category = "CreationsGroupTShirtAccessories", 
    assetType = v14.AssetType.TSHIRT_ACCESSORY, 
    ownershipType = v14.OwnershipType.GROUP
};
v14.CREATIONS_GROUP_SHIRT_ACCESSORIES = {
    name = "CreationsGroupShirtAccessories", 
    category = "CreationsGroupShirtAccessories", 
    assetType = v14.AssetType.SHIRT_ACCESSORY, 
    ownershipType = v14.OwnershipType.GROUP
};
v14.CREATIONS_GROUP_PANTS_ACCESSORIES = {
    name = "CreationsGroupPantsAccessories", 
    category = "CreationsGroupPantsAccessories", 
    assetType = v14.AssetType.PANTS_ACCESSORY, 
    ownershipType = v14.OwnershipType.GROUP
};
v14.CREATIONS_GROUP_JACKET_ACCESSORIES = {
    name = "CreationsGroupJacketAccessories", 
    category = "CreationsGroupJacketAccessories", 
    assetType = v14.AssetType.JACKET_ACCESSORY, 
    ownershipType = v14.OwnershipType.GROUP
};
v14.CREATIONS_GROUP_SWEATER_ACCESSORIES = {
    name = "CreationsGroupSweaterAccessories", 
    category = "CreationsGroupSweaterAccessories", 
    assetType = v14.AssetType.SWEATER_ACCESSORY, 
    ownershipType = v14.OwnershipType.GROUP
};
v14.CREATIONS_GROUP_SHORTS_ACCESSORIES = {
    name = "CreationsGroupShortsAccessories", 
    category = "CreationsGroupShortsAccessories", 
    assetType = v14.AssetType.SHORTS_ACCESSORY, 
    ownershipType = v14.OwnershipType.GROUP
};
v14.CREATIONS_GROUP_LEFT_SHOE_ACCESSORIES = {
    name = "CreationsGroupLeftShoeAccessories", 
    category = "CreationsGroupLeftShoeAccessories", 
    assetType = v14.AssetType.LEFT_SHOE_ACCESSORY, 
    ownershipType = v14.OwnershipType.GROUP
};
v14.CREATIONS_GROUP_RIGHT_SHOE_ACCESSORIES = {
    name = "CreationsGroupRightShoeAccessories", 
    category = "CreationsGroupRightShoeAccessories", 
    assetType = v14.AssetType.RIGHT_SHOE_ACCESSORY, 
    ownershipType = v14.OwnershipType.GROUP
};
v14.CREATIONS_GROUP_DRESS_SKIRT_ACCESSORIES = {
    name = "CreationsGroupDressSkirtAccessories", 
    category = "CreationsGroupDressSkirtAccessories", 
    assetType = v14.AssetType.DRESS_SKIRT_ACCESSORY, 
    ownershipType = v14.OwnershipType.GROUP
};
v14.MARKETPLACE = {
    v14.FREE_MODELS, 
    v14.WHITELISTED_PLUGINS, 
    v14.FREE_AUDIO, 
    v14.FREE_DECALS, 
    v14.FREE_MESHES, 
    v14.MARKETPLACE_VIDEOS, 
    v14.FREE_FONTS
};
if not l_ToolboxSetMarketplaceModelsAsPackagesForAll_0 then
    v14.INVENTORY = {
        v14.MY_MODELS, 
        v14.MY_PLUGINS, 
        v14.MY_AUDIO, 
        v14.MY_DECALS, 
        v14.MY_MESHES, 
        v14.MY_PACKAGES, 
        v14.MY_ANIMATIONS, 
        v14.MY_VIDEOS, 
        v14.MY_FONTS
    };
else
    v14.INVENTORY = {
        v14.MY_MODELS, 
        v14.MY_PLUGINS, 
        v14.MY_AUDIO, 
        v14.MY_DECALS, 
        v14.MY_MESHES, 
        v14.MY_ANIMATIONS, 
        v14.MY_VIDEOS, 
        v14.MY_FONTS
    };
end;
v14.RECENT = {
    v14.RECENT_MODELS, 
    v14.RECENT_AUDIO, 
    v14.RECENT_DECALS, 
    v14.RECENT_MESHES, 
    v14.RECENT_ANIMATIONS, 
    v14.RECENT_VIDEO
};
v14.DEFAULT = nil;
if not l_disableMarketplaceAndRecents_0() then
    v14.DEFAULT = v14.FREE_MODELS;
else
    v14.DEFAULT = v14.MY_MODELS;
end;
if v12() then
    if not l_disableMarketplaceAndRecents_0() then
        v14.DEFAULT_TAB = v14.MARKETPLACE;
    else
        v14.DEFAULT_TAB = v14.INVENTORY;
    end;
end;
v14.CREATOR_ROBLOX = {
    Id = 1, 
    Type = Enum.CreatorType.User.Value
};
v14.CREATOR_ROBLOX_DEVELOP_API = {
    Id = 1, 
    Type = v2.clientToBackend(Enum.CreatorType.User.Value)
};
v14.API_NAMES = {
    [v14.FREE_AUDIO.name] = "Audio", 
    [v14.WHITELISTED_PLUGINS.name] = "Plugins", 
    [v14.FREE_MESHES.name] = "Meshes", 
    [v14.FREE_DECALS.name] = "Decals", 
    [v14.MARKETPLACE_VIDEOS.name] = "Videos", 
    [v14.FREE_MODELS.name] = "Models", 
    [v14.MY_AUDIO.name] = "audio", 
    [v14.MY_PLUGINS.name] = "plugin", 
    [v14.MY_MODELS.name] = "model", 
    [v14.MY_MESHES.name] = "meshpart", 
    [v14.MY_DECALS.name] = "decal", 
    [v14.MY_VIDEOS.name] = "video", 
    [v14.MY_PACKAGES.name] = "package", 
    [v14.MY_ANIMATIONS.name] = "animation", 
    [v14.RECENT_AUDIO.name] = "audio", 
    [v14.RECENT_MODELS.name] = "model", 
    [v14.RECENT_MESHES.name] = "meshpart", 
    [v14.RECENT_DECALS.name] = "decal", 
    [v14.RECENT_VIDEO.name] = "video", 
    [v14.RECENT_ANIMATIONS.name] = "animation", 
    [v14.CREATIONS_AUDIO.name] = "audio", 
    [v14.FREE_FONTS.name] = "FontFamily", 
    [v14.MY_FONTS.name] = "fontFamily"
};
v14.AUTOCOMPLETE_API_NAMES = {
    [v14.FREE_AUDIO.name] = "audio", 
    [v14.WHITELISTED_PLUGINS.name] = "plugin", 
    [v14.FREE_MESHES.name] = "mesh", 
    [v14.FREE_DECALS.name] = "image", 
    [v14.MARKETPLACE_VIDEOS.name] = "video", 
    [v14.FREE_MODELS.name] = "model", 
    [v14.MY_ANIMATIONS.name] = "animation", 
    [v14.FREE_FONTS.name] = "fontFamily"
};
v14.ASSET_PREVIEW_SUGGESTIONS_ENABLED_FOR_ASSET_TYPE = {
    [v14.FREE_AUDIO.name] = true, 
    [v14.FREE_DECALS.name] = true, 
    [v14.FREE_MESHES.name] = true, 
    [v14.FREE_MODELS.name] = true, 
    [v14.MARKETPLACE_VIDEOS.name] = true, 
    [v14.WHITELISTED_PLUGINS.name] = true
};
local function v19()
    if not l_ToolboxSetMarketplaceModelsAsPackagesForAll_0 then
        return {
            v14.CREATIONS_DEVELOPMENT_SECTION_DIVIDER, 
            v14.CREATIONS_MODELS, 
            v14.CREATIONS_PLUGIN, 
            v14.CREATIONS_AUDIO, 
            v14.CREATIONS_DECALS, 
            v14.CREATIONS_MESHES, 
            v14.CREATIONS_ANIMATIONS, 
            v14.CREATIONS_GROUP_MODELS, 
            v14.CREATIONS_GROUP_PLUGIN, 
            v14.CREATIONS_GROUP_AUDIO, 
            v14.CREATIONS_GROUP_DECALS, 
            v14.CREATIONS_GROUP_MESHES, 
            v14.CREATIONS_GROUP_PACKAGES, 
            v14.CREATIONS_GROUP_ANIMATIONS
        };
    else
        return {
            v14.CREATIONS_DEVELOPMENT_SECTION_DIVIDER, 
            v14.CREATIONS_MODELS, 
            v14.CREATIONS_PLUGIN, 
            v14.CREATIONS_AUDIO, 
            v14.CREATIONS_DECALS, 
            v14.CREATIONS_MESHES, 
            v14.CREATIONS_ANIMATIONS, 
            v14.CREATIONS_GROUP_MODELS, 
            v14.CREATIONS_GROUP_PLUGIN, 
            v14.CREATIONS_GROUP_AUDIO, 
            v14.CREATIONS_GROUP_DECALS, 
            v14.CREATIONS_GROUP_MESHES, 
            v14.CREATIONS_GROUP_ANIMATIONS
        };
    end;
end;
v14.MARKETPLACE_KEY = "Marketplace";
v14.INVENTORY_KEY = "Inventory";
v14.RECENT_KEY = "Recent";
v14.CREATIONS_KEY = "Creations";
for _, v21 in pairs((string.split(l_getMarketplaceDisabledCategories_0(), ";"))) do
    local v22 = nil;
    for v23, v24 in pairs(v14.MARKETPLACE) do
        if v24.name == v21 then
            v22 = v23;
        end;
    end;
    if v22 then
        table.remove(v14.MARKETPLACE, v22);
    end;
end;
local v25 = {};
local v26 = {};
local v27 = {};
for _, v29 in pairs(v14) do
    if v29.name then
        v27[v29.name] = v29;
    end;
end;
v14.CREATIONS = v19();
local v30 = nil;
local v31 = nil;
if not l_disableMarketplaceAndRecents_0() then
    if not l_showRobloxCreatedAssets_0() then
        v30 = {
            v14.MARKETPLACE, 
            v14.INVENTORY, 
            v14.RECENT, 
            v14.CREATIONS
        };
        v31 = {
            v14.MARKETPLACE_KEY, 
            v14.INVENTORY_KEY, 
            v14.RECENT_KEY, 
            v14.CREATIONS_KEY
        };
    else
        v30 = {
            v14.MARKETPLACE, 
            v14.INVENTORY, 
            v14.CREATIONS
        };
        v31 = {
            v14.MARKETPLACE_KEY, 
            v14.INVENTORY_KEY, 
            v14.CREATIONS_KEY
        };
    end;
else
    v30 = {
        v14.INVENTORY, 
        v14.CREATIONS
    };
    v31 = {
        v14.INVENTORY_KEY, 
        v14.CREATIONS_KEY
    };
end;
for v32, v33 in ipairs(v30) do
    for _, v35 in ipairs(v33) do
        v25[v35.name] = v33;
        v26[v35.name] = v31[v32];
    end;
end;
v14.getTabForCategoryName = function(v36)
    return v25[v36] or v14.CREATIONS;
end;
v14.getTabKeyForCategoryName = function(v37)
    return v26[v37] or v14.CREATIONS_KEY;
end;
v14.getCategoryByName = function(v38)
    local v39 = v27[v38];
    if not (v39 or not v4.shouldDebugWarnings()) then
        warn(("Lua Toolbox: no category for name %s"):format((tostring(v38))));
    end;
    return v39;
end;
v14.getCategoryIndex = function(v40, v41, v42)
    if v40 == "" then
        return 1;
    else
        local v43 = v14.getTabKeyForCategoryName(v40);
        local l_getCategories_0 = v14.getCategories;
        local l_v43_0 = v43;
        local l_v41_0 = v41;
        local v47 = if not v11() then nil else v42;
        for v48, v49 in ipairs((l_getCategories_0(l_v43_0, l_v41_0, v47))) do
            if v49.name == v40 then
                return v48;
            end;
        end;
        if v4.shouldDebugWarnings() then
            warn(("Lua Toolbox: no category index for name %s"):format((tostring(v40))));
        end;
        return 1;
    end;
end;
v14.getAssetTypeByNumber = function(v50)
    return v14.AssetTypeInverted[v50];
end;
v14.categoryIsPackage = function(v51)
    local v52 = v14.getCategoryByName(v51);
    if not l_ToolboxSetMarketplaceModelsAsPackagesForAll_0 then
        return v52.assetType == v14.AssetType.PACKAGE;
    else
        local v53 = true;
        if v52.assetType ~= v14.AssetType.PACKAGE then
            v53 = v52 == v14.FREE_MODELS;
        end;
        return v53;
    end;
end;
v14.categoryIsFreeAsset = function(v54)
    return v14.getCategoryByName(v54).ownershipType == v14.OwnershipType.FREE;
end;
v14.categoryIsGroupAsset = function(v55)
    return v14.getCategoryByName(v55).ownershipType == v14.OwnershipType.GROUP;
end;
v14.categoryIsAudio = function(v56)
    return v14.getCategoryByName(v56).assetType == v14.AssetType.AUDIO;
end;
v14.categoryIsModel = function(v57)
    return v14.getCategoryByName(v57).assetType == v14.AssetType.MODEL;
end;
v14.categoryIsFont = function(v58)
    return v14.getCategoryByName(v58).assetType == v14.AssetType.FONT_FAMILY;
end;
v14.categoryIsVideo = function(v59)
    return v14.getCategoryByName(v59).assetType == v14.AssetType.VIDEO;
end;
v14.categoryIsGroupPackages = function(v60)
    return v14.getCategoryByName(v60).assetType == v14.AssetType.GROUP_PACKAGES;
end;
v14.categoryIsPlugin = function(v61)
    return v14.getCategoryByName(v61).assetType == v14.AssetType.PLUGIN;
end;
v14.shouldShowPrices = function(v62)
    local v63 = v14.getEngineAssetType(v14.getCategoryByName(v62).assetType);
    if not v13() then
        return v3.ENABLED_ASSET_TYPES[v63.Name];
    else
        return v3.MONETIZABLE_ASSET_TYPES[v63.Name];
    end;
end;
local v64 = {
    [Enum.AssetType.Hat] = v14.CREATIONS_HATS, 
    [Enum.AssetType.HairAccessory] = v14.CREATIONS_HAIR, 
    [Enum.AssetType.FaceAccessory] = v14.CREATIONS_FACE_ACCESSORIES, 
    [Enum.AssetType.NeckAccessory] = v14.CREATIONS_NECK_ACCESSORIES, 
    [Enum.AssetType.ShoulderAccessory] = v14.CREATIONS_SHOULDER_ACCESSORIES, 
    [Enum.AssetType.FrontAccessory] = v14.CREATIONS_FRONT_ACCESSORIES, 
    [Enum.AssetType.BackAccessory] = v14.CREATIONS_BACK_ACCESSORIES, 
    [Enum.AssetType.WaistAccessory] = v14.CREATIONS_WAIST_ACCESSORIES, 
    [Enum.AssetType.TShirtAccessory] = v14.CREATIONS_TSHIRT_ACCESSORIES, 
    [Enum.AssetType.ShirtAccessory] = v14.CREATIONS_SHIRT_ACCESSORIES, 
    [Enum.AssetType.PantsAccessory] = v14.CREATIONS_PANTS_ACCESSORIES, 
    [Enum.AssetType.JacketAccessory] = v14.CREATIONS_JACKET_ACCESSORIES, 
    [Enum.AssetType.SweaterAccessory] = v14.CREATIONS_SWEATER_ACCESSORIES, 
    [Enum.AssetType.ShortsAccessory] = v14.CREATIONS_SHORTS_ACCESSORIES, 
    [Enum.AssetType.LeftShoeAccessory] = v14.CREATIONS_LEFT_SHOE_ACCESSORIES, 
    [Enum.AssetType.RightShoeAccessory] = v14.CREATIONS_RIGHT_SHOE_ACCESSORIES, 
    [Enum.AssetType.DressSkirtAccessory] = v14.CREATIONS_DRESS_SKIRT_ACCESSORIES
};
local v65 = {
    [Enum.AssetType.Hat] = v14.CREATIONS_GROUP_HATS, 
    [Enum.AssetType.HairAccessory] = v14.CREATIONS_GROUP_HAIR, 
    [Enum.AssetType.FaceAccessory] = v14.CREATIONS_GROUP_FACE_ACCESSORIES, 
    [Enum.AssetType.NeckAccessory] = v14.CREATIONS_GROUP_NECK_ACCESSORIES, 
    [Enum.AssetType.ShoulderAccessory] = v14.CREATIONS_GROUP_SHOULDER_ACCESSORIES, 
    [Enum.AssetType.FrontAccessory] = v14.CREATIONS_GROUP_FRONT_ACCESSORIES, 
    [Enum.AssetType.BackAccessory] = v14.CREATIONS_GROUP_BACK_ACCESSORIES, 
    [Enum.AssetType.WaistAccessory] = v14.CREATIONS_GROUP_WAIST_ACCESSORIES, 
    [Enum.AssetType.TShirtAccessory] = v14.CREATIONS_GROUP_TSHIRT_ACCESSORIES, 
    [Enum.AssetType.ShirtAccessory] = v14.CREATIONS_GROUP_SHIRT_ACCESSORIES, 
    [Enum.AssetType.PantsAccessory] = v14.CREATIONS_GROUP_PANTS_ACCESSORIES, 
    [Enum.AssetType.JacketAccessory] = v14.CREATIONS_GROUP_JACKET_ACCESSORIES, 
    [Enum.AssetType.SweaterAccessory] = v14.CREATIONS_GROUP_SWEATER_ACCESSORIES, 
    [Enum.AssetType.ShortsAccessory] = v14.CREATIONS_GROUP_SHORTS_ACCESSORIES, 
    [Enum.AssetType.LeftShoeAccessory] = v14.CREATIONS_GROUP_LEFT_SHOE_ACCESSORIES, 
    [Enum.AssetType.RightShoeAccessory] = v14.CREATIONS_GROUP_RIGHT_SHOE_ACCESSORIES, 
    [Enum.AssetType.DressSkirtAccessory] = v14.CREATIONS_GROUP_DRESS_SKIRT_ACCESSORIES
};
v14.getCategories = function(v66, v67, v68)
    if v14.CREATIONS_KEY == v66 then
        if not (not v11() or not v4.shouldDebugWarnings()) and v68 == nil then
            warn("IXP variable was not found for getCategoryIndex");
        end;
        local v69 = if not not v11() and v10(v68) then {} else v19();
        if v67 then
            local v70 = v5(v67.allowedAssetTypesForRelease);
            if #v70 > 0 then
                table.insert(v69, v14.CREATIONS_CATALOG_SECTION_DIVIDER);
                for _, v72 in pairs(v70) do
                    table.insert(v69, v64[v72]);
                end;
                for _, v74 in pairs(v70) do
                    table.insert(v69, v65[v74]);
                end;
            end;
        end;
        return v69;
    elseif v14.MARKETPLACE_KEY == v66 then
        return v14.MARKETPLACE;
    elseif v14.INVENTORY_KEY == v66 then
        return v14.INVENTORY;
    elseif v14.RECENT_KEY == v66 then
        return v14.RECENT;
    else
        return ;
    end;
end;
v14.getEngineAssetType = function(v75)
    local v76 = v14.ToolboxAssetTypeToEngine[v75];
    if not (v76 or not v4.shouldDebugWarnings()) then
        warn(("Lua toolbox: No engine assetType for category asset type %s"):format((tostring(v75))));
    end;
    return v76;
end;
v14.categoryIsAvatarAssetByCategoryName = function(v77)
    return v65[v14.getEngineAssetType(v14.getCategoryByName(v77).assetType)] ~= nil;
end;
v14.getMarketplaceCategoryByAssetType = function(v78)
    for _, v80 in pairs(v14.MARKETPLACE) do
        if v80.assetType == v78.Value then
            return v80;
        end;
    end;
    if v4.shouldDebugWarnings() then
        warn(("No category found for assetType of %s"):format((tostring(v78))));
    end;
    return nil;
end;
return v14;
