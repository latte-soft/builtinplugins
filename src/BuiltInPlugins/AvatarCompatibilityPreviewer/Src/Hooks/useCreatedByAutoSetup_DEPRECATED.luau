local l_script_FirstAncestor_0 = script:FindFirstAncestor("AvatarCompatibilityPreviewer");
local v1 = require(l_script_FirstAncestor_0.Src.Util.Constants);
local _ = require(l_script_FirstAncestor_0.Src.Types);
local v3 = require(l_script_FirstAncestor_0.Src.Hooks.useAttribute);
local v4 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagAvatarPreviewerAutoSetup)();
return function(v5)
    assert(v4, "FFlagAvatarPreviewerAutoSetup is not enabled");
    return not not v3(v5.WorldModel, v1.ATTRIBUTE_PREFIX .. v1.ATTRIBUTE_CREATED_BY_AUTO_SETUP);
end;
