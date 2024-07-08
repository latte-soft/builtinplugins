local l_script_FirstAncestor_0 = script:FindFirstAncestor("AvatarCompatibilityPreviewer");
local v1 = require(l_script_FirstAncestor_0.Packages.Dash);
local v2 = require(l_script_FirstAncestor_0.Packages.Framework);
local v3 = require(l_script_FirstAncestor_0.Packages.React);
local v4 = require(l_script_FirstAncestor_0.Packages.UGCValidation);
local v5 = require(l_script_FirstAncestor_0.Src.Components.DisambiguationMenu.DisambiguationMenuEntry);
local v6 = require(l_script_FirstAncestor_0.Src.Components.DisambiguationMenu.getChoosableAssetTypes);
local _ = require(l_script_FirstAncestor_0.Src.Resources.Theme);
local _ = require(l_script_FirstAncestor_0.Src.Types);
local l_UI_0 = v2.UI;
local l_Pane_0 = l_UI_0.Pane;
local l_SelectInput_0 = l_UI_0.SelectInput;
local l_LayoutOrderIterator_0 = v2.Util.LayoutOrderIterator;
local l_Localization_0 = v2.ContextServices.Localization;
local l_Stylizer_0 = v2.ContextServices.Stylizer;
return function(v15)
    local v16 = l_Localization_0:use();
    local v17 = l_Stylizer_0:use("DisambiguationMenu");
    local v18 = l_LayoutOrderIterator_0.new();
    local v19 = v15.MeshPart:FindFirstChildWhichIsA("WrapLayer") ~= nil;
    local v20, v21 = v6();
    for _, v23 in v20, nil, nil do
        v23.Label = v16:getText("AssetType", v23.Label);
    end;
    table.sort(v20, function(v24, v25)
        return v24.Label < v25.Label;
    end);
    table.insert(v20, 1, {
        Id = "Ignore", 
        Label = v16:getText("DisambiguationMenu", "Ignore")
    });
    local v26 = nil;
    if v15.Assignment ~= nil and v15.Assignment.assetType ~= nil then
        local function _(v27)
            return v16:getText("DisambiguationMenu", v27, {
                name = v16:getText("AssetType", v15.Assignment.assetType.Name)
            });
        end;
        if not v19 or v4.util.isLayeredClothingAllowed(v15.Assignment.assetType) then
            if not (v19 or v4.util.isRigidAccessoryAllowed(v15.Assignment.assetType)) then
                v26 = v16:getText("DisambiguationMenu", "LoneMeshPartBadMarketplaceRigidAccessories", {
                    name = v16:getText("AssetType", v15.Assignment.assetType.Name)
                });
            end;
        else
            v26 = v16:getText("DisambiguationMenu", "LoneMeshPartBadMarketplaceLayeredClothing", {
                name = v16:getText("AssetType", v15.Assignment.assetType.Name)
            });
        end;
    end;
    local l_createElement_0 = v3.createElement;
    local l_v5_0 = v5;
    local v31 = {
        Instance = v15.MeshPart, 
        Name = v15.MeshPart.Name, 
        Subtitle = if not v19 then v16:getText("DisambiguationMenu", "RigidAccessory") else v16:getText("DisambiguationMenu", "LayeredClothing"), 
        WarningText = v26, 
        LayoutOrder = v15.LayoutOrder
    };
    local l_createElement_1 = v3.createElement;
    local l_l_Pane_0_0 = l_Pane_0;
    local v34 = {
        AutomaticSize = Enum.AutomaticSize.XY, 
        Layout = Enum.FillDirection.Horizontal, 
        Spacing = v17.HorizontalSpacing
    };
    local v35 = {};
    local l_Assignment_0 = v15.Assignment;
    if l_Assignment_0 then
        l_Assignment_0 = false;
        if v15.Assignment.assetType ~= nil then
            l_Assignment_0 = false;
            if #v21[v15.Assignment.assetType] > 1 then
                l_Assignment_0 = not v19 and v3.createElement(l_SelectInput_0, {
                    LayoutOrder = v18:getNextOrder(), 
                    Width = v17.AttachmentDropdownWidth, 
                    SelectedId = v15.Assignment.attachmentName, 
                    Items = v1.map(v21[v15.Assignment.assetType], function(v37)
                        return {
                            Id = v37.attachmentName, 
                            Label = v16:getText("AccessoryAttachment", v37.label)
                        };
                    end), 
                    OnItemActivated = function(v38)
                        local v39 = table.clone(v15.Assignment);
                        v39.attachmentName = v38.Id;
                        v15.SetAssignment(v39);
                    end
                });
            end;
        end;
    end;
    v35.AttachmentDropdown = l_Assignment_0;
    v35.AssetTypeDropdown = v3.createElement(l_SelectInput_0, {
        LayoutOrder = v18:getNextOrder(), 
        PlaceholderText = v16:getText("DisambiguationMenu", "AssetTypeDropdownPlaceholder"), 
        Width = v17.DropdownWidth, 
        SelectedId = (v15.Assignment ~= nil and v15.Assignment.assetType == nil) and "Ignore" or if v15.Assignment ~= nil and v15.Assignment.assetType ~= nil then v15.Assignment.assetType.Name else nil, 
        Items = v20, 
        OnItemActivated = function(v40)
            v15.SetAssignment({
                meshPart = v15.MeshPart, 
                assetType = if v40.Id == "Ignore" then nil else Enum.AssetType[v40.Id], 
                attachmentName = v40.Id == "Ignore" and "Ignore" or v21[Enum.AssetType[v40.Id]][1].attachmentName
            });
        end
    });
    return l_createElement_0(l_v5_0, v31, l_createElement_1(l_l_Pane_0_0, v34, v35));
end;
