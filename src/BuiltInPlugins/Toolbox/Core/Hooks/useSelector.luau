local v0 = require(script:FindFirstAncestor("Toolbox").Packages.React);
local v1 = require(script.Parent.useStore);
local function v4(v2, v3)
    return v2 == v3;
end;
useSelectorWithStore = function(v5, v6, v7)
    local _, v10 = v0.useReducer(function(v8)
        return v8 + 1;
    end, 0);
    local v11 = v0.useRef(nil);
    local v12 = v0.useRef(nil);
    local v13 = v0.useRef(nil);
    local v14 = v0.useRef(nil);
    local v15 = v7:getState();
    local v16 = nil;
    local l_status_0, l_result_0 = pcall(function()
        if (v5 == v12.current and v15 == v13.current) and not v11.current then
            v16 = v14.current;
            return ;
        else
            local v17 = v5(v15);
            if v14.current ~= nil and v6(v17, v14.current) then
                v16 = v14.current;
                return ;
            else
                v16 = v17;
                return ;
            end;
        end;
    end);
    if not l_status_0 then
        if v11.current then
            l_result_0 = string.format("%s\nThe error may be correlated with this previous error:\n%s\n\n", tostring(l_result_0), (tostring(v11.current)));
        end;
        error(l_result_0);
    end;
    v0.useLayoutEffect(function()
        v12.current = v5;
        v13.current = v15;
        v14.current = v16;
        v11.current = nil;
    end);
    v0.useLayoutEffect(function()
        local v24 = v7.changed:connect(function(v20)
            local l_status_1, l_result_1 = pcall(function()
                if v20 == v13.current then
                    return false;
                else
                    assert(v12.current, "latestSelector");
                    local v21 = v12.current(v20);
                    if not v6(v21, v14.current) then
                        v14.current = v21;
                        v13.current = v20;
                        return true;
                    else
                        return false;
                    end;
                end;
            end);
            if not l_status_1 then
                l_result_1 = l_result_1 or "Error";
                v11.current = l_result_1;
            end;
            if l_result_1 then
                v10(nil);
            end;
        end);
        local v25 = v7:getState();
        local l_status_2, l_result_2 = pcall(function()
            if v25 == v13.current then
                return false;
            else
                assert(v12.current, "latestSelector");
                local v26 = v12.current(v25);
                if not v6(v26, v14.current) then
                    v14.current = v26;
                    v13.current = v25;
                    return true;
                else
                    return false;
                end;
            end;
        end);
        if not l_status_2 then
            l_result_2 = l_result_2 or "Error";
            v11.current = l_result_2;
        end;
        if l_result_2 then
            v10(nil);
        end;
        return function()
            v24:disconnect();
        end;
    end, {
        v7
    });
    return v16;
end;
useSelector = function(v29, v30)
    return (useSelectorWithStore(v29, v30 or v4, (v1())));
end;
return useSelector;
