local l_TextService_0 = game:GetService("TextService");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("AnimationClipEditor");
local l_Math_0 = require(l_script_FirstAncestor_0.Packages.Framework).Util.Math;
local v3 = require(l_script_FirstAncestor_0.Src.Util.Constants);
local v4 = require(l_script_FirstAncestor_0.Src.Util.KeyframeUtils);
local v5 = require(l_script_FirstAncestor_0.LuaFlags.GetFFlagTimelineUnitSeconds);
local v6 = {};
local v7 = Vector2.new(1000000, 50);
v6.getTextWidth = function(v8, v9, v10)
    return l_TextService_0:GetTextSize(v8, v9, v10, v7).X;
end;
v6.split = function(v11, v12)
    local _ = v12 or ":";
    local v14 = {};
    v11:gsub(string.format("([^%s]+)", v12), function(v15)
        v14[#v14 + 1] = v15;
    end);
    return v14;
end;
v6.parseTime = function(v16, v17, v18)
    if not v5() then
        local v19 = v6.split(v16, ":");
        if #v19 == 0 then
            v19 = v6.split(v16, ";");
        end;
        local v20 = {};
        for _, v22 in ipairs(v19) do
            local l_status_0, l_result_0 = pcall(function()
                return (tonumber(v22));
            end);
            if not l_status_0 then
                return 0;
            else
                table.insert(v20, l_result_0);
            end;
        end;
        if #v20 == 1 then
            return (v20[1] * v3.TICK_FREQUENCY) / v17;
        elseif #v20 > 1 then
            return (v20[1] + v20[2] / v17) * v3.TICK_FREQUENCY;
        else
            return nil;
        end;
    elseif v18 == v3.TIMELINE_UNITS.SecondsDecimal then
        local v25 = tonumber(v16);
        if not v25 then
            return nil;
        else
            return v25 * v3.TICK_FREQUENCY;
        end;
    elseif v18 == v3.TIMELINE_UNITS.Frames then
        local v26 = tonumber(v16);
        if not v26 then
            return nil;
        else
            return (v26 * v3.TICK_FREQUENCY) / v17;
        end;
    else
        local v27 = v6.split(v16, ":");
        local v28 = {};
        for _, v30 in ipairs(v27) do
            local v31 = tonumber(v30);
            if not v31 then
                return nil;
            else
                table.insert(v28, v31);
            end;
        end;
        if #v28 == 1 then
            return (v28[1] * v3.TICK_FREQUENCY) / v17;
        elseif #v28 > 1 then
            return (v28[1] + v28[2] / v17) * v3.TICK_FREQUENCY;
        else
            return nil;
        end;
    end;
end;
v6.formatTime = function(v32, v33, v34)
    if v34 == v3.TIMELINE_UNITS.Frames then
        return (tostring((math.floor((v32 * v33) / v3.TICK_FREQUENCY))));
    elseif v34 == v3.TIMELINE_UNITS.Seconds then
        local v35 = v4.getNearestTick((v32 * v33) / v3.TICK_FREQUENCY);
        if v33 == 0 then
            return (tostring("0:" .. string.format("%02d", 0)));
        else
            local v36 = math.floor(v35 / v33);
            return (tostring(v36 .. ":" .. string.format("%02d", v35 - v36 * v33)));
        end;
    elseif v34 == v3.TIMELINE_UNITS.SecondsDecimal then
        return l_Math_0.round(v32 / v3.TICK_FREQUENCY, 2);
    else
        return ;
    end;
end;
v6.formatTime_DEPRECATED = function(v37, v38, v39)
    if v39 then
        local v40 = v4.getNearestTick((v37 * v38) / v3.TICK_FREQUENCY);
        if v38 == 0 then
            return (tostring("0:" .. string.format("%02d", 0)));
        else
            local v41 = math.floor(v40 / v38);
            return (tostring(v41 .. ":" .. string.format("%02d", v40 - v41 * v38)));
        end;
    else
        return (tostring((math.floor((v37 * v38) / v3.TICK_FREQUENCY))));
    end;
end;
v6.formatTimeInSeconds = function(v42, v43)
    if v43 == 0 then
        return (tostring("0s"));
    else
        return (tostring(l_Math_0.round(v42 / v43, 2) .. "s"));
    end;
end;
v6.getMaxTextWidth = function(v44, v45, v46)
    local v47 = 0;
    for _, v49 in ipairs(v44) do
        v47 = math.max(v47, (v6.getTextWidth(v49.Name, v45, v46)));
    end;
    return v47;
end;
return v6;
