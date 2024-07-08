local l_script_FirstAncestor_0 = script:FindFirstAncestor("AssetImporter");
local _ = require(l_script_FirstAncestor_0.Src.Types);
local l_joinDeep_0 = require(l_script_FirstAncestor_0.Packages.Framework).Dash.joinDeep;
local v3 = table.freeze({
    assetName = "", 
    currentPreset = "", 
    enabled = false, 
    errors = 0, 
    filepath = "", 
    progressValue = 0, 
    session = nil, 
    uploaded = false, 
    timestamp = 0, 
    validSession = false, 
    warnings = 0
});
return {
    new = function(v4)
        return table.freeze(l_joinDeep_0(table.clone(v3), v4 or {}));
    end, 
    update = function(v5, v6)
        return table.freeze(l_joinDeep_0(v5, v6));
    end, 
    compare = function(v7, v8)
        return v7.timestamp < v8.timestamp;
    end
};
