local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local l_Packages_0 = l_Parent_0.Packages;
local v2 = require(l_Packages_0.Roact);
local v3 = require(l_Packages_0.Framework);
local l_ContextServices_0 = v3.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_Util_0 = l_Parent_0.Core.Util;
local _ = require(l_Util_0.Constants);
local _ = require(l_Util_0.AssetConfigConstants);
local l_LayoutOrderIterator_0 = v3.Util.LayoutOrderIterator;
local l_StyleModifier_0 = v3.Util.StyleModifier;
local l_UI_0 = v3.UI;
local l_Pane_0 = l_UI_0.Pane;
local l_TextInput_0 = l_UI_0.TextInput;
local l_TextLabel_0 = l_UI_0.TextLabel;
local v15 = require(l_Parent_0.Core.Components.AssetConfiguration.ConfigSectionWrapper);
local v16 = v2.PureComponent:extend("ConfigTextField");
v16.init = function(v17, _)
    v17.state = {};
    v17.hasError = false;
    v17.onTextChanged = function(v19)
        v17:setState({
            currentContent = v19
        });
        v17.props.TextChangeCallBack(v19);
    end;
end;
v16.render = function(v20)
    local l_Stylizer_0 = v20.props.Stylizer;
    local l_props_0 = v20.props;
    local l_state_0 = v20.state;
    local l_Title_0 = l_props_0.Title;
    local l_TotalHeight_0 = l_props_0.TotalHeight;
    local l_LayoutOrder_0 = l_props_0.LayoutOrder;
    local l_MaxCount_0 = l_props_0.MaxCount;
    local v28 = l_state_0.currentContent or (l_props_0.TextContent or "");
    if v20.props.ErrorCallback then
        if v20.props.MaxCount < #v28 then
            if not v20.hasError then
                v20.hasError = true;
                v20.props.ErrorCallback(v20.hasError);
            end;
        elseif v20.hasError then
            v20.hasError = false;
            v20.props.ErrorCallback(v20.hasError);
        end;
    end;
    local _ = l_Stylizer_0.publishAsset;
    local v30 = utf8.len(v28);
    local v31 = l_MaxCount_0 and l_MaxCount_0 < v30;
    local v32 = not not l_MaxCount_0 and v30 .. "/" .. l_MaxCount_0 or "";
    local v33 = l_MaxCount_0 and l_MaxCount_0 > 50;
    local v34 = l_LayoutOrderIterator_0.new();
    local l_inputBottomText_0 = l_Stylizer_0.assetConfig.inputBottomText;
    return v2.createElement(v15, {
        LayoutOrder = l_LayoutOrder_0, 
        Title = l_Title_0
    }, {
        TextFieldWrapper = v2.createElement(l_Pane_0, {
            AutomaticSize = Enum.AutomaticSize.XY, 
            LayoutOrder = v34:getNextOrder(), 
            Size = UDim2.new(1, 0, 0, l_TotalHeight_0), 
            Spacing = l_inputBottomText_0.bottomTextSpacing
        }, {
            UIListLayout = v2.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Vertical, 
                HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                VerticalAlignment = Enum.VerticalAlignment.Top, 
                SortOrder = Enum.SortOrder.LayoutOrder
            }), 
            TextField = v2.createElement(l_TextInput_0, {
                BottomText = if not l_props_0.BottomRightText then v32 else nil, 
                LayoutOrder = v34:getNextOrder(), 
                MultiLine = v33, 
                OnTextChanged = v20.onTextChanged, 
                Size = UDim2.new(1, 0, 0, (l_TotalHeight_0 - 40) - 20), 
                StyleModifier = if not v31 then nil else l_StyleModifier_0.Error, 
                Text = v28
            }), 
            BottomTextWrapper = if not l_props_0.BottomRightText then nil else v2.createElement(l_Pane_0, {
                AutomaticSize = Enum.AutomaticSize.XY, 
                LayoutOrder = v34:getNextOrder(), 
                Size = UDim2.new(1, 0, 0, 0)
            }, {
                CounterText = v2.createElement(l_TextLabel_0, {
                    AutomaticSize = Enum.AutomaticSize.XY, 
                    LayoutOrder = v34:getNextOrder(), 
                    Size = UDim2.new(1, 0, 0, 0), 
                    TextXAlignment = Enum.TextXAlignment.Left, 
                    Text = v32, 
                    TextColor = if not v31 then l_inputBottomText_0.textColor else l_inputBottomText_0.textErrorColor, 
                    TextSize = l_inputBottomText_0.textSize
                }), 
                BottomText = v2.createElement(l_TextLabel_0, {
                    AutomaticSize = Enum.AutomaticSize.Y, 
                    LayoutOrder = v34:getNextOrder(), 
                    Size = UDim2.new(1, 0, 0, 0), 
                    Text = l_props_0.BottomRightText, 
                    TextColor = l_inputBottomText_0.textColor, 
                    TextSize = l_inputBottomText_0.textSize, 
                    TextXAlignment = Enum.TextXAlignment.Right
                })
            })
        })
    });
end;
return (l_withContext_0({
    Stylizer = l_ContextServices_0.Stylizer
})(v16));
