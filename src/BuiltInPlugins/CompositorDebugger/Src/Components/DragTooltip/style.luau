return {
    Padding = 5, 
    MaxWidth = 200, 
    ShowDelay = 0.3, 
    Offset = Vector2.new(10, 5), 
    DropShadow = {
        Color = require(script:FindFirstAncestor("CompositorDebugger").Packages.Framework).Style.StyleKey.Border, 
        Image = "rbxasset://textures/StudioSharedUI/dropShadow.png", 
        ImageSize = 16, 
        Offset = Vector2.new(), 
        Radius = 3, 
        Transparency = 0
    }
};
