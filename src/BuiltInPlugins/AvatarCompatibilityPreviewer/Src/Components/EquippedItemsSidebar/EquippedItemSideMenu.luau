local l_script_FirstAncestor_0 = script:FindFirstAncestor("AvatarCompatibilityPreviewer");
local v1 = require(l_script_FirstAncestor_0.Packages.Framework);
local v2 = require(l_script_FirstAncestor_0.Packages.React);
local v3 = require(l_script_FirstAncestor_0.Src.Hooks.useAggressiveHoverEndState);
local v4 = require(l_script_FirstAncestor_0.Src.Hooks.useToggleState);
local v5 = require(l_script_FirstAncestor_0.Src.Util.DEPRECATED_AvatarScreenContext);
local v6 = require(l_script_FirstAncestor_0.Src.Components.AvatarScreenContext);
local v7 = require(l_script_FirstAncestor_0.Src.Util.EquipmentStateContext);
local _ = require(l_script_FirstAncestor_0.Src.Resources.Theme);
local _ = require(l_script_FirstAncestor_0.Src.Types);
local v10 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagAvatarPreviewerSkinToneAlphaDetection);
local l_UI_0 = v1.UI;
local l_Image_0 = l_UI_0.Image;
local l_Pane_0 = l_UI_0.Pane;
local l_showContextMenu_0 = l_UI_0.showContextMenu;
local l_Localization_0 = v1.ContextServices.Localization;
local l_Stylizer_0 = v1.ContextServices.Stylizer;
return function(v17)
    local v18 = l_Localization_0:use();
    local v19 = l_Stylizer_0:use("EquippedItemSideMenu");
    local v20 = v2.useContext(if not v10() then v5 else v6.Context);
    local v21 = v2.useContext(v7);
    local v22, v23 = v2.useState(false);
    local v24 = v4(false);
    local v25 = v4(false);
    local v26 = v2.useRef(nil);
    local v27 = v3(v26);
    local v28 = v2.useCallback(function()
        v20.openPalette(v17.ItemData.palette.Key);
    end, {
        v17.ItemData, 
        v20.openPalette
    });
    local v29 = v2.useCallback(function()
        v21.hideEquippedItem(v17.ItemData);
    end, {
        v17.ItemData, 
        v21.hideEquippedItem
    });
    local v30 = v2.useCallback(function()
        v21.showEquippedItem(v17.ItemData);
    end, {
        v17.ItemData, 
        v21.showEquippedItem
    });
    local v32 = v2.useCallback(function(v31)
        return v21.setHideAllEquippedItems(true, {
            v31
        });
    end, {
        v21.setHideAllEquippedItems
    });
    local v34 = v2.useCallback(function(v33)
        return v21.setHideAllEquippedItems(false, {
            v33
        });
    end, {
        v21.setHideAllEquippedItems
    });
    local v39 = v2.useCallback(function(v35, v36)
        for _, v38 in v21.equippedItems, nil, nil do
            if v38 ~= v36 and v35 ~= (v38.isHidden or false) then
                return false;
            end;
        end;
        return true;
    end, {
        v21.equippedItems
    });
    local v40 = v2.useCallback(function()
        v21.removeEquippedItem(v17.ItemData);
    end, {
        v17.ItemData, 
        v21.removeEquippedItem
    });
    local v43 = v2.useCallback(function(_, v42)
        if v42.UserInputType == Enum.UserInputType.MouseButton1 then
            if not v42:IsModifierKeyDown(Enum.ModifierKey.Shift) then
                if not v42:IsModifierKeyDown(Enum.ModifierKey.Alt) then
                    if not v17.ItemData.isHidden then
                        v29();
                        return ;
                    else
                        v30();
                        return ;
                    end;
                elseif not v17.ItemData.isHidden then
                    if not v39(true, v17.ItemData) then
                        v32(v17.ItemData);
                        return ;
                    else
                        v34();
                        return ;
                    end;
                elseif not v39(false, v17.ItemData) then
                    v34(v17.ItemData);
                    return ;
                else
                    v32();
                    return ;
                end;
            elseif not v17.ItemData.isHidden then
                if not v39(false) then
                    v34();
                    return ;
                else
                    v32();
                    return ;
                end;
            elseif not v39(true) then
                v32();
                return ;
            else
                v34();
                return ;
            end;
        else
            if v42.UserInputType == Enum.UserInputType.MouseMovement then
                v23(true);
            end;
            return ;
        end;
    end, {
        v17.ItemData.isHidden, 
        v30, 
        v29, 
        v34, 
        v32
    });
    local v46 = v2.useCallback(function(_, v45)
        if v45.UserInputType == Enum.UserInputType.MouseMovement then
            v23(false);
        end;
    end, {});
    local function v47()
        v25.enable();
        l_showContextMenu_0(l_script_FirstAncestor_0.Parent, {
            {
                Text = v18:getText("EquippedItemContextMenu", "OpenPalette", {
                    palette = v18:getText("AssetPalettes", v17.ItemData.palette.Key)
                }), 
                OnItemClicked = v28
            }, 
            {
                ShowSeparator = true
            }, 
            {
                Text = if not v17.ItemData.isHidden then v18:getText("EquippedItemContextMenu", "HideItem") else v18:getText("EquippedItemContextMenu", "ShowItem"), 
                OnItemClicked = if not v17.ItemData.isHidden then v29 else v30
            }, 
            {
                Text = v18:getText("EquippedItemContextMenu", "HideAllItems"), 
                OnItemClicked = v32
            }, 
            {
                Text = v18:getText("EquippedItemContextMenu", "ShowAllItems"), 
                OnItemClicked = v34
            }, 
            {
                ShowSeparator = true
            }, 
            {
                Text = v18:getText("EquippedItemContextMenu", "UnequipItem"), 
                OnItemClicked = v40
            }, 
            {
                Text = v18:getText("EquippedItemContextMenu", "UnequipAllItems"), 
                OnItemClicked = v21.removeAllEquippedItems
            }
        });
        v25.disable();
    end;
    v2.useEffect(function()
        if v27.isHovered then
            v20.incrementDummyPreviewLock();
            return function()
                v20.decrementDummyPreviewLock();
            end;
        else
            return nil;
        end;
    end, {
        v27.isHovered
    });
    if not (v17.tileHovered or v27.isHovered) and not v25.enabled then
        if not v17.ItemData.isHidden then
            return nil;
        else
            return (v2.createElement(l_UI_0.Image, {
                Style = "EquippedItemDisabledBackground", 
                AnchorPoint = Vector2.new(-0.5, 0), 
                Position = UDim2.new(-0.5, 0, 0, v19.Margin), 
                Size = UDim2.fromScale(0.5, 0.5)
            }, {
                HideShowPane = v2.createElement(l_Pane_0, {
                    AnchorPoint = Vector2.new(0, 0), 
                    Position = UDim2.fromScale(0, 0), 
                    Layout = Enum.FillDirection.Vertical, 
                    [v2.Event.MouseEnter] = v27.hover
                }, {
                    HideShowIcon = v2.createElement(l_UI_0.Image, {
                        Style = "EquippedItemUnhideIcon", 
                        Size = UDim2.fromOffset(v19.IconSize, v19.IconSize)
                    })
                })
            }));
        end;
    else
        return (v2.createElement(l_Image_0, {
            Style = "EquippedItemHoverMenuBackground", 
            AnchorPoint = Vector2.new(-0.5, 0), 
            Position = UDim2.new(-0.5, 0, 0, v19.Margin), 
            Size = UDim2.new(0.5, 0, 1, -v19.Margin)
        }, {
            Container = v2.createElement(l_Pane_0, {
                Layout = Enum.FillDirection.Vertical, 
                Spacing = 8, 
                ref = v26, 
                [v2.Event.MouseEnter] = v27.hover
            }, {
                HideShowPane = v2.createElement(l_Pane_0, {
                    AnchorPoint = Vector2.new(0, 0), 
                    Position = UDim2.fromScale(0, 0), 
                    AutomaticSize = Enum.AutomaticSize.XY, 
                    [v2.Event.InputBegan] = v43, 
                    [v2.Event.InputEnded] = v46
                }, {
                    HideShowIcon = v2.createElement(l_Image_0, {
                        Style = if not v17.ItemData.isHidden then v22 and "EquippedItemHideHoverIcon" or "EquippedItemHideIcon" else v22 and "EquippedItemUnhideHoverIcon" or "EquippedItemUnhideIcon", 
                        Size = UDim2.fromOffset(v19.IconSize, v19.IconSize)
                    })
                }), 
                DotsPane = v2.createElement(l_Pane_0, {
                    OnClick = v47, 
                    AutomaticSize = Enum.AutomaticSize.XY, 
                    [v2.Event.MouseEnter] = v24.enable, 
                    [v2.Event.MouseLeave] = v24.disable
                }, {
                    DotsIcon = v2.createElement(l_Image_0, {
                        Style = "EquippedItemDotsIcon", 
                        ImageColor3 = if not v24.enabled then v19.DotsBackground else v19.DotsBackgroundHover, 
                        Size = UDim2.fromOffset(v19.IconSize, v19.IconSize)
                    })
                })
            })
        }));
    end;
end;
