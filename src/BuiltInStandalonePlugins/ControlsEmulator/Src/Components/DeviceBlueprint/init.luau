local l_script_FirstAncestor_0 = script:FindFirstAncestor("ControlsEmulator");
local v1 = require(l_script_FirstAncestor_0.Packages.React);
local l_Localization_0 = require(l_script_FirstAncestor_0.Packages.Framework).ContextServices.Localization;
local v3 = require(l_script_FirstAncestor_0.Src.Components.ControlsWidgets.Button);
local v4 = require(l_script_FirstAncestor_0.Src.Components.ControlsWidgets.Thumbstick);
local v5 = require(l_script_FirstAncestor_0.Src.Util.Constants);
local v6 = require(l_script_FirstAncestor_0.Src.Util.MappingsActionsContext);
local v7 = require(l_script_FirstAncestor_0.Src.Util.MappingsContext);
return function(v8)
    local _ = l_Localization_0:use();
    local _ = v1.useContext(v6);
    local l_gamepadId_0 = v1.useContext(v7).gamepadId;
    local l_createElement_0 = v1.createElement;
    local v13 = "Frame";
    local v14 = {
        [v1.Tag] = "Component-DeviceBlueprint X-Fit", 
        LayoutOrder = v8.LayoutOrder
    };
    local v15 = {};
    local v16 = false;
    if l_gamepadId_0 ~= v5.NO_CONNECTED_GAMEPAD_ID then
        v16 = v1.createElement("Frame", {
            Size = UDim2.new(0, 360, 0, 240)
        }, {
            ThumbstickLeft = v1.createElement(v4, {
                Position = UDim2.new(0.5, -72, 0.5, -72), 
                KeyCode = Enum.KeyCode.Thumbstick1
            }), 
            ThumbstickRight = v1.createElement(v4, {
                Position = UDim2.new(0.5, 36, 0.5, -72), 
                KeyCode = Enum.KeyCode.Thumbstick2
            }), 
            ArrowUp = v1.createElement(v3, {
                Text = "\226\134\145", 
                Position = UDim2.new(0, 54, 0.5, -36), 
                KeyCode = Enum.KeyCode.DPadUp
            }), 
            ArrowLeft = v1.createElement(v3, {
                Text = "\226\134\144", 
                Position = UDim2.new(0, 18, 0.5, 0), 
                KeyCode = Enum.KeyCode.DPadLeft
            }), 
            ArrowRight = v1.createElement(v3, {
                Text = "\226\134\146", 
                Position = UDim2.new(0, 90, 0.5, 0), 
                KeyCode = Enum.KeyCode.DPadRight
            }), 
            ArrowDown = v1.createElement(v3, {
                Text = "\226\134\147", 
                Position = UDim2.new(0, 54, 0.5, 36), 
                KeyCode = Enum.KeyCode.DPadDown
            }), 
            ButtonX = v1.createElement(v3, {
                Text = "X", 
                Position = UDim2.new(1, -108, 0.5, 0), 
                KeyCode = Enum.KeyCode.ButtonX
            }), 
            ButtonY = v1.createElement(v3, {
                Text = "Y", 
                Position = UDim2.new(1, -72, 0.5, -36), 
                KeyCode = Enum.KeyCode.ButtonY
            }), 
            ButtonB = v1.createElement(v3, {
                Text = "B", 
                Position = UDim2.new(1, -36, 0.5, 0), 
                KeyCode = Enum.KeyCode.ButtonB
            }), 
            ButtonA = v1.createElement(v3, {
                Text = "A", 
                Position = UDim2.new(1, -72, 0.5, 36), 
                KeyCode = Enum.KeyCode.ButtonA
            }), 
            Start = v1.createElement(v3, {
                Text = "\226\137\161", 
                Position = UDim2.new(0.5, 36, 1, -36), 
                Size = UDim2.new(0, 54, 0, 24), 
                KeyCode = Enum.KeyCode.ButtonStart
            }), 
            Select = v1.createElement(v3, {
                Text = "Select", 
                Position = UDim2.new(0.5, -54, 1, -36), 
                Size = UDim2.new(0, 54, 0, 24), 
                KeyCode = Enum.KeyCode.ButtonSelect
            })
        });
    end;
    v15.ControllerLayout = v16;
    return l_createElement_0(v13, v14, v15);
end;
