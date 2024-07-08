local l_script_FirstAncestor_0 = script:FindFirstAncestor("Toolbox");
local l_Packages_0 = l_script_FirstAncestor_0.Packages;
local v2 = require(l_Packages_0.Roact);
local v3 = require(l_Packages_0.Framework);
local l_ContextServices_0 = v3.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_formatLocalDateTime_0 = v3.Util.formatLocalDateTime;
local v7 = require(l_script_FirstAncestor_0.Core.Util.LayoutOrderIterator);
local l_Util_0 = l_script_FirstAncestor_0.Core.Util;
local _ = v3.Util.StyleModifier;
local v10 = require(l_Util_0.Constants);
local v11 = require(l_Util_0.AssetConfigConstants);
local l_StyleModifier_1 = v3.Util.StyleModifier;
local l_UI_0 = v3.UI;
local l_Pane_0 = l_UI_0.Pane;
local l_LinkText_0 = l_UI_0.LinkText;
local l_Checkbox_0 = l_UI_0.Checkbox;
local l_TextInput_0 = l_UI_0.TextInput;
local l_Button_0 = l_UI_0.Button;
local v19 = v2.PureComponent:extend("VersionsTableCell");
local v20 = {
    Version = 1, 
    Description = 2, 
    Restore = 3
};
v19.init = function(v21)
    v21.state = {
        inputText = if v21.props.ColumnIndex == 2 and v21.props.Value.versionDescription then v21.props.Value.versionDescription else ""
    };
    v21.hasError = false;
    v21.onCheck = function(v22, v23, v24)
        local l_props_0 = v21.props;
        local l_OnClickItem_0 = l_props_0.CellProps.OnClickItem;
        if not v23 then
            if not v24 or not l_OnClickItem_0 then
                if not (not (l_props_0.CellProps.SelectVersion ~= v22) or not l_OnClickItem_0) then
                    l_OnClickItem_0(v22);
                end;
                return ;
            else
                l_OnClickItem_0(nil);
                return ;
            end;
        else
            return ;
        end;
    end;
    v21.onClickDesc = function(v27)
        local l_props_1 = v21.props;
        local l_OnClickDesc_0 = l_props_1.CellProps.OnClickDesc;
        v21:setState({
            inputText = if v21.props.ColumnIndex == 2 then v21.props.Value.versionDescription else ""
        });
        if not (not (l_props_1.CellProps.OpenInputKey ~= v27) or not l_OnClickDesc_0) then
            l_OnClickDesc_0(v27, l_props_1.CellProps.PreviousInput);
        end;
        l_props_1.CellProps.SetPreviousInput(v21.state.inputText);
    end;
    v21.onClickOut = function()
        local l_OnClickDesc_1 = v21.props.CellProps.OnClickDesc;
        if l_OnClickDesc_1 then
            l_OnClickDesc_1(-1, v21.props.CellProps.PreviousInput);
        end;
    end;
    v21.onTextChanged = function(v31)
        v21:setState({
            inputText = v31
        });
        v21.props.CellProps.SetPreviousInput(v31);
    end;
end;
v19.createDescriptionComponent = function(v32)
    local l_props_2 = v32.props;
    local l_state_0 = v32.state;
    local v35 = l_props_2.Value.versionDescription and string.find(l_props_2.Value.versionDescription, "\n");
    local v36 = nil;
    local _ = v7.new();
    local v38 = l_state_0.inputText or "";
    if l_props_2.CellProps.ErrorCallback then
        if v11.PACKAGE_NOTE_CHARACTER_LIMIT < #v38 then
            if not v32.hasError then
                v32.hasError = true;
                l_props_2.CellProps.ErrorCallback(v32.hasError);
                l_props_2.CellProps.SetVersionError(l_props_2.Value.assetVersionNumber, v32.hasError);
            end;
        elseif v32.hasError then
            v32.hasError = false;
            l_props_2.CellProps.ErrorCallback(v32.hasError);
            l_props_2.CellProps.SetVersionError(l_props_2.Value.assetVersionNumber, v32.hasError);
        end;
    end;
    local v39 = v11.PACKAGE_NOTE_CHARACTER_LIMIT < #v38;
    if v35 then
        v36 = string.format("%s...", (string.sub(l_props_2.Value.versionDescription, 0, v35 - 1)));
    end;
    if l_props_2.CellProps.OpenInputKey == l_props_2.Value.assetVersionNumber then
        return (v2.createElement("Frame", {
            AutomaticSize = Enum.AutomaticSize.XY, 
            Size = UDim2.new(1, 0, 0.9, 0), 
            BackgroundTransparency = 1, 
            BorderSizePixel = 0
        }, {
            InputBox = v2.createElement(l_TextInput_0, {
                Text = l_state_0.inputText or "", 
                OnTextChanged = v32.onTextChanged, 
                PlaceholderText = l_props_2.Localization:getText("AssetConfigVersions", "DescribeChanges"), 
                MultiLine = true, 
                Size = UDim2.fromScale(0.995, 0.85), 
                Style = "BorderBox", 
                StyleModifier = if not v39 then nil else l_StyleModifier_1.Error, 
                MaxLength = v11.PACKAGE_NOTE_CHARACTER_LIMIT
            }), 
            CounterText = v2.createElement("Frame", {
                BorderSizePixel = 0, 
                BackgroundTransparency = 1, 
                Size = UDim2.new(0.995, 0, 1, 0)
            }, {
                UIListLayout = v2.createElement("UIListLayout", {
                    FillDirection = Enum.FillDirection.Horizontal, 
                    HorizontalAlignment = Enum.HorizontalAlignment.Right, 
                    VerticalAlignment = Enum.VerticalAlignment.Bottom, 
                    SortOrder = Enum.SortOrder.LayoutOrder, 
                    Padding = UDim.new(0, 5)
                }), 
                DiscardButton = v2.createElement(l_Button_0, {
                    BorderSizePixel = 0, 
                    Text = l_props_2.Localization:getText("General", "Discard"), 
                    Size = UDim2.fromScale(0.125, 0.125), 
                    TextSize = v10.FONT_SIZE_LARGE, 
                    BackgroundTransparency = 1, 
                    Font = v10.FONT, 
                    Style = "Round", 
                    OnClick = function()
                        l_props_2.CellProps.CloseInput(true);
                    end
                }), 
                SubmitButton = v2.createElement(l_Button_0, {
                    BorderSizePixel = 0, 
                    Text = l_props_2.Localization:getText("Common", "Submit"), 
                    Size = UDim2.fromScale(0.125, 0.125), 
                    TextSize = v10.FONT_SIZE_LARGE, 
                    BackgroundTransparency = 1, 
                    Font = v10.FONT, 
                    Style = "RoundPrimary", 
                    StyleModifier = not not v39 and l_StyleModifier_1.Disabled or nil, 
                    OnClick = function()
                        l_props_2.CellProps.CloseInput(false);
                    end
                })
            })
        }));
    elseif l_props_2.Value.versionDescription ~= "" and l_props_2.Value.versionDescription then
        return (v2.createElement(l_LinkText_0, {
            Style = {
                Font = v10.FONT, 
                TextSize = v10.FONT_SIZE_LARGE, 
                TextColor = if not v39 then l_props_2.CellProps.Theme.textColor else l_props_2.CellProps.Theme.errorColor
            }, 
            Text = if not v35 then l_props_2.Value.versionDescription else v36, 
            TextWrapped = not v35 and true or nil, 
            Position = UDim2.new(0, 2, 0, 1), 
            TextXAlignment = Enum.TextXAlignment.Left, 
            TextYAlignment = Enum.TextYAlignment.Top, 
            OnClick = function()
                v32.onClickDesc(l_props_2.Value.assetVersionNumber);
            end
        }));
    else
        return (v2.createElement(l_LinkText_0, {
            Style = {
                Font = v10.FONT, 
                TextSize = v10.FONT_SIZE_LARGE, 
                ForceUnderline = true, 
                ShowUnderline = true, 
                TextColor = l_props_2.CellProps.Theme.textColor
            }, 
            Text = l_props_2.Localization:getText("AssetConfigVersions", "AddNote"), 
            Position = UDim2.new(0, 2, 0, 5), 
            OnClick = function()
                v32.onClickDesc(l_props_2.Value.assetVersionNumber);
            end
        }));
    end;
end;
v19.render = function(v40)
    local l_props_3 = v40.props;
    local l_Value_0 = l_props_3.Value;
    local l_Style_0 = l_props_3.Style;
    local v44 = l_props_3.Width or UDim.new(1 / #l_props_3.Columns, 0);
    local l_Theme_0 = l_props_3.CellProps.Theme;
    local l_CurrentVersion_0 = l_props_3.CellProps.CurrentVersion;
    local l_SelectVersion_0 = l_props_3.CellProps.SelectVersion;
    local l_OpenInputKey_0 = l_props_3.CellProps.OpenInputKey;
    local l_BackgroundOdd_0 = l_Style_0.BackgroundOdd;
    local l_IdsToUsernames_0 = l_props_3.CellProps.IdsToUsernames;
    local v51 = v7.new();
    local v52 = nil;
    v52 = if typeof(l_Value_0) == "number" and math.floor(l_Value_0) ~= l_Value_0 then ("%.3f"):format(l_Value_0) else tostring(l_Value_0);
    if l_props_3.ColumnIndex == v20.Version then
        local v53 = l_Value_0 == l_CurrentVersion_0;
        if l_OpenInputKey_0 ~= -1 then
            return v2.createElement(l_Pane_0, {
                LayoutOrder = l_props_3.ColumnIndex, 
                Padding = 5, 
                Style = "Box", 
                BackgroundColor3 = l_BackgroundOdd_0, 
                BorderSizePixel = 1, 
                BorderColor3 = l_Style_0.Border, 
                Size = UDim2.new(v44.Scale, v44.Offset, 1, 0), 
                ClipsDescendants = true
            }, {
                Container = v2.createElement("ImageButton", {
                    Size = UDim2.new(1, 0, 1, 0), 
                    BackgroundTransparency = 1, 
                    [v2.Event.Activated] = v40.onClickOut
                }, {
                    TextFrame = v2.createElement("Frame", {
                        BackgroundTransparency = 1, 
                        BorderSizePixel = 0, 
                        LayoutOrder = v51:getNextOrder()
                    }, {
                        Text = v2.createElement("TextLabel", {
                            BackgroundTransparency = 1, 
                            BorderSizePixel = 0, 
                            Text = if not v53 then v52 else string.format("%s (%s)", v52, l_props_3.Localization:getText("AssetConfigVersions", "CurrentLabel")), 
                            TextColor3 = l_Theme_0.textColor, 
                            Font = v10.FONT, 
                            TextSize = v10.FONT_SIZE_LARGE, 
                            Position = UDim2.new(0, 2, 0, 2), 
                            TextXAlignment = Enum.TextXAlignment.Left, 
                            TextYAlignment = Enum.TextYAlignment.Top
                        })
                    })
                })
            });
        else
            return v2.createElement(l_Pane_0, {
                LayoutOrder = l_props_3.ColumnIndex, 
                Padding = 5, 
                Style = "Box", 
                BackgroundColor3 = l_BackgroundOdd_0, 
                BorderSizePixel = 1, 
                BorderColor3 = l_Style_0.Border, 
                Size = UDim2.new(v44.Scale, v44.Offset, 1, 0), 
                ClipsDescendants = true
            }, {
                TextFrame = v2.createElement("Frame", {
                    BackgroundTransparency = 1, 
                    BorderSizePixel = 0, 
                    LayoutOrder = v51:getNextOrder()
                }, {
                    Text = v2.createElement("TextLabel", {
                        BackgroundTransparency = 1, 
                        BorderSizePixel = 0, 
                        Text = if not v53 then v52 else string.format("%s (%s)", v52, l_props_3.Localization:getText("AssetConfigVersions", "CurrentLabel")), 
                        TextColor3 = l_Theme_0.textColor, 
                        Font = v10.FONT, 
                        TextSize = v10.FONT_SIZE_LARGE, 
                        Position = UDim2.new(0, 2, 0, 2), 
                        TextXAlignment = Enum.TextXAlignment.Left, 
                        TextYAlignment = Enum.TextYAlignment.Top
                    })
                })
            });
        end;
    elseif l_props_3.ColumnIndex == v20.Description then
        local v54 = l_formatLocalDateTime_0(l_Value_0.created, "L LTS", l_props_3.Localization:getLocale());
        local v55 = l_IdsToUsernames_0[l_Value_0.creatorId];
        local _ = nil;
        return v2.createElement(l_Pane_0, {
            LayoutOrder = l_props_3.ColumnIndex, 
            Padding = 5, 
            Style = "Box", 
            BackgroundColor3 = l_BackgroundOdd_0, 
            BorderSizePixel = 1, 
            BorderColor3 = l_Style_0.Border, 
            Size = UDim2.new(v44.Scale, v44.Offset, 1, 0), 
            ClipsDescendants = true
        }, {
            UIListLayout = v2.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Vertical, 
                HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                VerticalAlignment = Enum.VerticalAlignment.Top, 
                SortOrder = Enum.SortOrder.LayoutOrder
            }), 
            CreatedFrame = v2.createElement("Frame", {
                BackgroundTransparency = 1, 
                BorderSizePixel = 0, 
                LayoutOrder = v51:getNextOrder(), 
                AutomaticSize = Enum.AutomaticSize.XY
            }, {
                Created = v2.createElement("TextLabel", {
                    BorderSizePixel = 0, 
                    RichText = true, 
                    Text = if not v55 then if Enum.CreatorType[l_Value_0.creatorType] == Enum.CreatorType.User then string.format("%s   \226\128\162   <i>%s</i>", v54, l_props_3.Localization:getText("AssetConfigVersions", "RevokedUser")) else v54 else string.format("%s   \226\128\162   %s", v54, v55), 
                    BackgroundTransparency = 1, 
                    AutomaticSize = Enum.AutomaticSize.XY, 
                    TextTruncate = Enum.TextTruncate.AtEnd, 
                    TextColor3 = l_Theme_0.dimmedTextColor, 
                    Font = v10.FONT, 
                    TextSize = v10.FONT_SIZE_LARGE, 
                    TextXAlignment = Enum.TextXAlignment.Left, 
                    TextYAlignment = Enum.TextYAlignment.Top, 
                    Position = UDim2.new(0, 2, 0, 2)
                })
            }), 
            DescriptionFrame = v2.createElement("Frame", {
                BackgroundTransparency = 1, 
                BorderSizePixel = 0, 
                LayoutOrder = v51:getNextOrder(), 
                Size = UDim2.new(1, 0, 0.9, 0)
            }, {
                Container = if l_OpenInputKey_0 ~= -1 then v2.createElement("ImageButton", {
                    Size = UDim2.new(1, 0, 1, 0), 
                    AutomaticSize = Enum.AutomaticSize.XY, 
                    BackgroundTransparency = 1, 
                    [v2.Event.Activated] = v40.onClickOut
                }, {
                    DescriptionComponent = v40:createDescriptionComponent()
                }) else v40:createDescriptionComponent()
            })
        });
    elseif l_props_3.ColumnIndex == v20.Restore then
        local v57 = l_SelectVersion_0 == l_Value_0;
        local v58 = l_Value_0 == l_CurrentVersion_0;
        return v2.createElement(l_Pane_0, {
            LayoutOrder = l_props_3.ColumnIndex, 
            Padding = 5, 
            Style = "Box", 
            BackgroundColor3 = l_BackgroundOdd_0, 
            BorderSizePixel = 1, 
            BorderColor3 = l_Style_0.Border, 
            Size = UDim2.new(v44.Scale, v44.Offset, 1, 0), 
            ClipsDescendants = true, 
            Layout = Enum.FillDirection.Vertical
        }, {
            CheckboxContainer = if l_OpenInputKey_0 ~= -1 then v2.createElement("ImageButton", {
                Size = UDim2.new(1, 0, 1, 0), 
                BackgroundTransparency = 1, 
                [v2.Event.Activated] = v40.onClickOut
            }, {
                Pane = v2.createElement(l_Pane_0, {
                    LayoutOrder = l_props_3.ColumnIndex, 
                    Size = UDim2.fromScale(1, 1), 
                    ClipsDescendants = true, 
                    Layout = Enum.FillDirection.Vertical
                }, {
                    Checkbox = v2.createElement(l_Checkbox_0, {
                        Key = v52, 
                        Disabled = v58, 
                        OnClick = function()
                            v40.onCheck(l_Value_0, v58, v57);
                        end, 
                        Checked = v57
                    })
                })
            }) else v2.createElement(l_Checkbox_0, {
                Key = v52, 
                Disabled = v58, 
                OnClick = function()
                    v40.onCheck(l_Value_0, v58, v57);
                end, 
                Checked = v57
            })
        });
    else
        return ;
    end;
end;
return {
    Enum = v20, 
    Component = l_withContext_0({
        Localization = l_ContextServices_0.Localization
    })(v19)
};
