local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Roact);
local v2 = require(l_Parent_0.Packages.Framework);
local l_ContextServices_0 = v2.ContextServices;
local l_Pane_0 = v2.UI.Pane;
local l_UserInputService_0 = game:GetService("UserInputService");
local v6 = {
    [Enum.KeyCode.ButtonX] = "rbxasset://textures/ui/Controls/xboxX.png", 
    [Enum.KeyCode.ButtonY] = "rbxasset://textures/ui/Controls/xboxY.png", 
    [Enum.KeyCode.ButtonA] = "rbxasset://textures/ui/Controls/xboxA.png", 
    [Enum.KeyCode.ButtonB] = "rbxasset://textures/ui/Controls/xboxB.png", 
    [Enum.KeyCode.ButtonSelect] = "rbxasset://textures/ui/Controls/xboxmenu.png", 
    [Enum.KeyCode.ButtonL1] = "rbxasset://textures/ui/Controls/xboxLS.png", 
    [Enum.KeyCode.ButtonR1] = "rbxasset://textures/ui/Controls/xboxRS.png"
};
local v7 = UDim2.fromOffset(28, 28);
local v8 = {
    [Enum.KeyCode.DPadLeft] = "rbxasset://textures/ui/Controls/dpadLeft.png", 
    [Enum.KeyCode.DPadRight] = "rbxasset://textures/ui/Controls/dpadRight.png", 
    [Enum.KeyCode.DPadUp] = "rbxasset://textures/ui/Controls/dpadUp.png", 
    [Enum.KeyCode.DPadDown] = "rbxasset://textures/ui/Controls/dpadDown.png"
};
local v9 = UDim2.fromOffset(30, 30);
local v10 = {
    [Enum.KeyCode.Backspace] = "rbxasset://textures/ui/Controls/backspace.png", 
    [Enum.KeyCode.Return] = "rbxasset://textures/ui/Controls/return.png", 
    [Enum.KeyCode.LeftShift] = "rbxasset://textures/ui/Controls/shift.png", 
    [Enum.KeyCode.RightShift] = "rbxasset://textures/ui/Controls/shift.png", 
    [Enum.KeyCode.Tab] = "rbxasset://textures/ui/Controls/tab.png"
};
local v11 = UDim2.fromOffset(45, 45);
local v12 = {
    ["'"] = "rbxasset://textures/ui/Controls/apostrophe.png", 
    [","] = "rbxasset://textures/ui/Controls/comma.png", 
    ["`"] = "rbxasset://textures/ui/Controls/graveaccent.png", 
    ["."] = "rbxasset://textures/ui/Controls/period.png", 
    [" "] = "rbxasset://textures/ui/Controls/spacebar.png"
};
local v13 = {
    [Enum.KeyCode.LeftControl] = "Ctrl", 
    [Enum.KeyCode.RightControl] = "Ctrl", 
    [Enum.KeyCode.LeftAlt] = "Alt", 
    [Enum.KeyCode.RightAlt] = "Alt", 
    [Enum.KeyCode.F1] = "F1", 
    [Enum.KeyCode.F2] = "F2", 
    [Enum.KeyCode.F3] = "F3", 
    [Enum.KeyCode.F4] = "F4", 
    [Enum.KeyCode.F5] = "F5", 
    [Enum.KeyCode.F6] = "F6", 
    [Enum.KeyCode.F7] = "F7", 
    [Enum.KeyCode.F8] = "F8", 
    [Enum.KeyCode.F9] = "F9", 
    [Enum.KeyCode.F10] = "F10", 
    [Enum.KeyCode.F11] = "F11", 
    [Enum.KeyCode.F12] = "F12"
};
local v14 = v1.PureComponent:extend("KeyBarTile");
v14.init = function(_, v16)
    assert(v16.KeyCode ~= nil);
end;
v14.render = function(v17)
    local l_props_0 = v17.props;
    local l_Stylizer_0 = l_props_0.Stylizer;
    local l_KeyCode_0 = l_props_0.KeyCode;
    local v21 = nil;
    local l_l_UserInputService_0_StringForKeyCode_0 = l_UserInputService_0:GetStringForKeyCode(l_KeyCode_0);
    v21 = v10[l_KeyCode_0];
    local l_v11_0 = v11;
    if v21 == nil then
        v21 = v12[l_l_UserInputService_0_StringForKeyCode_0];
    end;
    if v21 == nil then
        v21 = v8[l_KeyCode_0];
        l_v11_0 = v9;
    end;
    if v21 == nil then
        v21 = v6[l_KeyCode_0];
        l_v11_0 = v7;
    end;
    local v24 = v13[l_KeyCode_0];
    if v24 then
        l_l_UserInputService_0_StringForKeyCode_0 = v24;
    end;
    if not l_l_UserInputService_0_StringForKeyCode_0 or string.len(l_l_UserInputService_0_StringForKeyCode_0) == 0 then
        l_l_UserInputService_0_StringForKeyCode_0 = l_KeyCode_0.Name;
    end;
    if not v21 then
        return v1.createElement(l_Pane_0, {
            Style = "KeyTileBox", 
            Size = l_props_0.Size, 
            BackgroundTransparency = l_props_0.BackgroundTransparency, 
            LayoutOrder = l_props_0.LayoutOrder
        }, {
            TextLabel = v1.createElement("TextLabel", {
                Text = l_l_UserInputService_0_StringForKeyCode_0, 
                Position = UDim2.fromScale(0, 0), 
                Size = UDim2.fromScale(1, 1), 
                TextScaled = true, 
                Font = Enum.Font.SourceSansBold, 
                TextSize = 25, 
                TextColor3 = l_Stylizer_0.TextColor, 
                BackgroundTransparency = 1, 
                BorderSizePixel = 0, 
                TextTransparency = l_props_0.ForegroundTransparency
            }, {
                SizeConstraint = v1.createElement("UITextSizeConstraint", {
                    MaxTextSize = 25, 
                    MinTextSize = 5
                })
            })
        });
    else
        return v1.createElement(l_Pane_0, {
            Style = "KeyTileBox", 
            Size = l_props_0.Size, 
            BackgroundTransparency = l_props_0.BackgroundTransparency, 
            LayoutOrder = l_props_0.LayoutOrder
        }, {
            Image = v1.createElement("ImageLabel", {
                Image = v21, 
                AnchorPoint = Vector2.new(0.5, 0.5), 
                Position = UDim2.fromScale(0.5, 0.5), 
                BackgroundTransparency = 1, 
                Size = l_v11_0, 
                ImageTransparency = l_props_0.ForegroundTransparency
            })
        });
    end;
end;
return (l_ContextServices_0.withContext({
    Stylizer = l_ContextServices_0.Stylizer
})(v14));
