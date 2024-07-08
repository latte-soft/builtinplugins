local l_script_FirstAncestor_0 = script:FindFirstAncestor("StreamingServiceDispatcherRegistry");
local l_ContextServices_0 = require(l_script_FirstAncestor_0.Packages.Framework).ContextServices;
local l_SourceStrings_0 = l_script_FirstAncestor_0.Src.Resources.Localization.SourceStrings;
local l_LocalizedStrings_0 = l_script_FirstAncestor_0.Src.Resources.Localization.LocalizedStrings;
local v4 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagFixAssistantEvalLocalization);
local v5 = nil;
pcall(function()
    v5 = l_ContextServices_0.Localization.new({
        stringResourceTable = l_SourceStrings_0, 
        translationResourceTable = l_LocalizedStrings_0, 
        pluginName = "StreamingServiceDispatcherRegistry"
    });
end);
if not v5 then
    v5 = if not v4() then {
        getText = function(v6, _, _)
            return v6;
        end
    } else {
        getText = function(_, v10, _, _)
            return v10;
        end
    };
end;
return v5;
