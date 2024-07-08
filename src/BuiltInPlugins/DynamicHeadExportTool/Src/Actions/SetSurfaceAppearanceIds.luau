return require(script:FindFirstAncestor("DynamicHeadExportTool").Packages.Framework).Util.Action(script.Name, function(v0, v1, v2, v3)
    return {
        colorMap = v0, 
        metalnessMap = v1, 
        normalMap = v2, 
        roughnessMap = v3
    };
end);
