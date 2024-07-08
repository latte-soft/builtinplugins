local l_ChangeHistoryService_0 = game:GetService("ChangeHistoryService");
local l_Parent_0 = script.Parent.Parent.Parent;
local v2 = require(l_Parent_0.Packages.React);
local v3 = require(l_Parent_0.Packages.RoactRodux);
local v4 = require(l_Parent_0.Packages.Dash);
local l_copy_0 = v4.copy;
local l_join_0 = v4.join;
local v7 = require(l_Parent_0.Packages.Framework);
local l_ContextServices_0 = v7.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_Localization_0 = l_ContextServices_0.Localization;
local l_TreeTable_0 = v7.UI.TreeTable;
local v12 = require(l_Parent_0.Src.Util.recordChange)(l_ChangeHistoryService_0);
local v13 = require(l_Parent_0.Src.Util.StyleSchema);
local v14 = require(l_Parent_0.Src.Renderers);
local v15 = require(l_Parent_0.Src.Util.TreeTableHelpers);
local v16 = require(l_Parent_0.Src.Contexts.Telemetry.TelemetryContext);
local v17 = require(l_Parent_0.Src.Util.mapDispatchToProps);
local _ = require(l_Parent_0.Src.Types);
local _ = require(l_Parent_0.Src.Reducers.Clipboard);
local _ = require(l_Parent_0.Src.Reducers.RootReducer);
local l_Thunks_0 = l_Parent_0.Src.Thunks;
local v22 = require(l_Thunks_0.ContextMenu.ShowStyleSheetMenu);
local v23 = require(l_Thunks_0.ContextMenu.ShowTokenMenu);
local v24 = require(l_Thunks_0.ContextMenu.ShowEmptyTokenMenu);
local v25 = require(script.Tree);
local l_EditTree_0 = v25.EditTree;
local v27 = v2.PureComponent:extend("TokenTable");
v27.init = function(v28)
    v28.state = {
        selectSchema = v2.None, 
        table = {
            Columns = l_copy_0(v25.Columns), 
            Expansion = {}, 
            Selection = {}, 
            Items = {}
        }
    };
    local v29 = l_EditTree_0:getStateAdaptor(v28, "table");
    v28.tableCallbacks = l_EditTree_0:getCallbacks(v29);
    v28.setConnections = function()
        local l_props_0 = v28.props;
        local l_RootInstance_0 = v28.props.RootInstance;
        v27.disconnect(v28.connections);
        v28.connections = {
            styleSheet = l_RootInstance_0.AttributeChanged:Connect(function(v32)
                v28:setState(function(v33)
                    local v34 = v25.buildTree(l_RootInstance_0, l_props_0.ThemeSelected, l_props_0.OnClick, (v13.getAttributeSchema((l_RootInstance_0:GetAttribute(v32)))));
                    local v35 = v15.createItemId(l_RootInstance_0);
                    local l_Expansion_0 = v33.table.Expansion;
                    l_Expansion_0[v35] = true;
                    return {
                        table = l_join_0(v33.table, {
                            Expansion = l_Expansion_0, 
                            Items = v34
                        })
                    };
                end);
            end)
        };
    end;
    v28.onDoubleClick = function(v37)
        v29(function(v38)
            local v39 = l_EditTree_0:getChild(v38.Items, v37);
            if v39 then
                return l_EditTree_0:updateCell(v38, {
                    Schema = l_join_0(v39.Name.Schema, {
                        Editing = true
                    })
                }, v37, 1);
            else
                return nil;
            end;
        end);
    end;
    v28.onRightClickRow = function(v40)
        local l_item_0 = v40.item;
        v28.selectRow(l_item_0.Id, false);
        if not (l_item_0.Value ~= nil) then
            return ;
        else
            v28.showRowContextMenu(l_item_0.Path);
            return ;
        end;
    end;
    v28.showRowContextMenu = function(v42)
        local l_props_1 = v28.props;
        local v44 = l_EditTree_0:getChild(v28.state.table.Items, v42);
        local v45 = if not v44.Value then nil else v44.Value.Schema;
        local function v46()
            v28.onDoubleClick(v42);
        end;
        if not (v45 ~= v13.EmptySchema) or v45 == v13.SelectTokenSchema then
            l_props_1.dispatch(v24(l_props_1.RootInstance));
            return ;
        elseif not v44.Name.FullSpan then
            l_props_1.dispatch(v23(l_props_1.RootInstance, v44.Name.Value));
            return ;
        else
            l_props_1.dispatch(v22(l_props_1.RootInstance, v46));
            return ;
        end;
    end;
    v28.selectRow = function(v47, v48)
        v29(function(v49)
            local l_Expansion_1 = v49.Expansion;
            if v48 and v49.Selection[v47] == true then
                l_Expansion_1 = l_join_0(v49.Expansion, {
                    [v47] = not v49.Expansion[v47]
                });
            end;
            return l_join_0(v49, {
                Selection = {
                    [v47] = true
                }, 
                Expansion = l_Expansion_1
            });
        end);
    end;
    v28.tableCallbacks.OnSelectionChange = function(v51)
        local v52 = v15.getOneSelectedItem(v51);
        if v52 then
            v28.selectRow(v52, true);
        end;
    end;
    v28.onCellAction = function(v53, v54, _)
        if v53 == "Menu" then
            v28.showRowContextMenu(v54);
        end;
    end;
    v28.onTokenEdited = function(v56, v57, v58)
        v29(function(v59)
            local v60 = l_EditTree_0:getChild(v59.Items, v57);
            local l_RootInstance_1 = v28.props.RootInstance;
            if v60 then
                local v62 = {
                    Value = v56
                };
                local v63 = if not v60.Value then v60.Name.Schema else v60.Value.Schema;
                if v58 == 1 then
                    if not v60.Name.FullSpan then
                        if l_RootInstance_1 and l_RootInstance_1:GetAttribute(v56) ~= nil then
                            v62.Value = v60.Name.Value;
                        elseif v60.Name.Value == "" then
                            v62.Schema = v13.TextSchema;
                            if not (not (v63 == v13.SelectTokenSchema) or not v60.Value.Value) then
                                v63 = v60.Value.Value;
                            end;
                            if v63 ~= v13.SelectTokenSchema then
                                v12({
                                    Name = "StyleEditor.AddToken", 
                                    DisplayName = "Style Editor - Add Token", 
                                    DoChange = function()
                                        local l_status_0, _ = pcall(function()
                                            l_RootInstance_1:SetAttribute(v56, v63.GetDefaultValue());
                                        end);
                                        if not l_status_0 then
                                            return nil;
                                        else
                                            return Enum.FinishRecordingOperation.Commit;
                                        end;
                                    end
                                });
                            end;
                        else
                            v12({
                                Name = "StyleEditor.EditToken", 
                                DisplayName = "Style Editor - Edit Token", 
                                DoChange = function()
                                    local l_status_1, _ = pcall(function()
                                        l_RootInstance_1:SetAttribute(v56, v60.Value.Value);
                                        l_RootInstance_1:SetAttribute(v60.Name.Value, nil);
                                    end);
                                    if not l_status_1 then
                                        return nil;
                                    else
                                        return Enum.FinishRecordingOperation.Commit;
                                    end;
                                end
                            });
                        end;
                    else
                        v62.Schema = l_join_0(v63, {
                            Editing = false
                        });
                        v62.Value = if v63.Type == "Theme" then l_RootInstance_1 else v56;
                        v12({
                            Name = "StyleEditor.RenameStyleSheet", 
                            DisplayName = "Style Editor - Rename StyleSheet", 
                            DoChange = function()
                                l_RootInstance_1.Name = v56;
                                return Enum.FinishRecordingOperation.Commit;
                            end
                        });
                    end;
                elseif v58 == 2 then
                    local l_Value_0 = v60.Name.Value;
                    if v63 == v13.SelectTokenSchema then
                        v28:setState({
                            selectSchema = v56
                        });
                        if l_Value_0 and l_Value_0 ~= "" then
                            v62.Schema = v56;
                            v56 = v56.GetDefaultValue();
                            v62.Value = v56;
                        end;
                    elseif v60.Name.Schema == v13.ChildComponentSchema then
                        l_Value_0 = l_EditTree_0:getParent(v59.Items, v60).Name.Value;
                        v56 = if not v60.SetParentValue then v56 else v60.SetParentValue(v56);
                    end;
                    do
                        local l_l_Value_0_0 = l_Value_0;
                        if l_l_Value_0_0 and l_l_Value_0_0 ~= "" then
                            v12({
                                Name = "StyleEditor.EditToken", 
                                DisplayName = "Style Editor - Edit Token", 
                                DoChange = function()
                                    local l_status_2, _ = pcall(function()
                                        l_RootInstance_1:SetAttribute(l_l_Value_0_0, v56);
                                    end);
                                    if not l_status_2 then
                                        return nil;
                                    else
                                        return Enum.FinishRecordingOperation.Commit;
                                    end;
                                end
                            });
                        end;
                    end;
                end;
                return l_EditTree_0:updateCell(v59, v62, v57, v58);
            else
                return ;
            end;
        end);
    end;
end;
v27.didMount = function(v72)
    v72.setConnections();
end;
v27.didUpdate = function(v73, v74, _)
    if not (v74.RootInstance == v73.props.RootInstance and v73.connections) then
        v73.setConnections();
    end;
end;
v27.getDerivedStateFromProps = function(v76, v77)
    local l_RootInstance_2 = v76.RootInstance;
    if not (l_RootInstance_2 == v77.styleSheet) or v76.ThemeSelected ~= v77.ThemeSelected then
        local l_selectSchema_0 = v77.selectSchema;
        if l_RootInstance_2 ~= v77.styleSheet then
            l_selectSchema_0 = if #l_RootInstance_2:GetDerives() > 0 then v13.TokenReferenceSchema else v2.None;
        end;
        local v80 = v25.buildTree(l_RootInstance_2, v76.ThemeSelected, v76.OnClick, l_selectSchema_0);
        local l_Expansion_2 = v77.table.Expansion;
        if v76.ThemeSelected == nil then
            l_Expansion_2[v15.createItemId(l_RootInstance_2)] = true;
        end;
        return l_join_0(v77, {
            selctSchema = l_selectSchema_0, 
            ThemeSelected = v76.ThemeSelected, 
            styleSheet = l_RootInstance_2, 
            table = l_join_0(v77.table, {
                Expansion = l_Expansion_2, 
                Items = v80
            })
        });
    else
        return v77;
    end;
end;
v27.disconnect = function(v82)
    if v82 then
        for v83, v84 in pairs(v82) do
            if v84 then
                v84:Disconnect();
            end;
            v82[v83] = nil;
        end;
    end;
end;
v27.willUnmount = function(v85)
    v27.disconnect(v85.connections);
end;
v27.render = function(v86)
    local l_state_0 = v86.state;
    return v2.createElement(l_TreeTable_0, l_join_0({
        AutomaticSize = Enum.AutomaticSize.Y, 
        Columns = l_state_0.table.Columns, 
        Expansion = l_state_0.table.Expansion, 
        FullSpanEmphasis = true, 
        GetChildren = v25.getItemChildren, 
        GetItemId = v25.getItemId, 
        OnCellAction = v86.onCellAction, 
        OnCellDoubleClick = v86.onDoubleClick, 
        OnCellEdited = v86.onTokenEdited, 
        OnCellPressed = v86.onPropertyPressed, 
        RightClick = v86.onRightClickRow, 
        RootItems = l_state_0.table.Items, 
        RowHeight = 32, 
        Renderers = v14, 
        ShowHeader = false, 
        Selection = l_state_0.table.Selection, 
        UseScale = true
    }, v86.tableCallbacks));
end;
v27 = l_withContext_0({
    Localization = l_Localization_0, 
    Plugin = l_ContextServices_0.Plugin, 
    Telemetry = v16
})(v27);
return v3.connect(function(v88)
    return {
        ClipboardAttribute = v88.Clipboard.Attribute
    };
end, v17)(v27);
