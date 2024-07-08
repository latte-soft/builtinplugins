local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Roact);
local v2 = require(l_Parent_0.Packages.RoactRodux);
local v3 = require(l_Parent_0.Packages.AvatarToolsShared);
local l_LuaMeshEditingModuleContext_0 = v3.Contexts.LuaMeshEditingModuleContext;
local l_EditingItemContext_0 = v3.Contexts.EditingItemContext;
local l_AvatarUtil_0 = v3.Util.AccessoryAndBodyToolShared.AvatarUtil;
local v7 = require(l_Parent_0.Packages.Framework);
local l_ContextServices_0 = v7.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_Focus_0 = l_ContextServices_0.Focus;
local l_Pane_0 = v7.UI.Pane;
local l_LayoutOrderIterator_0 = v7.Util.LayoutOrderIterator;
local v13 = require(l_Parent_0.Src.Components.Editor.CageControls);
local v14 = require(l_Parent_0.Src.Components.Editor.VisibilityControls);
local v15 = require(l_Parent_0.Src.Util.Constants);
local v16 = v1.PureComponent:extend("WorkspaceEditorControls");
v16.init = function(v17)
    v17.state = {
        narrowLayout = false, 
        shouldStack = false
    };
    v17.controlsRef = v1.createRef();
    v17.ScreenGui = Instance.new("ScreenGui");
    v17.ScreenGui.Parent = game:GetService("CoreGui");
    v17.ScreenGui.Name = "WorkspaceEditorControls";
    v17.ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling;
    v17.maxCageControlsWidth = 0;
    v17.maxVisibilityControlsWidth = 0;
    v17.focus = l_Focus_0.new(v17.ScreenGui);
    v17.shouldShowCageControls = function()
        return v17.props.EditingCage ~= v15.EDIT_MODE.Mesh;
    end;
    v17.isCageEditing = function()
        return v17.props.ToolMode == v15.TOOL_MODE.Point;
    end;
    v17.onMenuOptionClicked = function(_, v19)
        v17.menuOptionFunctions[v19]();
    end;
    v17.bringMannequinToView = function()
        local l_props_0 = v17.props;
        local v21 = l_props_0.EditingItemContext:getItem();
        local l_LuaMeshEditingModuleContext_1 = l_props_0.LuaMeshEditingModuleContext;
        if not (not v21 or not v21.Parent) then
            l_AvatarUtil_0:bringAvatarToView(v21.Parent, function()
                l_LuaMeshEditingModuleContext_1:updateCageLocationsFromInstance(v21);
            end);
            l_props_0.Analytics:getHandler("CenterAvatarToCamera")();
        end;
    end;
    v17.resetPoints = function()
        local l_LuaMeshEditingModuleContext_2 = v17.props.LuaMeshEditingModuleContext;
        if l_LuaMeshEditingModuleContext_2 then
            l_LuaMeshEditingModuleContext_2:resetTools();
        end;
    end;
    v17.menuOptionFunctions = {
        v17.bringMannequinToView, 
        v17.resetPoints
    };
    v17.getMenuOptions = function()
        local l_props_1 = v17.props;
        local l_Localization_0 = l_props_1.Localization;
        local l_EditingCage_0 = l_props_1.EditingCage;
        local l_ToolMode_0 = l_props_1.ToolMode;
        local v28 = {};
        table.insert(v28, l_Localization_0:getText("Editor", "BringMannequinToView"));
        if l_ToolMode_0 == v15.TOOL_MODE.Point then
            if l_EditingCage_0 == Enum.CageType.Outer then
                table.insert(v28, l_Localization_0:getText("Reset", "OuterCage"));
                return v28;
            elseif l_EditingCage_0 == Enum.CageType.Inner then
                table.insert(v28, l_Localization_0:getText("Reset", "InnerCage"));
            end;
        end;
        return v28;
    end;
    v17.onScreenSizeChanged = function(v29)
        local l_VisibilityControlsOffset_0 = v17.props.Stylizer.VisibilityControlsOffset;
        local l_CageControls_0 = v29.Container:FindFirstChild("CageControls");
        local l_VisibilityControls_0 = v29.Container:FindFirstChild("VisibilityControls");
        local v33 = 0;
        local v34 = 0;
        if l_CageControls_0 then
            v17.maxCageControlsWidth = math.max(v17.maxCageControlsWidth, l_CageControls_0.AbsoluteSize.X);
            v33 = v33 + v17.maxCageControlsWidth;
            v34 = v33;
        end;
        if l_VisibilityControls_0 then
            v17.maxVisibilityControlsWidth = math.max(v17.maxVisibilityControlsWidth, l_VisibilityControls_0.AbsoluteSize.X);
            v33 = v33 + v17.maxVisibilityControlsWidth;
        end;
        v17:setState({
            shouldStack = v29.AbsoluteSize.X <= v33 + l_VisibilityControlsOffset_0, 
            narrowLayout = v29.AbsoluteSize.X <= v34 + l_VisibilityControlsOffset_0
        });
    end;
end;
v16.render = function(v35)
    local l_props_2 = v35.props;
    local l_state_0 = v35.state;
    if not l_props_2.IsControlsPanelBlockerActive then
        local l_EditingCage_1 = l_props_2.EditingCage;
        local l_ToolMode_1 = l_props_2.ToolMode;
        local l_Stylizer_0 = l_props_2.Stylizer;
        local l_VisibilityControlsOffset_1 = l_Stylizer_0.VisibilityControlsOffset;
        local l_PaneOffsetY_0 = l_Stylizer_0.PaneOffsetY;
        local v43 = v35.getMenuOptions();
        local v44 = v35.shouldShowCageControls();
        local v45 = v35.isCageEditing();
        local l_narrowLayout_0 = l_state_0.narrowLayout;
        local l_shouldStack_0 = l_state_0.shouldStack;
        local v48 = l_LayoutOrderIterator_0.new();
        local v49 = nil;
        if not l_shouldStack_0 then
            if not (v44 and v45) then
                v49 = Enum.FillDirection.Horizontal;
            end;
        else
            v49 = Enum.FillDirection.Vertical;
        end;
        local v50 = Vector2.new(0, 0);
        if not (not v44 or not v45) then
            v50 = Vector2.new(1, 0);
        end;
        return l_ContextServices_0.provide({
            v35.focus
        }, {
            Child = v1.createElement(v1.Portal, {
                target = v35.ScreenGui
            }, {
                AccessoryFittingToolControls = v1.createElement("Frame", {
                    BackgroundTransparency = 1, 
                    Position = UDim2.new(0, 0, 0, l_PaneOffsetY_0), 
                    Size = UDim2.new(1, 0, 1, -l_PaneOffsetY_0), 
                    [v1.Change.AbsoluteSize] = v35.onScreenSizeChanged, 
                    [v1.Ref] = v35.controlsRef
                }, {
                    Container = v1.createElement(l_Pane_0, {
                        Layout = v49, 
                        HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                        VerticalAlignment = Enum.VerticalAlignment.Top
                    }, {
                        CageControls = v44 and v1.createElement(v13, {
                            EditingCage = l_EditingCage_1, 
                            LayoutOrder = v48:getNextOrder(), 
                            ShowMinimal = l_narrowLayout_0, 
                            ToolMode = l_ToolMode_1, 
                            MenuOptions = v43, 
                            OnMenuOptionClicked = v35.onMenuOptionClicked, 
                            ShowOptionsButton = not l_shouldStack_0
                        }), 
                        VisibilityControls = v1.createElement(v14, {
                            AnchorPoint = v50, 
                            LayoutOrder = v48:getNextOrder(), 
                            Offset = l_VisibilityControlsOffset_1, 
                            ToolMode = l_ToolMode_1, 
                            MenuOptions = v43, 
                            OnMenuOptionClicked = v35.onMenuOptionClicked, 
                            ShowOptionsButton = l_shouldStack_0 or not v44
                        })
                    })
                })
            })
        });
    else
        return nil;
    end;
end;
v16.didUpdate = function(v51, v52)
    if v51.props.ToolMode ~= v52.ToolMode then
        v51.maxCageControlsWidth = 0;
        v51.maxVisibilityControlsWidth = 0;
        v51.onScreenSizeChanged(v51.controlsRef.current);
    end;
end;
v16.willUnmount = function(v53)
    if v53.ScreenGui then
        v53.ScreenGui:Destroy();
    end;
end;
return v2.connect(function(v54, _)
    return {
        EditingCage = v54.selectItem.editingCage, 
        IsControlsPanelBlockerActive = v54.controlsPanelBlocker.isActive, 
        ToolMode = v54.status.toolMode
    };
end, nil)((l_withContext_0({
    Analytics = l_ContextServices_0.Analytics, 
    Localization = l_ContextServices_0.Localization, 
    EditingItemContext = l_EditingItemContext_0, 
    LuaMeshEditingModuleContext = l_LuaMeshEditingModuleContext_0, 
    Stylizer = l_ContextServices_0.Stylizer
})(v16)));
