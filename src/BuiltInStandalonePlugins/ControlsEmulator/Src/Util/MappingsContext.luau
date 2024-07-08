return (require(script:FindFirstAncestor("ControlsEmulator").Packages.React).createContext({
    CurrentSelection = nil, 
    Mappings = {}, 
    gamepadId = 0
}));
