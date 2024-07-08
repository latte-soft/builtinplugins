local function v4(v0, v1)
    if v0 == nil then
        return nil;
    else
        for _, v3 in ipairs(v0:GetDescendants()) do
            if not (not (v3:isA("TextLabel") or v3:isA("TextButton")) and not v3:isA("TextBox") or not string.find(v3.Text, v1)) then
                return v3;
            end;
        end;
        return nil;
    end;
end;
local function v5(v6)
    if not v6:IsA("GuiObject") then
        return false;
    elseif v6.Visible then
        if not v6.Parent or not v6.Parent:IsA("GuiObject") then
            return true;
        else
            return v5(v6.Parent);
        end;
    else
        return false;
    end;
end;
return {
    findFirstChildWithText = v4, 
    isVisible = v5
};
