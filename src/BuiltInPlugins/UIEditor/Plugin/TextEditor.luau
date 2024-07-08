local v0 = require(script.Parent.CoreGuiManager);
local _ = require(script.Parent.FFlag);
local l_ChangeHistoryService_0 = game:GetService("ChangeHistoryService");
local v3 = nil;
local v4 = nil;
local v5 = nil;
local v6 = nil;
local v7 = "";
local v8 = nil;
local v15 = {
    updateInstance = function(_, v10)
        if v4 then
            if v10.UserInputType == Enum.UserInputType.MouseButton1 and v10.UserInputState == Enum.UserInputState.Begin then
                local _ = Vector2.new(v10.Position.x, v10.Position.y);
            end;
            return ;
        else
            return false;
        end;
    end, 
    finishEditingInstance = function(_)
        v4 = nil;
        if v5 then
            v5:Destroy();
            v5 = nil;
            v6:Destroy();
            v6 = nil;
            v8:disconnect();
            v8 = nil;
        end;
        l_ChangeHistoryService_0:SetWaypoint("Text Changed");
        v3:onTextEditorEnded();
    end, 
    isCurrentlyEditing = function(_)
        return v4 ~= nil;
    end, 
    getCurrentInstance = function(_)
        return v4;
    end
};
local function v18(_, _)
    if v4 then
        v4.Text = v6.Text;
    end;
    v15:finishEditingInstance();
end;
v15.startEditingInstance = function(_, v20)
    v4 = v20;
    local l_AbsolutePosition_0 = v20.AbsolutePosition;
    local l_AbsoluteSize_0 = v20.AbsoluteSize;
    v7 = v20.Text;
    v20.Text = "";
    if not v5 then
        v5 = Instance.new("ScreenGui", v0:findOrCreateFolder("TextEditor"));
        v6 = Instance.new("TextBox");
        v6.Position = UDim2.new(0, l_AbsolutePosition_0.X, 0, l_AbsolutePosition_0.Y);
        v6.Size = UDim2.new(0, l_AbsoluteSize_0.X, 0, l_AbsoluteSize_0.Y);
        v6.BackgroundTransparency = 1;
        v6.BorderSizePixel = 0;
        v6.Font = v4.Font;
        v6.TextColor3 = v4.TextColor3;
        v6.Text = v7;
        v6.TextSize = v4.TextSize;
        v6.TextScaled = v4.TextScaled;
        v6.TextWrapped = v4.TextWrapped;
        v6.TextXAlignment = v4.TextXAlignment;
        v6.TextYAlignment = v4.TextYAlignment;
        v6.Parent = v5;
        v8 = v6.FocusLost:connect(v18);
        v6.ClearTextOnFocus = false;
        v6:CaptureFocus();
    end;
    v3:onTextEditorBegan();
end;
v15.setActionMediator = function(_, v24)
    v3 = v24;
end;
return v15;
