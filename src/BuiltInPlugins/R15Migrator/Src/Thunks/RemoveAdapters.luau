local l_script_FirstAncestor_0 = script:FindFirstAncestor("R15Migrator");
local l_AdapterTagging_0 = require(l_script_FirstAncestor_0.Src.Util.PublishTagging).AdapterTagging;
local v2 = require(l_script_FirstAncestor_0.Src.Actions.SetAdapted);
local v3 = require(l_script_FirstAncestor_0.Src.Modules.NpcManager);
local v4 = require(l_script_FirstAncestor_0.Src.Util.SaveInterface);
return function(v5)
    return function(v6)
        local v7 = v6:getState();
        local l_diagnostics_0 = v7.ScriptConversion.diagnostics;
        local v9 = 0;
        for _, v11 in l_diagnostics_0, nil, nil do
            v9 = v9 + #v11._list;
        end;
        local l_animations_0 = v7.AnimationConversion.animations;
        local v13 = 0;
        for _, v15 in l_animations_0, nil, nil do
            if v15.status ~= nil then
                if v15.status ~= "Done" and v15.status ~= "Published" then
                    v13 = v13 + 1;
                end;
            else
                v13 = v13 + 1;
            end;
        end;
        local l_characters_0 = v7.CharacterConversion.characters;
        local v17 = 0;
        for _, _ in l_characters_0, nil, nil do
            v17 = v17 + 1;
        end;
        v5:getHandler("onAdapterToggle")(false, v9, v13, v17);
        v3.ClearAdapterSetup();
        l_AdapterTagging_0:removeAllTags();
        game:GetService("Workspace"):SetAvatarUnificationMode(Enum.AvatarUnificationMode.Disabled);
        v4.SetAdapted(false);
        v6:dispatch(v2(false));
    end;
end;
