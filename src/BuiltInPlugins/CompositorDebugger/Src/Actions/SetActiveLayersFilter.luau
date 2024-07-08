return require(script:FindFirstAncestor("CompositorDebugger").Packages.Framework).Util.Action(script.Name, function(v0)
    return {
        activeLayersFilter = v0
    };
end);
