local l_Parent_0 = script.Parent.Parent;
return function(v1, v2)
    local v3 = os.clock();
    local v4 = require(l_Parent_0.Packages.React);
    local v5 = require(l_Parent_0.Packages.ReactRoblox);
    local v6 = v4.createElement(require(l_Parent_0.Src.MainPlugin), {
        Plugin = v1, 
        PluginLoaderContext = v2, 
        LoadStartTimestamp = v3
    });
    local v7 = v5.createRoot((Instance.new("Frame")));
    v7:render(v6);
    v1.Unloading:Connect(function()
        if v7 then
            v7:render(nil);
            v7 = nil;
        end;
    end);
end;
