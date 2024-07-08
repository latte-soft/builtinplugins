local l_script_FirstAncestor_0 = script:FindFirstAncestor("AudioEqualizerEditor");
return function(v1, v2)
    local v3 = require(l_script_FirstAncestor_0.Packages.React);
    local v4 = require(l_script_FirstAncestor_0.Packages.ReactRoblox);
    local v5 = v3.createElement(require(l_script_FirstAncestor_0.Src.MainPlugin), {
        Plugin = v1, 
        PluginLoaderContext = v2
    });
    local v6 = v4.createRoot((Instance.new("Frame")));
    assert(v6);
    v6:render(v5);
    v1.Unloading:Connect(function()
        v1:Invoke("OnStopEditing");
        if v6 then
            v6:render(nil);
            v6 = nil;
        end;
    end);
end;
