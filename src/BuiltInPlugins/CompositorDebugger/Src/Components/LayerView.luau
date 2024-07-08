local l_script_FirstAncestor_0 = script:FindFirstAncestor("CompositorDebugger");
local _ = require(l_script_FirstAncestor_0.Src.Types);
local v2 = require(l_script_FirstAncestor_0.Packages.React);
local v3 = require(l_script_FirstAncestor_0.Packages.RoactRodux);
local v4 = require(l_script_FirstAncestor_0.Packages.Framework);
local l_ContextServices_0 = v4.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_Analytics_0 = l_ContextServices_0.Analytics;
local l_Localization_0 = l_ContextServices_0.Localization;
local l_Dash_0 = v4.Dash;
local l_copy_0 = l_Dash_0.copy;
local l_join_0 = l_Dash_0.join;
local _ = l_Dash_0.keys;
local l_Stylizer_0 = v4.Style.Stylizer;
local l_UI_0 = v4.UI;
local l_Pane_0 = l_UI_0.Pane;
local l_TextInput_0 = l_UI_0.TextInput;
local l_TreeTable_0 = l_UI_0.TreeTable;
local l_Actions_0 = l_script_FirstAncestor_0.Src.Actions;
local v19 = require(l_Actions_0.SetExpandedSections);
local v20 = require(l_Actions_0.SetHistoryField);
local v21 = require(l_script_FirstAncestor_0.Src.Components.LayerViewCell);
local v22 = require(l_script_FirstAncestor_0.Src.Thunks.SetOverride);
local l_Util_0 = l_script_FirstAncestor_0.Src.Util;
local v24 = require(l_Util_0.Constants);
local v25 = require(l_Util_0.debugFlags);
local _ = require(l_script_FirstAncestor_0.Src.Types);
local v27 = {
    props = {
        Editable = true, 
        Overrides = true, 
        History = true
    }, 
    state = {
        History = true
    }, 
    watches = {
        History = true
    }
};
local v32 = {
    number = {
        Type = "Number", 
        History = true
    }, 
    string = {
        Type = "Text"
    }, 
    boolean = {
        Type = "Checkbox"
    }, 
    Vector2 = {
        Type = "Vector", 
        Components = {
            "X", 
            "Y"
        }, 
        GetValue = function(v28)
            return Vector2.new(v28[1], v28[2]);
        end, 
        GetComponents = function(v29)
            return {
                v29.X, 
                v29.Y
            };
        end, 
        History = true
    }, 
    Vector3 = {
        Type = "Vector", 
        Components = {
            "X", 
            "Y", 
            "Z"
        }, 
        GetValue = function(v30)
            return (Vector3.new(v30[1], v30[2], v30[3]));
        end, 
        GetComponents = function(v31)
            return {
                v31.X, 
                v31.Y, 
                v31.Z
            };
        end, 
        History = true
    }
};
local v33 = v2.PureComponent:extend("LayerView");
v33.init = function(v34)
    v34.getChildren = function(v35)
        return v35.children or {};
    end;
    v34.getItemId = function(v36)
        return v36.id;
    end;
    v34.onToggle = function(v37)
        v34.props.SetExpandedSections(l_join_0(v34.props.ExpandedSections, v37));
    end;
    v34.onDoubleClick = function(v38)
        if v38.hasChildren then
            local v39 = v34.getItemId(v38.item);
            v34.onToggle({
                [v39] = v34.props.ExpandedSections[v39] == false
            });
        end;
    end;
    v34.onCellEdited = function(v40, v41)
        v34.props.SetOverride(v41.id, v41.field, v40);
    end;
    v34.onCellAction = function(v42, v43)
        local _ = v34.props;
        if v42 == v24.LAYERVIEW_ACTIONS.Clear then
            v34.props.SetOverride(v43.id, v43.field, nil);
            return ;
        else
            if v42 == v24.LAYERVIEW_ACTIONS.History then
                v34.props.SetHistoryField(v43.id, v43.section, v43.field);
            end;
            return ;
        end;
    end;
    v34:setState({
        LayerData = nil
    });
end;
local _ = function(v45, v46)
    local l_v45_0 = v45;
    for _, v49 in v46, nil, nil do
        l_v45_0 = l_v45_0 and l_v45_0[v49];
    end;
    return l_v45_0;
end;
local function v51(v52, v53, v54, v55, v56, v57)
    if v55 then
        assert(v55);
        local v58 = v27[v54];
        local v59 = v58 and v58.Editable;
        local v60 = v58 and v58.Overrides;
        local v61 = v58 and v58.History;
        local _ = v57 == nil;
        v57 = v57 or {};
        for v63, v64 in v55, nil, nil do
            local v65 = {};
            local v66 = l_copy_0(v57);
            table.insert(v66, v63);
            if not (not v60 or not v56) then
                local l_v56_0 = v56;
                for _, v69 in v66, nil, nil do
                    l_v56_0 = l_v56_0 and l_v56_0[v69];
                end;
                local l_l_v56_0_0 = l_v56_0;
                if l_l_v56_0_0 ~= nil then
                    v64 = l_l_v56_0_0;
                    table.insert(v65, {
                        Id = v24.LAYERVIEW_ACTIONS.Clear, 
                        Icon = {
                            Image = "rbxasset://textures/CompositorDebugger/clear.png", 
                            Size = UDim2.fromOffset(12, 12)
                        }
                    });
                end;
            end;
            local v71 = {
                name = v63, 
                id = v54 .. "|" .. table.concat(v66, "|"), 
                path = {
                    id = v53, 
                    section = v54, 
                    field = v66
                }
            };
            local v72 = typeof(v64);
            if v72 == "table" then
                v71.value = {
                    Value = "", 
                    Actions = v65
                };
                v71.children = {};
                v51(v71.children, v53, v54, v64, v56, v66);
            elseif v32[v72] then
                if not v61 or not v32[v72].History then
                    table.insert(v65, {
                        Id = v24.LAYERVIEW_ACTIONS.NoOp, 
                        Icon = {
                            Image = "", 
                            Size = UDim2.fromOffset(12, 12)
                        }
                    });
                else
                    table.insert(v65, {
                        Id = v24.LAYERVIEW_ACTIONS.History, 
                        Icon = {
                            Image = "rbxasset://textures/CompositorDebugger/history.png", 
                            Size = UDim2.fromOffset(12, 12)
                        }
                    });
                end;
                v71.value = {
                    Value = v64, 
                    Disabled = not v59, 
                    Schema = v32[v72], 
                    Actions = v65
                };
            else
                v71.value = "[" .. v72 .. "]";
            end;
            table.insert(v52, v71);
        end;
        table.sort(v52, function(v73, v74)
            return v73.name < v74.name;
        end);
        return ;
    else
        return ;
    end;
end;
local function _(v75, v76, v77, v78)
    return function(v79, v80)
        if not (not v80 or not next(v80)) then
            local v81 = {
                name = v78:getText("LayerView", v79), 
                children = {}, 
                id = v79
            };
            v51(v81.children, v76, v79, v80, v77);
            table.insert(v75, v81);
        end;
    end;
end;
local function v92(v83, v84, v85)
    if v83 then
        local v86 = {};
        if v25.ShowLayerID then
            table.insert(v86, {
                name = v83.id, 
                children = {}, 
                id = v83.id or "uuid"
            });
        end;
        local l_id_0 = v83.id;
        local function v91(v88, v89)
            if not (not v89 or not next(v89)) then
                local v90 = {
                    name = v85:getText("LayerView", v88), 
                    children = {}, 
                    id = v88
                };
                v51(v90.children, l_id_0, v88, v89, v84);
                table.insert(v86, v90);
            end;
        end;
        v91("layerDetails", {
            name = v83.name or "", 
            class = v83.className, 
            children = not not v83.children and #v83.children or 0
        });
        v91("props", v83.props);
        v91("state", v83.state);
        v91("watches", v83.watches);
        return v86;
    else
        return nil;
    end;
end;
v33.getDerivedStateFromProps = function(v93, _)
    return {
        LayerData = v92(v93.LayerData, v93.Overrides, v93.Localization) or v2.None
    };
end;
v33.render = function(v95)
    local l_state_0 = v95.state;
    local l_props_1 = v95.props;
    if not l_props_1.RawMode then
        if not l_state_0.LayerData then
            return v2.createElement(l_Pane_0, {
                LayoutOrder = l_props_1.LayoutOrder, 
                Size = l_props_1.Size
            });
        else
            return v2.createElement(l_TreeTable_0, {
                LayoutOrder = l_props_1.LayoutOrder, 
                Size = l_props_1.Size, 
                Columns = {
                    {
                        Name = "Name", 
                        Key = "name"
                    }, 
                    {
                        Name = "Value", 
                        Key = "value"
                    }
                }, 
                Expansion = l_props_1.ExpandedSections, 
                RootItems = l_state_0.LayerData, 
                ShowHeader = false, 
                GetChildren = v95.getChildren, 
                GetItemId = v95.getItemId, 
                FullSpan = true, 
                FullSpanEmphasis = true, 
                Scroll = true, 
                CellComponent = v21, 
                OnExpansionChange = v95.onToggle, 
                OnDoubleClick = v95.onDoubleClick, 
                OnCellEdited = v95.onCellEdited, 
                OnCellAction = v95.onCellAction
            });
        end;
    else
        local v98 = nil;
        local v99 = require(l_script_FirstAncestor_0.Src.Util.Debug.dumpTable);
        if not l_props_1.LayerData then
            v98 = "{}";
        else
            local v100 = l_copy_0(l_props_1.LayerData);
            if not v25.ShowRawDataChildren then
                v100.children = not v100.children and 0 or #v100.children;
            end;
            if not v25.ShowLayerID then
                v100.id = nil;
            end;
            v99(v100, function(v101)
                v98 = v101;
            end);
        end;
        return v2.createElement(l_TextInput_0, {
            LayoutOrder = l_props_1.LayoutOrder, 
            Size = l_props_1.Size, 
            MultiLine = true, 
            Disabled = true, 
            Text = v98
        });
    end;
end;
return (v3.connect(function(v102, _)
    return {
        ExpandedSections = v102.Status.ExpandedSections, 
        HistoryField = v102.Status.HistoryField
    };
end, function(v104)
    return {
        SetExpandedSections = function(v105)
            v104(v19(v105));
        end, 
        SetOverride = function(v106, v107, v108)
            v104(v22(v106, v107, v108));
        end, 
        SetHistoryField = function(v109, v110, v111)
            v104(v20(v109, v110, v111));
        end
    };
end)((l_withContext_0({
    Analytics = l_Analytics_0, 
    Localization = l_Localization_0, 
    Stylizer = l_Stylizer_0
})(v33))));
