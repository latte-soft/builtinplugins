local l_script_FirstAncestor_0 = script:FindFirstAncestor("Ribbon");
local v1 = require(l_script_FirstAncestor_0.Packages.React);
local v2 = require(l_script_FirstAncestor_0.Packages.RoactRodux);
local v3 = require(l_script_FirstAncestor_0.Packages.Framework);
local l_counter_0 = v3.Util.counter;
local l_UI_0 = v3.UI;
local l_IconButton_0 = l_UI_0.IconButton;
local l_Pane_0 = l_UI_0.Pane;
local l_TextLabel_0 = l_UI_0.TextLabel;
local _ = require(l_script_FirstAncestor_0.Src.Reducers.MainReducer);
local v10 = require(l_script_FirstAncestor_0.Src.Actions.ExampleIncrementCount);
return v2.connect(function(v11, _)
    return {
        ExampleCount = v11.ExampleReducer.ExampleCount, 
        ExampleString = v11.ExampleReducer.ExampleString
    };
end, function(v13)
    return {
        dispatchExampleIncrementCount = function(v14)
            v13(v10(v14));
        end
    };
end)(function(v15)
    local v16 = l_counter_0();
    return v1.createElement(l_Pane_0, {
        LayoutOrder = 2, 
        [v1.Tag] = "X-Fit X-PadL X-RowM X-Middle"
    }, {
        Button = v1.createElement(l_IconButton_0, {
            LayoutOrder = v16(), 
            Text = "Increment", 
            OnClick = function()
                v15.dispatchExampleIncrementCount("Pressed");
            end, 
            [v1.Tag] = "Primary X-Fit"
        }), 
        Text = v1.createElement(l_TextLabel_0, {
            LayoutOrder = v16(), 
            Text = ("Count: %* %*"):format(v15.ExampleCount, v15.ExampleString), 
            [v1.Tag] = "X-Fit"
        })
    });
end);
