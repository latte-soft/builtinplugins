local l_script_FirstAncestor_0 = script:FindFirstAncestor("AvatarCompatibilityPreviewer");
local v1 = require(l_script_FirstAncestor_0.Packages.Dash);
local v2 = require(l_script_FirstAncestor_0.Packages.Framework);
local v3 = require(l_script_FirstAncestor_0.Packages.React);
local v4 = require(l_script_FirstAncestor_0.Src.Components.AvatarScreenContext);
local v5 = require(l_script_FirstAncestor_0.Src.Resources.BuiltinItems);
local v6 = require(l_script_FirstAncestor_0.Src.Components.ItemDataPreview);
local v7 = require(l_script_FirstAncestor_0.Src.Util.EquipmentStateContext);
local v8 = require(l_script_FirstAncestor_0.Src.Util.equippedItemDataEquals);
local v9 = require(l_script_FirstAncestor_0.Src.Util.find);
local v10 = require(l_script_FirstAncestor_0.Src.Util.getItemAccessoryType);
local v11 = require(l_script_FirstAncestor_0.Src.Hooks.useItemName);
local v12 = require(l_script_FirstAncestor_0.Src.Hooks.useToggleState);
local v13 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagAvatarPreviewerClothingTypeIcons);
local v14 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagAvatarPreviewerEditingTools)();
local _ = require(l_script_FirstAncestor_0.Src.Resources.Theme);
local _ = require(l_script_FirstAncestor_0.Src.Types);
local l_UI_0 = v2.UI;
local l_Button_0 = l_UI_0.Button;
local l_Image_0 = l_UI_0.Image;
local l_TextLabel_0 = l_UI_0.TextLabel;
local l_Pane_0 = l_UI_0.Pane;
local l_showContextMenu_0 = l_UI_0.showContextMenu;
local l_Analytics_0 = v2.ContextServices.Analytics;
local l_Localization_0 = v2.ContextServices.Localization;
local l_StyleModifier_0 = v2.Util.StyleModifier;
local l_Stylizer_0 = v2.ContextServices.Stylizer;
local function v33(v27)
    assert(v13(), "FFlagAvatarPreviewerClothingTypeIcons not enabled");
    if #v27.palette.Items == 1 then
        return nil;
    else
        local function v29(v28)
            return v10({
                palette = v27.palette, 
                item = {
                    source = "builtin", 
                    builtinItem = v28
                }
            }) == "layered";
        end;
        local v30 = v29(v27.palette.Items[1]);
        local v31 = false;
        for v32 = 2, #v27.palette.Items do
            if v29(v27.palette.Items[v32]) ~= v30 then
                v31 = true;
                break;
            end;
        end;
        if v31 then
            return v10(v27);
        else
            return nil;
        end;
    end;
end;
return function(v34)
    local v35 = l_Analytics_0:use();
    local v36 = l_Stylizer_0:use("CatalogItemButton");
    local v37 = if not v14 then nil else v3.useContext(v4.Context);
    local v38 = v3.useContext(v7);
    local v39 = l_Localization_0:use();
    local v40 = v3.useCallback(function()
        v35:report("equipItem", v34.ItemData);
        v38.addEquippedItem(v34.ItemData);
    end, {
        v38.addEquippedItem, 
        v34.ItemData
    });
    local v41 = v3.useCallback(function()
        v35:report("unequipItem", v34.ItemData);
        v38.removeEquippedItem(v34.ItemData);
    end, {
        v38.removeEquippedItem, 
        v34.ItemData
    });
    local v43 = v3.useMemo(function()
        return v1.find(v38.equippedItems, function(v42)
            return v8(v42, v34.ItemData);
        end);
    end, {
        v34.ItemData, 
        v38.equippedItems
    });
    local v44 = v11(v34.ItemData);
    local v45 = v12(false);
    local v46 = true;
    if v34.ItemData.palette.Key ~= "BodyRangeOfMotion" then
        v46 = true;
        if v34.ItemData.palette.Key ~= "Movement" then
            v46 = v34.ItemData.palette.Key == "BodyEmotes";
        end;
    end;
    local v47 = if not v13() then nil else v33(v34.ItemData);
    local v50 = v3.useCallback(function(_, v49)
        if not v34.IsUserProvided or v49.UserInputType ~= Enum.UserInputType.MouseButton2 then
            return ;
        else
            l_showContextMenu_0(l_script_FirstAncestor_0.Parent, {
                {
                    Text = v39:getText("CatalogContextMenu", "DeleteItem"), 
                    OnItemClicked = v34.Delete
                }, 
                {
                    Text = v39:getText("CatalogContextMenu", "DeleteAllItems"), 
                    OnItemClicked = v34.DeleteAll
                }
            });
            return ;
        end;
    end, {
        v34.ItemData
    });
    local v51 = false;
    if ((v14 and #v37.focusedAttachments ~= nil) and v34.ItemData.item.source == "builtin") and typeof(v34.ItemData.item.builtinItem) == "number" then
        local v53 = v9(v5.allItems, function(v52)
            return v52.id == v34.ItemData.item.builtinItem;
        end);
        local v54 = false;
        if v53 ~= nil then
            v54 = false;
            if v53.attachment ~= nil then
                v54 = table.find(v37.focusedAttachments, v53.attachment) ~= nil;
            end;
        end;
        v51 = v54;
    end;
    local l_createElement_0 = v3.createElement;
    local l_l_Button_0_0 = l_Button_0;
    local v57 = {
        LayoutOrder = v34.LayoutOrder, 
        Size = v34.Size, 
        OnClick = if not v43 then v40 else v41, 
        Style = if not v14 then v43 and "RoundActive" or "Round" else v43 and "RoundActive" or (v51 and "RoundHighlighted" or "Round"), 
        Tooltip = if v46 then nil else v44
    };
    local v58 = {};
    local l_createElement_1 = v3.createElement;
    local l_l_Pane_0_0 = l_Pane_0;
    local v61 = {
        [v3.Event.InputBegan] = v50, 
        [v3.Event.MouseEnter] = v45.enable, 
        [v3.Event.MouseLeave] = v45.disable
    };
    local v62 = {
        ItemNamePadding = if not not v44 and v46 then v3.createElement("UIPadding", {
            PaddingBottom = v36.ItemNamePaddingBottom
        }) else nil, 
        Preview = v3.createElement(v6, {
            ItemData = v34.ItemData, 
            Selected = v43
        })
    };
    local v63 = false;
    if v34.Delete ~= nil then
        v63 = v45.enabled and v3.createElement(l_Pane_0, {
            AnchorPoint = v36.HoverX.AnchorPoint, 
            Position = v36.HoverX.Position, 
            Size = v36.HoverX.Size
        }, {
            RemoveButton = v3.createElement(l_Button_0, {
                StyleModifier = l_StyleModifier_0.Hover, 
                OnClick = v34.Delete
            }, {
                HoverX = v3.createElement(l_Image_0, {
                    Image = v36.HoverX.Image, 
                    Size = UDim2.fromScale(1, 1)
                })
            })
        });
    end;
    v62.HoverX = v63;
    v63 = v13();
    if v63 then
        v63 = false;
        if v47 ~= nil then
            v63 = v3.createElement(l_Pane_0, {
                AnchorPoint = v36.AccessoryTypeImage.AnchorPoint, 
                Position = v36.AccessoryTypeImage.Position, 
                Size = v36.AccessoryTypeImage.Size
            }, {
                Image = v3.createElement(l_Image_0, {
                    Image = if v47 == "layered" then v36.AccessoryTypeImage.LayeredImage else v36.AccessoryTypeImage.RigidImage, 
                    ImageColor3 = v36.AccessoryTypeImage.Color, 
                    Size = UDim2.fromScale(1, 1)
                })
            });
        end;
    end;
    v62.AccessoryTypeImage = v63;
    v62.UserImage = v34.IsUserProvided and v3.createElement(l_Pane_0, {
        AnchorPoint = v36.UserImage.AnchorPoint, 
        Position = v36.UserImage.Position, 
        Size = v36.UserImage.Size
    }, {
        UserImage = v3.createElement(l_Image_0, {
            Image = v36.UserImage.Image, 
            ImageColor3 = v36.UserImage.Color, 
            Size = UDim2.fromScale(1, 1)
        })
    });
    v58.Contents = l_createElement_1(l_l_Pane_0_0, v61, v62);
    v58.ItemName = if not not v44 and v46 then v3.createElement(l_TextLabel_0, {
        Text = v44, 
        TextWrapped = true, 
        TextXAlignment = Enum.TextXAlignment.Left, 
        TextYAlignment = Enum.TextYAlignment.Bottom, 
        ZIndex = 2
    }, {
        Padding = v3.createElement("UIPadding", {
            PaddingLeft = UDim.new(0, 3)
        })
    }) else nil;
    return l_createElement_0(l_l_Button_0_0, v57, v58);
end;
