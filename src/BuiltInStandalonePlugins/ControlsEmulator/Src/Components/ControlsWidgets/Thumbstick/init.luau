local l_script_FirstAncestor_0 = script:FindFirstAncestor("ControlsEmulator");
local v1 = require(l_script_FirstAncestor_0.Src.Util.MousePositionContext);
local v2 = require(l_script_FirstAncestor_0.Src.Util.Constants);
local l_StudioDeviceEmulator_0 = require(l_script_FirstAncestor_0.Src.Util.MockableProxyPluginComponents).StudioDeviceEmulator;
local v4 = require(l_script_FirstAncestor_0.Packages.React);
local l_FAKE_CONNECTED_GAMEPAD_ID_0 = v2.FAKE_CONNECTED_GAMEPAD_ID;
local l_THUMBSTICK_SIZE_0 = v2.THUMBSTICK_SIZE;
local l_THUMBSTICK_SOCKET_SIZE_0 = v2.THUMBSTICK_SOCKET_SIZE;
local v8 = UDim2.new(0, l_THUMBSTICK_SOCKET_SIZE_0 / 2 - l_THUMBSTICK_SIZE_0, 0, l_THUMBSTICK_SOCKET_SIZE_0 / 2 - l_THUMBSTICK_SIZE_0);
return function(v9)
    local v10 = v4.useRef(nil);
    local v11 = v4.useRef(nil);
    local v12 = v4.useRef(0);
    local v13 = v4.useRef(0);
    local v14, v15 = v4.createBinding(v8);
    local l_InputChanged_0 = v4.useContext(v1).InputChanged;
    local l_InputEnded_0 = v4.useContext(v1).InputEnded;
    local function v19(v18)
        return UDim2.new(0, math.clamp(v18.X.Offset, 0 - l_THUMBSTICK_SOCKET_SIZE_0 / 2, l_THUMBSTICK_SOCKET_SIZE_0 / 2) + l_THUMBSTICK_SOCKET_SIZE_0 / 2, 0, math.clamp(v18.Y.Offset, 0 - l_THUMBSTICK_SOCKET_SIZE_0 / 2, l_THUMBSTICK_SOCKET_SIZE_0 / 2) + l_THUMBSTICK_SOCKET_SIZE_0 / 2);
    end;
    local function v21(v20)
        return (Vector3.new(math.clamp((v20.X.Offset / l_THUMBSTICK_SOCKET_SIZE_0) * 2, -1, 1), math.clamp((-v20.Y.Offset / l_THUMBSTICK_SOCKET_SIZE_0) * 2, -1, 1), 0));
    end;
    return v4.createElement("Frame", {
        [v4.Tag] = "Widget-Thumbstick X-Circle data-testid=Widget-Thumbstick", 
        Position = v9.Position, 
        Size = v9.Size
    }, {
        Stick = v4.createElement("Frame", {
            Position = v14:map(v19), 
            [v4.Tag] = "Widget-Thumbstick-Stick X-Circle data-testid=Widget-Thumbstick-Stick", 
            [v4.Event.InputBegan] = function(_, v23)
                if ((((v10.current == nil and l_InputChanged_0 ~= nil) and l_InputEnded_0 ~= nil) and v23.UserInputType == Enum.UserInputType.MouseButton1) and v12.current ~= nil) and v13.current ~= nil then
                    v12.current = v23.Position.X;
                    v13.current = v23.Position.Y;
                    v10.current = l_InputChanged_0:Connect(function(v24)
                        v15(UDim2.new(0, v24.Position.X - v12.current, 0, v24.Position.Y - v13.current));
                        local v25 = v14:map(v21):getValue();
                        pcall(function()
                            l_StudioDeviceEmulator_0:SendGamepadEvent(l_FAKE_CONNECTED_GAMEPAD_ID_0, v9.KeyCode, v25, Vector3.zero);
                        end);
                    end);
                    v11.current = l_InputEnded_0:Connect(function(_)
                        if (v23.UserInputType == Enum.UserInputType.MouseButton1 and v10.current ~= nil) and v11.current ~= nil then
                            v10.current:Disconnect();
                            v10.current = nil;
                            v11.current:Disconnect();
                            v11.current = nil;
                            pcall(function()
                                l_StudioDeviceEmulator_0:SendGamepadEvent(l_FAKE_CONNECTED_GAMEPAD_ID_0, v9.KeyCode, Vector3.zero, Vector3.zero);
                            end);
                            v15(v8);
                        end;
                    end);
                end;
            end
        })
    });
end;
