local _ = require(script.Parent.Parent.Parent.Parent.Src.Types);
local v1 = {
    FailedUrl = "FailedUrl", 
    FailedToImportMap = "FailedToImportMap", 
    FailedToUploadFromFileMap = "FailedToUploadFromFileMap", 
    FailedToUploadTooLarge = "FailedToUploadTooLarge", 
    FailedToInsertAssetManager = "FailedToInsertAssetManager", 
    MissingMaterial = "MissingMaterial", 
    None = "None"
};
return function()
    return v1;
end;
