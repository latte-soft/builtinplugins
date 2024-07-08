local l_script_FirstAncestor_0 = script:FindFirstAncestor("TerrainEditor");
local v1 = require(l_script_FirstAncestor_0.Src.Resources.Constants);
local _ = require(l_script_FirstAncestor_0.Src.Types);
return function(v3, v4)
    if math.abs(v3.Width / v3.Height - v4.X / v4.Z) <= v1.AspectRatioThreshold then
        return true, "";
    else
        local function v5(v6, v7)
            if v7 == 0 then
                return v6;
            else
                return (v5(v7, v6 % v7));
            end;
        end;
        local l_Width_0 = v3.Width;
        local l_Height_0 = v3.Height;
        local v10 = if l_Height_0 == 0 then l_Width_0 else v5(l_Height_0, l_Width_0 % l_Height_0);
        return false, (("%*:%*"):format(v3.Width / v10, v3.Height / v10));
    end;
end;
