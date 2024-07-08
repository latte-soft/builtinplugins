local l_script_FirstAncestor_0 = script:FindFirstAncestor("DynamicHeadExportTool");
local v1 = require(l_script_FirstAncestor_0.Src.Constants);
local v2 = require(l_script_FirstAncestor_0.Src.Actions.SetEnabled);
local v3 = require(l_script_FirstAncestor_0.Src.Actions.SetErrorText);
local v4 = require(l_script_FirstAncestor_0.Src.Actions.SetScreen);
return function(v5, v6)
    v5:dispatch(v2(true));
    v5:dispatch(v3(v6));
    v5:dispatch(v4(v1.Screens.Error));
end;
