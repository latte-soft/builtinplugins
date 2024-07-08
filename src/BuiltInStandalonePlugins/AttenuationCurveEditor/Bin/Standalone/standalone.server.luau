local l_script_FirstAncestor_0 = script:FindFirstAncestor("AttenuationCurveEditor");
require(l_script_FirstAncestor_0.Bin.Common.defineLuaFlags);
if game:GetFastFlag("EnableDistanceAttenuationCurveEditorLua") then
    local v1 = require(l_script_FirstAncestor_0.Packages.TestLoader);
    v1.launch("AttenuationCurveEditor", l_script_FirstAncestor_0.Src);
    if not v1.isCli() then
        local v2 = require(l_script_FirstAncestor_0.Bin.Common.pluginType);
        if v2.get() ~= v2.standalone then
            return ;
        else
            require(l_script_FirstAncestor_0.Bin.Common.setup)(plugin, (require(l_script_FirstAncestor_0.Bin.Common.setupMain)));
            return ;
        end;
    else
        return ;
    end;
else
    return ;
end;
