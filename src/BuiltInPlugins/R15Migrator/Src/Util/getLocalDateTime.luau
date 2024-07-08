local _ = require(script:FindFirstAncestor("R15Migrator").Src.Types);
return function(v1)
    local function _(v2)
        if v2 == 0 then
            return 12;
        elseif v2 > 12 then
            return v2 - 12;
        else
            return v2;
        end;
    end;
    local v4 = v1:ToLocalTime();
    local v5 = {
        year = tostring(v4.Year), 
        month = tostring(v4.Month), 
        day = tostring(v4.Day)
    };
    local l_Hour_0 = v4.Hour;
    v5.hour = tostring(l_Hour_0 == 0 and 12 or if l_Hour_0 > 12 then l_Hour_0 - 12 else l_Hour_0);
    v5.isPm = v4.Hour >= 12;
    v5.minute = if v4.Minute < 10 then "0" .. tostring(v4.Minute) else tostring(v4.Minute);
    return v5;
end;
