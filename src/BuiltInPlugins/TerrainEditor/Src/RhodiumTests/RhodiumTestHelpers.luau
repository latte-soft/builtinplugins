local l_script_FirstAncestor_0 = script:FindFirstAncestor("TerrainEditor");
local v1 = require(l_script_FirstAncestor_0.Packages.Framework);
local v2 = require(l_script_FirstAncestor_0.Packages.React);
local v3 = require(l_script_FirstAncestor_0.Packages.ReactRoblox);
local v4 = require(l_script_FirstAncestor_0.Packages.Dev.ReactTestingLibrary);
local v5 = require(l_script_FirstAncestor_0.Packages.Dev.Rhodium);
local l_render_0 = v4.render;
local l_screen_0 = v4.screen;
local l_Pane_0 = v1.UI.Pane;
local v9 = require(l_script_FirstAncestor_0.Src.Util.mockContext);
local v10 = require(l_script_FirstAncestor_0.Src.Components.App);
local _ = require(l_script_FirstAncestor_0.Src.Types);
local l_UserInputService_0 = game:GetService("UserInputService");
local l_VirtualInputManager_0 = game:GetService("VirtualInputManager");
local v23 = {
    MountApp = function(v14)
        l_render_0((v9({
            AppContainer = v2.createElement(l_Pane_0, {
                Size = UDim2.new(0, 300, 1, 0)
            }, {
                App = v2.createElement(v10)
            })
        }, v14)));
    end, 
    SelectTab = function(v15)
        v4.fireEvent.click(l_screen_0.getByText((("Studio.Test.Tabs.%*:[]"):format(v15))).Parent.Parent);
    end, 
    SelectTool = function(v16)
        v4.fireEvent.click(l_screen_0.getByText((("Studio.Test.BaseTool.%*:[]"):format(v16))).Parent.Parent);
    end, 
    UseBrush = function(v17, v18)
        v18._options = {
            cycles = 1
        };
        v17.Move:Fire();
        v18:startOperation({
            cycles = 1
        });
    end, 
    UseBrushWithMouse = function(v19, v20)
        v19.Move:Fire();
        v19.Button1Down:Fire();
        v3.act(function()
            v20._operation._budget = nil;
            wait(1);
        end);
        v19.Button1Up:Fire();
    end, 
    GetSettingsContainer = function(v21, v22)
        return l_screen_0.getByText((("Studio.Test.%*.%*:[]"):format(v21, v22))).Parent.Parent.Parent.Property.Content;
    end
};
v23.SetNumber = function(v24, v25, v26)
    v4.fireEvent.change(v23.GetSettingsContainer(v24, v25):FindFirstChildWhichIsA("TextBox", true), {
        target = {
            Text = tostring(v26)
        }
    });
end;
v23.SetVector = function(v27, v28, v29)
    local l_Children_0 = v23.GetSettingsContainer(v27, v28):GetChildren();
    local v31 = {};
    for _, v33 in l_Children_0, nil, nil do
        if v33:IsA("Frame") then
            table.insert(v31, v33:FindFirstChildWhichIsA("TextBox", true));
        end;
    end;
    table.sort(v31, function(v34, v35)
        return v34.LayoutOrder < v35.LayoutOrder;
    end);
    v31[1]:CaptureFocus();
    v4.fireEvent.change(v31[1], {
        target = {
            Text = tostring(v29.X)
        }
    });
    v31[1]:ReleaseFocus();
    v31[2]:CaptureFocus();
    v4.fireEvent.change(v31[2], {
        target = {
            Text = tostring(v29.Y)
        }
    });
    v31[2]:ReleaseFocus();
    v31[3]:CaptureFocus();
    v4.fireEvent.change(v31[3], {
        target = {
            Text = tostring(v29.Z)
        }
    });
    v31[3]:ReleaseFocus();
end;
v23.SetTabbedEnum = function(v36, v37, v38)
    v4.fireEvent.click(v23.GetSettingsContainer(v36, v37):FindFirstChild(v38, true).Contents.TextButton);
end;
v23.ToggleCheckbox = function(v39, v40)
    v4.fireEvent.click((v23.GetSettingsContainer(v39, v40):FindFirstChildWhichIsA("TextButton", true)));
end;
v23.SetMaterial = function(v41, v42, v43)
    for _, v45 in (v23.GetSettingsContainer(v41, v42):FindFirstChildWhichIsA("ScrollingFrame", true)), nil, nil do
        if v45:FindFirstChildWhichIsA("MeshPart").Material == v43 then
            v4.fireEvent.click(v45);
        end;
    end;
end;
v23.ClickButton = function(v46, v47)
    v4.fireEvent.click((l_screen_0.getByText((("Studio.Test.%*.%*:[]"):format(v46, v47)))));
end;
v23.ScrollUp = function()
    v3.act(function()
        v5.VirtualInput.Mouse.SendMouseWheelEvent(350, 150, true);
        l_VirtualInputManager_0:WaitForInputEventsProcessed();
    end);
end;
v23.ScrollDown = function()
    v3.act(function()
        v5.VirtualInput.Mouse.SendMouseWheelEvent(350, 150, false);
        l_VirtualInputManager_0:WaitForInputEventsProcessed();
    end);
end;
v23.ToggleControl = function()
    v3.act(function()
        if not l_UserInputService_0:IsKeyDown(Enum.KeyCode.LeftControl) then
            v5.VirtualInput.Keyboard.pressKey(Enum.KeyCode.LeftControl);
        else
            v5.VirtualInput.Keyboard.releaseKey(Enum.KeyCode.LeftControl);
        end;
        l_VirtualInputManager_0:WaitForInputEventsProcessed();
    end);
end;
v23.ToggleShift = function()
    v3.act(function()
        if not l_UserInputService_0:IsKeyDown(Enum.KeyCode.LeftShift) then
            v5.VirtualInput.Keyboard.pressKey(Enum.KeyCode.LeftShift);
        else
            v5.VirtualInput.Keyboard.releaseKey(Enum.KeyCode.LeftShift);
        end;
        l_VirtualInputManager_0:WaitForInputEventsProcessed();
    end);
end;
v23.ToggleAlt = function()
    v3.act(function()
        if not l_UserInputService_0:IsKeyDown(Enum.KeyCode.LeftAlt) then
            v5.VirtualInput.Keyboard.pressKey(Enum.KeyCode.LeftAlt);
        else
            v5.VirtualInput.Keyboard.releaseKey(Enum.KeyCode.LeftAlt);
        end;
        l_VirtualInputManager_0:WaitForInputEventsProcessed();
    end);
end;
v23.ToggleB = function()
    v3.act(function()
        if not l_UserInputService_0:IsKeyDown(Enum.KeyCode.B) then
            v5.VirtualInput.Keyboard.pressKey(Enum.KeyCode.B);
        else
            v5.VirtualInput.Keyboard.releaseKey(Enum.KeyCode.B);
        end;
        l_VirtualInputManager_0:WaitForInputEventsProcessed();
    end);
end;
v23.HitKey = function(v48)
    v3.act(function()
        v5.VirtualInput.Keyboard.hitKey(v48);
    end);
end;
return v23;
