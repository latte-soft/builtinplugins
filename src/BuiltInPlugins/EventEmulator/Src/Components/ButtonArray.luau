local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Roact);
local v2 = require(l_Parent_0.Packages.Framework);
local l_ContextServices_0 = v2.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local v5 = require(l_Parent_0.Src.Util.Constants);
local l_INPUT_PANE_LAYOUT_0 = v5.INPUT_PANE_LAYOUT;
local l_UNIMPLEMENTED_WARNING_0 = v5.UNIMPLEMENTED_WARNING;
local l_Button_0 = v2.UI.Button;
local v9 = v1.PureComponent:extend("ButtonArray");
local function v10()
    warn(l_UNIMPLEMENTED_WARNING_0);
end;
v9.render = function(v11)
    local l_props_0 = v11.props;
    local v13 = l_props_0.OnClearClicked or v10;
    local v14 = l_props_0.OnSaveClicked or v10;
    local v15 = l_props_0.OnSendClicked or v10;
    local l_Stylizer_0 = l_props_0.Stylizer;
    local l_Horizontal_0 = l_Stylizer_0.Layout.Horizontal;
    local l_Sizes_0 = l_Stylizer_0.Sizes;
    return v1.createElement("Frame", {
        Size = UDim2.new(1, 0, 0, l_Sizes_0.ShortHeight), 
        BackgroundTransparency = 1, 
        LayoutOrder = l_INPUT_PANE_LAYOUT_0.ConfirmationButtons
    }, {
        Layout = v1.createElement("UIListLayout", l_Horizontal_0), 
        Clear = v1.createElement(l_Button_0, {
            Size = UDim2.new(0, l_Sizes_0.ConfirmationButtonWidth, 1, 0), 
            Text = "Clear", 
            LayoutOrder = 1, 
            OnClick = v13
        }), 
        Save = v1.createElement(l_Button_0, {
            Size = UDim2.new(0, l_Sizes_0.ConfirmationButtonWidth, 1, 0), 
            Text = "Save", 
            LayoutOrder = 2, 
            OnClick = v14
        }), 
        Send = v1.createElement(l_Button_0, {
            Size = UDim2.new(0, l_Sizes_0.ConfirmationButtonWidth, 1, 0), 
            Text = "Send", 
            LayoutOrder = 3, 
            OnClick = function()
                v15();
            end
        })
    });
end;
return (l_withContext_0({
    Stylizer = l_ContextServices_0.Stylizer
})(v9));
