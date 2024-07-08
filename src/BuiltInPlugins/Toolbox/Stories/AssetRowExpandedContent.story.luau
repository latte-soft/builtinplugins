local l_script_FirstAncestor_0 = script:FindFirstAncestor("Toolbox");
local v1 = require(l_script_FirstAncestor_0.Core.Components.AssetRow.AssetRowExpandedContent);
local v2 = require(l_script_FirstAncestor_0.TestUtils.MockItems);
local v3 = require(l_script_FirstAncestor_0.Packages.Roact);
local v4 = require(l_script_FirstAncestor_0.Stories.ToolboxStoryWrapper);
local v5 = v2.getSimpleAsset(11322590111, "Roboto");
return {
    summary = "AssetRowExpandedContent", 
    stories = {
        {
            name = "AssetRowExpandedContent", 
            story = function()
                return v3.createElement(v4, {}, {
                    Frame = v3.createElement("Frame", {
                        AutomaticSize = Enum.AutomaticSize.Y, 
                        BackgroundTransparency = 1, 
                        Size = UDim2.new(1, 0, 0, 0)
                    }, {
                        List = v3.createElement(v1, {
                            AssetInfo = v5, 
                            OnAssetPreviewButtonClicked = function()
                                print("Asset Preview Clicked");
                            end, 
                            OnInsertClicked = function()
                                print("On Insert Clicked");
                            end
                        })
                    })
                });
            end
        }
    }
};
