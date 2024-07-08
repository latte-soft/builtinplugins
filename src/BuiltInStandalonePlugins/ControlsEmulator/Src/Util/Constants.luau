return {
    FAKE_CONNECTED_GAMEPAD_ID = 101, 
    NO_CONNECTED_GAMEPAD_ID = 0, 
    THUMBSTICK_SIZE = 36, 
    THUMBSTICK_SOCKET_SIZE = 72, 
    AVAILABLE_MAPPINGS = {
        Enum.KeyCode.Thumbstick1, 
        Enum.KeyCode.Thumbstick2, 
        Enum.KeyCode.DPadUp, 
        Enum.KeyCode.DPadLeft, 
        Enum.KeyCode.DPadRight, 
        Enum.KeyCode.DPadDown, 
        Enum.KeyCode.ButtonX, 
        Enum.KeyCode.ButtonY, 
        Enum.KeyCode.ButtonB, 
        Enum.KeyCode.ButtonA, 
        Enum.KeyCode.ButtonL1, 
        Enum.KeyCode.ButtonR1, 
        Enum.KeyCode.ButtonL2, 
        Enum.KeyCode.ButtonR2, 
        Enum.KeyCode.ButtonL3, 
        Enum.KeyCode.ButtonR3, 
        Enum.KeyCode.ButtonStart, 
        Enum.KeyCode.ButtonSelect
    }, 
    VECTOR_PRESSED = Vector3.new(0, 0, 1), 
    VECTOR_RELEASED = Vector3.zero, 
    DEFAULT_MOUSE_POSITION_CONTEXT_STATE = {
        InputChanged = nil, 
        InputEnded = nil
    }
};
