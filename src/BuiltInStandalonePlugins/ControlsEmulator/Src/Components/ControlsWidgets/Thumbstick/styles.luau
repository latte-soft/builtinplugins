local l_script_FirstAncestor_0 = script:FindFirstAncestor("ControlsEmulator");
local l_createStyleRule_0 = require(l_script_FirstAncestor_0.Packages.Framework).Styling.createStyleRule;
local v2 = require(l_script_FirstAncestor_0.Src.Util.Constants);
local l_THUMBSTICK_SIZE_0 = v2.THUMBSTICK_SIZE;
local l_THUMBSTICK_SOCKET_SIZE_0 = v2.THUMBSTICK_SOCKET_SIZE;
return l_createStyleRule_0(".Widget-Thumbstick", {
    Size = UDim2.new(0, l_THUMBSTICK_SOCKET_SIZE_0, 0, l_THUMBSTICK_SOCKET_SIZE_0), 
    BackgroundColor3 = "$ForegroundMuted"
}, {
    l_createStyleRule_0("> .Widget-Thumbstick-Stick", {
        BackgroundColor3 = "$Foreground", 
        Size = UDim2.new(0, l_THUMBSTICK_SIZE_0, 0, l_THUMBSTICK_SIZE_0), 
        Position = UDim2.new(0.5, 0, 0.5, 0), 
        AnchorPoint = Vector2.new(0.5, 0.5)
    })
});
