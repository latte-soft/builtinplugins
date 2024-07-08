local v0 = require(script.Parent.TimeConstants);
local l_ELAPSED_TIME_TRANSLATION_SCOPE_0 = v0.ELAPSED_TIME_TRANSLATION_SCOPE;
local function v4(v2)
    if v2 then
        local v3 = DateTime.now().UnixTimestamp - v2;
        if v3 < v0.MINUTE_IN_SECONDS then
            return {
                scope = l_ELAPSED_TIME_TRANSLATION_SCOPE_0, 
                key = "Now"
            };
        elseif v3 < v0.HOUR_IN_SECONDS then
            return {
                scope = l_ELAPSED_TIME_TRANSLATION_SCOPE_0, 
                key = "Minutes", 
                paramName = "minutes", 
                paramValue = tostring((math.floor(v3 / v0.MINUTE_IN_SECONDS)))
            };
        elseif v3 < v0.DAY_IN_SECONDS then
            return {
                scope = l_ELAPSED_TIME_TRANSLATION_SCOPE_0, 
                key = "Hours", 
                paramName = "hours", 
                paramValue = tostring((math.floor(v3 / v0.HOUR_IN_SECONDS)))
            };
        elseif v3 < v0.WEEK_IN_SECONDS then
            return {
                scope = l_ELAPSED_TIME_TRANSLATION_SCOPE_0, 
                key = "Days", 
                paramName = "days", 
                paramValue = tostring((math.floor(v3 / v0.DAY_IN_SECONDS)))
            };
        elseif v3 < v0.MONTH_IN_SECONDS then
            return {
                scope = l_ELAPSED_TIME_TRANSLATION_SCOPE_0, 
                key = "Weeks", 
                paramName = "weeks", 
                paramValue = tostring((math.floor(v3 / v0.WEEK_IN_SECONDS)))
            };
        elseif v3 < v0.YEAR_IN_SECONDS then
            return {
                scope = l_ELAPSED_TIME_TRANSLATION_SCOPE_0, 
                key = "Months", 
                paramName = "months", 
                paramValue = tostring((math.floor(v3 / v0.MONTH_IN_SECONDS)))
            };
        else
            return {
                scope = l_ELAPSED_TIME_TRANSLATION_SCOPE_0, 
                key = "Years", 
                paramName = "years", 
                paramValue = tostring((math.floor(v3 / v0.YEAR_IN_SECONDS)))
            };
        end;
    else
        return {
            scope = "", 
            key = ""
        };
    end;
end;
local v5 = v0.MINUTE_IN_SECONDS * v0.SECONDS_IN_MS;
local v6 = v0.HOUR_IN_SECONDS * v0.SECONDS_IN_MS;
return {
    calculateRelativeTime = v4, 
    getRefreshIntervalInMS = function(v7)
        if v7 then
            local v8 = DateTime.now().UnixTimestamp - v7;
            if v8 < v0.HOUR_IN_SECONDS then
                return v5;
            elseif v8 < v0.DAY_IN_SECONDS then
                return v6;
            else
                return nil;
            end;
        else
            return nil;
        end;
    end
};
