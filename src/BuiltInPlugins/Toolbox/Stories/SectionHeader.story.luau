local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Roact);
local v2 = require(l_Parent_0.Stories.ToolboxStoryWrapper);
local v3 = require(l_Parent_0.Core.Components.Categorization.SectionHeader);
return {
    name = "SectionHeader", 
    summary = "A header shown at the top of a swimlane.", 
    story = function()
        return v1.createElement(v2, {}, {
            EmptyFrame = v1.createElement("Frame", {
                BackgroundTransparency = 1, 
                Size = UDim2.new(0, 400, 0, 100)
            }, {
                SectionHeader = v1.createElement(v3, {
                    OnClickSeeAll = function()
                        print("'See All' button pressed");
                    end, 
                    Position = UDim2.new(0, 0, 0, 0), 
                    Title = "This is a test"
                })
            })
        });
    end
};
