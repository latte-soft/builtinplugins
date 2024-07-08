local l_script_FirstAncestor_0 = script:FindFirstAncestor("AvatarCompatibilityPreviewer");
local v1 = require(l_script_FirstAncestor_0.Packages.React);
local v2 = require(l_script_FirstAncestor_0.Src.Util.OriginalLimbContext);
return function(v3)
    local v4 = v1.useRef({});
    assert(v4.current ~= nil, "Luau");
    v1.useEffect(function()
        return function()
            for _, v6 in v4.current, nil, nil do
                v6:Disconnect();
            end;
            table.clear(v4.current);
        end;
    end, {});
    return v1.createElement(v2.Provider, {
        value = v1.useMemo(function()
            return {
                isLimbOriginal = function(v7)
                    return v4.current[v7] ~= nil;
                end, 
                markLimbAsOriginal = function(v8)
                    v4.current[v8] = v8.Destroying:Connect(function()
                        v4.current[v8]:Disconnect();
                        v4.current[v8] = nil;
                    end);
                end
            };
        end, {})
    }, v3.children);
end;
