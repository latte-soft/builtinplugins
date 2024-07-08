return require(script.Parent.Parent.Parent.Packages.Framework).Util.Action(script.Name, function()
    return {
        mostRecentAssetInsertTime = tick()
    };
end);
