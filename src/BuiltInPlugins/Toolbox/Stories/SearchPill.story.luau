local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Roact);
local v2 = require(l_Parent_0.Stories.ToolboxStoryWrapper);
local v3 = require(l_Parent_0.Core.Components.Categorization.SearchPill);
local function v5(v4)
    return v1.createElement(v2, v4);
end;
return {
    summary = "A generic search pill.", 
    stories = {
        {
            name = "Clickable", 
            story = function()
                return v1.createElement(v5, {}, {
                    SearchPill = v1.createElement(v3, {
                        AutomaticSize = Enum.AutomaticSize.XY, 
                        Text = "Clickable", 
                        OnClick = function()
                            print("Clicked");
                        end
                    })
                });
            end
        }, 
        {
            name = "Constant Size", 
            story = function()
                return v1.createElement(v5, {}, {
                    SearchPill = v1.createElement(v3, {
                        Text = "Size 100x50", 
                        Size = UDim2.new(0, 100, 0, 50)
                    })
                });
            end
        }
    }
};
