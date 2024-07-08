local l_decimalDelimiterByLocale_0 = require(script.Parent.delimitersByLocaleId).decimalDelimiterByLocale;
local l_StudioService_0 = game:GetService("StudioService");
local function v5(v2, v3, v4)
    if v3 == "." then
        v3 = "%.";
    end;
    return v2:gsub("(.*)" .. v3 .. "(.*)", "%1" .. v4 .. "%2");
end;
local function v7(v6)
    return v5(v6, l_decimalDelimiterByLocale_0[l_StudioService_0.StudioLocaleId] or ".", ".");
end;
return function(v8)
    return v7(v8);
end;
