local _ = require(script:FindFirstAncestor("TerrainEditor").Src.Types);
return function(v1)
    return {
        {
            Label = "Filename", 
            Value = not v1.File and "" or v1.File.Name
        }, 
        {
            Label = "Dimensions", 
            Value = ("%*x%*px"):format(v1.Width, v1.Height)
        }
    };
end;
