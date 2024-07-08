local v0 = {};
local v1 = require(script.Parent.CoreGuiManager);
local l_TextService_0 = game:GetService("TextService");
local v3 = Vector2.new(12, 4);
v0.getSize = function(v4)
    return v4.m_imageLabel.Size;
end;
v0.setPosition = function(v5, v6)
    v5.m_imageLabel.Position = v6;
end;
v0.setAnchorPoint = function(v7, v8)
    v7.m_imageLabel.AnchorPoint = v8;
end;
local function _(v9)
    return l_TextService_0:GetTextSize(v9.Text, v9.TextSize, v9.Font, Vector2.new(0, 0));
end;
v0.setText = function(v11, v12)
    local v13 = v1:findOrCreateScreenGui("ValueBoxes");
    v11.m_textLabel.Text = v12;
    v11.m_textLabel.TextSize = math.clamp(0.025 * v13.AbsoluteSize.Y, 12, 15);
    local l_m_textLabel_0 = v11.m_textLabel;
    local l_l_TextService_0_TextSize_0 = l_TextService_0:GetTextSize(l_m_textLabel_0.Text, l_m_textLabel_0.TextSize, l_m_textLabel_0.Font, Vector2.new(0, 0));
    l_m_textLabel_0 = math.clamp(0.008571428571428572 * v13.AbsoluteSize.X, 0, v3.X);
    local v16 = (l_m_textLabel_0 / v3.X) * v3.Y;
    v11.m_textLabel.Size = UDim2.new(0, l_l_TextService_0_TextSize_0.X, 0, l_l_TextService_0_TextSize_0.Y);
    v11.m_imageLabel.Size = UDim2.new(0, l_l_TextService_0_TextSize_0.X + 2 * l_m_textLabel_0, 0, l_l_TextService_0_TextSize_0.Y + 2 * v16);
end;
v0.setVisible = function(v17, v18)
    v17.m_imageLabel.Visible = v18;
    v17.m_textLabel.Visible = v18;
end;
local function v21()
    local l_ImageLabel_0 = Instance.new("ImageLabel");
    l_ImageLabel_0.Name = "UIEditorValueBoxImageLabel";
    local v20 = v1:findOrCreateScreenGui("ValueBoxes");
    v20.DisplayOrder = 1;
    l_ImageLabel_0.Parent = v20;
    l_ImageLabel_0.BackgroundTransparency = 1;
    l_ImageLabel_0.Image = "rbxasset://textures/StudioUIEditor/valueBoxRoundedRectangle.png";
    l_ImageLabel_0.ImageColor3 = Color3.fromRGB(255, 205, 0);
    l_ImageLabel_0.ScaleType = Enum.ScaleType.Slice;
    l_ImageLabel_0.SliceCenter = Rect.new(3, 3, 13, 13);
    return l_ImageLabel_0;
end;
local function v23()
    local l_TextLabel_0 = Instance.new("TextLabel");
    l_TextLabel_0.Name = "UIEditorValueBoxTexLabel";
    l_TextLabel_0.TextColor3 = Color3.new(0, 0, 0);
    l_TextLabel_0.BackgroundColor3 = Color3.fromRGB(118, 118, 118);
    l_TextLabel_0.BackgroundTransparency = 1;
    l_TextLabel_0.BorderSizePixel = 0;
    l_TextLabel_0.Font = Enum.Font.SourceSans;
    l_TextLabel_0.TextXAlignment = Enum.TextXAlignment.Center;
    l_TextLabel_0.TextYAlignment = Enum.TextYAlignment.Center;
    l_TextLabel_0.TextSize = 15;
    l_TextLabel_0.AnchorPoint = Vector2.new(0.5, 0.5);
    l_TextLabel_0.Position = UDim2.new(0.5, 0, 0.5, -2);
    return l_TextLabel_0;
end;
v0.new = function(v24)
    local v25 = {
        m_imageLabel = v21()
    };
    if v24 ~= nil then
        v25.m_imageLabel.Parent = v24;
    end;
    v25.m_textLabel = v23();
    v25.m_textLabel.Parent = v25.m_imageLabel;
    return (setmetatable(v25, v0));
end;
v0.__index = v0;
v0.Destroy = function(v26)
    v26.m_imageLabel:Destroy();
end;
return v0;
