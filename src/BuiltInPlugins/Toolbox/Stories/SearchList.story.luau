local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Roact);
local v2 = require(l_Parent_0.Stories.ToolboxStoryWrapper);
local v3 = require(l_Parent_0.Core.Components.Categorization.SearchList);
local function v5(v4)
    return v1.createElement(v2, v4);
end;
local v6 = {
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
    "snivy", 
    "fennekin", 
    "froakie", 
    "chespin", 
    "litten", 
    "popplio", 
    "rowlet"
};
return {
    summary = "A generic search list.", 
    stories = {
        {
            name = "Full, no max count", 
            story = function()
                return v1.createElement(v5, {}, {
                    v1.createElement("Frame", {
                        AutomaticSize = Enum.AutomaticSize.Y, 
                        BackgroundTransparency = 1, 
                        Size = UDim2.new(1, 0, 0, 0)
                    }, {
                        SearchList = v1.createElement(v3, {
                            Items = v6, 
                            ItemMinWidth = 28
                        })
                    })
                });
            end
        }, 
        {
            name = "Max row count of 2", 
            story = function()
                return v1.createElement(v5, {}, {
                    v1.createElement("Frame", {
                        AutomaticSize = Enum.AutomaticSize.Y, 
                        BackgroundTransparency = 1, 
                        Size = UDim2.new(1, 0, 0, 0)
                    }, {
                        SearchList = v1.createElement(v3, {
                            Items = v6, 
                            ItemMinWidth = 28, 
                            MaxRowCount = 2
                        })
                    })
                });
            end
        }
    }
};
