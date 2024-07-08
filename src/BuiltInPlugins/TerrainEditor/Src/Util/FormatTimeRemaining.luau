return function(v0, v1)
    local v2 = math.floor(v0 / 60);
    local v3 = math.floor(v2 / 60);
    if v3 > 0 then
        return v1:getText("Time", "HoursAndMinutes", {
            Hours = v3, 
            Minutes = v2 % 60
        });
    elseif v2 > 10 then
        return v1:getText("Time", "Minutes", {
            Minutes = v2
        });
    elseif v2 >= 1 then
        return v1:getText("Time", "MinutesAndSeconds", {
            Minutes = v2, 
            Seconds = (math.floor(v0 / 10) * 10) % 60
        });
    else
        return v1:getText("Time", "Seconds", {
            Seconds = v0
        });
    end;
end;
