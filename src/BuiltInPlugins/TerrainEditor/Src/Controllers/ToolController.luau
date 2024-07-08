local _ = game:GetService("ChangeHistoryService");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("TerrainEditor");
local v2 = require(l_script_FirstAncestor_0.Packages.Dash);
local v3 = require(l_script_FirstAncestor_0.Packages.Framework);
local l_ContextServices_0 = v3.ContextServices;
local l_ContextItem_0 = l_ContextServices_0.ContextItem;
local v6 = require(l_script_FirstAncestor_0.Src.Tools.BaseTool);
local l_Signal_0 = v3.Util.Signal;
local l_findIndex_0 = v2.findIndex;
local v9 = require(l_script_FirstAncestor_0.Src.Tools);
local l_Tab_0 = require(l_script_FirstAncestor_0.Src.Types).Tab;
local v11 = require(l_script_FirstAncestor_0.Src.Controllers.PluginController);
local v12 = require(l_script_FirstAncestor_0.Src.Controllers.ShortcutController);
local v13 = l_ContextItem_0:extend("ToolController");
v13.new = function(v14, v15, v16, v17, v18, v19)
    local v20 = setmetatable({
        _mocking = v19, 
        OnToolChanged = l_Signal_0.new(), 
        OnToolIndexChanged = l_Signal_0.new(), 
        OnTabIndexChanged = l_Signal_0.new()
    }, v13);
    local v21 = {};
    local v22 = {};
    for _, v24 in v9, nil, nil do
        local v25 = v24:new();
        v25:init({
            Analytics = v16, 
            Localization = v17, 
            PluginController = v14, 
            ShortcutController = v15, 
            Stylizer = v18, 
            ToolController = {
                selectTool = function(v26)
                    v20:setToolIndex(l_findIndex_0(v20._tabs[v20._tabIndex].ToolRegistry, function(v27)
                        return v27._name == v26;
                    end));
                end, 
                selectTab = function(v28)
                    v20:setTabIndex(v20._tabRegistry[v28]);
                end, 
                selectTabAndTool = function(v29, v30)
                    local v31 = v20._tabRegistry[v29];
                    v20:setTabAndToolIndex(v31, (l_findIndex_0(v20._tabs[v31].ToolRegistry, function(v32)
                        return v32._name == v30;
                    end)));
                end
            }
        }, {
            ChangeHistoryService = game:GetService("ChangeHistoryService"), 
            CoreGui = game:GetService("CoreGui"), 
            Selection = game:GetService("Selection"), 
            ShorelineUpgraderService = game:GetService("ShorelineUpgraderService"), 
            Terrain = game:GetService("Workspace"):FindFirstChildOfClass("Terrain")
        });
        local v33 = v25:getCategory();
        if v33 == l_Tab_0.None then
            if v20._emptyTool then
                assert("Cannot have more than one empty tool.");
            end;
            v20._emptyTool = v25;
        else
            if not v21[v33] then
                local v34 = #v22 + 1;
                table.insert(v22, {
                    Key = v34, 
                    Label = v17:getText("Tabs", v33), 
                    ToolIndex = 1, 
                    ToolRegistry = {}, 
                    Toolbar = {}
                });
                v21[v33] = v34;
            end;
            table.insert(v22[v21[v33]].ToolRegistry, v25);
            table.insert(v22[v21[v33]].Toolbar, v25:getTile());
        end;
    end;
    v20._tabRegistry = v21;
    v20._tabs = v22;
    v20._tabIndex = 1;
    v20._useEmptyTool = true;
    v20._focusedConnection = v14.Activation:Connect(function(v35)
        if not v35 then
            v20:getTool():reportAnalytics();
        end;
    end);
    return v20;
end;
v13.mock = function(v36, v37, v38, v39, v40)
    return v13.new(v36 or v11.mock(), v37 or v12.mock(), v38 or l_ContextServices_0.Analytics.mock(), v39 or l_ContextServices_0.Localization.mock(), v40, true);
end;
v13.destroy = function(v41)
    v41._focusedConnection:Disconnect();
end;
v13.getTabs = function(v42)
    return v42._tabs;
end;
v13.getTabIndex = function(v43)
    return v43._tabIndex;
end;
v13.getToolbar = function(v44)
    return v44._tabs[v44._tabIndex].Toolbar;
end;
v13.getToolIndex = function(v45)
    if not v45._useEmptyTool then
        return v45._tabs[v45._tabIndex].ToolIndex;
    else
        return -1;
    end;
end;
v13.getTool = function(v46)
    local v47 = v46._tabs[v46._tabIndex];
    if not v46._useEmptyTool then
        return v47.ToolRegistry[v47.ToolIndex] or v6.empty();
    else
        return v46._emptyTool;
    end;
end;
v13.setToolIndex = function(v48, v49)
    local v50 = v48._tabs[v48._tabIndex];
    assert(v49 <= #v50.ToolRegistry);
    if not (v49 == v50.ToolIndex) or v48._useEmptyTool then
        if not v48._useEmptyTool then
            v50.ToolRegistry[v50.ToolIndex]:deactivate();
        else
            v48._useEmptyTool = false;
            v48._emptyTool:deactivate();
        end;
        v50.ToolIndex = v49;
        v50.ToolRegistry[v50.ToolIndex]:activate();
        v48.OnToolIndexChanged:Fire(v49);
        v48.OnToolChanged:Fire(v50.ToolRegistry[v50.ToolIndex]);
        return ;
    else
        v50.ToolRegistry[v50.ToolIndex]:deactivate();
        v48._useEmptyTool = true;
        v48._emptyTool:activate();
        v48.OnToolIndexChanged:Fire(-1);
        v48.OnToolChanged:Fire(v48._emptyTool);
        return ;
    end;
end;
v13.setTabIndex = function(v51, v52)
    local v53 = v51._tabs[v51._tabIndex];
    if not v51._useEmptyTool then
        v53.ToolRegistry[v53.ToolIndex]:deactivate();
    end;
    v51._tabIndex = v52;
    v53 = v51._tabs[v51._tabIndex];
    if not v51._useEmptyTool then
        v53.ToolRegistry[v53.ToolIndex]:activate();
    end;
    v51.OnTabIndexChanged:Fire(v52);
    if not v51._useEmptyTool then
        v51.OnToolIndexChanged:Fire(v53.ToolIndex);
        v51.OnToolChanged:Fire(v53.ToolRegistry[v53.ToolIndex]);
        return ;
    else
        v51.OnToolIndexChanged:Fire(-1);
        v51.OnToolChanged:Fire(v51._emptyTool);
        return ;
    end;
end;
v13.setTabAndToolIndex = function(v54, v55, v56)
    local v57 = v54._tabs[v54._tabIndex];
    if not (v56 == v57.ToolIndex and v54._tabIndex == v55) or v54._useEmptyTool then
        if not v54._useEmptyTool then
            v57.ToolRegistry[v57.ToolIndex]:deactivate();
        else
            v54._useEmptyTool = false;
            v54._emptyTool:deactivate();
        end;
        if v56 == v57.ToolIndex then
            v54._useEmptyTool = true;
        end;
        v54._useEmptyTool = false;
        v54._tabIndex = v55;
        v57 = v54._tabs[v54._tabIndex];
        v57.ToolIndex = v56;
        v57.ToolRegistry[v57.ToolIndex]:activate();
        v54.OnTabIndexChanged:Fire(v55);
        v54.OnToolIndexChanged:Fire(v57.ToolIndex);
        v54.OnToolChanged:Fire(v57.ToolRegistry[v57.ToolIndex]);
        return ;
    else
        v57.ToolRegistry[v57.ToolIndex]:deactivate();
        v54._useEmptyTool = true;
        v54._emptyTool:activate();
        v54.OnToolIndexChanged:Fire(-1);
        v54.OnToolChanged:Fire(v54._emptyTool);
        return ;
    end;
end;
v13.selectTabAndTool = function(v58, v59, v60)
    local v61 = v58._tabRegistry[v59];
    v58:setTabAndToolIndex(v61, (l_findIndex_0(v58._tabs[v61].ToolRegistry, function(v62)
        return v62._name == v60;
    end)));
end;
return v13;
