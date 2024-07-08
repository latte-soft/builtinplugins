local l_script_FirstAncestor_0 = script:FindFirstAncestor("TerrainEditor");
local v1 = require(l_script_FirstAncestor_0.Src.Util.ApplyById);
local v2 = require(l_script_FirstAncestor_0.Src.Types);
local l_Category_0 = v2.Category;
local l_Storage_0 = v2.Storage;
local l_UpgradeSettings_0 = v2.UpgradeSettings;
local l_UpgradeSettings_1 = l_Category_0.UpgradeSettings;
local l_game_FastString_0 = game:GetFastString("Shorelines_LearnMoreUrl");
return {
    Storage = {
        [l_UpgradeSettings_0.Shorelines] = l_Storage_0.LocalSession
    }, 
    Generator = function(v8, v9, _, v11)
        return v1(v8, {
            {
                Id = l_UpgradeSettings_0.Shorelines, 
                Schema = {
                    Id = l_UpgradeSettings_0.Shorelines, 
                    Type = "Upgrade", 
                    URL = l_game_FastString_0
                }
            }
        }, {
            Category = l_UpgradeSettings_1, 
            Data = v9, 
            Overrides = v11
        });
    end
};
