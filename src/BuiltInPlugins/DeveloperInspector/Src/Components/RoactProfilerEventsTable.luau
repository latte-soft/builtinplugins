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
local l_ContextServices_0 = v3.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_UI_0 = v3.UI;
local l_PaginatedTable_0 = l_UI_0.PaginatedTable;
local l_Pane_0 = l_UI_0.Pane;
local v16 = v1.Component:extend("RoactProfilerEventsTable");
local v17 = {
    {
        Name = "At (s)", 
        Key = "startTime", 
        Width = UDim.new(0.1, 0)
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
    }, 
    {
        Name = "Cause", 
        Key = "cause", 
        TooltipKey = "log", 
        Width = UDim.new(0.15, 0)
    }, 
    {
        Name = "Details", 
        Key = "details", 
        TooltipKey = "detailsTip", 
        Width = UDim.new(0.35, 0)
    }
};
v16.init = function(v18)
    v18.onPageChange = function(v19)
        local v20 = v18.props.Inspector:get():getTargetApi();
        v18.props.setPageIndex(v19);
        if l_RoactInspectorApi_0.isInstance(v20) then
            if v20.setProfileEventsPageIndex then
                v20:setProfileEventsPageIndex(v19);
                v20:getProfileData();
            else
                return ;
            end;
        end;
    end;
    v18.onSizeChange = function(v21)
        local v22 = v18.props.Inspector:get():getTargetApi();
        v18.props.setPageSize(v21);
        if l_RoactInspectorApi_0.isInstance(v22) then
            if v22.setProfileEventsPageSize then
                v22:setProfileEventsPageSize(v21);
                v22:getProfileData();
            else
                return ;
            end;
        end;
    end;
    v18.onSortChange = function(v23, v24)
        local v25 = v18.props.Inspector:get():getTargetApi();
        v18.props.setSort(v23, v24);
        if l_RoactInspectorApi_0.isInstance(v25) then
            if v25.setProfileEventsPageIndex then
                v25:sortProfileData(v5.EVENTS, v23, v24);
                v25:getProfileData();
            else
                return ;
            end;
        end;
    end;
end;
v16.render = function(v26)
    local l_props_0 = v26.props;
    local l_ProfileData_0 = l_props_0.ProfileData;
    local l_TableData_0 = l_props_0.TableData;
    return v1.createElement(l_PaginatedTable_0, {
        Columns = v17, 
        Rows = l_TableData_0.pageRows, 
        SortIndex = l_TableData_0.sortIndex, 
        SortOrder = l_TableData_0.sortOrder, 
        PageIndex = l_TableData_0.pageIndex, 
        PageSize = l_TableData_0.pageSize, 
        PageCount = math.ceil(l_ProfileData_0.instanceEventCount / l_TableData_0.pageSize), 
        OnPageChange = v26.onPageChange, 
        OnPageSizeChange = v26.onSizeChange, 
        OnSortChange = v26.onSortChange, 
        Footer = v1.createElement(l_Pane_0, {
            Padding = 5, 
            Layout = Enum.FillDirection.Horizontal, 
            HorizontalAlignment = Enum.HorizontalAlignment.Left
        })
    });
end;
return v2.connect(function(v30)
    return {
        ProfileData = v30.RoactInspector.profileData, 
        TableData = v30.RoactInspector[v5.EVENTS]
    };
end, function(v31)
    return {
        setSort = function(v32, v33)
            v31(v10(v5.EVENTS, v32, v33));
        end, 
        setPageSize = function(v34)
            v31(v8(v5.EVENTS, v34));
        end, 
        setPageIndex = function(v35)
            v31(v9(v5.EVENTS, v35));
        end
    };
end)((l_withContext_0({
    Inspector = v4, 
    Stylizer = l_ContextServices_0.Stylizer
})(v16)));
