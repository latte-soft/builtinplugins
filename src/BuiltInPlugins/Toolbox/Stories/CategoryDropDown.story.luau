local l_script_FirstAncestor_0 = script:FindFirstAncestor("Toolbox");
local v1 = require(l_script_FirstAncestor_0.Packages.Roact);
local v2 = require(l_script_FirstAncestor_0.Core.Components.CategoryDropDown.CategoryDropDown);
local v3 = require(l_script_FirstAncestor_0.Stories.ToolboxStoryWrapper);
local v4 = {
    "rock", 
    "pop", 
    "scores-orchestral", 
    "children", 
    "ethnic-folk", 
    "kitsch-retro", 
    "electronic", 
    "latin", 
    "classical", 
    "jazz", 
    "corporate", 
    "blues", 
    "atmosphere", 
    "easy-listening", 
    "religious", 
    "world-beat", 
    "hip-hop", 
    "folk-contemporary", 
    "dance-traditional", 
    "funk-soul-r-b", 
    "ethnic-pop", 
    "country", 
    "marches-military", 
    "electronica"
};
local function v6(v5)
    print(v5);
end;
return {
    name = "Category drop down", 
    story = function()
        return v1.createElement(v3, {}, {
            CategoryDropDown = v1.createElement(v2, {
                OnCategorySelect = v6, 
                Categories = v4
            })
        });
    end
};
