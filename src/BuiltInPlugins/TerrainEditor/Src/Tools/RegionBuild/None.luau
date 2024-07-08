local l_script_FirstAncestor_0 = script:FindFirstAncestor("TerrainEditor");
local v1 = require(l_script_FirstAncestor_0.Src.Tools.BaseTool);
local v2 = require(l_script_FirstAncestor_0.Src.Types);
local _ = v2.BuildSettings;
local l_Category_0 = v2.Category;
local _ = v2.Gizmo;
local _ = v2.MaterialUnit;
return (v1:new(v2.TerrainType.None, v2.Tab.None, {
    {
        Defaults = {}, 
        Id = l_Category_0.BuildSettings
    }
}, {}));
