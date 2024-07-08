local l_script_FirstAncestor_0 = script:FindFirstAncestor("Toolbox");
local v1 = require(script.Parent.AudioRowExpandedContent);
local v2 = require(l_script_FirstAncestor_0.TestUtils.MockItems);
local v3 = require(l_script_FirstAncestor_0.Packages.Roact);
local v4 = require(l_script_FirstAncestor_0.Stories.ToolboxStoryWrapper);
local v5 = v2.getSimpleAudioAsset(11322590111, "Roboto");
return {
    name = "AudioRowExpandedContent", 
    summary = "Expanded content component used in the AudioRow", 
    story = function()
        return v3.createElement(v4, {}, {
            Frame = v3.createElement("Frame", {
                AutomaticSize = Enum.AutomaticSize.Y, 
                BackgroundTransparency = 1, 
                Size = UDim2.new(1, 0, 0, 0)
            }, {
                List = v3.createElement(v1, {
                    AudioDetails = v5.AudioDetails, 
                    AssetInfo = v5, 
                    IsPlaying = false, 
                    OnAssetPreviewButtonClicked = function()
                        print("OnAssetPreviewButtonClicked");
                    end, 
                    OnAudioEnd = function()
                        print("Audio End");
                    end, 
                    OnInsertClicked = function()
                        print("Insert Asset");
                    end
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
