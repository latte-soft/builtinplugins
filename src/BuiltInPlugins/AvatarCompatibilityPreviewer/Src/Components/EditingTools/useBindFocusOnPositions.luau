local l_Selection_0 = game:GetService("Selection");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("AvatarCompatibilityPreviewer");
local v2 = require(l_script_FirstAncestor_0.Packages.React);
local v3 = require(l_script_FirstAncestor_0.Src.Util.Constants);
return function(v4)
    local v5 = v2.useRef(v4);
    v5.current = v4;
    assert(v5.current ~= nil, v3.LUAU_ANALYZE_ERROR);
    v2.useEffect(function()
        if #v4 == 0 then
            return nil;
        else
            local v11 = l_Selection_0:AddFocusCallback(v3.FOCUS_CALLBACK_PRIORITIES.Positions, function()
                local l_current_0 = v5.current;
                if #l_current_0 == 0 then
                    return Vector3.zero, Vector3.zero;
                else
                    local v7 = l_current_0[1];
                    local v8 = l_current_0[1];
                    for v9 = 2, #l_current_0 do
                        local v10 = l_current_0[v9];
                        v7 = v7:Min(v10);
                        v8 = v8:Max(v10);
                    end;
                    return v7, v8;
                end;
            end);
            return function()
                v11:Disconnect();
            end;
        end;
    end, {
        #v4 == 0
    });
end;
