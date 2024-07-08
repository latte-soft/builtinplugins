local l_script_FirstAncestor_0 = script:FindFirstAncestor("TextureGenerator");
local v1 = require(l_script_FirstAncestor_0.Packages.Dash);
local v2 = require(l_script_FirstAncestor_0.Src.Util.Constants);
return function(v3, v4)
    assert(v4.action and v4.uuid, "Action must have action and uuid fields");
    v3 = table.clone(v3);
    if v4.action == v2.GENERATION_ACTIONS.UPDATE then
        assert(v4.data, "Action must have data field");
        if not v3[v4.uuid] then
            v3[v4.uuid] = {};
        end;
        v3[v4.uuid] = v1.join(v3[v4.uuid], v4.data);
        return v3;
    elseif v4.action == v2.GENERATION_ACTIONS.REMOVE then
        v3[v4.uuid] = nil;
        return v3;
    else
        error((("Invalid action: %*"):format(v4.action)));
        return v3;
    end;
end;
