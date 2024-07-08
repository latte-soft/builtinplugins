local l_script_FirstAncestor_0 = script:FindFirstAncestor("Toolbox");
local v1 = require(l_script_FirstAncestor_0.Packages.Roact);
local v2 = require(script.Parent.AudioTabs);
local v3 = require(l_script_FirstAncestor_0.Stories.ToolboxStoryWrapper);
local v4 = require(l_script_FirstAncestor_0.Core.Types.Category);
local v5 = v1.PureComponent:extend("AudioTabsStroyWrapper");
v5.init = function(v6)
    v6.state = {
        selectedTab = v4.SOUND_EFFECTS.name
    };
    v6.OnTabSelect = function(v7)
        v6:setState({
            selectedTab = v7
        });
    end;
end;
v5.render = function(v8)
    return v1.createElement("Frame", {
        Size = UDim2.new(0, 330, 0, 30), 
        BackgroundTransparency = 1
    }, {
        AudioTabs = v1.createElement(v2, {
            SelectedTab = v8.state.selectedTab, 
            OnTabSelect = v8.OnTabSelect
        })
    });
end;
return {
    name = "Audio Tabs", 
    summary = "Tab selection with round edges", 
    story = function()
        return v1.createElement(v3, {}, {
            AudioTabs = v1.createElement(v5)
        });
    end
};
