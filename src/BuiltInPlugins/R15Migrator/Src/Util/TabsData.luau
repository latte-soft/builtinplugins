local l_R15MigScriptsPane_0 = game:GetFastFlag("R15MigScriptsPane");
local v1 = {
    Summary = "Summary", 
    CharacterConversion = "CharacterConversion", 
    AnimationConversion = "AnimationConversion", 
    ScriptConversion = "ScriptConversion", 
    ScriptConversionDeprecated = if not l_R15MigScriptsPane_0 then nil else "ScriptConversionDeprecated"
};
v1.getAllTabsData = function(v2, v3)
    local v4 = {
        v1.Summary, 
        v1.CharacterConversion, 
        v1.AnimationConversion, 
        v1.ScriptConversion
    };
    if l_R15MigScriptsPane_0 then
        table.insert(v4, v1.ScriptConversionDeprecated);
    end;
    local v5 = {};
    for _, v7 in v4, nil, nil do
        table.insert(v5, {
            Tooltip = v2:getText("Tabs", v7), 
            Key = v7, 
            Icon = string.format("rbxasset://textures/R15Migrator/Icon_%sTab.png", v7), 
            Disabled = not not v3 and not v3(v7)
        });
    end;
    return v5;
end;
v1.findTabData = function(v8, v9)
    for _, v11 in v9, nil, nil do
        if v11.Key == v8 then
            return v11;
        end;
    end;
    return nil;
end;
return v1;
