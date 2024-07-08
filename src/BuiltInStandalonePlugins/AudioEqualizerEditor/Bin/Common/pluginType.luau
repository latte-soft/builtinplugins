local v0 = require(script:FindFirstAncestor("AudioEqualizerEditor").Bin.Common.defineLuaFlags);
return {
    Asset = "Asset", 
    Standalone = "Standalone", 
    get = function()
        if not v0.getFFlagLoadAudioEqualizerEditorInAssetDM() then
            return "Standalone";
        else
            return "Asset";
        end;
    end
};
