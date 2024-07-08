local l_Parent_0 = script.Parent.Parent;
local l_StudioService_0 = game:GetService("StudioService");
local l_SourceStrings_0 = l_Parent_0.Src.Resources.SourceStrings;
local l_Translator_0 = l_Parent_0.Src.Resources.LocalizedStrings:GetTranslator(l_StudioService_0.StudioLocaleId);
local l_l_SourceStrings_0_Translator_0 = l_SourceStrings_0:GetTranslator("en-us");
return function(v5, ...)
    local v6 = nil;
    local v7 = nil;
    local v8 = {
        ...
    };
    local l_status_0, l_result_0 = pcall(function()
        return l_Translator_0:FormatByKey(v5, v8);
    end);
    v6 = l_status_0;
    v7 = l_result_0;
    if not v6 then
        l_status_0, l_result_0 = pcall(function()
            return l_l_SourceStrings_0_Translator_0:FormatByKey(v5, v8);
        end);
        v6 = l_status_0;
        v7 = l_result_0;
        if not v6 then
            return v5;
        else
            return v7;
        end;
    else
        return v7;
    end;
end;
