local l_game_EngineFeature_0 = game:GetEngineFeature("EnableLocalizedLocalizationToolsErrorsApi");
local function v7(v1, v2)
    assert(l_game_EngineFeature_0, "expected FFlagLocalizedLocalizationToolsErrors to be true");
    for _, v4 in {
        {
            pattern = "^Error reading (.-): Missing a Key or Source header column.$", 
            key = "MissingKeyOrSource", 
            numArguments = 1
        }, 
        {
            pattern = "^.+%s(.+)%s?: Missing a Key or Source header column.%s?.*$", 
            key = "MissingKeyOrSource", 
            numArguments = 1
        }, 
        {
            pattern = "^.+%s(.+)%s?: Error opening CSV .-: Invalid UTF%-8. File must be UTF%-8 encoded.%s?.*$", 
            key = "NonUtf8", 
            numArguments = 1
        }, 
        {
            pattern = "^Error opening CSV (.-): Invalid UTF%-8. File must be UTF%-8 encoded.$", 
            key = "NonUtf8", 
            numArguments = 1
        }
    }, nil, nil do
        local v5, v6 = matchPatternToMessage(v1, v4, v2);
        if v5 then
            return v6;
        end;
    end;
    return v1;
end;
matchPatternToMessage = function(v8, v9, v10)
    local v11 = {
        string.match(v8, v9.pattern)
    };
    local v12 = nil;
    local v13 = #v11 == v9.numArguments;
    if v13 then
        v12 = v10:getText("EngineErrors", v9.key, v11);
    end;
    return v13, v12;
end;
return {
    getTranslationForEngineError = v7
};
