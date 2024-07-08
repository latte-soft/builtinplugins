local l_script_FirstAncestor_0 = script:FindFirstAncestor("TextureGenerator");
local v1 = require(l_script_FirstAncestor_0.Packages.React);
local v2 = require(l_script_FirstAncestor_0.Src.Util.Constants);
local v3 = require(l_script_FirstAncestor_0.Src.Util.GenerationsContext);
local v4 = require(l_script_FirstAncestor_0.Src.Hooks.jobTableReducer);
local v5 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagDebugTextureGeneratorLogging);
local function v9(v6, v7)
    assert((v7.action and v7.uuid) and v7.hash, "Action must have action, uuid, and hash fields");
    v6 = table.clone(v6);
    if v7.action == v2.GENERATION_ACTIONS.ADD then
        if v6[v7.hash] then
            v6[v7.hash] = table.clone(v6[v7.hash]);
        else
            v6[v7.hash] = {};
        end;
        table.insert(v6[v7.hash], v7.uuid);
        return v6;
    else
        if v7.action == v2.GENERATION_ACTIONS.REMOVE then
            if v6[v7.hash] then
                local v8 = table.find(v6[v7.hash], v7.uuid);
                if v8 then
                    v6[v7.hash] = table.clone(v6[v7.hash]);
                    table.remove(v6[v7.hash], v8);
                    return v6;
                end;
            end;
        else
            error((("Invalid action: %*"):format(v7.action)));
        end;
        return v6;
    end;
end;
return function(v10)
    local v11, v12 = v1.useReducer(v4, {});
    local v13, v14 = v1.useReducer(v9, {});
    local v15, v16 = v1.useState(nil);
    local v17, v18 = v1.useState(0);
    local v19, v20 = v1.useState(0);
    if v5() then
        v1.useEffect(function()
            print("Generations table: ", v11);
        end, {
            v11
        });
        v1.useEffect(function()
            print("ModelToGenerations table: ", v13);
        end, {
            v13
        });
    end;
    return v1.createElement(v3.Provider, {
        value = {
            generations = v11, 
            updateGeneration = v12, 
            modelToGenerations = v13, 
            updateModelToGenerations = v14, 
            selected = v15, 
            setSelected = v16, 
            quota = v17, 
            setQuota = v18, 
            total = v19, 
            setTotal = v20
        }
    }, v10.children);
end;
