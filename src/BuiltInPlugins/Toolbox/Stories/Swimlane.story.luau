local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Roact);
local v2 = require(l_Parent_0.Core.Components.Categorization.Swimlane);
local v3 = require(l_Parent_0.Stories.ToolboxStoryWrapper);
local v4 = require(l_Parent_0.Core.Components.Categorization.IconTile);
local function _(v5)
    return function()
        return v1.createElement(v3, {}, {
            Example = v1.createElement(v2, v5)
        });
    end;
end;
local function v9(v7, v8)
    return {
        BackgroundColor = Color3.fromRGB(math.random(255), math.random(255), math.random(255)), 
        Image = "rbxassetid://6002241241", 
        Key = v7, 
        Title = v8
    };
end;
local v10 = {
    summary = "A section with a title, horizontal list, and optional 'see all' button"
};
local v11 = {};
local v12 = {
    name = "Simple example", 
    summary = "a general example with data"
};
local v15 = {
    Data = {
        "This", 
        "is", 
        "a", 
        "test"
    }, 
    Total = 123, 
    Title = "Just a bunch of Frames", 
    OnClickSeeAll = function()
        print("See All");
    end, 
    OnRenderItem = function(v13, v14)
        return v1.createElement("TextLabel", {
            LayoutOrder = v13, 
            Size = UDim2.new(0, 100, 0, 100), 
            Text = v14
        });
    end
};
v12.story = function()
    return v1.createElement(v3, {}, {
        Example = v1.createElement(v2, v15)
    });
end;
local v16 = {
    name = "Icon Tiles", 
    summary = "Tiles that represent products to buy"
};
local v20 = {
    Data = {
        v9("1", "Blonde Hair"), 
        v9("2", "Cool Blonde Hair"), 
        v9("3", "Original Blonde"), 
        v9("4", "Blonde"), 
        v9("5", "Blondie"), 
        v9("6", "Bulond"), 
        v9("7", "Blund"), 
        v9("8", "Real Blonde"), 
        v9("9", "Blond"), 
        (v9("10", "Blonde"))
    }, 
    Title = "Check Out This Hair", 
    Total = 12341115, 
    OnClickSeeAll = function()
        print("See All");
    end, 
    OnRenderItem = function(v17, v18)
        return v1.createElement(v4, {
            LayoutOrder = v17, 
            BackgroundColor = v18.BackgroundColor, 
            Image = v18.Image, 
            Key = v18.Key, 
            Title = v18.Title, 
            Size = UDim2.new(0, 90, 0, 105), 
            OnClick = function(v19)
                print(v17, v19);
            end
        });
    end
};
v16.story = function()
    return v1.createElement(v3, {}, {
        Example = v1.createElement(v2, v20)
    });
end;
setlist { ['R008[1 to 2]'] = 'R009 to R010' };
v10.stories = v11;
return v10;
