local l_script_FirstAncestor_0 = script:FindFirstAncestor("AttenuationCurveEditor");
local _ = require(l_script_FirstAncestor_0.Src.Types);
local v2 = require(l_script_FirstAncestor_0.Src.Util.roundDecimal);
return {
    stringifyCurveTable = function(v3)
        local v4 = {};
        for v5, v6 in v3, nil, nil do
            local v7 = tostring(v5);
            if v7 then
                v4[v7] = v6;
            else
                print((("%* couldn't be converted to a stringformat(v5)));
            end;
        end;
        return v4;
    end, 
    destringifyCurveTable = function(v8)
        local v9 = {};
        for v10, v11 in v8, nil, nil do
            local v12 = tonumber(v10);
            if v12 then
                v9[v12] = v11;
            else
                print((("%* couldn't be converted to a numberformat(v10)));
            end;
        end;
        return v9;
    end, 
    curveToTable = function(v13)
        local v14 = {};
        for _, v16 in v13.Keypoints, nil, nil do
            v14[v2(v16.X, 3)] = v2(v16.Y, 3);
        end;
        return v14;
    end, 
    tableToCurve = function(v17)
        local v18 = {};
        for v19, v20 in v17, nil, nil do
            table.insert(v18, Vector2.new(v19, v20));
        end;
        table.sort(v18, function(v21, v22)
            return v21.X < v22.X;
        end);
        return {
            Keypoints = v18
        };
    end
};
