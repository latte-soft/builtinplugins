local l_script_FirstAncestor_0 = script:FindFirstAncestor("AssetImporter");
local v1 = require(l_script_FirstAncestor_0.Packages.Framework);
local v2 = require(l_script_FirstAncestor_0.Packages.Roact);
local v3 = require(l_script_FirstAncestor_0.Packages.RoactRodux);
local l_ContextServices_0 = v1.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_Stylizer_0 = l_ContextServices_0.Stylizer;
local l_StyleModifier_0 = v1.Util.StyleModifier;
local l_UI_0 = v1.UI;
local l_TextInput_0 = l_UI_0.TextInput;
local l_TruncatedTextLabel_0 = l_UI_0.TruncatedTextLabel;
local l_DropdownMenu_0 = l_UI_0.DropdownMenu;
local l_Button_0 = l_UI_0.Button;
local l_Pane_0 = l_UI_0.Pane;
local l_Image_0 = l_UI_0.Image;
local v15 = require(l_script_FirstAncestor_0.Src.Utility.getPackagesInPlace);
local v16 = require(l_script_FirstAncestor_0.Src.Utility.isAssetIdFormatValid);
local v17 = require(l_script_FirstAncestor_0.Src.Actions.SetHasInvalidPackageId);
local v18 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagDevFrameworkDropdownMenuHeight);
local v19 = v2.PureComponent:extend("AssetIdProperty");
v19.init = function(v20)
    v20.state = {
        isFocused = false, 
        isOnDropdown = false, 
        suggestionList = v15(), 
        selectedId = "", 
        dropdownHoveredIndex = 0
    };
    v20.ref = v2.createRef();
    v20.focused = function()
        v20:setState({
            isFocused = true
        });
    end;
    v20.unfocused = function()
        v20:setState({
            isFocused = false
        });
    end;
    v20.onItemActivated = function(v21, _)
        if v20.state.selectedId == v21.AssetId then
            v20:setState({
                selectedId = ""
            });
        end;
        v20:setState({
            selectedId = v21.AssetId
        });
    end;
    v20.onHoveredItemChanged = function(v23)
        v20:setState({
            isOnDropdown = true, 
            dropdownHoveredIndex = v23
        });
    end;
    v20.onMouseLeave = function()
        v20:setState({
            isOnDropdown = false, 
            dropdownHoveredIndex = 0
        });
    end;
    v20.onValidateText = function(v24)
        local v25 = v16(v24);
        v20.props.dispatchSetHasInvalidPackageId(not v25);
        return v25;
    end;
    v20.onRenderItem = function(v26, v27, v28, v29)
        local l_SuggestionDropdown_0 = v20.props.Stylizer.SuggestionDropdown;
        local l_DropdownHeight_0 = l_SuggestionDropdown_0.DropdownHeight;
        local v32 = not v20.ref:getValue() and 200 or v20.ref:getValue().AbsoluteSize.X;
        if not v18() then
            v29 = v27 == v20.state.dropdownHoveredIndex;
        end;
        return v2.createElement(l_Button_0, {
            LayoutOrder = v27, 
            OnClick = v28, 
            OnMouseEnter = function()
                v20.onHoveredItemChanged(v27);
            end, 
            Size = UDim2.new(0, v32 - l_SuggestionDropdown_0.DropdownScrollbarSize, 0, l_DropdownHeight_0), 
            StyleModifier = if not v29 then nil else l_StyleModifier_0.Hover
        }, {
            ButtonComponents = v2.createElement(l_Pane_0, {
                Layout = Enum.FillDirection.Horizontal, 
                Size = UDim2.fromScale(1, 1)
            }, {
                ImageContainer = v2.createElement(l_Pane_0, {
                    LayoutOrder = 1, 
                    Size = UDim2.fromOffset(l_DropdownHeight_0, l_DropdownHeight_0)
                }, {
                    Image = v2.createElement(l_Image_0, {
                        Style = {
                            Image = v26.Image
                        }
                    })
                }), 
                NameText = v2.createElement(l_TruncatedTextLabel_0, {
                    LayoutOrder = 2, 
                    Size = UDim2.new(1, -l_DropdownHeight_0, 1, 0), 
                    Text = v26.Name, 
                    TextXAlignment = Enum.TextXAlignment.Left, 
                    SuffixLength = 6
                }, {
                    AssetIdText = v2.createElement(l_TruncatedTextLabel_0, {
                        Size = UDim2.new(1, 0, 1, -l_SuggestionDropdown_0.SubtextOffset), 
                        TextXAlignment = Enum.TextXAlignment.Left, 
                        TextYAlignment = Enum.TextYAlignment.Bottom, 
                        Text = v26.AssetId, 
                        TextColor = if v29 then nil else l_SuggestionDropdown_0.SubtextColor, 
                        TextSize = l_SuggestionDropdown_0.SubtextSize
                    })
                })
            })
        });
    end;
end;
v19.render = function(v33)
    local l_props_0 = v33.props;
    local l_state_0 = v33.state;
    return v2.createElement(l_Pane_0, {
        Size = l_props_0.Size, 
        LayoutOrder = l_props_0.LayoutOrder, 
        Layout = Enum.FillDirection.Horizontal, 
        HorizontalAlignment = Enum.HorizontalAlignment.Left
    }, {
        AssetIdField = v2.createElement(l_Pane_0, {
            Size = UDim2.fromScale(1, 1), 
            LayoutOrder = l_props_0.LayoutOrder + 1, 
            [v2.Ref] = v33.ref
        }, {
            TextInput = v2.createElement(l_TextInput_0, {
                OnTextChanged = l_props_0.OnSetItem, 
                OnValidateText = v33.onValidateText, 
                Text = if l_state_0.selectedId ~= "" then l_state_0.selectedId else l_props_0.Value, 
                OnFocused = v33.focused, 
                OnFocusLost = v33.unfocused
            }), 
            AutocompleteDropdown = v2.createElement(l_DropdownMenu_0, {
                Hide = not l_state_0.isFocused and not l_state_0.isOnDropdown or not (#l_state_0.suggestionList ~= 0), 
                Items = l_state_0.suggestionList, 
                OnItemActivated = v33.onItemActivated, 
                OnMouseLeave = v33.onMouseLeave, 
                OnRenderItem = v33.onRenderItem, 
                OnFocusLost = v33.unfocused, 
                HoveredItemIndex = l_state_0.dropdownHoveredIndex, 
                Width = not v33.ref:getValue() and 200 or v33.ref:getValue().AbsoluteSize.X
            })
        })
    });
end;
return v3.connect(nil, function(v36)
    return {
        dispatchSetHasInvalidPackageId = function(v37)
            v36(v17(v37));
        end
    };
end)((l_withContext_0({
    Stylizer = l_Stylizer_0
})(v19)));
