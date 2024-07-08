local l_script_FirstAncestor_0 = script:FindFirstAncestor("Toolbox");
local v1 = require(l_script_FirstAncestor_0.Packages.Roact);
local v2 = require(l_script_FirstAncestor_0.Core.Util.MockWrapper);
local v3 = require(l_script_FirstAncestor_0.Core.Types.Category);
local v4 = require(script.Parent.SubcategoriesSwimlaneView);
return {
    summary = "A grid of Subcategory IconTiles with flexible widths.", 
    story = function()
        return v1.createElement(v2, {}, {
            SubcategoriesSwimlaneView = v1.createElement(v4, {
                CategoryName = v3.FREE_MODELS.name, 
                OnClickBack = function()
                end, 
                OnClickSeeAllAssets = function()
                end, 
                SubcategoryDict = {
                    {
                        displayName = "Category", 
                        children = {}, 
                        childCount = 0, 
                        index = 1, 
                        name = "1", 
                        path = {}, 
                        thumbnail = {
                            assetId = 5657301130, 
                            backgroundColor = "#32a852"
                        }
                    }, 
                    {
                        displayName = "Vehicle", 
                        children = {}, 
                        childCount = 0, 
                        index = 2, 
                        name = "2", 
                        path = {}, 
                        thumbnail = {
                            assetId = 5657301130, 
                            backgroundColor = "#32a852"
                        }
                    }, 
                    {
                        displayName = "3rd", 
                        children = {}, 
                        childCount = 0, 
                        index = 3, 
                        name = "3", 
                        path = {}, 
                        thumbnail = {
                            assetId = 5657301130, 
                            backgroundColor = "#32a852"
                        }
                    }, 
                    {
                        displayName = "4", 
                        children = {}, 
                        childCount = 0, 
                        index = 3, 
                        name = "4", 
                        path = {}, 
                        thumbnail = {
                            assetId = 5657301130, 
                            backgroundColor = "#32a852"
                        }
                    }, 
                    {
                        displayName = "5", 
                        children = {}, 
                        childCount = 0, 
                        name = "5", 
                        index = 3, 
                        path = {}, 
                        thumbnail = {
                            assetId = 5657301130, 
                            backgroundColor = "#32a852"
                        }
                    }
                }
            })
        });
    end
};
