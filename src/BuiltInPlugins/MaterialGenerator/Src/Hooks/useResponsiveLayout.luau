local l_script_FirstAncestor_0 = script:FindFirstAncestor("MaterialGenerator");
local v1 = require(l_script_FirstAncestor_0.Packages.Dash);
local v2 = require(l_script_FirstAncestor_0.Packages.React);
local v3 = require(l_script_FirstAncestor_0.Packages.ReactRoblox);
local _ = require(l_script_FirstAncestor_0.Src.Types);
local function _(v5, v6)
    local l_X_0 = v6.X;
    local l_Y_0 = v6.Y;
    local v11 = v1.last(v5, function(v9)
        local v10 = false;
        if (v9.minWidth or 0) <= l_X_0 then
            v10 = false;
            if l_X_0 <= (v9.maxWidth or math.huge) then
                v10 = false;
                if (v9.minHeight or 0) <= l_Y_0 then
                    v10 = l_Y_0 <= (v9.maxHeight or math.huge);
                end;
            end;
        end;
        return v10;
    end);
    if not v11 then
        return nil;
    else
        return v11.value;
    end;
end;
return function(v13)
    local v21, v22 = v2.useState(function()
        local l_v13_0 = v13;
        local v15 = Vector2.new(0, 0);
        local l_X_1 = v15.X;
        local l_Y_1 = v15.Y;
        local v20 = v1.last(l_v13_0, function(v18)
            local v19 = false;
            if (v18.minWidth or 0) <= l_X_1 then
                v19 = false;
                if l_X_1 <= (v18.maxWidth or math.huge) then
                    v19 = false;
                    if (v18.minHeight or 0) <= l_Y_1 then
                        v19 = l_Y_1 <= (v18.maxHeight or math.huge);
                    end;
                end;
            end;
            return v19;
        end);
        if not v20 then
            return nil;
        else
            return v20.value;
        end;
    end);
    local v32 = v2.useCallback(function(v23)
        local l_v22_0 = v22;
        local l_v13_1 = v13;
        local l_AbsoluteSize_0 = v23.AbsoluteSize;
        local l_X_2 = l_AbsoluteSize_0.X;
        local l_Y_2 = l_AbsoluteSize_0.Y;
        local v31 = v1.last(l_v13_1, function(v29)
            local v30 = false;
            if (v29.minWidth or 0) <= l_X_2 then
                v30 = false;
                if l_X_2 <= (v29.maxWidth or math.huge) then
                    v30 = false;
                    if (v29.minHeight or 0) <= l_Y_2 then
                        v30 = l_Y_2 <= (v29.maxHeight or math.huge);
                    end;
                end;
            end;
            return v30;
        end);
        l_v22_0(if not v31 then nil else v31.value);
    end, {
        v13
    });
    return v2.useMemo(function()
        return {
            [v3.Change.AbsoluteSize] = v32
        };
    end, {
        v32
    }), v21;
end;
