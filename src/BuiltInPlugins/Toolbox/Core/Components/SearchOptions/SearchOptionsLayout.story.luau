local l_script_FirstAncestor_0 = script:FindFirstAncestor("Toolbox");
local v1 = require(l_script_FirstAncestor_0.Packages.Roact);
local v2 = require(script.Parent.SearchOptionsLayout);
local v3 = require(l_script_FirstAncestor_0.TestUtils.ClickToShowInteractiveStoryWrapper);
local v4 = require(l_script_FirstAncestor_0.Stories.ToolboxStoryWrapper);
return {
    name = "SearchOptionsLayout", 
    summary = "The layout for the Search Option component", 
    stories = {
        {
            story = function()
                return v1.createElement(v4, {}, {
                    ClickToShowInteractiveStoryWrapper = v1.createElement(v3, {
                        OnRender = function(_, v6)
                            return v1.createElement(v2, {
                                SearchOptions = {}, 
                                OnClose = v6
                            });
                        end
                    })
                });
            end
        }
    }
};
