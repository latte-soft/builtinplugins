return {
    asset = "Asset", 
    standalone = "Standalone", 
    get = function()
        if not game:GetFastFlag("LoadAttenuationCurveEditorInAssetDM") then
            return "Standalone";
        else
            return "Asset";
        end;
    end
};
