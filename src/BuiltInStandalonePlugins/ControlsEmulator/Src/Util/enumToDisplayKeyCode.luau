local l_splitOn_0 = require(script:FindFirstAncestor("ControlsEmulator").Packages.Dash).splitOn;
return function(v1)
    if v1 then
        local v2 = "";
        for _, v4 in v1, nil, nil do
            local v5, _ = l_splitOn_0(tostring(v4), "%.");
            v2 = v2 .. "+" .. v5[#v5];
        end;
        return v2;
    else
        return "N/A";
    end;
end;
