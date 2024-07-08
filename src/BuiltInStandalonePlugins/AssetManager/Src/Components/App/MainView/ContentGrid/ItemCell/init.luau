local l_script_FirstAncestor_0 = script:FindFirstAncestor("AssetManager");
local v1 = require(l_script_FirstAncestor_0.Packages.React);
local v2 = require(l_script_FirstAncestor_0.Packages.Framework);
local l_Localization_0 = v2.ContextServices.Localization;
local l_UI_0 = v2.UI;
local l_Image_0 = l_UI_0.Image;
local l_Pane_0 = l_UI_0.Pane;
local l_TextLabel_0 = l_UI_0.TextLabel;
local v8 = require(l_script_FirstAncestor_0.Src.Controllers.ItemsController);
local v9 = require(l_script_FirstAncestor_0.Src.Controllers.PluginController);
local v10 = require(l_script_FirstAncestor_0.Src.Networking);
local v11 = require(l_script_FirstAncestor_0.Src.Hooks.useItems);
local v12 = require(l_script_FirstAncestor_0.Src.Hooks.useItemSelection);
local l_useState_0 = v1.useState;
local v14 = require(l_script_FirstAncestor_0.Src.Util.renderContextMenu);
local _ = require(l_script_FirstAncestor_0.Src.Types);
local l_DoubleClickDetector_0 = v2.Util.DoubleClickDetector;
local l_LayoutOrderIterator_0 = v2.Util.LayoutOrderIterator;
return function(v18)
    local v19 = l_useState_0(l_DoubleClickDetector_0.new());
    local v20 = l_LayoutOrderIterator_0.new();
    local v21 = l_Localization_0.use();
    local v22 = v9.use();
    local v23 = v8.use();
    local v24 = v10.use();
    local l_Cell_0 = v18.Cell;
    local v26 = v12(v23);
    local v27 = v11(v23);
    local v28 = "";
    if v26[l_Cell_0.AssetId] then
        v28 = "SelectedCell";
    end;
    return v1.createElement(l_Pane_0, {
        LayoutOrder = v18.Key, 
        Size = v18.Size, 
        Position = v18.Position, 
        OnClick = function()
            v23:handleClick(l_Cell_0.AssetId, v27, v18.Key, v19:isDoubleClick());
        end, 
        OnRightClick = function()
            v14(l_Cell_0.AssetId, v21, v22:getPlugin());
        end, 
        [v1.Tag] = "ItemCell X-Top X-Center X-ColumnS"
    }, {
        ThumbnailContainer = v1.createElement(l_Pane_0, {
            [v1.Tag] = ("ThumbnailContainer Secondary X-Corner X-Pad X-Center X-Middle %*"):format(v28)
        }, {
            Thumbnail = v1.createElement(l_Image_0, {
                LayoutOrder = v20:getNextOrder(), 
                Image = v24:getThumbnailForItem(l_Cell_0)
            })
        }), 
        TagContainer = v1.createElement(l_Pane_0, {
            LayoutOrder = v20:getNextOrder(), 
            [v1.Tag] = "TagContainer X-Column X-PadS X-Left X-Middle"
        }, {
            NameTag = v1.createElement(l_TextLabel_0, {
                AutomaticSize = Enum.AutomaticSize.XY, 
                LayoutOrder = v20:getNextOrder(), 
                Text = v18.Cell.DisplayName, 
                TextTruncate = Enum.TextTruncate.AtEnd
            }), 
            TypeTag = v1.createElement(l_TextLabel_0, {
                AutomaticSize = Enum.AutomaticSize.XY, 
                LayoutOrder = v20:getNextOrder(), 
                Text = v21:getText("AssetType", l_Cell_0.AssetType), 
                TextTruncate = Enum.TextTruncate.AtEnd, 
                [v1.Tag] = "Body"
            })
        })
    });
end;
