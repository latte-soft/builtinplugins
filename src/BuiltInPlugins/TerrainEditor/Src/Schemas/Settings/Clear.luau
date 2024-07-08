local l_script_FirstAncestor_0 = script:FindFirstAncestor("TerrainEditor");
local v1 = require(l_script_FirstAncestor_0.Src.Util.ApplyById);
local v2 = require(l_script_FirstAncestor_0.Src.Types);
local l_Category_0 = v2.Category;
local l_ClearSettings_0 = v2.ClearSettings;
local l_Storage_0 = v2.Storage;
local l_ClearSettings_1 = l_Category_0.ClearSettings;
return {
    Storage = {
        [l_ClearSettings_0.Clear] = l_Storage_0.LocalSession
    }, 
    Generator = function(v7, v8, _, v10)
        return v1(v7, {
            {
                Id = l_ClearSettings_0.Clear, 
                Layout = Enum.FillDirection.Vertical, 
                Schema = {
                    Label = v7.Localization:getText(l_Category_0.ClearSettings, "ClearButtonLabel"), 
                    Type = "Button"
                }
            }
        }, {
            Category = l_ClearSettings_1, 
            Data = v8, 
            Overrides = v10
        });
    end
};
