local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Src.Util.KeyProvider);
local l_getCopyIdKeyName_0 = v1.getCopyIdKeyName;
local l_getEditKeyName_0 = v1.getEditKeyName;
local l_StudioService_0 = game:GetService("StudioService");
local v5 = require(l_Parent_0.Packages.Roact);
local v6 = require(l_Parent_0.Packages.Framework);
local l_GetTextSize_0 = v6.Util.GetTextSize;
local l_UI_0 = v6.UI;
local l_Button_0 = l_UI_0.Button;
local l_HoverArea_0 = l_UI_0.HoverArea;
local l_Pane_0 = l_UI_0.Pane;
local l_TitledFrame_0 = l_UI_0.TitledFrame;
local l_ContextServices_0 = v6.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local v15 = require(l_Parent_0.Src.Components.TableWithMenu);
local v16 = v5.PureComponent:extend(script.Name);
v16.render = function(v17)
    local l_props_0 = v17.props;
    local l_Stylizer_0 = l_props_0.Stylizer;
    local l_Localization_0 = l_props_0.Localization;
    local l_ProductList_0 = l_props_0.ProductList;
    local l_ShowTable_0 = l_props_0.ShowTable;
    local l_CreateNewDevProduct_0 = l_props_0.CreateNewDevProduct;
    local l_OnEditDevProductClicked_0 = l_props_0.OnEditDevProductClicked;
    local l_OnLoadMoreDevProducts_0 = l_props_0.OnLoadMoreDevProducts;
    local l_LayoutOrder_0 = l_props_0.LayoutOrder;
    local v27 = l_Localization_0:getText("General", "ButtonCreate");
    local v28 = l_GetTextSize_0(v27, l_Stylizer_0.fontStyle.Normal.TextSize, l_Stylizer_0.fontStyle.Normal.Font);
    return v5.createElement(l_Pane_0, {
        AutomaticSize = Enum.AutomaticSize.XY, 
        Layout = Enum.FillDirection.Vertical, 
        LayoutOrder = l_LayoutOrder_0, 
        Spacing = l_Stylizer_0.devProducts.headerPadding
    }, {
        DevProductsTitle = v5.createElement(l_TitledFrame_0, {
            LayoutOrder = 1, 
            Title = l_Localization_0:getText("Monetization", "DevProducts")
        }, {
            Padding = v5.createElement("UIPadding", {
                PaddingRight = UDim.new(0, l_Stylizer_0.devProducts.titlePadding)
            }), 
            Layout = v5.createElement("UIListLayout", {
                HorizontalAlignment = Enum.HorizontalAlignment.Right, 
                VerticalAlignment = Enum.VerticalAlignment.Center
            }), 
            CreateButton = v5.createElement(l_Button_0, {
                Style = "GameSettingsPrimaryButton", 
                Text = v27, 
                Size = UDim2.new(0, v28.X + l_Stylizer_0.createButton.PaddingX, 0, v28.Y + l_Stylizer_0.createButton.PaddingY), 
                LayoutOrder = 2, 
                OnClick = function()
                    l_CreateNewDevProduct_0();
                end
            }, {
                v5.createElement(l_HoverArea_0, {
                    Cursor = "PointingHand"
                })
            })
        }), 
        DeveloperProductTable = l_ShowTable_0 and v5.createElement(v15, {
            Headers = {
                l_Localization_0:getText("Monetization", "ProductID"), 
                l_Localization_0:getText("Monetization", "ProductName"), 
                l_Localization_0:getText("Monetization", "PriceTitle")
            }, 
            Data = l_ProductList_0, 
            MenuItems = {
                {
                    Key = l_getEditKeyName_0(), 
                    Text = l_Localization_0:getText("General", "ButtonEdit")
                }, 
                {
                    Key = l_getCopyIdKeyName_0(), 
                    Text = l_Localization_0:getText("General", "CopyIDToClipboard")
                }
            }, 
            MenuItemsFilterFunc = function(v29, v30)
                if not tonumber(v29.row[1]) then
                    local v31 = nil;
                    for v32, v33 in pairs(v30) do
                        if v33.Key == l_getCopyIdKeyName_0() then
                            v31 = v32;
                            break;
                        end;
                    end;
                    v30[v31] = nil;
                end;
            end or nil, 
            OnItemClicked = function(v34, v35)
                if v34 == l_getEditKeyName_0() then
                    l_OnEditDevProductClicked_0(v35);
                    return ;
                elseif v34 == l_getCopyIdKeyName_0() then
                    l_StudioService_0:CopyToClipboard(v35);
                    return ;
                else
                    error("Invalid Key");
                    return ;
                end;
            end, 
            LayoutOrder = 2, 
            NextPageFunc = l_OnLoadMoreDevProducts_0
        })
    });
end;
return (l_withContext_0({
    Localization = l_ContextServices_0.Localization, 
    Stylizer = l_ContextServices_0.Stylizer
})(v16));
