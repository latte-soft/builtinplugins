local function v0(v1)
    if v1 and v1.Parent then
        if v1.Parent:IsA("ScreenGui") and v1.Parent.Enabled == true then
            return true;
        elseif v1.Parent:IsA("GuiObject") and v1.Parent.Visible == true then
            return v0(v1.Parent);
        elseif not v1.Parent:IsA("Folder") then
            return false;
        else
            return v0(v1.Parent);
        end;
    else
        return false;
    end;
end;
return {
    isVisible = function(_, v3, _)
        if v3:IsA("GuiObject") then
            if v3.Visible then
                if v0(v3) then
                    if v3.BackgroundTransparency >= 1 then
                        if not v3:IsA("ImageLabel") and not v3:IsA("ImageButton") then
                            if not v3:IsA("TextLabel") and not v3:IsA("TextButton") then
                                return false;
                            else
                                local v5 = false;
                                if v3.Text ~= "" then
                                    v5 = v3.TextTransparency < 1;
                                end;
                                return v5;
                            end;
                        else
                            local v6 = false;
                            if v3.Image ~= "" then
                                v6 = v3.ImageTransparency < 1;
                            end;
                            return v6;
                        end;
                    else
                        return true;
                    end;
                else
                    return false;
                end;
            else
                return false;
            end;
        else
            return false;
        end;
    end, 
    canSeeThrough = function(_, v8)
        if ((not v8:IsA("GuiObject") or not v8.Visible) or not v0(v8)) or v8.BackgroundTransparency > 0 then
            return true;
        else
            return false;
        end;
    end
};
