local l_script_FirstAncestor_0 = script:FindFirstAncestor("Toolbox");
local v1 = require(l_script_FirstAncestor_0.Packages.React);
local v2 = require(l_script_FirstAncestor_0.Packages.Framework);
local v3 = require(l_script_FirstAncestor_0.Core.Components.DropdownMenu);
local _ = require(l_script_FirstAncestor_0.Core.Util.AssetConfigUtil);
local l_Stylizer_0 = v2.ContextServices.Stylizer;
local l_Pane_0 = v2.UI.Pane;
local l_TitledFrame_0 = v2.UI.TitledFrame;
local l_ContextServices_0 = v2.ContextServices;
local _ = require(l_script_FirstAncestor_0.Core.Types.MarketplaceFiatServiceTypes);
local v10 = require(l_script_FirstAncestor_0.Core.Util.FiatUtil);
return function(v11)
    local _ = l_Stylizer_0:use();
    local v13 = l_ContextServices_0.Localization:use();
    local v16, v17 = v1.useState(function()
        for v14, v15 in v11.BasePrices, nil, nil do
            if (v15.BasePriceMoney.currencyCode == v11.InitialBaseMoney.currencyCode and v15.BasePriceMoney.quantity.significand == v11.InitialBaseMoney.quantity.significand) and v15.BasePriceMoney.quantity.exponent == v11.InitialBaseMoney.quantity.exponent then
                return v14;
            end;
        end;
        return 1;
    end);
    return v1.createElement(l_Pane_0, {
        LayoutOrder = v11.LayoutOrder, 
        Size = UDim2.new(1, 0, 0, v11.TotalHeight)
    }, {
        TitledFrame = v1.createElement(l_TitledFrame_0, {
            Title = v13:getText("General", "SalesPrice"), 
            TitleWidth = 165
        }, {
            FiatPriceDropdown = v1.createElement(v3, {
                fontSize = 20, 
                items = v1.useMemo(function()
                    local v18 = {};
                    for v19, v20 in v11.BasePrices, nil, nil do
                        v18[v19] = {
                            name = v10.displayStringFromMoney(v20.BasePriceMoney, v13), 
                            selectable = v11.Selectable
                        };
                    end;
                    return v18;
                end, {
                    v13, 
                    v11.BasePrices, 
                    v11.Selectable
                }), 
                onItemClicked = v1.useCallback(function(v21)
                    v11.OnPriceSelected(v11.BasePrices[v21].BasePriceMoney);
                    v17(v21);
                end, {
                    v11.BasePrices
                }), 
                rowHeight = 24, 
                selectedDropDownIndex = v16, 
                Size = UDim2.new(0, 225, 0, 40), 
                visibleDropDownCount = 6
            })
        })
    });
end;
