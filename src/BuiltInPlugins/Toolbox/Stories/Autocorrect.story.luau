local l_script_FirstAncestor_0 = script:FindFirstAncestor("Toolbox");
local v1 = require(l_script_FirstAncestor_0.Core.Components.Autocorrect.Autocorrect);
local v2 = require(l_script_FirstAncestor_0.Packages.Roact);
local v3 = require(l_script_FirstAncestor_0.Stories.ToolboxStoryWrapper);
local v4 = require(l_script_FirstAncestor_0.Core.Types.AutocorrectTypes);
return {
    name = "Autocorrect", 
    summary = "An Autocorrect component", 
    story = function()
        return v2.createElement(v3, {}, {
            Frame = v2.createElement("Frame", {
                AutomaticSize = Enum.AutomaticSize.Y, 
                BackgroundColor3 = Color3.new(255, 255, 255), 
                Size = UDim2.new(1, 0, 1, 0)
            }, {
                Autocorrect = v2.createElement(v1, {
                    CorrectionState = v4.AutocorrectResponseState.CorrectionAvailable, 
                    CurrentQuery = "foo", 
                    CorrectedQuery = "bar", 
                    UserQuery = nil
                }), 
                Padding = v2.createElement("UIPadding", {
                    PaddingTop = UDim.new(0, 10), 
                    PaddingBottom = UDim.new(0, 10), 
                    PaddingLeft = UDim.new(0, 10), 
                    PaddingRight = UDim.new(0, 10)
                })
            })
        });
    end
};
