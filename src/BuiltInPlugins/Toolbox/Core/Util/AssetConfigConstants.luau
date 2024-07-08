local l_Parent_0 = script.Parent.Parent.Parent;
local l_enumerate_0 = require(l_Parent_0.Packages.Framework).Util.enumerate;
local l_Util_0 = l_Parent_0.Core.Util;
local v3 = require(l_Parent_0.Core.Flags.getFFlagToolboxAddNewUGCAssetTypes);
local v4 = require(l_Parent_0.Core.Util.SharedFlags.getFFlagToolboxRestrictAssetConfig);
local v5 = require(l_Util_0.convertArrayToTable);
local v6 = {
    WIDTH = 1100, 
    HEIGHT = 860, 
    MIN_WIDTH = 900, 
    MIN_HEIGHT = 500, 
    TERM_OF_USE_URL = "https://en.help.roblox.com/hc/en-us/articles/115004647846-Roblox-Terms-of-Use", 
    ACCOUNT_SETTING_URL = "https://www.roblox.com/my/account#/info", 
    NAME_CHARACTER_LIMIT = 50, 
    DESCRIPTION_CHARACTER_LIMIT = 1000, 
    PACKAGE_NOTE_CHARACTER_LIMIT = 500, 
    TITLE_GUTTER_WIDTH = 180, 
    OverrideAssetItemSize = UDim2.new(0, 150, 0, 200), 
    PreviewTypes = v5({
        "ImagePicker", 
        "Thumbnail", 
        "ModelPreview"
    }), 
    SIDE_TABS = v5({
        "Sales", 
        "General", 
        "Versions", 
        "Override", 
        "Permissions"
    }), 
    FIELD_NAMES = v5({
        "Title", 
        "Description", 
        "Price"
    }), 
    GENRE_TYPE = {
        {
            name = Enum.Genre.All.Name
        }, 
        {
            name = Enum.Genre.TownAndCity.Name
        }, 
        {
            name = Enum.Genre.Fantasy.Name
        }, 
        {
            name = Enum.Genre.SciFi.Name
        }, 
        {
            name = Enum.Genre.Ninja.Name
        }, 
        {
            name = Enum.Genre.Scary.Name
        }, 
        {
            name = Enum.Genre.Pirate.Name
        }, 
        {
            name = Enum.Genre.Adventure.Name
        }, 
        {
            name = Enum.Genre.Sports.Name
        }, 
        {
            name = Enum.Genre.Funny.Name
        }, 
        {
            name = Enum.Genre.WildWest.Name
        }, 
        {
            name = Enum.Genre.War.Name
        }, 
        {
            name = Enum.Genre.SkatePark.Name
        }, 
        {
            name = Enum.Genre.Tutorial.Name
        }
    }, 
    FLOW_TYPE = v5({
        "EDIT_FLOW", 
        "UPLOAD_FLOW", 
        "DOWNLOAD_FLOW"
    }), 
    SCREENS = v5({
        "ASSET_TYPE_SELECTION", 
        "ASSET_VALIDATION", 
        "CONFIGURE_ASSET", 
        "UPLOADING_ASSET", 
        "UPLOAD_ASSET_RESULT"
    }), 
    ASSET_STATUS = v5({
        "Unknown", 
        "ReviewPending", 
        "Moderated", 
        "ReviewApproved", 
        "OnSale", 
        "OffSale", 
        "DelayedRelease", 
        "Free"
    }), 
    RESTRICTION_TYPE = if not v4() then nil else v5({
        "AssetType", 
        "Authorization", 
        "Invalid", 
        "KillSwitch", 
        "Quota", 
        "SafetyStatus", 
        "SellerAccountNotOnboarded", 
        "SellerAccountRestricted", 
        "UnsupportedAssetOwner", 
        "Verification"
    }), 
    SALES_STATUS_FOR_PRICE = v5({
        "OnSale"
    })
};
local function _(v7, v8)
    return {
        type = v7, 
        isCatalog = true, 
        isUploadable = v8 == true
    };
end;
local function _(v10, v11)
    return {
        type = v10, 
        isMarketplace = true, 
        isBuyable = v11 == true
    };
end;
v6.ASSET_TYPE_INFO = {
    {
        type = Enum.AssetType.Hat, 
        isCatalog = true, 
        isUploadable = true
    }, 
    {
        type = Enum.AssetType.TShirt, 
        isCatalog = true, 
        isUploadable = false
    }, 
    {
        type = Enum.AssetType.Shirt, 
        isCatalog = true, 
        isUploadable = false
    }, 
    {
        type = Enum.AssetType.Pants, 
        isCatalog = true, 
        isUploadable = false
    }, 
    {
        type = Enum.AssetType.HairAccessory, 
        isCatalog = true, 
        isUploadable = true
    }, 
    {
        type = Enum.AssetType.FaceAccessory, 
        isCatalog = true, 
        isUploadable = true
    }, 
    {
        type = Enum.AssetType.NeckAccessory, 
        isCatalog = true, 
        isUploadable = true
    }, 
    {
        type = Enum.AssetType.ShoulderAccessory, 
        isCatalog = true, 
        isUploadable = true
    }, 
    {
        type = Enum.AssetType.FrontAccessory, 
        isCatalog = true, 
        isUploadable = true
    }, 
    {
        type = Enum.AssetType.BackAccessory, 
        isCatalog = true, 
        isUploadable = true
    }, 
    {
        type = Enum.AssetType.WaistAccessory, 
        isCatalog = true, 
        isUploadable = true
    }, 
    {
        type = Enum.AssetType.TShirtAccessory, 
        isCatalog = true, 
        isUploadable = true
    }, 
    {
        type = Enum.AssetType.ShirtAccessory, 
        isCatalog = true, 
        isUploadable = true
    }, 
    {
        type = Enum.AssetType.PantsAccessory, 
        isCatalog = true, 
        isUploadable = true
    }, 
    {
        type = Enum.AssetType.JacketAccessory, 
        isCatalog = true, 
        isUploadable = true
    }, 
    {
        type = Enum.AssetType.SweaterAccessory, 
        isCatalog = true, 
        isUploadable = true
    }, 
    {
        type = Enum.AssetType.ShortsAccessory, 
        isCatalog = true, 
        isUploadable = true
    }, 
    {
        type = Enum.AssetType.LeftShoeAccessory, 
        isCatalog = true, 
        isUploadable = true
    }, 
    {
        type = Enum.AssetType.RightShoeAccessory, 
        isCatalog = true, 
        isUploadable = true
    }, 
    {
        type = Enum.AssetType.DressSkirtAccessory, 
        isCatalog = true, 
        isUploadable = true
    }, 
    {
        type = Enum.AssetType.Model, 
        isMarketplace = true, 
        isBuyable = false
    }, 
    {
        type = Enum.AssetType.Decal, 
        isMarketplace = true, 
        isBuyable = false
    }, 
    {
        type = Enum.AssetType.Mesh, 
        isMarketplace = true, 
        isBuyable = false
    }, 
    {
        type = Enum.AssetType.MeshPart, 
        isMarketplace = true, 
        isBuyable = false
    }, 
    {
        type = Enum.AssetType.Audio, 
        isMarketplace = true, 
        isBuyable = false
    }, 
    {
        type = Enum.AssetType.Animation, 
        isMarketplace = true, 
        isBuyable = false
    }, 
    {
        type = Enum.AssetType.Video, 
        isMarketplace = true, 
        isBuyable = false
    }, 
    {
        type = Enum.AssetType.Plugin, 
        isMarketplace = true, 
        isBuyable = true
    }
};
table.insert(v6.ASSET_TYPE_INFO, {
    type = Enum.AssetType.Package, 
    isMarketplace = true, 
    isBuyable = false
});
if v3() then
    table.insert(v6.ASSET_TYPE_INFO, {
        type = Enum.AssetType.Torso, 
        isCatalog = true, 
        isUploadable = true
    });
    table.insert(v6.ASSET_TYPE_INFO, {
        type = Enum.AssetType.RightArm, 
        isCatalog = true, 
        isUploadable = true
    });
    table.insert(v6.ASSET_TYPE_INFO, {
        type = Enum.AssetType.LeftArm, 
        isCatalog = true, 
        isUploadable = true
    });
    table.insert(v6.ASSET_TYPE_INFO, {
        type = Enum.AssetType.LeftLeg, 
        isCatalog = true, 
        isUploadable = true
    });
    table.insert(v6.ASSET_TYPE_INFO, {
        type = Enum.AssetType.RightLeg, 
        isCatalog = true, 
        isUploadable = true
    });
    table.insert(v6.ASSET_TYPE_INFO, {
        type = Enum.AssetType.DynamicHead, 
        isCatalog = true, 
        isUploadable = true
    });
    table.insert(v6.ASSET_TYPE_INFO, {
        type = Enum.AssetType.EyebrowAccessory, 
        isCatalog = true, 
        isUploadable = true
    });
    table.insert(v6.ASSET_TYPE_INFO, {
        type = Enum.AssetType.EyelashAccessory, 
        isCatalog = true, 
        isUploadable = true
    });
end;
for _, v14 in ipairs(v6.ASSET_TYPE_INFO) do
    if next(v14) ~= nil then
        if not (not v14.isCatalog or not v14.isMarketplace) then
            error(tostring(v14.type) .. " cannot be both a catalog and marketplace asset");
        end;
        if v6.ASSET_TYPE_INFO[v14.type] then
            error("AssetConfigConstants.ASSET_TYPE_INFO contains a duplicate of " .. tostring(v14.type));
        end;
        v6.ASSET_TYPE_INFO[v14.type] = v14;
    end;
end;
v6.developCategoryType = v5({
    "WhitelistedPlugins", 
    "MyPlugins", 
    "GroupPlugins"
});
v6.packagesCategoryType = v5({
    "MyPackages", 
    "GroupPackages"
});
v6.rbxThumbTypes = v5({
    "Asset", 
    "Avatar", 
    "AvatarHeadShot", 
    "BadgeIcon", 
    "BundleThumbnail", 
    "GameIcon", 
    "GamePass", 
    "GroupIcon", 
    "Outfit"
});
v6.rbxThumbSizes = {
    AvatarHeadshotImageSize = 60, 
    GroupIconImageSize = 150, 
    AssetThumbnailSize = 420
};
v6.additionalImages = {
    MaxThumbnails = 5, 
    AspectRatioHeight = 9, 
    AspectRatioWidth = 16, 
    RecommendedHeight = 432, 
    RecommendedWidth = 768
};
v6.IMAGE_TYPES = {
    "jpg", 
    "jpeg", 
    "png"
};
v6.TAGS_SUGGESTION_SUCCESS = "Success";
v6.MAX_DISPLAY_SUGGESTIONS = 5;
v6.MAX_FETCH_SUGGESTIONS = 10;
v6.AVATAR_MESHPART_ACCESSORY_FORMAT = "avatar_meshpart_accessory";
v6.MULTIPART_FORM_BOUNDARY = "EA0A21C3-8388-4038-9BD5-92C8B1B7BF8E";
v6.OVERRIDE_ASSET_ID = "OverrideAssetId";
v6.SHARING_KEYS = {
    Public = true, 
    Private = false
};
v6.UGCBundleTypes = l_enumerate_0("UGCBundleTypes", {
    "Body", 
    "DynamicHead"
});
v6.UGCBundleTypeStringToEnumeration = {
    [v6.UGCBundleTypes.Body.rawValue()] = v6.UGCBundleTypes.Body, 
    [v6.UGCBundleTypes.DynamicHead.rawValue()] = v6.UGCBundleTypes.DynamicHead
};
v6.AllowedAssetStringsMetadataToAssetTypeMap = {
    DynamicHead = Enum.AssetType.DynamicHead, 
    LeftArm = Enum.AssetType.LeftArm, 
    LeftLeg = Enum.AssetType.LeftLeg, 
    RightArm = Enum.AssetType.RightArm, 
    RightLeg = Enum.AssetType.RightLeg, 
    Torso = Enum.AssetType.Torso, 
    EyebrowAccessory = Enum.AssetType.EyebrowAccessory, 
    EyelashAccessory = Enum.AssetType.EyelashAccessory, 
    HairAccessory = Enum.AssetType.HairAccessory
};
v6.UGC_BODY_PARTS = {
    Head = "Head", 
    UpperTorso = "UpperTorso", 
    LowerTorso = "LowerTorso", 
    LeftUpperLeg = "LeftUpperLeg", 
    LeftLowerLeg = "LeftLowerLeg", 
    LeftHand = "LeftHand", 
    RightUpperArm = "RightUpperArm", 
    RightLowerArm = "RightLowerArm", 
    RightHand = "RightHand", 
    LeftUpperArm = "LeftUpperArm", 
    LeftLowerArm = "LeftLowerArm", 
    LeftFoot = "LeftFoot", 
    RightUpperLeg = "RightUpperLeg", 
    RightLowerLeg = "RightLowerLeg", 
    RightFoot = "RightFoot", 
    EyebrowAccessory = "EyebrowAccessory", 
    EyelashAccessory = "EyelashAccessory", 
    HairAccessory = "HairAccessory"
};
v6.UGC_BODY_PART_NAMES_TO_ASSET_TYPE = {
    [v6.UGC_BODY_PARTS.Head] = Enum.AssetType.DynamicHead, 
    [v6.UGC_BODY_PARTS.UpperTorso] = Enum.AssetType.Torso, 
    [v6.UGC_BODY_PARTS.LowerTorso] = Enum.AssetType.Torso, 
    [v6.UGC_BODY_PARTS.LeftUpperArm] = Enum.AssetType.LeftArm, 
    [v6.UGC_BODY_PARTS.LeftLowerArm] = Enum.AssetType.LeftArm, 
    [v6.UGC_BODY_PARTS.LeftHand] = Enum.AssetType.LeftArm, 
    [v6.UGC_BODY_PARTS.RightUpperArm] = Enum.AssetType.RightArm, 
    [v6.UGC_BODY_PARTS.RightLowerArm] = Enum.AssetType.RightArm, 
    [v6.UGC_BODY_PARTS.RightHand] = Enum.AssetType.RightArm, 
    [v6.UGC_BODY_PARTS.LeftUpperLeg] = Enum.AssetType.LeftLeg, 
    [v6.UGC_BODY_PARTS.LeftLowerLeg] = Enum.AssetType.LeftLeg, 
    [v6.UGC_BODY_PARTS.LeftFoot] = Enum.AssetType.LeftLeg, 
    [v6.UGC_BODY_PARTS.RightUpperLeg] = Enum.AssetType.RightLeg, 
    [v6.UGC_BODY_PARTS.RightLowerLeg] = Enum.AssetType.RightLeg, 
    [v6.UGC_BODY_PARTS.RightFoot] = Enum.AssetType.RightLeg, 
    [v6.UGC_BODY_PARTS.EyebrowAccessory] = Enum.AssetType.EyebrowAccessory, 
    [v6.UGC_BODY_PARTS.EyelashAccessory] = Enum.AssetType.EyelashAccessory, 
    [v6.UGC_BODY_PARTS.HairAccessory] = Enum.AssetType.HairAccessory
};
return v6;
