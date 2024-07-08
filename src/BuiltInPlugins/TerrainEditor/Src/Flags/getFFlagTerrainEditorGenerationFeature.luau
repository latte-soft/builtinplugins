local _ = script:FindFirstAncestor("TerrainEditor");
game:DefineFastFlag("TerrainEditorGenerationFeature3", false);
return function()
    return game:GetFastFlag("TerrainEditorGenerationFeature3") and game:GetFastFlag("DevFrameworkFormSubsetting");
end;
