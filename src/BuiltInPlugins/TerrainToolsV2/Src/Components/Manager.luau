local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Framework);
local v2 = require(l_Parent_0.Packages.Roact);
local v3 = require(l_Parent_0.Packages.RoactRodux);
local _ = v1.UI.Pane;
local l_withContext_0 = v1.ContextServices.withContext;
local v6 = require(l_Parent_0.Src.ContextItems);
local v7 = require(l_Parent_0.Src.Actions.ChangeTab);
local l_Components_0 = l_Parent_0.Src.Components;
local v9 = require(l_Components_0.Tab);
local v10 = require(l_Components_0.ToolManager);
local v11 = require(l_Components_0.ToolRenderer);
local v12 = require(l_Parent_0.Src.Components.Tools.ShorelineUpgradePanel);
local v13 = require(l_Parent_0.Src.Components.Tools.SmoothVoxelsUpgradePanel);
local l_Shorelines_Tooling_0 = game:GetFastFlag("Shorelines_Tooling");
local l_SmoothVoxels_Tooling_0 = game:GetFastFlag("SmoothVoxels_Tooling");
local l_TerrainEditorOverhaul_0 = game:GetFastFlag("TerrainEditorOverhaul");
local v17 = require(l_Parent_0.Src.Util.TerrainEnums);
local l_TabId_0 = v17.TabId;
local l_ToolId_0 = v17.ToolId;
local v20 = {
    l_TabId_0.Create
};
if not l_TerrainEditorOverhaul_0 then
    table.insert(v20, l_TabId_0.Region);
end;
table.insert(v20, l_TabId_0.Edit);
local v21 = v2.PureComponent:extend(script.Name);
v21.init = function(v22)
    v22.state = {
        upperContentYSize = 0
    };
    v22.updateRenderToolContentSize = function(v23)
        if v23 then
            v22:setState({
                upperContentYSize = v23.AbsoluteContentSize.Y
            });
        end;
    end;
end;
local function v31(v24)
    local l_dispatchChangeTab_0 = v24.dispatchChangeTab;
    local l_currentTab_0 = v24.currentTab;
    local v27 = UDim2.new(1 / #v20, 0, 1, 0);
    local v28 = {
        UIListLayout = v2.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Horizontal, 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            HorizontalAlignment = Enum.HorizontalAlignment.Center
        })
    };
    for v29, v30 in ipairs(v20) do
        v28[v30] = v2.createElement(v9, {
            TabId = v30, 
            Size = v27, 
            OnClick = l_dispatchChangeTab_0, 
            IsCurrent = l_currentTab_0 == v30, 
            LayoutOrder = v29
        });
    end;
    return v2.createFragment(v28);
end;
v21.render = function(v32)
    return v2.createElement("Frame", {
        Size = UDim2.new(1, 0, 1, 0), 
        BackgroundColor3 = v32.props.Theme:get().backgroundColor
    }, {
        UILayout = v2.createElement("UIListLayout", {
            Padding = UDim.new(0, 14), 
            SortOrder = Enum.SortOrder.LayoutOrder
        }), 
        Upper = v2.createElement("Frame", {
            Size = UDim2.new(1, 0, 0, v32.state.upperContentYSize), 
            BackgroundTransparency = 1, 
            [v2.Ref] = v32.upperFrame
        }, {
            UILayout = v2.createElement("UIListLayout", {
                Padding = UDim.new(0, 14), 
                SortOrder = Enum.SortOrder.LayoutOrder, 
                [v2.Change.AbsoluteContentSize] = v32.updateRenderToolContentSize
            }), 
            Tabs = v2.createElement("Frame", {
                Size = UDim2.new(1, 0, 0, 29), 
                BackgroundTransparency = 1, 
                LayoutOrder = 1
            }, v31(v32.props)), 
            ToolBar = v2.createElement(v10, {
                CurrentTab = v32.props.currentTab, 
                LayoutOrder = 2
            })
        }), 
        UpgradeShorelinesPanel = if ((not not l_Shorelines_Tooling_0 and v32.props.shorelinesUpgradePossible) and v32.props.currentTab == l_TabId_0.Create) and v32.props.currentTool == l_ToolId_0.None then v2.createElement(v12, {
            UpperContentYSize = v32.state.upperContentYSize + 14, 
            LayoutOrder = 3
        }) else nil, 
        UpgradeSmoothVoxelsPanel = if ((not not l_SmoothVoxels_Tooling_0 and v32.props.smoothVoxelsUpgradePossible) and v32.props.currentTab == l_TabId_0.Create) and v32.props.currentTool == l_ToolId_0.None then v2.createElement(v13, {
            UpperContentYSize = v32.state.upperContentYSize + 14, 
            LayoutOrder = 4
        }) else nil, 
        ToolPanel = v2.createElement(v11, {
            UpperContentYSize = v32.state.upperContentYSize + 14, 
            LayoutOrder = 5
        })
    });
end;
return v3.connect(function(v33, _)
    return {
        currentTab = v33.Tools.currentTab, 
        currentTool = v33.Tools.currentTool, 
        shorelinesUpgradePossible = v33.Tools.ShorelinesUpgradePossible, 
        smoothVoxelsUpgradePossible = v33.Tools.SmoothVoxelsUpgradePossible
    };
end, function(v35)
    return {
        dispatchChangeTab = function(v36)
            v35(v7(v36));
        end
    };
end)((l_withContext_0({
    Theme = v6.DEPRECATED_Theme
})(v21)));
