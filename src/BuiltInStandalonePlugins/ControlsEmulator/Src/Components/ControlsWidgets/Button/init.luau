local l_script_FirstAncestor_0 = script:FindFirstAncestor("ControlsEmulator");
local v1 = require(l_script_FirstAncestor_0.Packages.React);
local l_StudioDeviceEmulator_0 = require(l_script_FirstAncestor_0.Src.Util.MockableProxyPluginComponents).StudioDeviceEmulator;
local v3 = require(l_script_FirstAncestor_0.Src.Util.Constants);
local v4 = require(l_script_FirstAncestor_0.Src.Util.MappingsContext);
local v5 = require(l_script_FirstAncestor_0.Src.Util.enumToDisplayKeyCode);
local l_VECTOR_PRESSED_0 = v3.VECTOR_PRESSED;
local l_VECTOR_RELEASED_0 = v3.VECTOR_RELEASED;
return function(v8)
    local v9 = v1.useContext(v4);
    local v10 = v9.Mappings[v8.KeyCode];
    local l_gamepadId_0 = v9.gamepadId;
    return v1.createElement("TextButton", {
        [v1.Tag] = "Widget-Button", 
        Text = v8.Text .. "<" .. v5(v10) .. ">", 
        Position = v8.Position, 
        Size = v8.Size, 
        [v1.Event.Activated] = function()
            pcall(function()
                l_StudioDeviceEmulator_0:SendGamepadEvent(l_gamepadId_0, v8.KeyCode, l_VECTOR_PRESSED_0, Vector3.zero);
            end);
            pcall(function()
                l_StudioDeviceEmulator_0:SendGamepadEvent(l_gamepadId_0, v8.KeyCode, l_VECTOR_RELEASED_0, Vector3.zero);
            end);
        end
    });
end;
