local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Cryo);
local v2 = require(l_Parent_0.Packages.Roact);
local v3 = require(l_Parent_0.Packages.Framework);
local l_ContextServices_0 = v3.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_Button_0 = v3.UI.Button;
local v7 = v2.PureComponent:extend("FolderTreeItem");
local v8 = require(l_Parent_0.Src.Util.ModernIcons);
v7.init = function(v9)
    v9.layoutRef = v2.createRef();
    v9.parentContentRef = v2.createRef();
    v9.childrenContentRef = v2.createRef();
    v9.state = {
        Hovering = false
    };
    v9.mouseEnter = function()
        v9.props.Mouse:__pushCursor("PointingHand");
        v9:setState({
            Hovering = true
        });
    end;
    v9.mouseLeave = function()
        v9.props.Mouse:__popCursor();
        v9:setState({
            Hovering = false
        });
    end;
    v9.onClick = function()
        v9.props.Mouse:__popCursor();
        v9.props.toggleSelected();
    end;
    v9.resizeFrameHeight = function()
        local l_Height_0 = v9.props.Stylizer.TreeViewItem.Height;
        local v11 = nil;
        v11 = if not v9.layoutRef.current then l_Height_0 else v9.layoutRef.current.AbsoluteContentSize.Y + l_Height_0;
        v9.parentContentRef.current.Size = UDim2.new(1, 0, 0, v11);
        v9.childrenContentRef.current.Size = UDim2.new(1, 0, 0, v11);
    end;
end;
v7.render = function(v12)
    local l_props_0 = v12.props;
    local l_TreeViewItem_0 = l_props_0.Stylizer.TreeViewItem;
    local l_Name_0 = l_props_0.element.Name;
    local l_indent_0 = l_props_0.indent;
    local l_canExpand_0 = l_props_0.canExpand;
    local l_isExpanded_0 = l_props_0.isExpanded;
    local v19 = l_props_0.rowIndex or 1;
    local l_Height_1 = l_TreeViewItem_0.Height;
    return v2.createElement("Frame", {
        Size = UDim2.new(1, 0, 0, l_Height_1), 
        BackgroundTransparency = 1, 
        [v2.Ref] = v12.parentContentRef, 
        LayoutOrder = v19, 
        [v2.Event.MouseEnter] = v12.mouseEnter, 
        [v2.Event.mouseLeave] = v12.mouseLeave
    }, {
        Contents = v2.createElement(l_Button_0, {
            Size = UDim2.new(1, 0, 0, l_Height_1), 
            Position = UDim2.new(0, 2 * l_Height_1, 0, 0), 
            Text = l_Name_0, 
            Style = "TreeItemButton", 
            OnClick = v12.onClick
        }, {
            Padding = v2.createElement("UIPadding", {
                PaddingLeft = UDim.new(0, l_indent_0 * l_TreeViewItem_0.Indent)
            }), 
            Expand = v2.createElement("ImageButton", {
                LayoutOrder = 0, 
                Size = UDim2.new(0, l_Height_1, 0, l_Height_1), 
                Position = UDim2.new(0, -2 * l_Height_1 - l_TreeViewItem_0.Offset, 0, 0), 
                BackgroundTransparency = 1, 
                ImageTransparency = 1, 
                [v2.Event.Activated] = function()
                    l_props_0.toggleExpanded();
                    v12.resizeFrameHeight();
                end
            }, {
                ExpandIcon = l_canExpand_0 and v2.createElement("ImageLabel", v1.Dictionary.join(not not l_isExpanded_0 and l_TreeViewItem_0.Arrow.Expanded or l_TreeViewItem_0.Arrow.Collapsed, {
                    BackgroundTransparency = 1, 
                    ScaleType = Enum.ScaleType.Fit, 
                    Size = UDim2.new(0, l_TreeViewItem_0.Arrow.Size, 0, l_TreeViewItem_0.Arrow.Size), 
                    AnchorPoint = Vector2.new(0.5, 0.5), 
                    Position = UDim2.new(0.5, 0, 0.5, 1), 
                    ImageTransparency = not l_canExpand_0 and 1 or 0, 
                    ImageColor3 = l_TreeViewItem_0.Arrow.Color
                }))
            }), 
            Icon = v2.createElement("ImageLabel", {
                ZIndex = 2, 
                LayoutOrder = 1, 
                Size = UDim2.new(0, l_Height_1, 0, l_Height_1), 
                Position = UDim2.new(0, -1 * l_Height_1 - l_TreeViewItem_0.Offset, 0, 0), 
                BackgroundTransparency = 1, 
                Image = v8.getIconForCurrentTheme(v8.IconEnums.BlankFolder)
            })
        }), 
        Children = v2.createElement("Frame", {
            Size = UDim2.new(1, 0, 0, l_TreeViewItem_0.Indent), 
            BackgroundTransparency = 1, 
            [v2.Ref] = v12.childrenContentRef
        }, v1.Dictionary.join({
            FolderLayout = v2.createElement("UIListLayout", {
                Padding = UDim.new(0, l_TreeViewItem_0.Padding), 
                FillDirection = Enum.FillDirection.Vertical, 
                SortOrder = Enum.SortOrder.LayoutOrder, 
                [v2.Ref] = v12.layoutRef, 
                [v2.Change.AbsoluteContentSize] = v12.resizeFrameHeight
            }), 
            Padding = v2.createElement("UIPadding", {
                PaddingTop = UDim.new(0, l_TreeViewItem_0.Indent)
            })
        }, l_props_0.children))
    });
end;
return (l_withContext_0({
    Stylizer = l_ContextServices_0.Stylizer, 
    Mouse = l_ContextServices_0.Mouse
})(v7));
