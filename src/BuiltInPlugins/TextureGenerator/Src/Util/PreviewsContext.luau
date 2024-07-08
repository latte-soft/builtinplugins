local l_script_FirstAncestor_0 = script:FindFirstAncestor("TextureGenerator");
local v1 = require(l_script_FirstAncestor_0.Packages.React);
local _ = require(l_script_FirstAncestor_0.Src.Types);
local v3 = require(l_script_FirstAncestor_0.Src.Util.createUnimplemented);
return (v1.createContext({
    previews = {}, 
    addOrUpdatePreview = v3("addOrUpdatePreview"), 
    updatePreview = v3("updatePreview"), 
    removePreview = v3("removePreview"), 
    addError = v3("addError"), 
    popError = v3("popError"), 
    removeErrorById = v3("removeErrorById"), 
    getTopError = v3("getTopError"), 
    modelToPreview = {}, 
    addOrUpdateModelToPreview = v3("addOrUpdateModelToPreview"), 
    quota = 0, 
    setQuota = v3("setQuota"), 
    total = 0, 
    setTotal = v3("setTotal")
}));
