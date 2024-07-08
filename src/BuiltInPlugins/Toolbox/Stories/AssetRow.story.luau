local l_script_FirstAncestor_0 = script:FindFirstAncestor("Toolbox");
local v1 = require(l_script_FirstAncestor_0.Core.Components.AssetRow.AssetRow);
local v2 = require(l_script_FirstAncestor_0.TestUtils.MockItems);
local v3 = require(l_script_FirstAncestor_0.Packages.Roact);
local v4 = require(l_script_FirstAncestor_0.Stories.ToolboxStoryWrapper);
local v5 = v2.getSimpleAsset(11322590111, "Asset Row");
local v6 = v3.PureComponent:extend("MockAssetRowInteractiveWrapper");
v6.init = function(v7)
    v7.state = {
        isExpanded = false
    };
    v7.updateExpanded = function()
        v7:setState(function(v8)
            return {
                isExpanded = not v8.isExpanded
            };
        end);
    end;
end;
v6.render = function(v9)
    return v3.createElement("Frame", {
        AutomaticSize = Enum.AutomaticSize.Y, 
        BackgroundTransparency = 1, 
        Size = UDim2.new(1, 0, 0, 0)
    }, {
        AssetRow = v3.createElement(v1, {
            AssetInfo = v5, 
            CanInsertAsset = function()
                return true;
            end, 
            InsertAsset = function()
                print("Insert Asset");
            end, 
            IsExpanded = v9.state.isExpanded, 
            OnExpanded = v9.updateExpanded, 
            LayoutOrder = 1, 
            OnAssetPreviewButtonClicked = function()
                print("Asset Preview Clicked");
            end, 
            ParentAbsoluteSize = UDim2.fromOffset(500, 500), 
            TryOpenAssetConfig = function()
                print("Try Open Asset Config");
            end
        })
    });
end;
return {
    summary = "AssetRow", 
    stories = {
        {
            name = "Interactive AssetRow", 
            summary = "Never expanding row (IsExpanded = false)", 
            story = function()
                return v3.createElement(v4, {}, {
                    v3.createElement(v6)
                });
            end
        }, 
        {
            name = "Unexpanded AssetRow", 
            summary = "Never expanding row (IsExpanded = false)", 
            story = function()
                return v3.createElement(v4, {}, {
                    Frame = v3.createElement("Frame", {
                        AutomaticSize = Enum.AutomaticSize.Y, 
                        BackgroundTransparency = 1, 
                        Size = UDim2.new(1, 0, 0, 0)
                    }, {
                        AssetRow = v3.createElement(v1, {
                            AssetInfo = v5, 
                            CanInsertAsset = function()
                                return true;
                            end, 
                            InsertAsset = function()
                                print("Insert Asset");
                            end, 
                            IsExpanded = false, 
                            OnExpanded = function(v10)
                                print("On Expanded id:", v10);
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
            name = "Expanded AssetRow", 
            summary = "Always expanded Row (IsExpanded = true)", 
            story = function()
                return v3.createElement(v4, {}, {
                    Frame = v3.createElement("Frame", {
                        AutomaticSize = Enum.AutomaticSize.Y, 
                        BackgroundTransparency = 1, 
                        Size = UDim2.new(1, 0, 0, 0)
                    }, {
                        AssetRow = v3.createElement(v1, {
                            AssetInfo = v5, 
                            CanInsertAsset = function()
                                return true;
                            end, 
                            InsertAsset = function()
                                print("Insert Asset");
                            end, 
                            IsExpanded = true, 
                            OnExpanded = function()
                                print("On Expanded");
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
