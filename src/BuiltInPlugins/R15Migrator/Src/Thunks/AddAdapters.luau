local l_script_FirstAncestor_0 = script:FindFirstAncestor("R15Migrator");
local l_Util_0 = l_script_FirstAncestor_0.Src.Util;
local l_AdapterTagging_0 = require(l_Util_0.PublishTagging).AdapterTagging;
local l_CharactersConvertedToR15Tagging_0 = require(l_Util_0.QuickAccessTagging).CharactersConvertedToR15Tagging;
local v4 = require(l_script_FirstAncestor_0.Src.Actions.SetAdapted);
local v5 = require(l_script_FirstAncestor_0.Src.Modules.NpcManager);
local v6 = require(l_script_FirstAncestor_0.Src.Util.SaveInterface);
return function(v7)
    return function(v8)
        v7:getHandler("onAdapterToggle")(true);
        for _, v10 in pairs(l_CharactersConvertedToR15Tagging_0:getTagged()) do
            v5.SetupUnificationScripts(v10);
            l_AdapterTagging_0:addTag(v10);
        end;
        v6.SetAdapted(true);
        v8:dispatch(v4(true));
        game:GetService("Workspace"):SetAvatarUnificationMode(Enum.AvatarUnificationMode.Enabled);
    end;
end;
