game:DefineFastFlag("RobloxScriptSecurityCanCallEditableImageAPIs", false);
game:DefineFastFlag("AvatarPreviewerSkinToneAlphaDetection", false);
return function()
    return game:GetFastFlag("AvatarPreviewerSkinToneAlphaDetection") and game:GetFastFlag("RobloxScriptSecurityCanCallEditableImageAPIs");
end;
