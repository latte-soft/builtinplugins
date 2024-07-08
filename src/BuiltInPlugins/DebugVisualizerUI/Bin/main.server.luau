game:DefineFastFlag("ShowDebugVisualizerUI", false);
if game:GetFastFlag("ShowDebugVisualizerUI") then
    local v0 = nil;
    local v1 = require(script.Parent.Parent.Src.tr);
    local function v2()
        if not settings().Physics.AreTimestepsShown then
            v0.Parent = nil;
            return ;
        else
            v0.Parent = game:GetService("CoreGui");
            return ;
        end;
    end;
    local function v9(v3, v4)
        local l_Frame_0 = Instance.new("Frame");
        l_Frame_0.Size = UDim2.new(1, 0, 0, 15);
        l_Frame_0.BackgroundTransparency = 1;
        local l_UIListLayout_0 = Instance.new("UIListLayout");
        l_UIListLayout_0.Parent = l_Frame_0;
        l_UIListLayout_0.FillDirection = "Horizontal";
        l_UIListLayout_0.HorizontalAlignment = "Center";
        l_UIListLayout_0.VerticalAlignment = "Center";
        local l_Frame_1 = Instance.new("Frame");
        l_Frame_1.Size = UDim2.new(0, 15, 0, 15);
        l_Frame_1.Parent = l_Frame_0;
        l_Frame_1.BackgroundColor3 = v3;
        l_Frame_1.BorderSizePixel = 0;
        local l_TextLabel_0 = Instance.new("TextLabel");
        l_TextLabel_0.Text = v4;
        l_TextLabel_0.Parent = l_Frame_0;
        l_TextLabel_0.Size = UDim2.new(1, -15, 0, 15);
        l_TextLabel_0.BackgroundTransparency = 1;
        l_TextLabel_0.TextColor3 = Color3.new(1, 1, 1);
        return l_Frame_0;
    end;
    local function v16()
        v0 = Instance.new("ScreenGui");
        v0.Name = "AdaptiveTimeSteppingLegend";
        v0.Enabled = true;
        local l_Frame_2 = Instance.new("Frame");
        l_Frame_2.Parent = v0;
        l_Frame_2.Size = UDim2.new(0, 120, 0, 80);
        l_Frame_2.Position = UDim2.new(0, 0, 0, 0);
        l_Frame_2.BackgroundColor3 = Color3.new(0, 0, 0);
        local l_TextLabel_1 = Instance.new("TextLabel");
        l_TextLabel_1.Parent = l_Frame_2;
        l_TextLabel_1.Size = UDim2.new(1, 0, 0, 25);
        l_TextLabel_1.TextColor3 = Color3.new(1, 1, 1);
        l_TextLabel_1.Text = v1("Studio.DebugVisualizerUI.AdaptiveTimesteppingLegend.LegendLabel");
        l_TextLabel_1.BackgroundTransparency = 1;
        l_TextLabel_1.LayoutOrder = 0;
        local l_UIListLayout_1 = Instance.new("UIListLayout");
        l_UIListLayout_1.Parent = l_Frame_2;
        l_UIListLayout_1.FillDirection = "Vertical";
        l_UIListLayout_1.HorizontalAlignment = "Center";
        l_UIListLayout_1.VerticalAlignment = "Center";
        l_UIListLayout_1.SortOrder = "LayoutOrder";
        local v13 = v9(Color3.new(255, 0, 0), "240hz");
        v13.Parent = l_Frame_2;
        v13.LayoutOrder = 1;
        local v14 = v9(Color3.fromRGB(255, 198, 0), "120hz");
        v14.Parent = l_Frame_2;
        v14.LayoutOrder = 2;
        local v15 = v9(Color3.fromRGB(64, 166, 81), "60hz");
        v15.Parent = l_Frame_2;
        v15.LayoutOrder = 3;
        plugin.Name = "DebugVisualizerUI";
    end;
    plugin.Unloading:Connect(function()
        v0.Parent = nil;
    end);
    settings().Physics:GetPropertyChangedSignal("AreTimestepsShown"):Connect(v2);
    v16();
    if not settings().Physics.AreTimestepsShown then
        v0.Parent = nil;
    else
        v0.Parent = game:GetService("CoreGui");
    end;
    return ;
else
    return ;
end;
