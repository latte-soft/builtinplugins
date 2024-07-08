return require(script:FindFirstAncestor("R15Migrator").Packages.Framework).Util.Action(script.Name, function(v0, v1, v2, v3, v4)
    return {
        newWorldModelEntries = {
            [v0] = {
                previewModel = v1, 
                convertedModel = v2, 
                resetPreviewModel = v3, 
                resetConvertedModel = v4
            }
        }
    };
end);
