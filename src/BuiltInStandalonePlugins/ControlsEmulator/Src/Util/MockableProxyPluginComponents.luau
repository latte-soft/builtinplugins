local v0 = {};
setmetatable(v0, {
    __index = function(_, v2)
        return script:FindFirstAncestorWhichIsA("Plugin"):GetPluginComponent(v2);
    end
});
return v0;
