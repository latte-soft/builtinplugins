local l_script_FirstAncestor_0 = script:FindFirstAncestor("AvatarCompatibilityPreviewer");
local v1 = require(l_script_FirstAncestor_0.Packages.React);
local _ = require(l_script_FirstAncestor_0.Src.Components.Screens.AvatarScreen.Stages.StageType);
local v3 = require(l_script_FirstAncestor_0.Src.Components.TestingInterfaceContext);
local _ = require(l_script_FirstAncestor_0.Src.Types);
local v5 = require(l_script_FirstAncestor_0.Src.Util.createUnimplemented);
local v6 = require(l_script_FirstAncestor_0.Src.Util.skinToneAvailableAsync);
local v7 = require(l_script_FirstAncestor_0.Src.Hooks.useAsync);
local v8 = require(l_script_FirstAncestor_0.Src.Hooks.useIncrementedState);
local v9 = v1.createContext({
    openPalette = v5("openPalette"), 
    focusedAttachments = {}, 
    setFocusedAttachments = v5("setFocusedAttachments"), 
    dummyPreviewLocked = false, 
    incrementDummyPreviewLock = v5("incrementDummyPreviewLock"), 
    decrementDummyPreviewLock = v5("decrementDummyPreviewLock"), 
    resetCamera = function()
    end, 
    stage = {}, 
    isColorable = true
});
return {
    Context = v9, 
    Provider = function(v10)
        local v11 = v1.useContext(v3.Context);
        local v12, v13 = v1.useState({});
        local v14 = v8();
        local v16 = v7(function()
            local v15 = v6(v10.selectedAvatar);
            if v11.onIsColorableAcquired ~= nil then
                task.defer(function()
                    v11.onIsColorableAcquired:Fire();
                end);
            end;
            return v15;
        end, {
            v10.selectedAvatar, 
            v11.onIsColorableAcquired
        });
        return v1.createElement(v9.Provider, {
            value = {
                openPalette = v10.openPalette, 
                focusedAttachments = v12, 
                setFocusedAttachments = v13, 
                dummyPreviewLocked = v14.amount > 0, 
                incrementDummyPreviewLock = v14.increment, 
                decrementDummyPreviewLock = v14.decrement, 
                resetCamera = v10.resetCamera, 
                stage = v10.stage, 
                isColorable = not (v16.state == "ok") or v16.value
            }
        }, v10.children);
    end
};
