local l_script_FirstAncestor_0 = script:FindFirstAncestor("AvatarCompatibilityPreviewer");
local v1 = require(l_script_FirstAncestor_0.Packages.React);
local _ = require(l_script_FirstAncestor_0.Src.Components.Screens.AvatarScreen.Stages.StageType);
local _ = require(l_script_FirstAncestor_0.Src.Types);
local v4 = require(l_script_FirstAncestor_0.Src.Util.createUnimplemented);
return (v1.createContext({
    openPalette = v4("openPalette"), 
    focusedAttachments = {}, 
    setFocusedAttachments = v4("setFocusedAttachments"), 
    dummyPreviewLocked = false, 
    incrementDummyPreviewLock = v4("incrementDummyPreviewLock"), 
    decrementDummyPreviewLock = v4("decrementDummyPreviewLock"), 
    resetCamera = function()
    end, 
    stage = {}
}));
