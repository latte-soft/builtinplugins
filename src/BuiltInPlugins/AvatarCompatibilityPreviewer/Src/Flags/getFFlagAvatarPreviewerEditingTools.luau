local v0 = require(script:FindFirstAncestor("AvatarCompatibilityPreviewer").Src.Flags.getFFlagAvatarPreviewerCageEditingTools);
game:DefineFastFlag("AvatarPreviewerEditingTools_Dev", false);
return function()
    return game:GetFastFlag("AvatarPreviewerEditingTools_Dev") and v0();
end;
