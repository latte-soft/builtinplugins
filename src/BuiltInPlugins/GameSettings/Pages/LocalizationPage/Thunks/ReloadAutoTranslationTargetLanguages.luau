local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Cryo);
local l_getAutoTranslatedLanguages_0 = require(l_Parent_0.Src.Util.GameSettingsUtilities).getAutoTranslatedLanguages;
local v3 = require(l_Parent_0.Src.Actions.SetCurrentSettings);
return function(v4)
    return function(v5, v6)
        v5:dispatch(v3((v1.Dictionary.join(v5:getState().Settings.Current, {
            AutoTranslationTargetLanguages = l_getAutoTranslatedLanguages_0()[v4] or v6.localizationPageController:getAutoTranslationTargetLanguages(v4)
        }))));
    end;
end;
