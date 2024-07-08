local l_script_FirstAncestor_0 = script:FindFirstAncestor("CompositorDebugger");
local l_StyleKey_0 = require(l_script_FirstAncestor_0.Packages.Framework).Style.StyleKey;
return {
    BackgroundColor = l_StyleKey_0.SubBackground2, 
    PlayPauseButton = {
        ButtonSize = UDim2.fromOffset(24, 24), 
        Play = "rbxasset://textures/CompositorDebugger/play.png", 
        Pause = "rbxasset://textures/CompositorDebugger/pause.png", 
        Color = l_StyleKey_0.MainText
    }, 
    Tick = {
        Color = l_StyleKey_0.MainTextDisabled, 
        LBorder = {
            TextAlignment = Enum.TextXAlignment.Left, 
            Width = 2, 
            Height = 1
        }, 
        RBorder = {
            TextAlignment = Enum.TextXAlignment.Right, 
            Width = 2, 
            Height = 1
        }, 
        Major = {
            TextAlignment = Enum.TextXAlignment.Left, 
            Width = 1, 
            Height = 0.75
        }, 
        Medium = {
            Width = 1, 
            Height = 0.5
        }, 
        Minor = {
            Width = 1, 
            Height = 0.25
        }
    }, 
    Intervals = require(l_script_FirstAncestor_0.Src.Util.Constants).TIMECONTROLS_INVERVALS, 
    Scrubber = {
        Color = l_StyleKey_0.DialogMainButton, 
        HeadSize = 5
    }, 
    BufferBar = {
        Color = l_StyleKey_0.DialogMainButton, 
        Height = 2
    }
};
