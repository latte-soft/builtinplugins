local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Cryo);
return require(l_Parent_0.Packages.Rodux).createReducer({
    languagesTable = {}, 
    languagesList = {}
}, {
    LoadLanguages = function(v2, v3)
        local l_data_0 = v3.data;
        local v5 = {};
        local v6 = {};
        for _, v8 in pairs(l_data_0) do
            v5[v8.locale.locale] = {
                localeId = v8.locale.locale, 
                languageCode = v8.locale.language.languageCode, 
                displayText = v8.locale.language.name
            };
            table.insert(v6, {
                localeId = v8.locale.locale, 
                displayText = v8.locale.language.name
            });
        end;
        table.sort(v6, function(v9, v10)
            return v9.displayText < v10.displayText;
        end);
        table.insert(v6, {
            isCustom = true, 
            displayTextSectionKey = "LanguageSection", 
            displayTextStringKey = "CustomLanguageDisplayText"
        });
        return v1.Dictionary.join(v2, {
            languagesTable = v5, 
            languagesList = v6
        });
    end
});
