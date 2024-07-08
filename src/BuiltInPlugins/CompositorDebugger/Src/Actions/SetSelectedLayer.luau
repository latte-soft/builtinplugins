return require(script:FindFirstAncestor("CompositorDebugger").Packages.Framework).Util.Action(script.Name, function(v0)
    return {
        selectedLayer = v0
    };
end);
