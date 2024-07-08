local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.React);
local v2 = require(l_Parent_0.Packages.Framework);
local l_Pane_0 = v2.UI.Pane;
local l_IconButton_0 = v2.UI.IconButton;
local l_TextLabel_0 = v2.UI.TextLabel;
local l_TextInput_0 = v2.UI.TextInput;
local l_Image_0 = v2.UI.Image;
local l_Table_0 = v2.UI.Table;
local l_Util_0 = l_Parent_0.Src.Util;
local v10 = require(l_Util_0.Utils);
local v11 = require(l_Util_0.WorkspaceOperations);
local v12 = require(l_Util_0.Constants);
local function v15(v13)
    local l_Localization_0 = v13.props.Localization;
    return {
        {
            Name = l_Localization_0:getText("TextureTable", "Texture")
        }, 
        {
            Name = l_Localization_0:getText("TextureTable", "Id")
        }, 
        {
            Name = l_Localization_0:getText("TextureTable", "Size")
        }, 
        {
            Name = l_Localization_0:getText("TextureTable", "FindSelect")
        }
    };
end;
local _ = function(v16, v17)
    local l_Localization_1 = v16.props.Localization;
    return function(v19)
        local l_Row_0 = v19.Row;
        local l_ColumnIndex_0 = v19.ColumnIndex;
        local l_RowIndex_0 = v19.RowIndex;
        local v23 = v19.Width or UDim.new(1 / #v19.Columns, 0);
        local l_TableCell_0 = v17.TableCell;
        local v25 = nil;
        local l_Texture_0 = l_Row_0.Texture;
        local function v28(v27)
            l_Texture_0 = v27;
        end;
        local function v29()
            v16:setState({
                editingCell = -1
            });
        end;
        if l_Row_0 then
            if l_ColumnIndex_0 == 1 then
                v25 = v1.createElement(l_Image_0, {
                    Image = not not v10.doesTextureAliasContainId(l_Row_0.Texture) and string.format("rbxthumb://type=Asset&id=%s&w=150&h=150&filters=", l_Row_0.Id) or l_Row_0.Texture, 
                    Size = UDim2.fromScale(1, 1)
                });
            elseif l_ColumnIndex_0 == 2 then
                v25 = if v16.state.editingCell == l_RowIndex_0 then v1.createElement(l_Pane_0, {
                    Layout = Enum.FillDirection.Vertical, 
                    Size = UDim2.fromScale(1, 1)
                }, {
                    TextInput = v1.createElement(l_TextInput_0, {
                        Text = l_Texture_0, 
                        TextXAlignment = Enum.TextXAlignment.Center, 
                        Size = l_TableCell_0.IdCell.TextInput.Size, 
                        OnTextChanged = v28, 
                        LayoutOrder = 1
                    }), 
                    ButtonsWrapper = v1.createElement(l_Pane_0, {
                        Size = l_TableCell_0.IdCell.Buttons.ButtonsWrapper.Size, 
                        Layout = Enum.FillDirection.Horizontal, 
                        Padding = l_TableCell_0.IdCell.Buttons.Padding, 
                        LayoutOrder = 2
                    }, {
                        CancelButton = v1.createElement(l_Pane_0, {
                            AutomaticSize = Enum.AutomaticSize.XY, 
                            Padding = l_TableCell_0.IdCell.Buttons.Padding, 
                            LayoutOrder = 1
                        }, {
                            v1.createElement(l_IconButton_0, {
                                LeftIcon = l_TableCell_0.IdCell.Buttons.CancelIcon, 
                                TextXAlignment = Enum.TextXAlignment.Center, 
                                Size = UDim2.fromScale(1, 1), 
                                OnClick = v29
                            })
                        }), 
                        ConfirmButton = v1.createElement(l_Pane_0, {
                            AutomaticSize = Enum.AutomaticSize.XY, 
                            Padding = l_TableCell_0.IdCell.Buttons.Padding, 
                            LayoutOrder = 2
                        }, {
                            v1.createElement(l_IconButton_0, {
                                LeftIcon = l_TableCell_0.IdCell.Buttons.ConfirmIcon, 
                                TextXAlignment = Enum.TextXAlignment.Center, 
                                Size = UDim2.fromScale(1, 1), 
                                OnClick = function()
                                    if l_Row_0.Texture ~= l_Texture_0 then
                                        v11.replaceAllTexturesWithId(l_Row_0.Id, l_Texture_0);
                                    end;
                                    v16:setState({
                                        editingCell = -1
                                    });
                                    v16:refreshData();
                                end
                            })
                        })
                    })
                }) else v1.createElement(l_TextLabel_0, {
                    Text = l_Row_0.Id
                });
            elseif l_ColumnIndex_0 == 3 then
                v25 = v1.createElement(l_TextLabel_0, {
                    Text = l_Row_0.Size > 0 and v10.round(l_Row_0.Size / v12.BYTES_IN_KB, 2) .. " KB" or l_Localization_1:getText("TextureTable", "NotLoaded")
                });
            elseif l_ColumnIndex_0 == 4 then
                local _ = nil;
                v25 = v1.createElement(l_Pane_0, {
                    Layout = Enum.FillDirection.Horizontal, 
                    Size = UDim2.fromScale(1, 1)
                }, {
                    PrevButton = v1.createElement(l_Pane_0, {
                        AutomaticSize = Enum.AutomaticSize.XY, 
                        LayoutOrder = 1
                    }, {
                        v1.createElement(l_IconButton_0, {
                            LeftIcon = l_TableCell_0.FindSelectCell.PrevButton.Icon, 
                            Size = UDim2.fromScale(1, 1), 
                            OnClick = function()
                                l_Row_0.ZoomedInstanceIndex = l_Row_0.ZoomedInstanceIndex - 1;
                                if l_Row_0.ZoomedInstanceIndex < 1 then
                                    l_Row_0.ZoomedInstanceIndex = #l_Row_0.Instances;
                                end;
                                v16:zoomTo(l_Row_0.Instances, (l_Row_0.ZoomedInstanceIndex - 1) % #l_Row_0.Instances + 1);
                            end
                        })
                    }), 
                    ZoomTextLabel = v1.createElement(l_Pane_0, {
                        Padding = l_TableCell_0.FindSelectCell.ZoomText.Padding, 
                        AutomaticSize = Enum.AutomaticSize.XY, 
                        LayoutOrder = 2
                    }, {
                        v1.createElement(l_TextLabel_0, {
                            Text = if l_Row_0.ZoomedInstanceIndex ~= 0 then tostring((l_Row_0.ZoomedInstanceIndex - 1) % #l_Row_0.Instances + 1) .. "/" .. l_Row_0.Count else "-/" .. l_Row_0.Count, 
                            TextSize = l_TableCell_0.FindSelectCell.ZoomText.TextSize
                        })
                    }), 
                    NextButton = v1.createElement(l_Pane_0, {
                        AutomaticSize = Enum.AutomaticSize.XY, 
                        LayoutOrder = 3
                    }, {
                        v1.createElement(l_IconButton_0, {
                            LeftIcon = l_TableCell_0.FindSelectCell.NextButton.Icon, 
                            Size = UDim2.fromScale(1, 1), 
                            OnClick = function()
                                l_Row_0.ZoomedInstanceIndex = l_Row_0.ZoomedInstanceIndex + 1;
                                if l_Row_0.ZoomedInstanceIndex < 1 then
                                    l_Row_0.ZoomedInstanceIndex = #l_Row_0.Instances;
                                end;
                                v16:zoomTo(l_Row_0.Instances, (l_Row_0.ZoomedInstanceIndex - 1) % #l_Row_0.Instances + 1);
                            end
                        })
                    })
                });
            end;
        end;
        return v1.createElement(l_Pane_0, {
            LayoutOrder = v19.ColumnIndex, 
            Style = l_TableCell_0.Style, 
            BorderSizePixel = l_TableCell_0.BorderSizePixel, 
            BackgroundColor3 = v19.Style.BackgroundEven, 
            BorderColor3 = v19.Style.Border, 
            Size = UDim2.new(v23.Scale, v23.Offset, 1, 0), 
            OnRightClick = function()
                v16.showRightClickMenu(l_RowIndex_0, l_Row_0.Instances);
            end, 
            ClipsDescendants = true
        }, {
            Content = v25
        });
    end;
end;
return function(v32, v33)
    local l_props_0 = v32.props;
    local _ = l_props_0.Localization;
    local l_TextureTable_0 = l_props_0.Stylizer.TextureTable;
    local l_createElement_0 = v1.createElement;
    local l_l_Table_0_0 = l_Table_0;
    local v39 = {
        Size = l_TextureTable_0.Size, 
        Rows = v33, 
        Columns = v15(v32)
    };
    local l_Localization_3 = v32.props.Localization;
    v39.CellComponent = function(v41)
        local l_Row_1 = v41.Row;
        local l_ColumnIndex_1 = v41.ColumnIndex;
        local l_RowIndex_1 = v41.RowIndex;
        local v45 = v41.Width or UDim.new(1 / #v41.Columns, 0);
        local l_TableCell_1 = l_TextureTable_0.TableCell;
        local v47 = nil;
        local l_Texture_1 = l_Row_1.Texture;
        local function v50(v49)
            l_Texture_1 = v49;
        end;
        local function v51()
            v32:setState({
                editingCell = -1
            });
        end;
        if l_Row_1 then
            if l_ColumnIndex_1 == 1 then
                v47 = v1.createElement(l_Image_0, {
                    Image = not not v10.doesTextureAliasContainId(l_Row_1.Texture) and string.format("rbxthumb://type=Asset&id=%s&w=150&h=150&filters=", l_Row_1.Id) or l_Row_1.Texture, 
                    Size = UDim2.fromScale(1, 1)
                });
            elseif l_ColumnIndex_1 == 2 then
                v47 = if v32.state.editingCell == l_RowIndex_1 then v1.createElement(l_Pane_0, {
                    Layout = Enum.FillDirection.Vertical, 
                    Size = UDim2.fromScale(1, 1)
                }, {
                    TextInput = v1.createElement(l_TextInput_0, {
                        Text = l_Texture_1, 
                        TextXAlignment = Enum.TextXAlignment.Center, 
                        Size = l_TableCell_1.IdCell.TextInput.Size, 
                        OnTextChanged = v50, 
                        LayoutOrder = 1
                    }), 
                    ButtonsWrapper = v1.createElement(l_Pane_0, {
                        Size = l_TableCell_1.IdCell.Buttons.ButtonsWrapper.Size, 
                        Layout = Enum.FillDirection.Horizontal, 
                        Padding = l_TableCell_1.IdCell.Buttons.Padding, 
                        LayoutOrder = 2
                    }, {
                        CancelButton = v1.createElement(l_Pane_0, {
                            AutomaticSize = Enum.AutomaticSize.XY, 
                            Padding = l_TableCell_1.IdCell.Buttons.Padding, 
                            LayoutOrder = 1
                        }, {
                            v1.createElement(l_IconButton_0, {
                                LeftIcon = l_TableCell_1.IdCell.Buttons.CancelIcon, 
                                TextXAlignment = Enum.TextXAlignment.Center, 
                                Size = UDim2.fromScale(1, 1), 
                                OnClick = v51
                            })
                        }), 
                        ConfirmButton = v1.createElement(l_Pane_0, {
                            AutomaticSize = Enum.AutomaticSize.XY, 
                            Padding = l_TableCell_1.IdCell.Buttons.Padding, 
                            LayoutOrder = 2
                        }, {
                            v1.createElement(l_IconButton_0, {
                                LeftIcon = l_TableCell_1.IdCell.Buttons.ConfirmIcon, 
                                TextXAlignment = Enum.TextXAlignment.Center, 
                                Size = UDim2.fromScale(1, 1), 
                                OnClick = function()
                                    if l_Row_1.Texture ~= l_Texture_1 then
                                        v11.replaceAllTexturesWithId(l_Row_1.Id, l_Texture_1);
                                    end;
                                    v32:setState({
                                        editingCell = -1
                                    });
                                    v32:refreshData();
                                end
                            })
                        })
                    })
                }) else v1.createElement(l_TextLabel_0, {
                    Text = l_Row_1.Id
                });
            elseif l_ColumnIndex_1 == 3 then
                v47 = v1.createElement(l_TextLabel_0, {
                    Text = l_Row_1.Size > 0 and v10.round(l_Row_1.Size / v12.BYTES_IN_KB, 2) .. " KB" or l_Localization_3:getText("TextureTable", "NotLoaded")
                });
            elseif l_ColumnIndex_1 == 4 then
                local _ = nil;
                v47 = v1.createElement(l_Pane_0, {
                    Layout = Enum.FillDirection.Horizontal, 
                    Size = UDim2.fromScale(1, 1)
                }, {
                    PrevButton = v1.createElement(l_Pane_0, {
                        AutomaticSize = Enum.AutomaticSize.XY, 
                        LayoutOrder = 1
                    }, {
                        v1.createElement(l_IconButton_0, {
                            LeftIcon = l_TableCell_1.FindSelectCell.PrevButton.Icon, 
                            Size = UDim2.fromScale(1, 1), 
                            OnClick = function()
                                l_Row_1.ZoomedInstanceIndex = l_Row_1.ZoomedInstanceIndex - 1;
                                if l_Row_1.ZoomedInstanceIndex < 1 then
                                    l_Row_1.ZoomedInstanceIndex = #l_Row_1.Instances;
                                end;
                                v32:zoomTo(l_Row_1.Instances, (l_Row_1.ZoomedInstanceIndex - 1) % #l_Row_1.Instances + 1);
                            end
                        })
                    }), 
                    ZoomTextLabel = v1.createElement(l_Pane_0, {
                        Padding = l_TableCell_1.FindSelectCell.ZoomText.Padding, 
                        AutomaticSize = Enum.AutomaticSize.XY, 
                        LayoutOrder = 2
                    }, {
                        v1.createElement(l_TextLabel_0, {
                            Text = if l_Row_1.ZoomedInstanceIndex ~= 0 then tostring((l_Row_1.ZoomedInstanceIndex - 1) % #l_Row_1.Instances + 1) .. "/" .. l_Row_1.Count else "-/" .. l_Row_1.Count, 
                            TextSize = l_TableCell_1.FindSelectCell.ZoomText.TextSize
                        })
                    }), 
                    NextButton = v1.createElement(l_Pane_0, {
                        AutomaticSize = Enum.AutomaticSize.XY, 
                        LayoutOrder = 3
                    }, {
                        v1.createElement(l_IconButton_0, {
                            LeftIcon = l_TableCell_1.FindSelectCell.NextButton.Icon, 
                            Size = UDim2.fromScale(1, 1), 
                            OnClick = function()
                                l_Row_1.ZoomedInstanceIndex = l_Row_1.ZoomedInstanceIndex + 1;
                                if l_Row_1.ZoomedInstanceIndex < 1 then
                                    l_Row_1.ZoomedInstanceIndex = #l_Row_1.Instances;
                                end;
                                v32:zoomTo(l_Row_1.Instances, (l_Row_1.ZoomedInstanceIndex - 1) % #l_Row_1.Instances + 1);
                            end
                        })
                    })
                });
            end;
        end;
        return v1.createElement(l_Pane_0, {
            LayoutOrder = v41.ColumnIndex, 
            Style = l_TableCell_1.Style, 
            BorderSizePixel = l_TableCell_1.BorderSizePixel, 
            BackgroundColor3 = v41.Style.BackgroundEven, 
            BorderColor3 = v41.Style.Border, 
            Size = UDim2.new(v45.Scale, v45.Offset, 1, 0), 
            OnRightClick = function()
                v32.showRightClickMenu(l_RowIndex_1, l_Row_1.Instances);
            end, 
            ClipsDescendants = true
        }, {
            Content = v47
        });
    end;
    v39.Scroll = true;
    v39.RowHeight = l_TextureTable_0.RowHeight;
    v39.LayoutOrder = 3;
    return l_createElement_0(l_l_Table_0_0, v39);
end;
