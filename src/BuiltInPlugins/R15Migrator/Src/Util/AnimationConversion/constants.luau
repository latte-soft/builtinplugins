local v0 = {};
local v1 = {
    NotStarted = "NotStarted", 
    ScanningScripts = "ScanningScripts", 
    ScanningWorkspace = "ScanningWorkspace", 
    ConvertingAnimations = "ConvertingAnimations", 
    Done = "Done"
};
local v2 = {
    RobloxAsset = 1, 
    LocalAsset = 2, 
    AnimationInstance = 3, 
    AssetIdString = 4
};
local v3 = {
    Uploading = 1, 
    FailedSerialization = "FailedSerialization", 
    FailedToGetProductInfo = "FailedToGetProductInfo", 
    FailedWithError = "FailedWithError", 
    Done = "Done"
};
v0.Status = v1;
v0.AssetType = v2;
v0.AnimationStatus = v3;
return v0;
