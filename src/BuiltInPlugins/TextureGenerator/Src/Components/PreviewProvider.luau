local l_script_FirstAncestor_0 = script:FindFirstAncestor("TextureGenerator");
local v1 = require(l_script_FirstAncestor_0.Packages.React);
local v2 = require(l_script_FirstAncestor_0.Src.Util.PreviewsContext);
local v3 = require(l_script_FirstAncestor_0.Src.Hooks.useAddOrUpdateModelToPreview);
local v4 = require(l_script_FirstAncestor_0.Src.Hooks.useAddOrUpdatePreview);
local v5 = require(l_script_FirstAncestor_0.Src.Hooks.useErrorStates);
local v6 = require(l_script_FirstAncestor_0.Src.Hooks.useRemovePreview);
local v7 = require(l_script_FirstAncestor_0.Src.Hooks.useUpdatePreview);
return function(v8)
    local v9, v10 = v1.useState({});
    local v11 = v4(v10);
    local v12 = v7(v10);
    local v13 = v6(v10);
    local v14, v15 = v1.useState({});
    local v16 = v3(v15);
    local v17 = v5();
    local v18, v19 = v1.useState(0);
    local v20, v21 = v1.useState(0);
    return v1.createElement(v2.Provider, {
        value = {
            previews = v9, 
            addOrUpdatePreview = v11, 
            updatePreview = v12, 
            removePreview = v13, 
            addError = v17.addError, 
            popError = v17.popError, 
            getTopError = v17.getTopError, 
            removeErrorById = v17.removeErrorById, 
            modelToPreview = v14, 
            addOrUpdateModelToPreview = v16, 
            quota = v18, 
            setQuota = v19, 
            total = v20, 
            setTotal = v21
        }
    }, v8.children);
end;
