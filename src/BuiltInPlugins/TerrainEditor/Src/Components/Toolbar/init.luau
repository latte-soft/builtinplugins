local l_script_FirstAncestor_0 = script:FindFirstAncestor("TerrainEditor");
local v1 = require(l_script_FirstAncestor_0.Packages.Framework);
local v2 = require(l_script_FirstAncestor_0.Packages.React);
local l_Stylizer_0 = v1.ContextServices.Stylizer;
local l_LayoutOrderIterator_0 = v1.Util.LayoutOrderIterator;
local v5 = require(script.Tile);
local l_UI_0 = v1.UI;
local l_Grid_0 = l_UI_0.Grid;
local l_Pane_0 = l_UI_0.Pane;
local l_Tabs_0 = l_UI_0.Tabs;
local v10 = require(l_script_FirstAncestor_0.Src.Controllers.ToolController);
local v11 = require(l_script_FirstAncestor_0.Src.Hooks.useToolbar);
local _ = require(l_script_FirstAncestor_0.Src.Resources.Theme);
local l_TextService_0 = game:GetService("TextService");
local v14 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagFixTerrainEditorDETruncations);
return function(v15)
    local v16 = l_Stylizer_0:use("Toolbar");
    local v17 = l_LayoutOrderIterator_0.new();
    local v18 = v10.use();
    local v19 = v11(v18);
    local v20 = {};
    for v21, v22 in v19.Tools, nil, nil do
        v20[v21] = {
            icon = {
                Image = string.format(v22.icon.Image, v16.StudioTheme), 
                Size = v16.IconSize
            }, 
            name = v22.name
        };
    end;
    return v2.createElement(l_Pane_0, {
        AutomaticSize = Enum.AutomaticSize.Y, 
        HorizontalAlignment = Enum.HorizontalAlignment.Left, 
        Layout = Enum.FillDirection.Vertical, 
        LayoutOrder = v15.LayoutOrder, 
        VerticalAlignment = Enum.VerticalAlignment.Top, 
        [v2.Change.AbsoluteSize] = function(v23)
            v15.OnAbsoluteSizeChanged(v23.AbsoluteSize);
        end
    }, {
        Category = v2.createElement(l_Pane_0, {
            AutomaticSize = Enum.AutomaticSize.Y, 
            BackgroundColor = v16.TabBackgroundColor, 
            LayoutOrder = v17:getNextOrder(), 
            Size = UDim2.fromScale(1, 0)
        }, {
            Tabs = v2.createElement(l_Tabs_0, {
                LayoutOrder = v17:getNextOrder(), 
                OnTabSelected = function(v24)
                    v18:setTabIndex(v24.Key);
                end, 
                SelectedTab = v19.TabIndex, 
                Tabs = v19.Tabs
            })
        }), 
        Tools = v2.createElement(l_Pane_0, {
            AutomaticSize = Enum.AutomaticSize.Y, 
            LayoutOrder = v17:getNextOrder(), 
            Size = UDim2.fromScale(1, 0)
        }, {
            Grid = v2.createElement(l_Grid_0, {
                AutomaticSize = Enum.AutomaticSize.Y, 
                Cells = v20, 
                CellComponent = v5, 
                CellPadding = v16.CellPadding, 
                CellSize = v16.CellSize, 
                GetCellProps = function(v25, v26, v27, v28)
                    local v29 = nil;
                    if v14() then
                        v29 = if v16.OverflowThreshold < l_TextService_0:GetTextSize(v25.name, v16.TextSize, Enum.Font.SourceSans, (Vector2.new(v16.CellSize.X.Offset, v16.CellSize.Y.Offset))).X then v16.OverflowTextSize else v16.TextSize;
                    end;
                    return {
                        Icon = v25.icon, 
                        Key = v26, 
                        Name = v25.name, 
                        OnClick = function(v30)
                            v18:setToolIndex(v30);
                        end, 
                        Position = v27, 
                        Selected = v19.ToolIndex, 
                        Size = v28, 
                        TextSize = if not v14() then nil else v29
                    };
                end, 
                ScrollingDirection = Enum.ScrollingDirection.Y, 
                Size = UDim2.fromScale(1, 0)
            })
        })
    });
end;
