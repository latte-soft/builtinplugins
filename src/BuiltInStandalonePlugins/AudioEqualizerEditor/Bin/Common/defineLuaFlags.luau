game:DefineFastFlag("EnableAudioEqualizerEditor", false);
game:DefineFastInt("AudioEqualizerEditorAnalyzerResolution", 100);
game:DefineFastFlag("LoadAudioEqualizerEditorInAssetDM", false);
game:DefineFastFlag("Path2DControlPointAtomicClass4", false);
game:DefineFastFlag("Path2DEnabled15", false);
game:DefineFastInt("Path2DMaxControlPointLimit", 50);
return {
    getFFlagEnableAudioEqualizerEditor = function()
        return game:GetFastFlag("EnableAudioEqualizerEditor");
    end, 
    getFIntAudioEqualizerEditorAnalyzerResolution = function()
        return game:GetFastInt("AudioEqualizerEditorAnalyzerResolution");
    end, 
    getFFlagLoadAudioEqualizerEditorInAssetDM = function()
        return game:GetFastFlag("LoadAudioEqualizerEditorInAssetDM");
    end, 
    getFFlagPath2DEnabled = function()
        return game:GetFastFlag("Path2DControlPointAtomicClass4") and game:GetFastFlag("Path2DEnabled15");
    end, 
    getFIntPath2DMaxControlPointLimit = function()
        return game:GetFastInt("Path2DMaxControlPointLimit");
    end
};
