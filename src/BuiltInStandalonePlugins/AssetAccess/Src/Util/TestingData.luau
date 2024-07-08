local _ = require(script:FindFirstAncestor("AssetAccess").Src.Types);
local v1 = {
    AssetMetadata = {}
};
v1.AssetMetadata.PUBLIC = table.freeze({
    id = 123, 
    visibility = "Public", 
    name = "Asset1", 
    owner = "User1", 
    type = Enum.AssetType.Audio
});
v1.AssetMetadata.PRIVATE = table.freeze({
    id = 456, 
    visibility = "Private"
});
table.freeze(v1.AssetMetadata);
v1.AssetModel = {};
v1.AssetModel.LOADED_PUBLIC = table.freeze({
    state = "Loaded", 
    metadata = table.freeze(table.clone(v1.AssetMetadata.PUBLIC))
});
v1.AssetModel.LOADED_PRIVATE = table.freeze({
    state = "Loaded", 
    metadata = table.freeze(table.clone(v1.AssetMetadata.PRIVATE))
});
v1.AssetModel.LOADING = table.freeze({
    state = "Loading"
});
v1.AssetModel.FAILED = table.freeze({
    state = "Failed"
});
table.freeze(v1.AssetModel);
v1.INACCESSIBLE_ASSET_MODELS = table.freeze({
    [123] = table.freeze(table.clone(v1.AssetModel.LOADED_PUBLIC)), 
    [456] = table.freeze(table.clone(v1.AssetModel.LOADED_PRIVATE)), 
    [789] = table.freeze(table.clone(v1.AssetModel.LOADING)), 
    [101112] = table.freeze(table.clone(v1.AssetModel.FAILED))
});
v1.UNSHARABLE_ASSET_MODELS = {};
v1.INACCESSIBLE_ASSET_IDS = {};
v1.UNSHARABLE_ASSET_IDS = {};
for v2, v3 in v1.INACCESSIBLE_ASSET_MODELS, nil, nil do
    table.insert(v1.INACCESSIBLE_ASSET_IDS, v2);
    if v2 % 2 == 1 then
        table.insert(v1.UNSHARABLE_ASSET_IDS, v2);
        v1.UNSHARABLE_ASSET_MODELS[v2] = table.freeze(table.clone(v3));
    end;
end;
table.freeze(v1.UNSHARABLE_ASSET_MODELS);
table.freeze(v1.INACCESSIBLE_ASSET_IDS);
table.freeze(v1.UNSHARABLE_ASSET_IDS);
v1.ShareDialogModel = {};
v1.ShareDialogModel.INACTIVE = table.freeze({
    state = "Inactive"
});
v1.ShareDialogModel.PROMPT = table.freeze({
    state = "Prompt", 
    assetModels = table.freeze(table.clone(v1.INACCESSIBLE_ASSET_MODELS))
});
v1.ShareDialogModel.SHARING = table.freeze({
    state = "Sharing", 
    assetModels = table.freeze(table.clone(v1.INACCESSIBLE_ASSET_MODELS))
});
v1.ShareDialogModel.CANT_SHARE = table.freeze({
    state = "CantShare", 
    assetModels = table.freeze(table.clone(v1.UNSHARABLE_ASSET_MODELS))
});
v1.ShareDialogModel.UNEXPECTED_ERROR = table.freeze({
    state = "UnexpectedError"
});
table.freeze(v1.ShareDialogModel);
return table.freeze(v1);
