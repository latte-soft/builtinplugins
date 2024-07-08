local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local l_Packages_0 = l_Parent_0.Packages;
local v2 = require(l_Packages_0.Framework);
local v3 = require(l_Packages_0.Roact);
local l_ContextServices_0 = v2.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_ScrollingFrame_0 = v2.UI.ScrollingFrame;
local l_Util_0 = l_Parent_0.Src.Util;
local v8 = require(l_Util_0.LayoutOrderIterator);
local v9 = require(l_Util_0.Constants);
local l_ConvertToPackageWindow_0 = l_Parent_0.Src.Components.ConvertToPackageWindow;
local v11 = require(l_ConvertToPackageWindow_0.ConfigTextField);
local v12 = require(l_ConvertToPackageWindow_0.ConfigAccess);
local v13 = require(l_ConvertToPackageWindow_0.ConfigComment);
local v14 = v3.PureComponent:extend("PublishAsset");
v14.init = function(v15, _)
    v15.state = {};
    v15.baseFrameRef = v3.createRef();
end;
v14.render = function(v17)
    local l_props_0 = v17.props;
    local l_Localization_0 = l_props_0.Localization;
    local l_Size_0 = l_props_0.Size;
    local l_LayoutOrder_0 = l_props_0.LayoutOrder;
    local l_name_0 = l_props_0.name;
    local l_description_0 = l_props_0.description;
    local l_owner_0 = l_props_0.owner;
    local l_allowComment_0 = l_props_0.allowComment;
    local l_commentOn_0 = l_props_0.commentOn;
    local l_onNameChange_0 = l_props_0.onNameChange;
    local l_onDescChange_0 = l_props_0.onDescChange;
    local l_onOwnerSelected_0 = l_props_0.onOwnerSelected;
    local l_toggleComment_0 = l_props_0.toggleComment;
    local v31 = v8.new();
    return v3.createElement(l_ScrollingFrame_0, {
        AutomaticCanvasSize = Enum.AutomaticSize.Y, 
        LayoutOrder = l_LayoutOrder_0, 
        Size = l_Size_0, 
        [v3.Ref] = v17.baseFrameRef
    }, {
        Padding = v3.createElement("UIPadding", {
            PaddingTop = UDim.new(0, 24), 
            PaddingBottom = UDim.new(0, 24), 
            PaddingLeft = UDim.new(0, 24), 
            PaddingRight = UDim.new(0, 24)
        }), 
        UIListLayout = v3.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Vertical, 
            HorizontalAlignment = Enum.HorizontalAlignment.Left, 
            VerticalAlignment = Enum.VerticalAlignment.Top, 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            Padding = UDim.new(0, 5), 
            [v3.Change.AbsoluteContentSize] = function(v32)
                if v17.baseFrameRef.current then
                    v17.baseFrameRef.current.CanvasSize = UDim2.new(l_Size_0.X.Scale, l_Size_0.X.Offset, 0, v32.AbsoluteContentSize.y + 48);
                    return ;
                else
                    return ;
                end;
            end
        }), 
        Title = v3.createElement(v11, {
            Title = l_Localization_0:getText("General", "Title"), 
            TotalHeight = 100, 
            MaxCount = v9.NAME_CHARACTER_LIMIT, 
            TextChangeCallBack = l_onNameChange_0, 
            TextContent = l_name_0, 
            LayoutOrder = v31:getNextOrder()
        }), 
        Description = v3.createElement(v11, {
            Title = l_Localization_0:getText("General", "Description"), 
            TotalHeight = 320, 
            MaxCount = v9.DESCRIPTION_CHARACTER_LIMIT, 
            TextChangeCallBack = l_onDescChange_0, 
            TextContent = l_description_0, 
            LayoutOrder = v31:getNextOrder()
        }), 
        Ownership = v3.createElement(v12, {
            Title = l_Localization_0:getText("General", "Ownership"), 
            owner = l_owner_0, 
            TotalHeight = 70, 
            onDropDownSelect = l_onOwnerSelected_0, 
            LayoutOrder = v31:getNextOrder()
        }), 
        Comment = v3.createElement(v13, {
            Title = l_Localization_0:getText("General", "Comments"), 
            TotalHeight = 80, 
            CommentEnabled = l_allowComment_0, 
            CommentOn = l_commentOn_0, 
            ToggleCallback = l_toggleComment_0, 
            LayoutOrder = v31:getNextOrder()
        })
    });
end;
return (l_withContext_0({
    Localization = l_ContextServices_0.Localization, 
    Stylizer = l_ContextServices_0.Stylizer
})(v14));
