local v0 = require(script.Parent.Parent.Parent.Src.TestHelpers.createMockMaterialGenerationService);
return function()
    local v1 = v0():StartSession();
    local v2, v3 = v1:GenerateImagesAsync("test", {});
    return v1, v2, v3;
end;
