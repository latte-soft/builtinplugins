local v0 = require(script:FindFirstAncestor("AssetImporter").Src.Components.Properties.Types.PathProperty);
local function v2(v1)
    return not v1.IsPbr;
end;
return {
    {
        Section = "ObjectGeneral", 
        Properties = {
            {
                Name = "ImportName", 
                Editable = true
            }, 
            {
                Name = "DiffuseFilePath", 
                Editable = false, 
                AllowPickFile = true, 
                ComponentFactory = v0
            }, 
            {
                Name = "NormalFilePath", 
                Editable = false, 
                AllowPickFile = true, 
                ComponentFactory = v0, 
                ShouldHide = v2
            }, 
            {
                Name = "MetalnessFilePath", 
                Editable = false, 
                AllowPickFile = true, 
                ComponentFactory = v0, 
                ShouldHide = v2
            }, 
            {
                Name = "RoughnessFilePath", 
                Editable = false, 
                AllowPickFile = true, 
                ComponentFactory = v0, 
                ShouldHide = v2
            }
        }
    }
};
