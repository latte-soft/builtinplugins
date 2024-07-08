return function(v0)
    local v1 = tonumber(v0);
    if not v1 then
        local v2 = v0:gsub("%s+", ""):split(",");
        if #v2 == 3 then
            return Color3.fromRGB(tonumber(v2[1]), tonumber(v2[2]), (tonumber(v2[3])));
        else
            local l_status_0, l_result_0 = pcall(function()
                return Color3.fromHex(v0);
            end);
            if not l_status_0 or not l_result_0 then
                return nil;
            else
                return l_result_0;
            end;
        end;
    else
        v1 = math.clamp(v1, 0, 255);
        return Color3.fromRGB(v1, v1, v1);
    end;
end;
