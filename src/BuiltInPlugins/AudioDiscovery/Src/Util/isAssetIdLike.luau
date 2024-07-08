return function(v0)
    local v1 = #v0;
    if v1 < 9 then
        return false;
    elseif v1 > 12 then
        return false;
    elseif string.find(v0, "[^" .. string.sub(v0, 1, 1) .. "]") then
        local v2 = 0;
        local v3 = 1;
        while true do
            v3 = string.find(v0, "0", v3, true);
            if v3 then
                v2 = v2 + 1;
                v3 = v3 + 1;
            else
                break;
            end;
        end;
        return v2 / v1 <= 0.5;
    else
        return false;
    end;
end;
