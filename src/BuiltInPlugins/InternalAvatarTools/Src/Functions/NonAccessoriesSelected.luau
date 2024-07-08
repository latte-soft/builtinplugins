local l_Selection_0 = game:GetService("Selection");
return function()
    local v1 = l_Selection_0:Get();
    if v1 then
        for _, v3 in ipairs(v1) do
            if not v3:IsA("Accessory") then
                return true;
            end;
        end;
        return false;
    else
        return false;
    end;
end;
