local l_Parent_0 = script.Parent.Parent.Parent.Parent.Parent;
local l_Packages_0 = l_Parent_0.Packages;
local v2 = require(l_Packages_0.Roact);
local v3 = require(l_Packages_0.Framework);
local l_DropdownMenu_0 = v3.UI.DropdownMenu;
local v5 = require(l_Parent_0.Core.Components.AssetConfiguration.Permissions.DetailedDropdownItem);
local l_IconButton_0 = v3.UI.IconButton;
local l_Tooltip_0 = v3.UI.Tooltip;
local l_Util_0 = l_Parent_0.Core.Util;
local v9 = require(l_Util_0.Images);
local v10 = require(l_Util_0.Constants);
local v11 = require(l_Parent_0.Core.Components.AssetConfiguration.Permissions.CollaboratorThumbnail);
local l_ContentProvider_0 = game:GetService("ContentProvider");
local l_ContextServices_0 = v3.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local v15 = v2.PureComponent:extend("CollaboratorItem");
local function v17(v16)
    return v2.createElement(v11, {
        Size = UDim2.new(0, 50, 0, 50), 
        LayoutOrder = v16.LayoutOrder or 0, 
        Image = not not v16.IsLoadedThumbnail and v16.CollaboratorIcon or v16.DefaultIcon, 
        UseMask = v16.UseMask, 
        IsLoadedThumbnail = v16.IsLoadedThumbnail
    });
end;
v15.init = function(v18)
    v18.state = {
        assetFetchStatus = nil, 
        showDropdown = false
    };
    v18.isMounted = false;
    v18.onItemActivated = function(v19)
        local l_props_0 = v18.props;
        if not (not l_props_0.Enabled or not l_props_0.PermissionChanged) then
            l_props_0.PermissionChanged(v19.Key);
        end;
        v18.closeDropdown();
    end;
    v18.onDropdownRenderItem = function(v21, _, v23)
        return v2.createElement(v5, {
            Key = v21.Key, 
            Description = v21.Description, 
            OnActivated = v23, 
            Selected = v21.Key == v18.props.SelectedItem, 
            Title = v21.Display
        });
    end;
    v18.openDropdown = function()
        v18:setState({
            showDropdown = true
        });
    end;
    v18.closeDropdown = function()
        v18:setState({
            showDropdown = false
        });
    end;
    v18.onDelete = function()
        local l_props_1 = v18.props;
        if not (not l_props_1.Enabled or not l_props_1.Removed) then
            l_props_1.Removed();
        end;
    end;
end;
v15.didMount = function(v25)
    v25.isMounted = true;
    spawn(function()
        l_ContentProvider_0:PreloadAsync({
            v25.props.CollaboratorIcon
        }, function(_, v27)
            if v25.isMounted then
                v25:setState({
                    assetFetchStatus = v27
                });
            end;
        end);
    end);
end;
v15.willUnmount = function(v28)
    v28.isMounted = false;
end;
v15.render = function(v29)
    local l_props_2 = v29.props;
    local l_Stylizer_0 = l_props_2.Stylizer;
    l_props_2.Items = l_props_2.Items or {};
    local l_Removable_0 = l_props_2.Removable;
    if l_Removable_0 then
        l_Removable_0 = false;
        if #l_props_2.Items > 0 then
            l_Removable_0 = not l_props_2.IsLoading;
        end;
    end;
    local v33 = v29.state.assetFetchStatus == Enum.AssetFetchStatus.Success;
    local v34 = nil;
    v34 = if l_props_2.SubjectType == Enum.CreatorType.User then v9.DEFAULT_USER_THUMBNAIL else v9.DEFAULT_GROUP_THUMBNAIL;
    local l_createElement_0 = v2.createElement;
    local v36 = "Frame";
    local v37 = {
        Size = UDim2.new(1, 0, 0, 60), 
        LayoutOrder = l_props_2.LayoutOrder or 0, 
        BackgroundTransparency = 1, 
        BorderSizePixel = 0
    };
    local v38 = {};
    local l_createElement_1 = v2.createElement;
    local v40 = "Frame";
    local v41 = {
        Size = UDim2.new(1, 0, 1, 0), 
        BackgroundTransparency = 1, 
        BackgroundColor3 = l_Stylizer_0.assetConfig.packagePermissions.backgroundColor
    };
    local v42 = {
        Padding = v2.createElement("UIPadding", {
            PaddingLeft = UDim.new(0, 6), 
            PaddingRight = UDim.new(0, 6), 
            PaddingTop = UDim.new(0, 10), 
            PaddingBottom = UDim.new(0, 10)
        })
    };
    local v43 = false;
    if l_props_2.CollaboratorIcon ~= nil then
        v43 = v2.createElement(v17, {
            LayoutOrder = 0, 
            Enabled = l_props_2.Enabled, 
            UseMask = l_props_2.UseMask, 
            CollaboratorIcon = l_props_2.CollaboratorIcon, 
            DefaultIcon = v34, 
            IsLoadedThumbnail = v33
        });
    end;
    v42.Icon = v43;
    v42.Labels = v2.createElement("Frame", {
        Size = UDim2.new(1, -290, 0, 50), 
        Position = UDim2.new(0, 80, 0, 0), 
        LayoutOrder = l_props_2.LayoutOrder or 0, 
        BackgroundTransparency = 1
    }, {
        PrimaryLabel = v2.createElement("TextLabel", {
            Size = UDim2.new(1, 0, not l_props_2.SecondaryText and 1 or 0.5, 0), 
            Text = l_props_2.CollaboratorName or "", 
            TextXAlignment = Enum.TextXAlignment.Left, 
            Font = v10.FONT, 
            TextSize = v10.FONT_SIZE_TITLE, 
            TextColor3 = l_Stylizer_0.assetConfig.packagePermissions.subTextColor, 
            TextTruncate = Enum.TextTruncate.AtEnd, 
            BackgroundTransparency = 1
        })
    });
    v42.DropdownFrame = v2.createElement("Frame", {
        AnchorPoint = Vector2.new(1, 0), 
        BackgroundTransparency = 1, 
        Position = UDim2.new(1, -80, 0, 0), 
        Size = UDim2.new(0, 120, 0, 50)
    }, {
        Dropdown = v2.createElement(l_DropdownMenu_0, {
            Hide = not (l_props_2.Enabled and #l_props_2.Items > 0) or not v29.state.showDropdown, 
            OnFocusLost = function()
                v29.closeDropdown();
            end, 
            Items = l_props_2.Items, 
            OnItemActivated = v29.onItemActivated, 
            OnRenderItem = v29.onDropdownRenderItem, 
            Width = 300
        })
    });
    v42.Dropdown = v2.createElement(l_IconButton_0, {
        Disabled = not (l_props_2.Enabled and #l_props_2.Items > 0), 
        RightIcon = "rbxasset://textures/StudioToolbox/ArrowDownIconWhite.png", 
        Text = l_props_2.Action, 
        OnClick = function()
            v29.openDropdown();
        end, 
        AnchorPoint = Vector2.new(1, 0), 
        Position = UDim2.new(1, -80, 0, 0), 
        Size = UDim2.new(0, 120, 0, 50)
    }, {
        TextPadding = v2.createElement("UIPadding", {
            PaddingLeft = UDim.new(0, 4)
        })
    });
    v42.Delete = l_Removable_0 and v2.createElement(l_IconButton_0, {
        AnchorPoint = Vector2.new(1, 0), 
        BackgroundStyle = "RoundBox", 
        IconColor = l_Stylizer_0.assetConfig.packagePermissions.collaboratorItem.deleteButton, 
        LeftIcon = v9.CLOSE_ICON, 
        OnClick = v29.onDelete, 
        Position = UDim2.new(1, 0, 0, 0), 
        Size = UDim2.new(0, 50, 0, 50)
    });
    v42.Tooltip = l_props_2.TooltipText and v2.createElement(l_Tooltip_0, {
        Text = l_props_2.TooltipText
    });
    v38.Contents = l_createElement_1(v40, v41, v42);
    return l_createElement_0(v36, v37, v38);
end;
return (l_withContext_0({
    Stylizer = l_ContextServices_0.Stylizer
})(v15));
