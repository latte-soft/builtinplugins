local l_script_FirstAncestor_0 = script:FindFirstAncestor("Toolbox");
local v1 = require(l_script_FirstAncestor_0.Core.Components.AssetTable.AssetTable);
local v2 = require(l_script_FirstAncestor_0.TestUtils.MockItems);
local v3 = require(l_script_FirstAncestor_0.Packages.Roact);
local v4 = require(l_script_FirstAncestor_0.Stories.ToolboxStoryWrapper);
local v5 = v2.getSimpleAsset(1, "Asset Row 1");
local v6 = v2.getSimpleAsset(2, "Asset Row 2");
local v7 = v2.getSimpleAsset(3, "Asset Row 3");
return {
    summary = "AssetTable", 
    stories = {
        {
            name = "AssetTable", 
            story = function()
                return v3.createElement(v4, {}, {
                    Frame = v3.createElement("Frame", {
                        AutomaticSize = Enum.AutomaticSize.Y, 
                        BackgroundTransparency = 1, 
                        Size = UDim2.new(1, 0, 0, 0)
                    }, {
                        List = v3.createElement(v1, {
                            Assets = {
                                v5, 
                                v6, 
                                v7
                            }, 
                            CanInsertAsset = function()
                                return true;
                            end, 
                            LayoutOrder = 1, 
                            OnAssetPreviewButtonClicked = function()
                                print("Asset Preview Clicked");
                            end, 
                            ParentAbsoluteSize = UDim2.fromOffset(500, 500), 
                            TryOpenAssetConfig = function()
                                print("Try Open Asset Config");
                            end
                        })
                    })
                });
            end
        }, 
        {
            name = "Empty table", 
            story = function()
                return v3.createElement(v4, {}, {
                    Frame = v3.createElement("Frame", {
                        AutomaticSize = Enum.AutomaticSize.Y, 
                        BackgroundTransparency = 1, 
                        Size = UDim2.new(1, 0, 0, 0)
                    }, {
                        List = v3.createElement(v1, {
                            Assets = {}, 
                            CanInsertAsset = function()
                                return true;
                            end, 
                            LayoutOrder = 1, 
                            OnAssetPreviewButtonClicked = function()
                                print("Asset Preview Clicked");
                            end, 
                            ParentAbsoluteSize = UDim2.fromOffset(500, 500), 
                            TryOpenAssetConfig = function()
                                print("Try Open Asset Config");
                            end
                        })
                    })
                });
            end
        }
    }
};
