local l_script_FirstAncestor_0 = script:FindFirstAncestor("AssetManager");
local v1 = require(l_script_FirstAncestor_0.Packages.React);
local v2 = require(l_script_FirstAncestor_0.Packages.Framework);
local l_Localization_0 = v2.ContextServices.Localization;
local l_UI_0 = v2.UI;
local l_Pane_0 = l_UI_0.Pane;
local l_SelectInput_0 = l_UI_0.SelectInput;
local l_Image_0 = l_UI_0.Image;
local l_ViewTypeSelector_0 = l_UI_0.ViewTypeSelector;
local v9 = require(script.FilterItem);
local v10 = require(l_script_FirstAncestor_0.Src.Controllers.ItemsController);
local l_useState_0 = v1.useState;
local v12 = require(l_script_FirstAncestor_0.Src.Hooks.useLayoutInfo);
local v13 = require(l_script_FirstAncestor_0.Src.Types);
local l_AssetInfoField_0 = v13.AssetInfoField;
local v15 = require(script.styles);
local v16 = require(l_script_FirstAncestor_0.Src.Util.Images);
local l_LayoutOrderIterator_0 = v2.Util.LayoutOrderIterator;
return function(v18)
    local v19 = l_LayoutOrderIterator_0.new();
    local v20 = l_Localization_0.use();
    local v21 = v10.use();
    local v22, v23 = l_useState_0(nil);
    local v24, v25 = l_useState_0(nil);
    local function v30(v26, v27, v28, v29)
        return v1.createElement(v9, {
            FilterType = v26, 
            Item = v27, 
            LayoutOrder = v28, 
            Activated = v29
        });
    end;
    local v31 = v12(v21);
    local function _(v32, v33)
        if not v32 then
            v32 = v31.GridSize;
        end;
        if not v33 then
            v33 = v31.ViewType;
        end;
        v21:setLayout({
            GridSize = v32, 
            ViewType = v33
        });
    end;
    return v1.createElement(l_Pane_0, {
        LayoutOrder = v18.LayoutOrder, 
        [v1.Tag] = "HeaderOptions X-Right X-RowM X-Middle X-PadS"
    }, {
        CreatorFilter = v1.createElement(l_SelectInput_0, {
            LayoutOrder = v19:getNextOrder(), 
            PlaceholderText = v20:getText("Filters", "Owner"), 
            SelectedIndex = v24, 
            Items = v21:getOwners(), 
            OnItemActivated = function(v35, v36)
                v25(v36);
                v21:addFilter(l_AssetInfoField_0.Owner, {
                    [v35] = true
                });
            end, 
            OnRenderItem = function(v37, v38, v39)
                return v30(l_AssetInfoField_0.Owner, v37, v38, v39);
            end, 
            UseAutoWidth = true, 
            TextTruncate = Enum.TextTruncate.AtEnd, 
            Size = v15:GetAttribute("FilterSize"), 
            [v1.Tag] = ""
        }), 
        AssetTypeFilter = v1.createElement(l_SelectInput_0, {
            LayoutOrder = v19:getNextOrder(), 
            PlaceholderText = v20:getText("Filters", "AssetTypes"), 
            SelectedIndex = v22, 
            Items = v13.getEnumAsList(v13.AssetType), 
            OnItemActivated = function(v40, v41)
                v23(v41);
                v21:addFilter(l_AssetInfoField_0.AssetType, {
                    [v40] = true
                });
            end, 
            OnRenderItem = function(v42, v43, v44)
                return v30(l_AssetInfoField_0.AssetType, v42, v43, v44);
            end, 
            UseAutoWidth = true, 
            TextTruncate = Enum.TextTruncate.AtEnd, 
            Size = v15:GetAttribute("FilterSize"), 
            [v1.Tag] = ""
        }), 
        ClearFiltersButton = v1.createElement(l_Pane_0, {
            LayoutOrder = v19:getNextOrder(), 
            OnClick = function()
                v21:clearFilters();
                v25(nil);
                v23(nil);
            end, 
            [v1.Tag] = "ClearFilter"
        }, {
            ClearFiltersIcon = v1.createElement(l_Image_0, {
                Image = v16.CLEAR_ICON, 
                [v1.Tag] = "FilterImage"
            })
        }), 
        ViewTypeSelector = v1.createElement(l_ViewTypeSelector_0, {
            LayoutOrder = v19:getNextOrder(), 
            OnGridTileSizeChanged = function(v45)
                local l_v45_0 = v45;
                local v47 = nil;
                if not l_v45_0 then
                    l_v45_0 = v31.GridSize;
                end;
                if not v47 then
                    v47 = v31.ViewType;
                end;
                v21:setLayout({
                    GridSize = l_v45_0, 
                    ViewType = v47
                });
            end, 
            OnViewTypeSelected = function(v48)
                local v49 = nil;
                local v50 = v13.ViewType.fromRawValue(v48.rawValue());
                if not v49 then
                    v49 = v31.GridSize;
                end;
                if not v50 then
                    v50 = v31.ViewType;
                end;
                v21:setLayout({
                    GridSize = v49, 
                    ViewType = v50
                });
            end, 
            Default = v31.ViewType.rawValue(), 
            DefaultGridTileSize = v31.GridSize, 
            [v1.Tag] = "IconOnly"
        })
    });
end;
