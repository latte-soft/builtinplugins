return require(script:FindFirstAncestor("AssetImporter").Packages.Framework).Util.enumerate("StatusLevel", {
    Error = "Error", 
    Warning = "Warning"
});
