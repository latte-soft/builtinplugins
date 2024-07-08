local v0 = require(script.Parent.Parent.Parent.Src.Util.DebugFlags);
local v1 = {
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
        AUDIO = 3, 
        PACKAGE = 4, 
        PLUGIN = 5, 
        HAT = 6, 
        TEE_SHIRT = 7, 
        SHIRT = 8, 
        PANTS = 9, 
        HAIR_ACCESSORY = 10, 
        FACE_ACCESSORY = 11, 
        NECK_ACCESSORY = 12, 
        SHOULDER_ACCESSORY = 13, 
        FRONT_ACCESSORY = 14, 
        BACK_ACCESSORY = 15, 
        WAIST_ACCESSORY = 16
    }
};
v1.ToolboxAssetTypeToEngine = {
    [v1.AssetType.MODEL] = Enum.AssetType.Model, 
    [v1.AssetType.DECAL] = Enum.AssetType.Decal, 
    [v1.AssetType.MESH] = Enum.AssetType.Mesh, 
    [v1.AssetType.AUDIO] = Enum.AssetType.Audio, 
    [v1.AssetType.PACKAGE] = Enum.AssetType.Package, 
    [v1.AssetType.PLUGIN] = Enum.AssetType.Plugin, 
    [v1.AssetType.HAT] = Enum.AssetType.Hat, 
    [v1.AssetType.TEE_SHIRT] = Enum.AssetType.TShirt, 
    [v1.AssetType.SHIRT] = Enum.AssetType.Shirt, 
    [v1.AssetType.PANTS] = Enum.AssetType.Pants, 
    [v1.AssetType.HAIR_ACCESSORY] = Enum.AssetType.HairAccessory, 
    [v1.AssetType.FACE_ACCESSORY] = Enum.AssetType.FaceAccessory, 
    [v1.AssetType.NECK_ACCESSORY] = Enum.AssetType.NeckAccessory, 
    [v1.AssetType.SHOULDER_ACCESSORY] = Enum.AssetType.ShoulderAccessory, 
    [v1.AssetType.FRONT_ACCESSORY] = Enum.AssetType.FrontAccessory, 
    [v1.AssetType.BACK_ACCESSORY] = Enum.AssetType.BackAccessory, 
    [v1.AssetType.WAIST_ACCESSORY] = Enum.AssetType.WaistAccessory
};
v1.FREE_MODELS = {
    name = "FreeModels", 
    category = "FreeModels", 
    ownershipType = v1.OwnershipType.FREE, 
    assetType = v1.AssetType.MODEL
};
v1.FREE_DECALS = {
    name = "FreeDecals", 
    category = "FreeDecals", 
    ownershipType = v1.OwnershipType.FREE, 
    assetType = v1.AssetType.DECAL
};
v1.FREE_MESHES = {
    name = "FreeMeshes", 
    category = "FreeMeshes", 
    ownershipType = v1.OwnershipType.FREE, 
    assetType = v1.AssetType.MESH
};
v1.FREE_AUDIO = {
    name = "FreeAudio", 
    category = "FreeAudio", 
    ownershipType = v1.OwnershipType.FREE, 
    assetType = v1.AssetType.AUDIO
};
v1.MY_MODELS = {
    name = "MyModels", 
    category = "MyModelsExceptPackage", 
    ownershipType = v1.OwnershipType.MY, 
    assetType = v1.AssetType.MODEL
};
v1.MY_DECALS = {
    name = "MyDecals", 
    category = "MyDecals", 
    ownershipType = v1.OwnershipType.MY, 
    assetType = v1.AssetType.DECAL
};
v1.MY_MESHES = {
    name = "MyMeshes", 
    category = "MyMeshes", 
    ownershipType = v1.OwnershipType.MY, 
    assetType = v1.AssetType.MESH
};
v1.MY_AUDIO = {
    name = "MyAudio", 
    category = "MyAudio", 
    ownershipType = v1.OwnershipType.MY, 
    assetType = v1.AssetType.AUDIO
};
v1.MY_PLUGINS = {
    name = "MyPlugins", 
    category = "MyPlugins", 
    ownershipType = v1.AssetType.PLUGIN, 
    assetType = v1.AssetType.PLUGIN
};
v1.RECENT_MODELS = {
    name = "RecentModels", 
    category = "RecentModels", 
    ownershipType = v1.OwnershipType.RECENT, 
    assetType = v1.AssetType.MODEL
};
v1.RECENT_DECALS = {
    name = "RecentDecals", 
    category = "RecentDecals", 
    ownershipType = v1.OwnershipType.RECENT, 
    assetType = v1.AssetType.DECAL
};
v1.RECENT_MESHES = {
    name = "RecentMeshes", 
    category = "RecentMeshes", 
    ownershipType = v1.OwnershipType.RECENT, 
    assetType = v1.AssetType.MESH
};
v1.RECENT_AUDIO = {
    name = "RecentAudio", 
    category = "RecentAudio", 
    ownershipType = v1.OwnershipType.RECENT, 
    assetType = v1.AssetType.AUDIO
};
v1.GROUP_MODELS = {
    name = "GroupModels", 
    category = "GroupModelsExceptPackage", 
    ownershipType = v1.OwnershipType.GROUP, 
    assetType = v1.AssetType.MODEL
};
v1.GROUP_DECALS = {
    name = "GroupDecals", 
    category = "GroupDecals", 
    ownershipType = v1.OwnershipType.GROUP, 
    assetType = v1.AssetType.DECAL
};
v1.GROUP_MESHES = {
    name = "GroupMeshes", 
    category = "GroupMeshes", 
    ownershipType = v1.OwnershipType.GROUP, 
    assetType = v1.AssetType.MESH
};
v1.GROUP_AUDIO = {
    name = "GroupAudio", 
    category = "GroupAudio", 
    ownershipType = v1.OwnershipType.GROUP, 
    assetType = v1.AssetType.AUDIO
};
v1.MY_PACKAGES = {
    name = "MyPackages", 
    category = "MyPackages", 
    ownershipType = v1.OwnershipType.MY, 
    assetType = v1.AssetType.PACKAGE
};
v1.GROUP_PACKAGES = {
    name = "GroupPackages", 
    category = "GroupPackages", 
    ownershipType = v1.OwnershipType.GROUP, 
    assetType = v1.AssetType.PACKAGE
};
v1.CREATIONS_DEVELOPMENT_SECTION_DIVIDER = {
    name = "CreationsDevelopmentSectionDivider", 
    selectable = false
};
v1.CREATIONS_MODELS = {
    name = "CreationsModels", 
    assetType = v1.AssetType.MODEL
};
v1.CREATIONS_DECALS = {
    name = "CreationsDecals", 
    assetType = v1.AssetType.DECAL
};
v1.CREATIONS_AUDIO = {
    name = "CreationsAudio", 
    assetType = v1.AssetType.AUDIO
};
v1.CREATIONS_MESHES = {
    name = "CreationsMeshes", 
    assetType = v1.AssetType.MESH
};
v1.CREATIONS_CATALOG_SECTION_DIVIDER = {
    name = "CreationsCatalogSectionDivider", 
    selectable = false
};
v1.CREATIONS_HATS = {
    name = "CreationsHats", 
    assetType = v1.AssetType.HAT
};
v1.CREATIONS_TEE_SHIRT = {
    name = "CreationsTeeShirts", 
    assetType = v1.AssetType.TEE_SHIRT
};
v1.CREATIONS_SHIRT = {
    name = "CreationsShirts", 
    assetType = v1.AssetType.SHIRT
};
v1.CREATIONS_PANTS = {
    name = "CreationsPants", 
    assetType = v1.AssetType.PANTS
};
v1.CREATIONS_HAIR = {
    name = "CreationsHair", 
    assetType = v1.AssetType.HairAccessory
};
v1.CREATIONS_FACE_ACCESSORYS = {
    name = "CreationsFaceAccessorys", 
    assetType = v1.AssetType.FaceAccessory
};
v1.CREATIONS_NECK_ACCESSORYS = {
    name = "CreationsNeckAccessorys", 
    assetType = v1.AssetType.NeckAccessory
};
v1.CREATIONS_SHOULDER_ACCESSORYS = {
    name = "CreationsShoulderAccessorys", 
    assetType = v1.AssetType.ShoulderAccessory
};
v1.CREATIONS_FRONT_ACCESSORYS = {
    name = "CreationsFrontAccessorys", 
    assetType = v1.AssetType.FrontAccessory
};
v1.CREATIONS_BACK_ACCESSORYS = {
    name = "CreationsBackAccessorys", 
    assetType = v1.AssetType.BackAccessory
};
v1.CREATIONS_WAIST_ACCESSORYS = {
    name = "CreationsWaistAccessorys", 
    assetType = v1.AssetType.WaistAccessory
};
v1.MARKETPLACE = {
    v1.FREE_MODELS, 
    v1.FREE_DECALS, 
    v1.FREE_MESHES, 
    v1.FREE_AUDIO
};
v1.INVENTORY = {
    v1.MY_MODELS, 
    v1.MY_DECALS, 
    v1.MY_MESHES, 
    v1.MY_AUDIO, 
    v1.MY_PACKAGES
};
v1.INVENTORY_WITH_GROUPS = {
    v1.MY_MODELS, 
    v1.MY_DECALS, 
    v1.MY_MESHES, 
    v1.MY_AUDIO, 
    v1.MY_PACKAGES, 
    v1.GROUP_MODELS, 
    v1.GROUP_DECALS, 
    v1.GROUP_MESHES, 
    v1.GROUP_AUDIO
};
v1.RECENT = {
    v1.RECENT_MODELS, 
    v1.RECENT_DECALS, 
    v1.RECENT_MESHES, 
    v1.RECENT_AUDIO
};
local v2 = {
    v1.CREATIONS_DEVELOPMENT_SECTION_DIVIDER, 
    v1.CREATIONS_MODELS, 
    v1.CREATIONS_DECALS, 
    v1.CREATIONS_AUDIO, 
    v1.CREATIONS_MESHES
};
local v3 = {
    v1.CREATIONS_DEVELOPMENT_SECTION_DIVIDER, 
    v1.CREATIONS_MODELS, 
    v1.CREATIONS_DECALS, 
    v1.CREATIONS_AUDIO, 
    v1.CREATIONS_MESHES, 
    v1.CREATIONS_CATALOG_SECTION_DIVIDER, 
    v1.CREATIONS_HATS
};
v1.MARKETPLACE_KEY = "Marketplace";
v1.INVENTORY_KEY = "Inventory";
v1.RECENT_KEY = "Recent";
v1.CREATIONS_KEY = "Creations";
local v4 = {
    [v1.MARKETPLACE_KEY] = v1.MARKETPLACE, 
    [v1.INVENTORY_KEY] = v1.INVENTORY, 
    [v1.RECENT_KEY] = v1.RECENT, 
    [v1.CREATIONS_KEY] = {
        [1] = v2, 
        [2] = v3
    }
};
local function _(v5)
    local l_v5_0 = v5;
    if l_v5_0 then
        l_v5_0 = false;
        if v5 >= 1 then
            l_v5_0 = v5 <= #v1.INVENTORY_WITH_GROUPS;
        end;
    end;
    return l_v5_0;
end;
v1.categoryIsPackage = function(v8)
    local l_v8_0 = v8;
    if l_v8_0 then
        l_v8_0 = false;
        if v8 >= 1 then
            l_v8_0 = v8 <= #v1.INVENTORY_WITH_GROUPS;
        end;
    end;
    if l_v8_0 then
        l_v8_0 = v1.INVENTORY_WITH_GROUPS[v8].assetType == v1.AssetType.PACKAGE;
    end;
    return l_v8_0;
end;
v1.categoryIsFreeAsset = function(v10)
    local l_v10_0 = v10;
    if l_v10_0 then
        l_v10_0 = false;
        if v10 >= 1 then
            l_v10_0 = v10 <= #v1.INVENTORY_WITH_GROUPS;
        end;
    end;
    if l_v10_0 then
        l_v10_0 = v1.INVENTORY_WITH_GROUPS[v10].ownershipType == v1.OwnershipType.FREE;
    end;
    return l_v10_0;
end;
v1.categoryIsGroupAsset = function(v12, v13)
    if v12 == v1.CREATIONS_KEY then
        return false;
    else
        local l_v13_0 = v13;
        if l_v13_0 then
            l_v13_0 = false;
            if v13 >= 1 then
                l_v13_0 = v13 <= #v1.INVENTORY_WITH_GROUPS;
            end;
        end;
        if l_v13_0 then
            l_v13_0 = v1.INVENTORY_WITH_GROUPS[v13].ownershipType == v1.OwnershipType.GROUP;
        end;
        return l_v13_0;
    end;
end;
v1.categoryIsPlugin = function(v15)
    local l_v15_0 = v15;
    if l_v15_0 then
        l_v15_0 = false;
        if v15 >= 1 then
            l_v15_0 = v15 <= #v1.INVENTORY_WITH_GROUPS;
        end;
    end;
    if l_v15_0 then
        l_v15_0 = v1.INVENTORY_WITH_GROUPS[v15].assetType == v1.AssetType.PLUGIN;
    end;
    return l_v15_0;
end;
v1.getCategories = function(v17, v18)
    if v1.CREATIONS_KEY == v17 then
        if not v18 or not v18.isCatalogItemCreator then
            return v4[v17][1];
        else
            return v4[v17][2];
        end;
    else
        return v4[v17];
    end;
end;
v1.getEngineAssetType = function(v19)
    local v20 = v1.ToolboxAssetTypeToEngine[v19];
    if not (v20 or not v0.shouldDebugWarnings()) then
        warn(("Lua toolbox: No engine assetType for category asset type %s"):format((tostring(v19))));
    end;
    return v20;
end;
local function _(v21)
    if v21 == v1.OwnershipType.FREE then
        return "FREE";
    elseif v21 == v1.OwnershipType.MY then
        return "MY";
    elseif v21 == v1.OwnershipType.RECENT then
        return "RECENT";
    elseif v21 == v1.OwnershipType.GROUP then
        return "GROUP";
    else
        return "[unknown]";
    end;
end;
local function _(v23)
    if v23 == v1.AssetType.MODEL then
        return "MODEL";
    elseif v23 == v1.AssetType.DECAL then
        return "DECAL";
    elseif v23 == v1.AssetType.MESH then
        return "MESH";
    elseif v23 == v1.AssetType.AUDIO then
        return "AUDIO";
    elseif v23 == v1.AssetType.PACKAGE then
        return "PACKAGE";
    else
        return "[unknown]";
    end;
end;
v1.categoryToString = function(v25)
    local v26 = "Category(name=\"%s\", category=\"%s\", ownershipType=\"%s\", assetType=\"%s\")";
    local l_name_0 = v25.name;
    local l_category_0 = v25.category;
    local l_ownershipType_0 = v25.ownershipType;
    local v30 = l_ownershipType_0 == v1.OwnershipType.FREE and "FREE" or (l_ownershipType_0 == v1.OwnershipType.MY and "MY" or (l_ownershipType_0 == v1.OwnershipType.RECENT and "RECENT" or (l_ownershipType_0 == v1.OwnershipType.GROUP and "GROUP" or "[unknown]")));
    local l_assetType_0 = v25.assetType;
    return v26:format(l_name_0, l_category_0, v30, l_assetType_0 == v1.AssetType.MODEL and "MODEL" or (l_assetType_0 == v1.AssetType.DECAL and "DECAL" or (l_assetType_0 == v1.AssetType.MESH and "MESH" or (l_assetType_0 == v1.AssetType.AUDIO and "AUDIO" or (l_assetType_0 == v1.AssetType.PACKAGE and "PACKAGE" or "[unknown]")))));
end;
return v1;
