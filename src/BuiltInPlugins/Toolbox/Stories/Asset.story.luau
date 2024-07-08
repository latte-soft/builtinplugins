local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Roact);
local v2 = require(l_Parent_0.Core.Components.Asset.Asset);
local v3 = require(l_Parent_0.Stories.ToolboxStoryWrapper);
local v4 = require(l_Parent_0.TestUtils.MockItems);
local v5 = require(l_Parent_0.Core.Actions.GetAssets);
local function v9(v6)
    local l_fakeAsset_0 = v6.fakeAsset;
    v6.storeSetup = function(v8)
        v8:dispatch(v5({
            l_fakeAsset_0
        }, 1));
    end;
    return v1.createElement(v3, v6);
end;
local v10 = v4.getSimpleAsset(123456);
return {
    name = "Asset", 
    summary = "An asset used in the grid view.", 
    stories = {
        {
            name = "Asset", 
            story = function()
                v1.createElement(v9, {
                    fakeAsset = v10
                }, {
                    Asset = v1.createElement(v2, {
                        asset = v10, 
                        assetData = v10, 
                        assetId = 123456, 
                        LayoutOrder = 1
                    })
                });
            end
        }, 
        {
            name = "Asset hovered", 
            story = function()
                v1.createElement(v9, {
                    fakeAsset = v10
                }, {
                    v1.createElement("Frame", {
                        Size = UDim2.new(1, 0, 0, 250), 
                        BackgroundTransparency = 1
                    }, {
                        Layout = v1.createElement("UIListLayout", {
                            VerticalAlignment = Enum.VerticalAlignment.Center, 
                            HorizontalAlignment = Enum.HorizontalAlignment.Center
                        }), 
                        Asset = v1.createElement(v2, {
                            asset = v10, 
                            assetData = v10, 
                            assetId = 123456, 
                            isHovered = true, 
                            LayoutOrder = 1
                        })
                    })
                });
            end
        }
    }
};
