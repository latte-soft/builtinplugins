local l_ChangeHistoryService_0 = game:GetService("ChangeHistoryService");
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_Parent_0 = script.Parent.Parent.Parent;
local v3 = require(l_Parent_0.Packages.React);
local v4 = require(l_Parent_0.Packages.RoactRodux);
local v5 = require(l_Parent_0.Packages.Framework);
local l_ContextServices_0 = v5.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_TreeTable_0 = v5.UI.TreeTable;
local v9 = require(l_Parent_0.Src.Renderers.DeriveRenderer);
local v10 = require(l_Parent_0.Src.Util.DesignHelpers);
local v11 = require(l_Parent_0.Src.Util.StyleSchema);
local v12 = require(l_Parent_0.Src.Util.getAutocompleteItems);
local v13 = require(l_Parent_0.Src.Util.recordChange)(l_ChangeHistoryService_0);
local v14 = require(l_Parent_0.Src.Util.TreeTableHelpers);
local _ = require(l_Parent_0.Src.Types);
local _ = require(l_Parent_0.Src.Reducers.RootReducer);
local v17 = require(l_Parent_0.Packages.Dash);
local l_collectArray_0 = v17.collectArray;
local l_filter_0 = v17.filter;
local l_join_0 = v17.join;
local l_mapOne_0 = v17.mapOne;
local l_copy_0 = v17.copy;
local l_insert_0 = table.insert;
local v26 = l_TreeTable_0.EditTree.new({
    getChildren = function(v24)
        return v24.Children or {};
    end, 
    getId = function(v25)
        return v25;
    end
});
local v27 = {
    {
        Name = "Name", 
        Key = "Name", 
        Width = UDim.new(1, 0)
    }
};
local v28 = v3.PureComponent:extend("DerivesTable");
v28.init = function(v29)
    v29.state = {
        allSheets = {}, 
        styleSheet = nil, 
        table = {
            Columns = l_copy_0(v27), 
            Expansion = {}, 
            Selection = {}, 
            Items = {}
        }
    };
    v29.tableCallbacks = v26:getCallbacks((v26:getStateAdaptor(v29, "table")));
    v29.onEdited = function(v30, _, _)
        local l_props_0 = v29.props;
        local l_state_0 = v29.state;
        local l_StyleSheet_0 = l_props_0.StyleSheet;
        v13({
            Name = "StyleEditor.SetDerives", 
            DisplayName = "Style Editor - Set Derives", 
            DoChange = function()
                v10.insertDerive(l_StyleSheet_0, (l_mapOne_0(l_state_0.allSheets, function(v36)
                    if v36.Name == v30 then
                        return v36;
                    else
                        return nil;
                    end;
                end)));
                return Enum.FinishRecordingOperation.Commit;
            end
        });
    end;
    v29.getChildren = function(v37)
        return v37.Children or {};
    end;
    v29.getCellAutocomplete = function(v38)
        local l_StyleSheet_1 = v29.props.StyleSheet;
        return v12(l_collectArray_0(v29.state.allSheets, function(_, v41)
            if not v10.isValidDerive(l_StyleSheet_1, v41) then
                return ;
            else
                return v41.Name;
            end;
        end), v38);
    end;
end;
v28.getAllSheets = function(v42)
    return l_filter_0(l_ReplicatedStorage_0:GetDescendants(), function(v43)
        return v43:IsA("StyleSheet") and v43 ~= v42;
    end);
end;
v28.getEmptyRow = function()
    return {
        Name = {
            Schema = l_join_0(v11.TextSchema, {
                PlaceholderText = "Add a Derive..."
            }), 
            Value = ""
        }, 
        Value = {
            Schema = {
                Type = "Empty"
            }, 
            Value = ""
        }
    };
end;
v28.getItems = function(v44)
    local v48 = {
        Name = {
            Schema = l_join_0(v11.SelectorSchema, {
                Editing = false
            }), 
            FullSpan = true, 
            Value = "Derives"
        }, 
        Children = l_collectArray_0(v44:GetDerives(), function(_, v46)
            return {
                Name = {
                    OnClick = function(v47)
                        if v47 then
                            v13({
                                Name = "StyleEditor.RemoveDerive", 
                                DisplayName = "Style Editor - Remove Derive from {derivedSheet.Name}", 
                                DoChange = function()
                                    v10.removeDerive(v44, v47);
                                    return Enum.FinishRecordingOperation.Commit;
                                end
                            });
                            return ;
                        else
                            return nil;
                        end;
                    end, 
                    Schema = v11.DeriveSchema, 
                    Value = v46
                }, 
                Instance = v46
            };
        end)
    };
    l_insert_0(v48.Children, v28.getEmptyRow());
    return v26:updatePaths({
        v48
    });
end;
v28.getDerivedStateFromProps = function(v49, v50)
    local l_StyleSheet_2 = v49.StyleSheet;
    if l_StyleSheet_2 == v50.styleSheet and not v49.IsDirty then
        return v50;
    else
        local v52 = v28.getAllSheets(l_StyleSheet_2);
        local v53 = v28.getItems(l_StyleSheet_2);
        v14.updateItems(v26, v50.table, {
            Children = v50.table.Items
        }, {
            Children = v53
        });
        local l_Expansion_0 = v50.table.Expansion;
        l_Expansion_0[v53[1]] = true;
        return l_join_0(v50, {
            allSheets = v52, 
            styleSheet = l_StyleSheet_2, 
            table = l_join_0(v50.table, {
                Expansion = l_Expansion_0, 
                Items = v53
            })
        });
    end;
end;
v28.render = function(v55)
    local l_props_1 = v55.props;
    local l_state_1 = v55.state;
    return v3.createElement(l_TreeTable_0, (l_join_0({
        AutomaticSize = Enum.AutomaticSize.Y, 
        Columns = l_state_1.table.Columns, 
        Expansion = l_state_1.table.Expansion, 
        FullSpanEmphasis = true, 
        GetCellAutocomplete = v55.getCellAutocomplete, 
        GetChildren = v55.getChildren, 
        LayoutOrder = l_props_1.LayoutOrder, 
        OnCellEdited = v55.onEdited, 
        Renderers = {
            Derive = v9
        }, 
        RootItems = l_state_1.table.Items, 
        RowHeight = 32, 
        Selection = l_state_1.table.Selection, 
        ShowHeader = false, 
        UseScale = true
    }, v55.tableCallbacks)));
end;
v28 = l_withContext_0({
    Localization = l_ContextServices_0.Localization
})(v28);
return v4.connect(function(v58)
    return {
        IsDirty = v58.Window.IsDirty
    };
end)(v28);
