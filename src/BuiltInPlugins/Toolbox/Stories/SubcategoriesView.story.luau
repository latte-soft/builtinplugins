local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Roact);
local v2 = require(l_Parent_0.Stories.ToolboxStoryWrapper);
local v3 = require(l_Parent_0.Core.Components.Categorization.SubcategoriesView);
local function v5(v4)
    return v1.createElement(v2, v4);
end;
return {
    summary = "A grid of Subcategory IconTiles with flexible widths.", 
    stories = {
        {
            name = "SubcategoriesView", 
            summary = "Example with 5 subcategories.", 
            story = function()
                return v1.createElement(v5, {}, {
                    IconTile = v1.createElement(v3, {
                        Size = UDim2.new(1, 0, 0, 200), 
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
        }
    }
};
