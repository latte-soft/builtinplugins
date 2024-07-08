local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Roact);
local v2 = require(l_Parent_0.Packages.RoactRodux);
local v3 = require(l_Parent_0.Packages.Framework);
local v4 = require(l_Parent_0.Src.Util.InspectorContext);
local v5 = require(script.FieldTreeRow);
local l_RoactInspectorApi_0 = v3.DeveloperTools.RoactInspectorApi;
local v7 = require(l_Parent_0.Packages.Dash);
local l_flat_0 = v7.flat;
local l_values_0 = v7.values;
local l_sort_0 = table.sort;
local l_ContextServices_0 = v3.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_TreeView_0 = v3.UI.TreeView;
local l_Actions_0 = l_Parent_0.Src.Actions;
local v15 = require(l_Actions_0.RoactInspector.SelectField);
local v16 = require(l_Actions_0.RoactInspector.ToggleField);
local v17 = v1.PureComponent:extend("FieldsTable");
v17.init = function(v18)
    v18.onToggleField = function(v19)
        local l_item_0 = v19.item;
        local v21 = not v18.props.Expansion[l_item_0];
        v18.props.toggleField({
            [l_item_0] = v21
        });
        if v21 then
            local v22 = v18.props.Inspector:get():getTargetApi();
            if l_RoactInspectorApi_0.isInstance(v22) then
                v22:getFields(v18.props.SelectedPath, v18.props.SelectedNodeIndex, l_item_0.Path);
            end;
        end;
    end;
    v18.onSelectField = function(_)
    end;
    v18.getRowProps = function(v24, _, v26, v27)
        return {
            Row = v24, 
            OnSelect = v18.onSelectField, 
            OnToggle = v18.onToggleField, 
            IsExpanded = v18.props.Expansion[v24.item], 
            IsSelected = false, 
            Position = v26, 
            Style = v18.props.Stylizer, 
            Size = v27
        };
    end;
end;
local function v32(v28)
    local v29 = l_values_0(v28.Children or {});
    l_sort_0(v29, function(v30, v31)
        if typeof(v30) == typeof(v31) then
            return v30.Name < v31.Name;
        else
            return tostring(v30.Name) < tostring(v31.Name);
        end;
    end);
    return v29;
end;
v17.render = function(v33)
    local l_Children_0 = v33.props.Root.Children;
    return v1.createElement(l_TreeView_0, {
        Size = UDim2.new(1, 0, 1, 0), 
        Expansion = v33.props.Expansion, 
        RootItems = l_flat_0({
            {
                {
                    Name = "Props", 
                    IsHeading = true
                }
            }, 
            v32(l_Children_0.props), 
            {
                {
                    Name = "State", 
                    IsHeading = true
                }
            }, 
            v32(l_Children_0.state), 
            {
                {
                    Name = "Context", 
                    IsHeading = true
                }
            }, 
            (v32(l_Children_0._context))
        }), 
        RowComponent = v5, 
        GetChildren = v32, 
        GetRowProps = v33.getRowProps, 
        ScrollingDirection = Enum.ScrollingDirection.Y, 
        Style = "BorderBox"
    });
end;
return v2.connect(function(v35, _)
    return {
        SelectedPath = v35.RoactInspector.selectedPath, 
        SelectedNodeIndex = v35.RoactInspector.selectedNodeIndex, 
        Root = v35.RoactInspector.fields, 
        Selection = v35.RoactInspector.selectedFields, 
        Expansion = v35.RoactInspector.expandedFields
    };
end, function(v37)
    return {
        selectField = function(v38)
            v37(v15(v38));
        end, 
        toggleField = function(v39)
            v37(v16(v39));
        end
    };
end)((l_withContext_0({
    Stylizer = l_ContextServices_0.Stylizer, 
    Inspector = v4
})(v17)));
