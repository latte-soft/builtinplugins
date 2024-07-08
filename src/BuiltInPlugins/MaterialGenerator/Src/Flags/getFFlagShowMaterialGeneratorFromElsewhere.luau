game:DefineFastFlag("ShowMaterialGeneratorFromElsewhere", false);
return function()
    return game:GetEngineFeature("MaterialPickerBetaEnabled") or game:GetFastFlag("ShowMaterialGeneratorFromElsewhere");
end;
