local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.Core.Components.Font.FontTile);
local v2 = require(l_Parent_0.TestUtils.MockItems);
local v3 = require(l_Parent_0.Packages.Roact);
local v4 = require(l_Parent_0.Stories.ToolboxStoryWrapper);
local v5 = v2.getSimpleAsset(11322590111, "Roboto");
return {
    name = "FontTile", 
    summary = "A FontTile component used in the grid view", 
    story = function()
        return v3.createElement(v4, {}, {
            Frame = v3.createElement("Frame", {
                AutomaticSize = Enum.AutomaticSize.Y, 
                BackgroundColor3 = Color3.new(255, 255, 255), 
                Size = UDim2.new(1, 0, 0, 0)
            }, {
                List = v3.createElement(v1, {
                    AssetInfo = v5
                }), 
                Padding = v3.createElement("UIPadding", {
                    PaddingTop = UDim.new(0, 10), 
                    PaddingBottom = UDim.new(0, 10), 
                    PaddingLeft = UDim.new(0, 10), 
                    PaddingRight = UDim.new(0, 10)
                })
            })
        });
    end
};
