local l_script_FirstAncestor_0 = script:FindFirstAncestor("Toolbox");
local v1 = require(l_script_FirstAncestor_0.Packages.Framework);
local v2 = require(l_script_FirstAncestor_0.Packages.Roact);
local v3 = require(l_script_FirstAncestor_0.Core.Util.MockWrapper);
local v4 = require(l_script_FirstAncestor_0.Core.Util.Urls);
local v5 = require(l_script_FirstAncestor_0.Core.Util.Constants);
local v6 = require(l_script_FirstAncestor_0.Core.Components.Categorization.IconTile);
local l_ASSET_THUMBNAIL_REQUESTED_IMAGE_SIZE_0 = v5.ASSET_THUMBNAIL_REQUESTED_IMAGE_SIZE;
local l_ResponsiveGrid_0 = v1.UI.ResponsiveGrid;
local v9 = {
    5657301130, 
    13986559755, 
    7062372311, 
    494291269, 
    9346039031, 
    14318578453, 
    8530191225, 
    13902359897
};
local v10 = {
    Color3.fromHex("#005D92"), 
    Color3.fromHex("#A2120B"), 
    Color3.fromHex("#008347"), 
    Color3.fromHex("#AD8007"), 
    Color3.fromHex("#B61CA2"), 
    Color3.fromHex("#008BDB"), 
    Color3.fromHex("#C2510F"), 
    Color3.fromHex("#6D34E3"), 
    Color3.fromHex("#7A0D08"), 
    Color3.fromHex("#AD8007"), 
    Color3.fromHex("#00456D"), 
    Color3.fromHex("#006939")
};
local function _(v11)
    return v11[Random.new():NextInteger(1, #v11)];
end;
local v13 = v2.PureComponent:extend("GridStory");
v13.defaultProps = {
    numTiles = 10, 
    tileWidth = 120
};
v13.init = function(v14)
    v14.state = {
        maxTileHeight = 0
    };
    v14.setMaxTileHeight = function(v15)
        v14:setState(function(v16)
            return {
                maxTileHeight = math.max(v16.maxTileHeight, v15.Y)
            };
        end);
    end;
end;
v13.render = function(v17)
    local v18 = {};
    for v19 = 1, v17.props.numTiles do
        local v20 = ("Tile%*"):format(v19);
        local l_createElement_0 = v2.createElement;
        local l_v6_0 = v6;
        local v23 = {
            Title = ("Category %*"):format(v19), 
            BackgroundColor = v10[v19]
        };
        local l_constructAssetThumbnailUrl_0 = v4.constructAssetThumbnailUrl;
        local l_v9_0 = v9;
        v23.Image = l_constructAssetThumbnailUrl_0(l_v9_0[Random.new():NextInteger(1, #l_v9_0)], l_ASSET_THUMBNAIL_REQUESTED_IMAGE_SIZE_0, l_ASSET_THUMBNAIL_REQUESTED_IMAGE_SIZE_0);
        v23.LayoutOrder = v19;
        v23.OnAbsoluteSizeChanged = v17.setMaxTileHeight;
        v18[v20] = l_createElement_0(l_v6_0, v23);
    end;
    return v2.createElement(l_ResponsiveGrid_0, {
        AutomaticSize = Enum.AutomaticSize.Y, 
        CutOffs = {
            {
                ColumnCount = 1, 
                MinWidth = 0
            }, 
            {
                ColumnCount = 2, 
                MinWidth = v17.props.tileWidth * 3
            }, 
            {
                ColumnCount = 3, 
                MinWidth = v17.props.tileWidth * 8
            }
        }, 
        ItemHeight = UDim.new(0, v17.state.maxTileHeight), 
        Size = UDim2.fromScale(1, 0)
    }, v18);
end;
return {
    summary = "A generic tile with an icon and flat color background.", 
    stories = {
        {
            name = "Single", 
            summary = "Sends a key on click and has a pointer cursor.", 
            story = function()
                return v2.createElement(v3, {}, {
                    IconTile = v2.createElement(v6, {
                        BackgroundColor = Color3.fromRGB(50, 168, 82), 
                        Image = v4.constructAssetThumbnailUrl(v9[1], l_ASSET_THUMBNAIL_REQUESTED_IMAGE_SIZE_0, l_ASSET_THUMBNAIL_REQUESTED_IMAGE_SIZE_0), 
                        Key = "Click", 
                        OnClick = function(v26)
                            print(v26);
                        end, 
                        Size = UDim2.new(0, 75, 0, 90), 
                        Title = "Category"
                    })
                });
            end
        }, 
        {
            name = "Grid", 
            summary = "A grid of tiles to show off use in responsive layouts", 
            story = function()
                return v2.createElement(v3, {}, {
                    GridStory = v2.createElement(v13)
                });
            end
        }, 
        {
            name = "Text truncation", 
            summary = "The title text of an IconTile will truncate on smaller sized tiles", 
            story = function()
                return v2.createElement(v3, {}, {
                    IconTile = v2.createElement(v6, {
                        BackgroundColor = Color3.fromRGB(50, 168, 82), 
                        Image = v4.constructAssetThumbnailUrl(v9[1], l_ASSET_THUMBNAIL_REQUESTED_IMAGE_SIZE_0, l_ASSET_THUMBNAIL_REQUESTED_IMAGE_SIZE_0), 
                        Key = "Click", 
                        OnClick = function(v27)
                            print(v27);
                        end, 
                        Size = UDim2.fromOffset(120, 0), 
                        AutomaticSize = Enum.AutomaticSize.Y, 
                        Title = "OnlyTwentyCharacters"
                    })
                });
            end
        }
    }
};
