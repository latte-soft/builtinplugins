local l_script_FirstAncestor_0 = script:FindFirstAncestor("AssetImporter");
local v1 = require(l_script_FirstAncestor_0.Packages.Rodux);
local v2 = require(l_script_FirstAncestor_0.Packages.Cryo);
local l_Actions_0 = l_script_FirstAncestor_0.Src.Actions;
return v1.createReducer({
    showError = false, 
    showPreview = false, 
    showProgress = false, 
    uploading = false
}, {
    [require(l_Actions_0.SetShowError).name] = function(v4, v5)
        return v2.Dictionary.join(v4, {
            showError = v5.showError
        });
    end, 
    [require(l_Actions_0.SetShowPreview).name] = function(v6, v7)
        return v2.Dictionary.join(v6, {
            showPreview = v7.showPreview
        });
    end, 
    [require(l_Actions_0.SetShowProgress).name] = function(v8, v9)
        return v2.Dictionary.join(v8, {
            showProgress = v9.showProgress
        });
    end, 
    [require(l_Actions_0.SetShowQueue).name] = function(v10, v11)
        return v2.Dictionary.join(v10, {
            showQueue = v11.showQueue
        });
    end, 
    [require(l_Actions_0.SetShowWarning).name] = function(v12, v13)
        return v2.Dictionary.join(v12, {
            showWarning = v13.showWarning
        });
    end, 
    [require(l_Actions_0.SetUploading).name] = function(v14, v15)
        return v2.Dictionary.join(v14, {
            uploading = v15.uploading
        });
    end
});
