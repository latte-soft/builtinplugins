local l_script_FirstAncestor_0 = script:FindFirstAncestor("AvatarCompatibilityPreviewer");
local v1 = require(l_script_FirstAncestor_0.Src.Util.Constants);
local _ = require(l_script_FirstAncestor_0.Src.Types);
local v3 = require(l_script_FirstAncestor_0.Src.Hooks.useAttribute);
local _ = require(l_script_FirstAncestor_0.Src.Flags.getFFlagAvatarPreviewerAutoSetup);
local v5 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagAvatarPreviewerAutoSetupDisablePublish);
local v6 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagAvatarPreviewerAutoSetupTelemetryV2);
return function(v7)
    assert(v5() or v6(), "FFlagAvatarPreviewAutoSetupDisablePublish and FFlagAvatarPreviewerAutoSetupTelemetryV2 are not enabled");
    return not not v3(v7, v1.ATTRIBUTE_CREATED_BY_AUTO_SETUP);
end;
