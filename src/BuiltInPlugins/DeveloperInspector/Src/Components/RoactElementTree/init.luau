local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Roact);
local v2 = require(l_Parent_0.Packages.RoactRodux);
local v3 = require(l_Parent_0.Packages.Framework);
local v4 = require(l_Parent_0.Src.Util.InspectorContext);
local v5 = require(script.RoactElementRow);
local l_RoactInspectorApi_0 = v3.DeveloperTools.RoactInspectorApi;
local v7 = require(l_Parent_0.Packages.Dash);
local l_shallowEqual_0 = v7.shallowEqual;
local l_mapOne_0 = v7.mapOne;
local l_values_0 = v7.values;
local l_sort_0 = table.sort;
local l_ContextServices_0 = v3.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_TreeView_0 = v3.UI.TreeView;
local l_Actions_0 = l_Parent_0.Src.Actions;
local v16 = require(l_Actions_0.RoactInspector.SelectInstance);
local v17 = require(l_Actions_0.RoactInspector.ToggleInstance);
local v18 = v1.PureComponent:extend("RoactElementTree");
v18.init = function(v19)
    v19.onToggleInstance = function(v20)
        local l_item_0 = v20.item;
        local v22 = not v19.props.Expansion[l_item_0];
        v19.props.toggleInstance({
            [l_item_0] = v22
        });
        if v22 then
            local v23 = v19.props.Inspector:get():getTargetApi();
            if l_RoactInspectorApi_0.isInstance(v23) then
                v23:getChildren(l_item_0.Path);
            end;
        end;
    end;
    v19.onSelectInstance = function(v24)
        local l_item_1 = v24.item;
        if not v19.props.Expansion[l_item_1] then
            v19.onToggleInstance(v24);
        end;
        v19.props.selectInstance({
            [l_item_1] = true
        });
        local v26 = v19.props.Inspector:get():getTargetApi();
        if l_RoactInspectorApi_0.isInstance(v26) then
            v26:getBranch(l_item_1.Path);
        end;
    end;
    v19.onEnterRow = function(v27)
        v19.hoveredItem = v27.item;
        local v28 = v19.props.Inspector:get():getTargetApi();
        if l_RoactInspectorApi_0.isInstance(v28) then
            v28:highlight(v27.item.Path);
        end;
    end;
    v19.onLeaveRow = function(v29)
        if v29.item ~= v19.hoveredItem then
            return ;
        else
            local v30 = v19.props.Inspector:get():getTargetApi();
            if l_RoactInspectorApi_0.isInstance(v30) then
                v30:dehighlight();
            end;
            return ;
        end;
    end;
    v19.getRowProps = function(v31, _, v33, v34)
        return {
            Row = v31, 
            OnEnterRow = v19.onEnterRow, 
            OnLeaveRow = v19.onLeaveRow, 
            OnSelect = v19.onSelectInstance, 
            OnToggle = v19.onToggleInstance, 
            Position = v33, 
            Flash = l_mapOne_0(v19.props.Flash, function(v35, v36)
                if not l_shallowEqual_0(v36, v31.item.Path) then
                    return nil;
                else
                    return v35;
                end;
            end), 
            IsExpanded = v19.props.Expansion[v31.item], 
            IsSelected = v19.props.Selection[v31.item], 
            Size = v34, 
            Style = v19.props.Stylizer
        };
    end;
end;
local function v41(v37)
    local v38 = not not v37.Children and l_values_0(v37.Children) or {};
    l_sort_0(v38, function(v39, v40)
        return v39.Name < v40.Name;
    end);
    return v38;
end;
v18.render = function(v42)
    local l_props_0 = v42.props;
    return v1.createElement(l_TreeView_0, {
        Size = UDim2.new(1, 0, 1, 0), 
        Expansion = l_props_0.Expansion, 
        GetRowProps = v42.getRowProps, 
        RootItems = v41(l_props_0.RootInstance), 
        RowComponent = v5, 
        GetChildren = v41, 
        ScrollingDirection = Enum.ScrollingDirection.Y, 
        Style = "BorderBox"
    });
end;
return v2.connect(function(v44, _)
    return {
        SelectedNodeIndex = v44.RoactInspector.selectedNodeIndex, 
        RootInstance = v44.RoactInspector.rootInstance, 
        Flash = v44.RoactInspector.flashInstances, 
        Selection = v44.RoactInspector.selectedInstances, 
        Expansion = v44.RoactInspector.expandedInstances
    };
end, function(v46)
    return {
        selectInstance = function(v47)
            v46(v16(v47));
        end, 
        toggleInstance = function(v48)
            v46(v17(v48));
        end
    };
end)((l_withContext_0({
    Stylizer = l_ContextServices_0.Stylizer, 
    Inspector = v4
})(v18)));
