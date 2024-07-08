local l_Math_0 = require(script.Parent.Parent.Parent.Parent.Packages.Framework).Util.Math;
local l_decimalDelimiterByLocale_0 = require(script.Parent.delimitersByLocaleId).decimalDelimiterByLocale;
local l_StudioService_0 = game:GetService("StudioService");
local l_StudioGameSettingsWorldPageFormatNumbersForGerman_0 = game:GetFastFlag("StudioGameSettingsWorldPageFormatNumbersForGerman");
local function v6(v4, v5)
    assert(l_StudioGameSettingsWorldPageFormatNumbersForGerman_0);
    return string.gsub(v4, "%.", v5);
end;
local function v8(v7)
    assert(l_StudioGameSettingsWorldPageFormatNumbersForGerman_0);
    return v6(v7, l_decimalDelimiterByLocale_0[l_StudioService_0.StudioLocaleId] or ".");
end;
return function(v9)
    if not l_StudioGameSettingsWorldPageFormatNumbersForGerman_0 then
        return (tostring(l_Math_0.round(v9, 3)));
    else
        return v8((tostring(l_Math_0.round(v9, 3))));
    end;
end;
