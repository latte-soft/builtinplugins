local l_script_FirstAncestor_0 = script:FindFirstAncestor("R15Migrator");
local l_Actions_0 = l_script_FirstAncestor_0.Src.Actions;
local _ = require(l_Actions_0.SetAdapted);
local v3 = require(l_Actions_0.SetCharacterConverted);
local v4 = require(l_script_FirstAncestor_0.Src.Modules.NpcManager);
local l_Util_0 = l_script_FirstAncestor_0.Src.Util;
local l_AdapterTagging_0 = require(l_Util_0.PublishTagging).AdapterTagging;
local l_CharacterTagging_0 = require(l_Util_0.PublishTagging).CharacterTagging;
local l_CharactersConvertedToR15Tagging_0 = require(l_Util_0.QuickAccessTagging).CharactersConvertedToR15Tagging;
return function(v9)
    return function(v10)
        local v11 = v10:getState();
        local l_selection_0 = v11.CharacterConversion.selection;
        local l_characters_0 = v11.CharacterConversion.characters;
        for _, v15 in l_selection_0, nil, nil do
            local v16 = l_characters_0[v15];
            if not (not v16 or not v16.model) then
                local v17 = v16.model:Clone();
                v4.ReplaceModel(v15, v17, true, v11.Adapter.adapted);
                l_CharactersConvertedToR15Tagging_0:addTag(v17);
                l_AdapterTagging_0:addTag(v17);
                l_CharacterTagging_0:removeTag(v17);
                v10:dispatch(v3(v16, true));
            end;
        end;
        v9:getHandler("onCharactersConverted")(l_characters_0, l_selection_0);
    end;
end;
