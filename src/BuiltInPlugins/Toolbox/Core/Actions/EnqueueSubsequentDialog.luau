local l_script_FirstAncestor_0 = script:FindFirstAncestor("Toolbox");
local l_Action_0 = require(l_script_FirstAncestor_0.Packages.Framework).Util.Action;
local _ = require(l_script_FirstAncestor_0.Core.Models.AssetInfo);
local _ = require(l_script_FirstAncestor_0.Core.Types.SubsequentDialogStatus);
return l_Action_0(script.Name, function(v4, v5)
    return {
        assetData = v4, 
        status = v5
    };
end);
