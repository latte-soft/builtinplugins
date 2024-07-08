local l_script_FirstAncestor_0 = script:FindFirstAncestor("AvatarCompatibilityPreviewer");
local v1 = require(l_script_FirstAncestor_0.Packages.Framework);
local v2 = require(l_script_FirstAncestor_0.Packages.React);
local v3 = require(script.EquippedItemPreview);
local v4 = require(script.Parent.ResetCameraButton);
local v5 = require(l_script_FirstAncestor_0.Src.Components.DraggableTileList);
local v6 = require(l_script_FirstAncestor_0.Src.Util.EquipmentStateContext);
local v7 = require(l_script_FirstAncestor_0.Src.Util.getItemAccessoryType);
local v8 = require(l_script_FirstAncestor_0.Src.Util.DEPRECATED_isLayeredClothing);
local _ = require(l_script_FirstAncestor_0.Src.Resources.Theme);
local _ = require(l_script_FirstAncestor_0.Src.Types);
local v11 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagAvatarPreviewerEquippedHoverMenu);
local v12 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagAvatarPreviewerClothingTypeIcons);
local l_UI_0 = v1.UI;
local l_Pane_0 = l_UI_0.Pane;
local l_ScrollingFrame_0 = l_UI_0.ScrollingFrame;
local l_LayoutOrderIterator_0 = v1.Util.LayoutOrderIterator;
local l_Analytics_0 = v1.ContextServices.Analytics;
local l_Stylizer_0 = v1.ContextServices.Stylizer;
return function(v19)
    local v20 = l_Analytics_0:use();
    local v21 = l_Stylizer_0:use("EquippedItemsSidebar");
    local v22 = v2.useContext(v6);
    local v23 = {};
    local v24 = {};
    local v25 = l_LayoutOrderIterator_0.new();
    for _, v27 in v22.equippedItems, nil, nil do
        if not if not v12() then v8(v27) else v7(v27) == "layered" then
            table.insert(v24, v2.createElement(v3, {
                ItemData = v27, 
                LayoutOrder = v25:getNextOrder(), 
                Size = v21.CellSize
            }));
        else
            table.insert(v23, 1, v27);
        end;
    end;
    local _ = UDim2.fromOffset(v21.CellSize.X.Offset, v21.CellSize.Y.Offset * #v23);
    local v29, v30 = v2.useState(Vector2.new());
    return v2.createElement(l_Pane_0, {
        AnchorPoint = Vector2.new(1, 1), 
        Position = UDim2.fromScale(1, 1) - v21.PositionOffset, 
        Size = v21.Size, 
        Layout = Enum.FillDirection.Vertical, 
        Spacing = v21.SidebarSpacing
    }, {
        Contents = v2.createElement(l_Pane_0, {
            AutomaticSize = Enum.AutomaticSize.Y, 
            HorizontalAlignment = Enum.HorizontalAlignment.Right, 
            Layout = Enum.FillDirection.Vertical, 
            Spacing = v21.SidebarSpacing, 
            [v2.Change.AbsoluteSize] = function(v31)
                v30(v31.AbsoluteSize);
            end
        }, {
            ResetCameraButton = v2.createElement(v4, {
                LayoutOrder = v25:getNextOrder()
            }), 
            LayeredClothingEquipment = v2.createElement(v5, {
                cellSize = v21.CellSize, 
                layoutOrder = v25:getNextOrder(), 
                tiles = v23, 
                render = function(v32, v33)
                    local v34 = v2.createElement(v3, {
                        ItemData = v32, 
                        Size = UDim2.fromScale(1, 1), 
                        IsDragging = v33
                    });
                    if not v11() then
                        return v34, (tostring(v32));
                    else
                        return v34, tostring(v32.palette) .. "/" .. tostring(v32.item);
                    end;
                end, 
                move = v2.useCallback(function(v35, v36)
                    v20:report("changedLayers");
                    v19.OnClothingLayerOrderChanged((#v23 - v35) + 1, (#v23 - v36) + 1);
                end, {
                    v19.OnClothingLayerOrderChanged, 
                    #v23
                })
            })
        }), 
        OtherEquipment = v2.createElement(l_ScrollingFrame_0, {
            AutomaticSize = Enum.AutomaticSize.X, 
            AutoSizeCanvas = false, 
            AutomaticCanvasSize = Enum.AutomaticSize.Y, 
            HorizontalAlignment = if not v11() then nil else Enum.HorizontalAlignment.Right, 
            LayoutOrder = v25:getNextOrder(), 
            Layout = Enum.FillDirection.Vertical, 
            Spacing = v21.ItemSpacing, 
            Size = if not v11() then UDim2.new(0, v21.CellSize.X.Offset, 1, -v29.Y) else UDim2.new(0, v21.CellSize.X.Offset + v21.FrameSizeOffset, 1, -v29.Y), 
            ScrollingFrameSize = if not v11() then nil else UDim2.new(0, v21.ScrollingFrameSizeOffset, 1, 0)
        }, v24)
    });
end;
