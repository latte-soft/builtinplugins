local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Roact);
local v2 = require(l_Parent_0.Packages.RoactRodux);
local v3 = require(l_Parent_0.Packages.Framework);
local v4 = require(l_Parent_0.Src.Util.InspectorContext);
local v5 = require(l_Parent_0.Src.Util.TableIds);
local l_RoactInspectorApi_0 = v3.DeveloperTools.RoactInspectorApi;
local l_Actions_0 = l_Parent_0.Src.Actions;
local v8 = require(l_Actions_0.RoactInspector.SetProfilePageSize);
local v9 = require(l_Actions_0.RoactInspector.SetProfilePageIndex);
local v10 = require(l_Actions_0.RoactInspector.SortProfileData);
local v11 = require(l_Actions_0.RoactInspector.SelectProfileRow);
local l_ContextServices_0 = v3.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_UI_0 = v3.UI;
local l_PaginatedTable_0 = l_UI_0.PaginatedTable;
local l_Pane_0 = l_UI_0.Pane;
local l_TextLabel_0 = l_UI_0.TextLabel;
local v18 = v1.Component:extend("RoactProfilerComponentsTable");
local v19 = {
    {
        Name = "Component", 
        Key = "instanceName", 
        TooltipKey = "pathString", 
        Width = UDim.new(0.3, 0)
    }, 
    {
        Name = "Depth", 
        Key = "depth", 
        Width = UDim.new(0.15, 0)
    }, 
    {
        Name = "Renders", 
        Key = "count", 
        Width = UDim.new(0.15, 0)
    }, 
    {
        Name = "Render Time (ms)", 
        Key = "renderTime", 
        Width = UDim.new(0.2, 0)
    }, 
    {
        Name = "Deep Time (ms)", 
        Key = "time", 
        Width = UDim.new(0.2, 0)
    }
};
v18.init = function(v20)
    v20.onPageChange = function(v21)
        local v22 = v20.props.Inspector:get():getTargetApi();
        v20.props.setPageIndex(v21);
        if l_RoactInspectorApi_0.isInstance(v22) then
            if v22.setProfileComponentsPageIndex then
                v22:setProfileComponentsPageIndex(v21);
                v22:getProfileData();
            else
                return ;
            end;
        end;
    end;
    v20.onHover = function(_, v24)
        local v25 = v20.props.Inspector:get():getTargetApi();
        local v26 = v20.props.TableData.pageRows[v24];
        if not ((not v26 or not v26.path) or not l_RoactInspectorApi_0.isInstance(v25)) then
            v25:highlight(v26.path);
        end;
    end;
    v20.onMouseLeave = function()
        local v27 = v20.props.Inspector:get():getTargetApi();
        if l_RoactInspectorApi_0.isInstance(v27) then
            v27:dehighlight();
        end;
    end;
    v20.onSizeChange = function(v28)
        local v29 = v20.props.Inspector:get():getTargetApi();
        v20.props.setPageSize(v28);
        if l_RoactInspectorApi_0.isInstance(v29) then
            if v29.setProfileComponentsPageSize then
                v29:setProfileComponentsPageSize(v28);
                v29:getProfileData();
            else
                return ;
            end;
        end;
    end;
    v20.onSortChange = function(v30, v31)
        local v32 = v20.props.Inspector:get():getTargetApi();
        v20.props.setSort(v30, v31);
        if l_RoactInspectorApi_0.isInstance(v32) then
            if v32.sortProfileData then
                v32:sortProfileData("profileComponents", v30, v31);
                v32:getProfileData();
            else
                return ;
            end;
        end;
    end;
    v20.onSelectRow = function(_, v34)
        local v35 = v20.props.Inspector:get():getTargetApi();
        local l_TableData_0 = v20.props.TableData;
        local v37 = v34 + (l_TableData_0.pageIndex - 1) * l_TableData_0.pageSize;
        local v38 = l_TableData_0.pageRows[v34];
        if v38 then
            local l_instanceId_0 = v38.instanceId;
            v20.props.selectRow(v37);
            if l_RoactInspectorApi_0.isInstance(v35) then
                v35:selectProfileInstance(l_instanceId_0);
                v35:setProfileEventsPageIndex(1);
                v35:getProfileData();
            end;
        end;
    end;
end;
v18.render = function(v40)
    local l_props_0 = v40.props;
    local l_ProfileData_0 = l_props_0.ProfileData;
    local l_TableData_1 = l_props_0.TableData;
    return v1.createElement(l_PaginatedTable_0, {
        Columns = v19, 
        Rows = l_TableData_1.pageRows, 
        SelectedRow = l_TableData_1.selectedRow, 
        SortIndex = l_TableData_1.sortIndex, 
        SortOrder = l_TableData_1.sortOrder, 
        PageIndex = l_TableData_1.pageIndex, 
        PageSize = l_TableData_1.pageSize, 
        PageCount = math.ceil(l_ProfileData_0.rowCount / l_TableData_1.pageSize), 
        OnHoverRow = v40.onHover, 
        OnMouseLeave = v40.onMouseLeave, 
        OnSelectRow = v40.onSelectRow, 
        OnPageChange = v40.onPageChange, 
        OnPageSizeChange = v40.onSizeChange, 
        OnSortChange = v40.onSortChange, 
        Footer = v1.createElement(l_Pane_0, {
            Padding = 5, 
            Layout = Enum.FillDirection.Horizontal, 
            HorizontalAlignment = Enum.HorizontalAlignment.Left
        }, {
            Label = v1.createElement(l_TextLabel_0, {
                AutomaticSize = Enum.AutomaticSize.XY, 
                Text = ("%s Events from %s Components"):format(l_ProfileData_0.eventCount, l_ProfileData_0.rowCount)
            })
        })
    });
end;
return v2.connect(function(v44)
    return {
        ProfileData = v44.RoactInspector.profileData, 
        TableData = v44.RoactInspector[v5.COMPONENTS]
    };
end, function(v45)
    return {
        setSort = function(v46, v47)
            v45(v10(v5.COMPONENTS, v46, v47));
        end, 
        setPageSize = function(v48)
            v45(v8(v5.COMPONENTS, v48));
        end, 
        setPageIndex = function(v49)
            v45(v9(v5.COMPONENTS, v49));
        end, 
        selectRow = function(v50)
            v45(v11(v50));
        end
    };
end)((l_withContext_0({
    Inspector = v4, 
    Stylizer = l_ContextServices_0.Stylizer
})(v18)));
