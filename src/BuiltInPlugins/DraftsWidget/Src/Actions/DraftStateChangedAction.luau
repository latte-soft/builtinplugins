local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(script.Parent.Action);
local v2 = require(l_Parent_0.Src.Symbols.AutosaveState);
local v3 = require(l_Parent_0.Src.Symbols.CommitState);
local v4 = require(l_Parent_0.Src.Symbols.DraftState);
local _ = function(v5, v6)
    for _, v8 in pairs(v5) do
        if v8 == v6 then
            return true;
        end;
    end;
    return false;
end;
return v1(script.Name, function(v10, v11, v12)
    local v13 = tostring(v11);
    local v14 = tostring(v12);
    local v15 = typeof(v10);
    assert(v15 == "Instance", "Expected draft to be Instance. Got '" .. v15 .. "'");
    assert(v10:IsA("LuaSourceContainer"), "Expected draft to be a LuaSourceContainer. Got '" .. v10.ClassName .. "'");
    local v16;
    for _, v18 in pairs(v4) do
        if v18 == v11 then
            v16 = true;
            goto label0 --[[  true, false  ]];
        end;
    end;
    v16 = false;
    ::label0::;
    assert(v16 ~= nil, "Expected valid DraftState. Got '" .. v13 .. "'");
    if not (v11 ~= v4.Outdated) or v11 == v4.Deleted then
        assert(typeof(v12) == "boolean", "Expected type boolean for state type " .. v13 .. ". Got '" .. v14 .. "'");
    elseif v11 == v4.Autosaved then
        local v19;
        for _, v21 in pairs(v2) do
            if v21 == v12 then
                v19 = true;
                goto label1 --[[  true, false  ]];
            end;
        end;
        v19 = false;
        ::label1::;
        assert(v19, "Expected valid " .. v13 .. ". Got '" .. v14 .. "'");
    elseif v11 == v4.Committed then
        local v22;
        for _, v24 in pairs(v3) do
            if v24 == v12 then
                v22 = true;
                goto label2 --[[  true, false  ]];
            end;
        end;
        v22 = false;
        ::label2::;
        assert(v22, "Expected valid " .. v13 .. ". Got '" .. v14 .. "'");
    end;
    return {
        Draft = v10, 
        StateType = v11, 
        StateValue = v12
    };
end);
