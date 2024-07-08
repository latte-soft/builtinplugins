local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Roact);
local v2 = require(l_Parent_0.Packages.RoactRodux);
local v3 = require(l_Parent_0.Packages.Framework);
local l_ContextServices_0 = v3.ContextServices;
local l_UI_0 = v3.UI;
local l_HoverArea_0 = l_UI_0.HoverArea;
local l_Pane_0 = l_UI_0.Pane;
local l_DEPRECATED_TextInput_0 = l_UI_0.DEPRECATED_TextInput;
local l_Image_0 = l_UI_0.Image;
local l_TextLabel_0 = l_UI_0.TextLabel;
local l_LayoutOrderIterator_0 = v3.Util.LayoutOrderIterator;
local v12 = require(l_Parent_0.Src.Actions);
local v13 = require(l_Parent_0.Src.TagManager);
local v14 = v1.Component:extend("NewTagTextInput");
v14.init = function(v15)
    v15.textBoxRef = v1.createRef();
    v15.state = {
        enteredText = "", 
        editing = false, 
        hovered = false
    };
    v15.onTextChanged = function(v16)
        v15.enteredText = v16;
    end;
    v15.beginEditing = function()
        v15:setState({
            editing = true
        });
        if v15.textBoxRef.current then
            v15.textBoxRef.current:CaptureFocus();
        end;
    end;
    v15.endEditing = function(v17)
        local l_props_0 = v15.props;
        if v17 then
            v13.Get():AddTag(v15.enteredText);
            l_props_0.openTagMenu(nil);
        end;
        v15:setState({
            editing = false, 
            enteredText = ""
        });
    end;
end;
v14.render = function(v19)
    local l_props_1 = v19.props;
    local l_NewTagTextInput_0 = l_props_1.Stylizer.NewTagTextInput;
    local l_Localization_0 = l_props_1.Localization;
    local v23 = l_LayoutOrderIterator_0.new();
    local v24 = l_props_1.WidthOffset or 0;
    local v25 = nil;
    if not (not v19.state.hovered or v19.state.editing) then
        v25 = "ButtonHover";
    end;
    return v1.createElement(l_Pane_0, {
        Size = if not v19.state.editing then UDim2.new(1, -v24, 0, l_NewTagTextInput_0.Height) else l_NewTagTextInput_0.EditingSize, 
        LayoutOrder = l_props_1.LayoutOrder
    }, {
        HoverArea = v1.createElement(l_HoverArea_0, {
            Cursor = "PointingHand", 
            MouseEnter = function()
                v19:setState({
                    hovered = true
                });
            end, 
            MouseLeave = function()
                v19:setState({
                    hovered = false
                });
            end
        }), 
        Pane = v1.createElement(l_Pane_0, {
            Layout = Enum.FillDirection.Horizontal, 
            HorizontalAlignment = Enum.HorizontalAlignment.Left, 
            OnClick = v19.beginEditing, 
            Spacing = l_NewTagTextInput_0.Spacing, 
            ClipsDescendants = true, 
            Style = v25
        }, {
            AddIcon = v1.createElement(l_Image_0, {
                LayoutOrder = v23:getNextOrder(), 
                Size = l_NewTagTextInput_0.IconSize, 
                Image = "rbxasset://textures/TagEditor/Insert.png", 
                ImageColor3 = if not v19.state.hovered then l_NewTagTextInput_0.IconColor else l_NewTagTextInput_0.IconColorHover
            }), 
            TextLabel = not v19.state.editing and v1.createElement(l_TextLabel_0, {
                Size = l_NewTagTextInput_0.TextInputSize, 
                Style = not v19.state.hovered and "ButtonText" or "ButtonTextHover", 
                LayoutOrder = v23:getNextOrder(), 
                Text = l_Localization_0:getText("Info", "CreateNewTag"), 
                TextXAlignment = Enum.TextXAlignment.Left
            }), 
            TextInput = v19.state.editing and v1.createElement(l_DEPRECATED_TextInput_0, {
                Size = l_NewTagTextInput_0.TextInputSize, 
                LayoutOrder = v23:getNextOrder(), 
                ShouldFocus = true, 
                ForwardRef = v19.textBoxRef, 
                PlaceholderText = l_Localization_0:getText("Info", "CreateNewTag"), 
                OnTextChanged = v19.onTextChanged, 
                OnFocusLost = v19.endEditing
            })
        })
    });
end;
return v2.connect(function(_, _)
    return {};
end, function(v28)
    return {
        openTagMenu = function(v29)
            v28(v12.OpenTagMenu(v29));
        end
    };
end)((l_ContextServices_0.withContext({
    Stylizer = l_ContextServices_0.Stylizer, 
    Localization = l_ContextServices_0.Localization
})(v14)));
