local l_script_FirstAncestor_0 = script:FindFirstAncestor("R15Migrator");
local v1 = require(l_script_FirstAncestor_0.Packages.Cryo);
local l_Actions_0 = l_script_FirstAncestor_0.Src.Actions;
local _ = require(l_Actions_0.SetAdapted);
local v4 = require(l_Actions_0.SetCharacterConverted);
local v5 = require(l_script_FirstAncestor_0.Src.Modules.NpcManager);
local l_Util_0 = l_script_FirstAncestor_0.Src.Util;
local l_CharacterTagging_0 = require(l_Util_0.PublishTagging).CharacterTagging;
local l_AdapterTagging_0 = require(l_Util_0.PublishTagging).AdapterTagging;
local l_CharactersConvertedToR15Tagging_0 = require(l_Util_0.QuickAccessTagging).CharactersConvertedToR15Tagging;
return function(v10)
    return function(v11)
        local v12 = v11:getState();
        local l_selection_0 = v12.CharacterConversion.selection;
        local l_convertedCharacters_0 = v12.CharacterConversion.convertedCharacters;
        for _, v16 in l_selection_0, nil, nil do
            local v17 = l_convertedCharacters_0[v16];
            if not (not v17 or not v17.model) then
                l_AdapterTagging_0:removeTag(v17.model);
                l_CharactersConvertedToR15Tagging_0:removeTag(v17.model);
                local v18 = v17.model:Clone();
                v5.ReplaceModel(v16, v18, false);
                l_CharacterTagging_0:addTag(v18);
                v11:dispatch(v4(v17, false));
            end;
        end;
        if #v1.Dictionary.keys(v11:getState().CharacterConversion.convertedCharacters) == 0 then
            local l_AvatarUnification_0 = game:GetService("ReplicatedStorage"):FindFirstChild("AvatarUnification");
            if l_AvatarUnification_0 then
                l_AvatarUnification_0:Destroy();
            end;
            local l_StarterCharacterScripts_0 = game:GetService("StarterPlayer"):FindFirstChild("StarterCharacterScripts");
            if l_StarterCharacterScripts_0 then
                local l_LocalEffects_0 = l_StarterCharacterScripts_0:FindFirstChild("LocalEffects");
                if l_LocalEffects_0 then
                    l_LocalEffects_0:Destroy();
                end;
            end;
        end;
        v10:getHandler("onCharactersReverted")(l_convertedCharacters_0, l_selection_0);
    end;
end;
