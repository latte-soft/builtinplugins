local l_script_FirstAncestor_0 = script:FindFirstAncestor("StreamingServiceDispatcherRegistry");
local v1 = require(l_script_FirstAncestor_0.Src.Utils.CliAdapter).GetService("ChatbotUIService");
local _ = require(l_script_FirstAncestor_0.Src.Types);
return function(v3)
    v1:DisplayContent("DisplaySuggestions", v3.arguments);
end;
