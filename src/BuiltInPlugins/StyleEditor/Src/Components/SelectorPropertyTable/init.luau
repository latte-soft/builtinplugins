local l_ChangeHistoryService_0 = game:GetService("ChangeHistoryService");
local l_Parent_0 = script.Parent.Parent.Parent;
local v2 = require(l_Parent_0.Packages.React);
local v3 = require(l_Parent_0.Packages.RoactRodux);
local v4 = require(l_Parent_0.Packages.Dash);
local l_copy_0 = v4.copy;
local l_join_0 = v4.join;
local l_joinDeep_0 = v4.joinDeep;
local v8 = require(l_Parent_0.Packages.Framework);
local l_TreeTable_0 = v8.UI.TreeTable;
local l_ContextServices_0 = v8.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local _ = require(l_Parent_0.Src.Types);
local _ = require(l_Parent_0.Src.Reducers.Clipboard);
local _ = require(l_Parent_0.Src.Reducers.RootReducer);
local l_Actions_0 = l_Parent_0.Src.Actions;
local v16 = require(l_Actions_0.Clipboard.CopyPropertyToClipboard);
local v17 = require(l_Actions_0.Window.SelectItem);
local l_Thunks_0 = l_Parent_0.Src.Thunks;
local v19 = require(l_Thunks_0.Change.RenameStyleRuleProperty);
local v20 = require(l_Thunks_0.Change.SetStyleRuleProperty);
local v21 = require(l_Thunks_0.Change.SetStyleRulePropertyType);
local v22 = require(l_Thunks_0.Change.SetStyleRuleSelector);
local v23 = require(l_Thunks_0.ContextMenu.ShowStyleRuleMenu);
local v24 = require(l_Thunks_0.Change.UnlinkStyleRulePropertyTokenReference);
local v25 = require(l_Parent_0.Src.Util.mapDispatchToProps);
local v26 = require(l_Parent_0.Src.Util.DesignHelpers);
local v27 = require(l_Parent_0.Src.Util.MenuHelpers);
local v28 = require(l_Parent_0.Src.Resources.ModernIcons);
local v29 = require(l_Parent_0.Src.Util.StyleSchema);
local v30 = require(l_Parent_0.Src.Util.SelectorHelpers);
local v31 = require(l_Parent_0.Src.Util.TokenHelpers);
local v32 = require(l_Parent_0.Src.Renderers);
local v33 = require(l_Parent_0.Src.Util.bind);
local v34 = require(l_Parent_0.Src.Util.recordChange)(l_ChangeHistoryService_0);
local v35 = require(l_Parent_0.Src.Util.TreeTableHelpers);
local v36 = require(l_Parent_0.Src.Contexts.Telemetry.TelemetryContext);
local v37 = require(script.Tree);
local l_EditTree_0 = v37.EditTree;
local v39 = v2.PureComponent:extend("SelectorPropertyTable");
v39.init = function(v40)
    v40.state = {
        rootInstance = nil, 
        table = {
            Columns = l_copy_0(v37.Columns), 
            Expansion = {}, 
            Selection = {}, 
            Items = {}
        }
    };
    local v41 = l_EditTree_0:getStateAdaptor(v40, "table");
    v40.tableCallbacks = l_EditTree_0:getCallbacks(v41);
    v40.onDoubleClick = function(v42)
        v41(function(v43)
            if l_EditTree_0:getChild(v43.Items, v42) then
                return l_EditTree_0:updateCell(v43, {
                    Schema = l_join_0(v29.SelectorSchema, {
                        Editing = true
                    })
                }, v42, 1);
            else
                return nil;
            end;
        end);
    end;
    v40.canPasteProperty = function()
        return v40.props.ClipboardProperty ~= nil;
    end;
    v40.canPasteSelector = function()
        return v40.props.ClipboardInstance ~= nil;
    end;
    v40.selectRow = function(v44, v45)
        v41(function(v46)
            local l_Expansion_0 = v46.Expansion;
            if v45 and v46.Selection[v44] == true then
                l_Expansion_0 = l_join_0(v46.Expansion, {
                    [v44] = not v46.Expansion[v44]
                });
            end;
            return l_join_0(v46, {
                Selection = {
                    [v44] = true
                }, 
                Expansion = l_Expansion_0
            });
        end);
    end;
    v40.onRightClickRow = function(v48)
        local l_item_0 = v48.item;
        v40.selectRow(l_item_0.Id, false);
        v40.showContextMenu(l_item_0);
    end;
    v40.showEmptyRowContextMenu = function(v50)
        local l_props_0 = v40.props;
        local v52 = {
            Id = "EmptyRowMenu", 
            Children = {
                {
                    Id = "PasteProperty", 
                    Text = l_props_0.Localization:getText("ContextMenu", "Paste"), 
                    Icon = v28.paste(), 
                    Enabled = v40.canPasteProperty(), 
                    OnItemClicked = v33(v40.menuActions.pasteProperty, {
                        v50
                    })
                }
            }
        };
        local v53 = l_props_0.Plugin:get();
        v27.trackClicks(v52, (l_props_0.Telemetry:get()));
        v27.showContextMenu(v53, v52);
    end;
    v40.showPropertyRowContextMenu = function(v54)
        local l_props_1 = v40.props;
        local l_Localization_0 = l_props_1.Localization;
        local v57 = v54.Value.Schema.Type == v29.TokenReferenceSchema.Type;
        local v58 = v30.getSelectorChain(l_props_1.RootInstance);
        local v59 = not not v58 and v58.Class ~= "";
        local v60 = v26.isTheme((v31.getTokenSourceStyleSheet(l_props_1.RootInstance, v54.Value.Value)));
        local v61 = if not v57 then {
            Id = "LinkToken", 
            Text = l_Localization_0:getText("ContextMenu", "LinkToken"), 
            Icon = v28.Standard.TokenSheet(), 
            OnItemClicked = v33(v40.menuActions.linkToken, {
                v54
            })
        } else {
            Id = "UnlinkToken", 
            Text = l_Localization_0:getText("ContextMenu", "UnlinkToken"), 
            Icon = v28.Standard.TokenSheet(), 
            OnItemClicked = v33(v40.menuActions.unlinkToken, {
                v54
            })
        };
        local v62 = v29.getPossiblePropertyTypes(v54.Name.Value);
        local v63 = {
            Id = "PropertyRowMenu", 
            Children = {
                v61, 
                {
                    Id = "ViewTheme", 
                    Text = l_Localization_0:getText("ContextMenu", not v60 and "ViewToken" or "ViewTheme"), 
                    Icon = v28.open(), 
                    Hidden = not v57, 
                    OnItemClicked = v33(v40.menuActions.viewTheme, {
                        v54
                    })
                }, 
                {
                    Id = "ChangeType", 
                    Text = l_Localization_0:getText("ContextMenu", "ChangeType"), 
                    Hidden = v59 or #v62 <= 1, 
                    Children = v27.getAttributeTypeActions(v62, v33(v40.menuActions.changePropertyType, {
                        v54
                    }))
                }, 
                {
                    Id = "Copy", 
                    Text = l_Localization_0:getText("ContextMenu", "Copy"), 
                    Icon = v28.copy(), 
                    OnItemClicked = v33(v40.menuActions.copyProperty, {
                        v54
                    })
                }, 
                {
                    Id = "Paste", 
                    Text = l_Localization_0:getText("ContextMenu", "Paste"), 
                    Icon = v28.paste(), 
                    Enabled = v40.canPasteProperty(), 
                    OnItemClicked = v33(v40.menuActions.pasteProperty, {
                        v54
                    })
                }, 
                {
                    Id = "Delete", 
                    Text = l_Localization_0:getText("ContextMenu", "Delete"), 
                    Icon = v28.delete(), 
                    OnItemClicked = v33(v40.menuActions.deleteProperty, {
                        v54
                    })
                }
            }
        };
        local v64 = l_props_1.Plugin:get();
        v27.trackClicks(v63, (l_props_1.Telemetry:get()));
        v27.showContextMenu(v64, v63);
    end;
    v40.showContextMenu = function(v65)
        local l_props_2 = v40.props;
        if typeof(v65.Instance) == "Instance" then
            l_props_2.dispatch(v23(v65.Instance, v40.menuActions.rename, false));
            return ;
        elseif v65.Value and v65.Value.Schema then
            if v65.Value.Schema.Type == "Empty" then
                v40.showEmptyRowContextMenu(v65);
                return ;
            else
                v40.showPropertyRowContextMenu(v65);
                return ;
            end;
        else
            return ;
        end;
    end;
    v40.onEdited = function(v67, v68, v69)
        local l_props_3 = v40.props;
        local l_state_0 = v40.state;
        local v72 = l_EditTree_0:getChild(l_state_0.table.Items, v68);
        if v72 then
            if not v72.Name.FullSpan then
                local l_Value_0 = v72.Name.Value;
                local v74 = l_EditTree_0:getParent(l_state_0.table.Items, v72);
                local l_Instance_0 = v74.Instance;
                if typeof(v72.SetParentValue) == "function" then
                    v67 = v72.SetParentValue(v67);
                    l_Value_0 = v74.Name.Value;
                    l_Instance_0 = l_EditTree_0:getParent(l_state_0.table.Items, v74).Instance;
                end;
                if l_Instance_0 then
                    if v69 == v37.NAME_COLUMN_INDEX then
                        l_props_3.dispatch(v19(l_Instance_0, l_Value_0, v67));
                        return ;
                    else
                        if v69 == v37.VALUE_COLUMN_INDEX then
                            l_props_3.dispatch(v20(l_Instance_0, l_Value_0, v67));
                        end;
                        return ;
                    end;
                else
                    warn("Table row without valid StyleRule reference:", v74);
                    return ;
                end;
            elseif v72.Instance then
                assert(v72.Instance ~= nil, "expecting valid instance");
                local l_v67_0 = v67;
                l_props_3.dispatch(v22(v72.Instance, l_v67_0));
                if l_v67_0 == v72.Name.Value then
                    v41(function(v77)
                        return l_EditTree_0:updateCell(v77, {
                            Schema = l_join_0(v29.SelectorSchema, {
                                Editing = false
                            })
                        }, v68, 1);
                    end);
                end;
                return ;
            else
                warn("Table row without valid StyleRule reference:", v72);
                return ;
            end;
        else
            return ;
        end;
    end;
    v40.tableCallbacks.OnSelectionChange = function(v78)
        local v79 = v35.getOneSelectedItem(v78);
        if v79 then
            v40.selectRow(v79, true);
        end;
    end;
    v40.onSizeChange = function(_, v81)
        local v82 = math.min(250, 0.4 * v81);
        local v83 = UDim.new(0, v82);
        local v84 = UDim.new(1, -v82);
        v40:setState(function(v85)
            return {
                table = l_joinDeep_0(v85.table, {
                    Columns = {
                        {
                            Width = v83
                        }, 
                        {
                            Width = v84
                        }
                    }
                })
            };
        end);
    end;
    v40.menuActions = {
        linkToken = function(v86, _)
            v40.props.dispatch(v21(l_EditTree_0:getParent(v40.state.table.Items, v86).Instance, v86.Name.Value, "TokenReference"));
        end, 
        unlinkToken = function(v88, _)
            v40.props.dispatch(v24(l_EditTree_0:getParent(v40.state.table.Items, v88).Instance, v88.Name.Value));
        end, 
        changePropertyType = function(v90, v91)
            local l_props_4 = v40.props;
            local v93 = if not v91.Data then nil else v91.Data.Type;
            if v93 then
                l_props_4.dispatch(v21(l_EditTree_0:getParent(v40.state.table.Items, v90).Instance, v90.Name.Value, v93));
                return ;
            else
                warn("Cannot change to nil type");
                return ;
            end;
        end, 
        copyProperty = function(v94, _)
            v40.props.dispatch(v16(v94.Name.Value, v94.Value.Value));
        end, 
        pasteProperty = function(v96, _)
            local l_state_1 = v40.state;
            local l_props_5 = v40.props;
            if l_props_5.ClipboardProperty then
                assert(l_props_5.ClipboardProperty, "ClipboardProperty cannot be nil");
                local v100 = l_EditTree_0:getParent(l_state_1.table.Items, v96);
                if v100 and v100.Instance then
                    v34({
                        Name = "StyleEditor.PasteProperty", 
                        DisplayName = "StyleEditor - Paste Property", 
                        DoChange = function()
                            v100.Instance:SetProperty(l_props_5.ClipboardProperty.Name, l_props_5.ClipboardProperty.Value);
                            return Enum.FinishRecordingOperation.Commit;
                        end
                    });
                    return ;
                else
                    return ;
                end;
            else
                return ;
            end;
        end, 
        deleteProperty = function(v101, _)
            local v103 = l_EditTree_0:getParent(v40.state.table.Items, v101);
            if v103 and v103.Instance then
                v34({
                    Name = "StyleEditor.DeleteProperty", 
                    DisplayName = "Style Editor - Delete Property", 
                    DoChange = function()
                        v103.Instance:SetProperty(v101.Name.Value, nil);
                        return Enum.FinishRecordingOperation.Commit;
                    end
                });
                return ;
            else
                return ;
            end;
        end, 
        viewTheme = function(v104, _)
            local l_props_6 = v40.props;
            local v107 = v31.getTokenSourceStyleSheet(v40.props.RootInstance, v104.Value.Value);
            if v107 then
                l_props_6.dispatch(v17((v35.createItemId(v107))));
            end;
        end, 
        rename = function(v108, _)
            v40.onDoubleClick(v108.Path);
        end
    };
    v40.onAction = function(v110, v111, _)
        if v110 == "Menu" then
            v40.showContextMenu((l_EditTree_0:getChild(v40.state.table.Items, v111)));
        end;
    end;
    v40.onPropertyPressed = function(v113, _)
        v40.selectRow(l_EditTree_0:getChild(v40.state.table.Items, v113).Id, false);
    end;
end;
v39.getDerivedStateFromProps = function(v115, v116)
    local l_RootInstance_0 = v115.RootInstance;
    if l_RootInstance_0 == v116.rootInstance and not v115.IsDirty then
        return v116;
    else
        local v118 = v37.buildItems(l_RootInstance_0);
        local v119 = {};
        local v120 = {};
        if l_RootInstance_0 == v116.rootInstance then
            v120 = l_copy_0(v116.table.Expansion);
            v119 = l_copy_0(v116.table.Selection);
        end;
        v37.expandNewRows(v118, v120);
        return l_join_0(v116, {
            rootInstance = l_RootInstance_0, 
            table = l_join_0(v116.table, {
                Expansion = v120, 
                Selection = v119, 
                Items = v118
            })
        });
    end;
end;
v39.render = function(v121)
    local l_state_2 = v121.state;
    return v2.createElement(l_TreeTable_0, (l_join_0({
        Columns = l_state_2.table.Columns, 
        ClampSize = true, 
        Expansion = l_state_2.table.Expansion, 
        FullSpanEmphasis = true, 
        GetChildren = v37.getItemChildren, 
        GetItemId = v37.getItemId, 
        LayoutOrder = 2, 
        OnCellAction = v121.onAction, 
        OnCellEdited = v121.onEdited, 
        OnCellDoubleClick = v121.onDoubleClick, 
        OnSizeChange = v121.onSizeChange, 
        Renderers = v32, 
        RightClick = v121.onRightClickRow, 
        RootItems = l_state_2.table.Items, 
        RowHeight = 32, 
        Selection = l_state_2.table.Selection, 
        Scroll = true, 
        ScrollProps = {
            VerticalScrollBarInset = Enum.ScrollBarInset.ScrollBar
        }, 
        ShowHeader = false, 
        UseScale = true
    }, v121.tableCallbacks)));
end;
return v3.connect(function(v123)
    return {
        IsDirty = v123.Window.IsDirty, 
        ClipboardInstance = v123.Clipboard.Instance, 
        ClipboardProperty = v123.Clipboard.Property
    };
end, v25)((l_withContext_0({
    Plugin = l_ContextServices_0.Plugin, 
    Localization = l_ContextServices_0.Localization, 
    Telemetry = v36
})(v39)));
