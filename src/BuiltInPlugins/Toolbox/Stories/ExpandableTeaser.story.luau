local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Roact);
local v2 = require(l_Parent_0.Stories.ToolboxStoryWrapper);
local v3 = require(l_Parent_0.Core.Components.Categorization.ExpandableTeaser);
local v4 = require(l_Parent_0.Core.Components.Categorization.SearchList);
local function v6(v5)
    return v1.createElement(v2, v5);
end;
local function v7()
    return {
        v1.createElement("Frame", {
            BackgroundColor3 = Color3.new(1, 0, 0), 
            Size = UDim2.new(1, 0, 0, 100)
        })
    };
end;
local function v8()
    return {
        SearchList = v1.createElement(v4, {
            AutomaticSize = Enum.AutomaticSize.Y, 
            Items = {
                "charmander", 
                "bulbasaur", 
                "squirtle", 
                "cyndaquil", 
                "totodile", 
                "chikorita", 
                "torchic", 
                "mudkip", 
                "treecko", 
                "chimchar", 
                "piplup", 
                "turtwig", 
                "tepig", 
                "oshawott", 
                "snivy"
            }, 
            ItemMinWidth = 28
        })
    };
end;
local function v10(v9)
    print("isExpanded: ", v9);
end;
return {
    summary = "An expandable teaser.", 
    stories = {
        {
            name = "Expandable", 
            story = function()
                return v1.createElement(v6, {}, {
                    v1.createElement("Frame", {
                        AutomaticSize = Enum.AutomaticSize.Y, 
                        BackgroundTransparency = 1, 
                        Size = UDim2.new(1, 0, 0, 0)
                    }, {
                        ExpandableTeaser = v1.createElement(v3, {
                            OnExpandChanged = v10, 
                            Title = "Expandable", 
                            TeaserSize = Vector2.new(0, 10)
                        }, (v7()))
                    })
                });
            end
        }, 
        {
            name = "Search Pills", 
            story = function()
                return v1.createElement(v6, {}, {
                    v1.createElement("Frame", {
                        AutomaticSize = Enum.AutomaticSize.Y, 
                        BackgroundTransparency = 1, 
                        Size = UDim2.new(1, 0, 0, 0)
                    }, {
                        ExpandableTeaser = v1.createElement(v3, {
                            OnExpandChanged = v10, 
                            Title = "Top Searches", 
                            TeaserSize = Vector2.new(0, 28)
                        }, (v8()))
                    })
                });
            end
        }
    }
};
