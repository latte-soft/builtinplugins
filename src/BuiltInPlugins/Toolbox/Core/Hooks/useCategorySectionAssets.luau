return require(script.Parent["useCategorySectionAssets.impl"])({
    fetchCategoryAssets = require(script:FindFirstAncestor("Toolbox").Core.Requests.fetchCategoryAssets)
});
