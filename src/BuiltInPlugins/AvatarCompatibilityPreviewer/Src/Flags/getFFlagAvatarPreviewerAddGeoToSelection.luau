local v0 = require(script:FindFirstAncestor("AvatarCompatibilityPreviewer").Src.Flags.getFFlagAvatarPreviewerAutoSetup);
game:DefineFastFlag("AvatarPreviewerAddGeoToSelection", false);
return function()
    return game:GetFastFlag("AvatarPreviewerAddGeoToSelection") and v0();
end;
