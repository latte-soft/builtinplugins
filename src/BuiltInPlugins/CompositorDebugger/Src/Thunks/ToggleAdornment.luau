local l_script_FirstAncestor_0 = script:FindFirstAncestor("CompositorDebugger");
local l_copy_0 = require(l_script_FirstAncestor_0.Packages.Framework).Dash.copy;
local v2 = require(l_script_FirstAncestor_0.Src.Actions.SetAdornments);
local _ = require(l_script_FirstAncestor_0.Src.Types);
local v4 = {
    {
        color = Color3.new(0, 0, 1), 
        count = 0
    }, 
    {
        color = Color3.new(0, 1, 0), 
        count = 0
    }, 
    {
        color = Color3.new(0, 1, 1), 
        count = 0
    }, 
    {
        color = Color3.new(1, 0, 0), 
        count = 0
    }, 
    {
        color = Color3.new(1, 0, 1), 
        count = 0
    }, 
    {
        color = Color3.new(1, 1, 0), 
        count = 0
    }, 
    {
        color = Color3.new(0.5, 0.5, 0.5), 
        count = 0
    }, 
    {
        color = Color3.new(0, 0, 0.5), 
        count = 0
    }, 
    {
        color = Color3.new(0, 0.5, 0), 
        count = 0
    }, 
    {
        color = Color3.new(0, 0.5, 0.5), 
        count = 0
    }, 
    {
        color = Color3.new(0.5, 0, 0), 
        count = 0
    }, 
    {
        color = Color3.new(0.5, 0, 0.5), 
        count = 0
    }, 
    {
        color = Color3.new(0.5, 0.5, 0), 
        count = 0
    }
};
local function v10()
    local v5 = nil;
    local v6 = nil;
    for v7, v8 in v4, nil, nil do
        if not (v5 ~= nil) or v8.count < v5 then
            v5 = v8.count;
            v6 = v7;
        end;
    end;
    local v9 = v4[v6];
    v9.count = v9.count + 1;
    return v4[v6];
end;
local function _(v11)
    v11.count = v11.count - 1;
end;
return function(v13)
    return function(v14)
        local v15 = l_copy_0(v14:getState().Status.Adornments);
        if v15[v13] and v15[v13].enabled then
            local l_colorEntry_0 = v15[v13].colorEntry;
            l_colorEntry_0.count = l_colorEntry_0.count - 1;
            v15[v13].enabled = false;
        else
            local v17 = v10();
            v15[v13] = {
                enabled = true, 
                color = v17.color, 
                colorEntry = v17
            };
        end;
        v14:dispatch(v2(v15));
        local l_LayerAdornmentEvent_0 = v14:getState().Status.LayerAdornmentEvent;
        if l_LayerAdornmentEvent_0 then
            l_LayerAdornmentEvent_0:fire(v15);
        end;
    end;
end;
