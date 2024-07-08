local l_script_FirstAncestor_0 = script:FindFirstAncestor("AssetImporter");
local v1 = require(l_script_FirstAncestor_0.Packages.Framework);
local _ = require(l_script_FirstAncestor_0.Src.DataTypes.QueuedSession);
return v1.Util.Action(script.Name, function(v3)
    return {
        sessionQueue = v3
    };
end);
