local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Framework);
local v2 = require(l_Parent_0.Packages.React);
local _ = require(l_Parent_0.Packages._Index.DeveloperFramework.DeveloperFramework.Types);
local l_ContextServices_0 = v1.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_Localization_0 = l_ContextServices_0.Localization;
local l_Stylizer_0 = v1.Style.Stylizer;
local l_UI_0 = v1.UI;
local l_InfiniteScrollingGrid_0 = l_UI_0.InfiniteScrollingGrid;
local l_Pane_0 = l_UI_0.Pane;
local l_Shimmer_0 = l_UI_0.Shimmer;
local l_showContextMenu_0 = l_UI_0.showContextMenu;
local _ = require(l_Parent_0.Src.Types);
local v14 = require(l_Parent_0.Src.Components.TextureItem);
local v15 = require(l_Parent_0.Src.Flags.getFFlagMaterialGeneratorNewUI);
local v16 = require(l_Parent_0.Src.Flags.getFFlagMaterialGeneratorSupportVariations2);
local v17 = v2.PureComponent:extend("TextureBrowser");
v17.init = function(v18)
    assert(not v15(), "Expected FFlagMaterialGeneratorNewUI to be false");
    v18.getItemKey = function(v19)
        if v19.Type == "Material" then
            return ("%s-%s"):format(v19.Material.Textures.ColorMap, (tostring(v19.Selected)));
        elseif v19.Type == "Shimmer" then
            return (("shimmer-%*"):format(v19.Index));
        else
            error((("Unknown item type passed to getItemKey: %*"):format(v19.Type)));
            return ;
        end;
    end;
    local function v23(v20, v21)
        local l_Material_0 = v21.Material;
        return v2.createElement(v14, {
            Image = l_Material_0.Textures.ColorMap, 
            LayoutOrder = v20, 
            OnClick = function()
                v18.props.OnMaterialSelected(l_Material_0);
            end, 
            OnRightClick = function()
                v18.showContextMenu(l_Material_0);
            end, 
            Selected = v21.Selected
        });
    end;
    local function v25(v24)
        assert(l_Shimmer_0 ~= nil, "DevFrameworkShimmer is not enabled");
        return v2.createElement(l_Shimmer_0, {
            LayoutOrder = v24.Index
        });
    end;
    v18.renderItem = function(v26, v27)
        if v27.Type == "Material" then
            return v23(v26, v27);
        elseif v27.Type == "Shimmer" then
            return v25(v27);
        else
            error((("Unknown item type passed to renderItem: %*"):format(v27.Type)));
            return ;
        end;
    end;
    v18.showContextMenu = function(v28)
        local l_props_0 = v18.props;
        local v30 = l_props_0.Plugin:get();
        local l_Localization_1 = l_props_0.Localization;
        local v32 = {
            {
                Text = l_Localization_1:getText("TextureBrowser", "Remove"), 
                Enabled = v28 ~= nil, 
                OnItemClicked = function()
                    v18.props.OnRemove(v28);
                end
            }, 
            {
                Text = l_Localization_1:getText("TextureBrowser", "RemoveAll"), 
                Enabled = #l_props_0.Materials > 0, 
                OnItemClicked = l_props_0.OnRemoveAll
            }
        };
        if v16() then
            table.insert(v32, 1, {
                Text = l_Localization_1:getText("TextureBrowser", "GenerateVariations"), 
                Enabled = v28 ~= nil, 
                OnItemClicked = function()
                    v18.props.OnGenerateVariations(v28);
                end
            });
        end;
        task.spawn(function()
            l_showContextMenu_0(v30, v32);
        end);
    end;
    v18.rightClick = function()
        v18.showContextMenu();
    end;
end;
v17.render = function(v33)
    local l_props_1 = v33.props;
    local l_TextureBrowser_0 = l_props_1.Stylizer.TextureBrowser;
    local l_CellPadding_0 = l_TextureBrowser_0.CellPadding;
    local l_CellSize_0 = l_TextureBrowser_0.CellSize;
    local l_Padding_0 = l_TextureBrowser_0.Padding;
    local v39 = {};
    for v40 = 1, l_props_1.GeneratingImages do
        table.insert(v39, {
            Type = "Shimmer", 
            Index = v40
        });
    end;
    for _, v42 in l_props_1.Materials, nil, nil do
        table.insert(v39, {
            Type = "Material", 
            Material = v42, 
            Selected = l_props_1.SelectedMaterial == v42
        });
    end;
    return v2.createElement(l_Pane_0, {
        LayoutOrder = l_props_1.LayoutOrder, 
        OnRightClick = v33.rightClick, 
        Size = l_props_1.Size
    }, {
        v2.createElement(l_InfiniteScrollingGrid_0, {
            AbsoluteMax = #l_props_1.Materials + l_props_1.GeneratingImages, 
            BackgroundTransparency = 1, 
            CellPadding = l_CellPadding_0, 
            CellSize = l_CellSize_0, 
            BufferedRows = 2, 
            GetItemKey = v33.getItemKey, 
            Items = v39, 
            Loading = false, 
            Padding = l_Padding_0, 
            RenderItem = v33.renderItem, 
            Size = UDim2.fromScale(1, 1), 
            ZIndex = 1
        })
    });
end;
return l_withContext_0({
    Localization = l_Localization_0, 
    Plugin = l_ContextServices_0.Plugin, 
    Stylizer = l_Stylizer_0
})(v17);
