local l_script_FirstAncestor_0 = script:FindFirstAncestor("R15Migrator");
local l_Modules_0 = l_script_FirstAncestor_0.Src.Modules;
local v2 = require(l_Modules_0.NpcManager);
local v3 = require(l_Modules_0.NpcIdManager);
local l_Util_0 = l_script_FirstAncestor_0.Src.Util;
local v5 = require(l_Util_0.SaveInterface);
local l_CharacterTagging_0 = require(l_Util_0.PublishTagging).CharacterTagging;
local l_AdapterTagging_0 = require(l_Util_0.PublishTagging).AdapterTagging;
local l_CharactersConvertedToR15Tagging_0 = require(l_Util_0.QuickAccessTagging).CharactersConvertedToR15Tagging;
local v9 = require(l_script_FirstAncestor_0.Src.Actions.SetCharacterMetadata);
local _ = require(l_script_FirstAncestor_0.Src.Actions.SetAdapted);
local function v20(v11)
    local v12 = nil;
    local v13 = {};
    for _, v15 in v11, nil, nil do
        local v16 = nil;
        if v15:FindFirstChildOfClass("Humanoid").RigType == Enum.HumanoidRigType.R6 then
            v16 = v15:Clone();
        else
            v12 = v12 or v5.getR6Characters();
            local v17 = v12[v5.getConversionId(v15)];
            if v17 then
                l_CharactersConvertedToR15Tagging_0:addTag(v15);
                if not v2.HasUnificationScripts(v15) then
                    l_AdapterTagging_0:removeTag(v15);
                else
                    l_AdapterTagging_0:addTag(v15);
                end;
                v16 = v17:Clone();
                v16.Name = v15.Name;
            else
                warn("Original R6 character is unavailable. Was the save folder edited?");
                continue;
            end;
        end;
        local l_v15_FullName_0 = v15:GetFullName();
        local v19 = v5.getConversionId(v15);
        if not v19 then
            v19 = v3.AddNpc(v15);
        else
            v3.SetNpcWithId(v15, v19);
        end;
        v13[v19] = {
            key = v19, 
            fullName = l_v15_FullName_0, 
            model = v16
        };
    end;
    return v13;
end;
local function v25(v21, v22)
    for _, v24 in pairs(v21) do
        if l_CharacterTagging_0:hasTagged(v24) then
            if v22 then
                v2.SetupUnificationScripts(v24);
                l_AdapterTagging_0:addTag(v24);
            end;
            l_CharactersConvertedToR15Tagging_0:addTag(v24);
            l_CharacterTagging_0:removeTag(v24);
        end;
    end;
end;
local function v38(v26, v27)
    local v28 = v26:getState();
    v3.Reset();
    local v29 = v2.GetR6Npcs();
    v5.addConvertibleCharacters(v29);
    local v30 = v20(v29);
    local v31 = v2.GetR15ConvertedNpcs();
    local l_adapted_0 = v28.Adapter.adapted;
    v25(v31, l_adapted_0);
    local v33 = v20(v31);
    for _, v35 in pairs(v29) do
        l_CharacterTagging_0:addTag(v35);
    end;
    for _, v37 in pairs(v31) do
        l_CharacterTagging_0:removeTag(v37);
    end;
    v26:dispatch(v9(v30, v33));
    v27:getHandler("onCharactersLoaded")(v30, v33);
    game:GetService("Workspace"):SetAvatarUnificationMode(not not l_adapted_0 and Enum.AvatarUnificationMode.Enabled or Enum.AvatarUnificationMode.Disabled);
end;
return function(v39)
    return function(v40)
        coroutine.wrap(v38)(v40, v39);
    end;
end;
