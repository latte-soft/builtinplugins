local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Roact);
local v2 = require(l_Parent_0.Stories.ToolboxStoryWrapper);
local v3 = require(l_Parent_0.Core.Components.Categorization.HorizontalList);
return {
    name = "HorizontalList", 
    summary = "A generic horizontal list that sizes itself to the size of its content", 
    story = function()
        return v1.createElement(v2, {}, {
            Frame = v1.createElement("Frame", {
                BackgroundTransparency = 1, 
                Size = UDim2.new(0, 600, 0, 60)
            }, {
                List = v1.createElement(v3, {
                    DefaultHeight = 50, 
                    Data = {
                        "This", 
                        "is", 
                        "a", 
                        "test"
                    }, 
                    OnRenderItem = function(v4, v5)
                        return v1.createElement("TextLabel", {
                            Size = UDim2.new(0, 50, 0, 50), 
                            Text = v5, 
                            LayoutOrder = v4
                        });
                    end
                })
            })
        });
    end
};
