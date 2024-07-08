game:DefineFastFlag("ToolboxFixInventoryGridSearch", false);
local v0 = require(script:FindFirstAncestor("Toolbox").Core.Util.SharedFlags.getFFlagToolboxFixInventoryCreatorFilter);
return function()
    return v0() and game:GetFastFlag("ToolboxFixInventoryGridSearch");
end;
