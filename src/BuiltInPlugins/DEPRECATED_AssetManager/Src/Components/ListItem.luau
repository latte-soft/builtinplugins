local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Cryo);
local v2 = require(l_Parent_0.Packages.Roact);
local v3 = require(l_Parent_0.Packages.RoactRodux);
local v4 = require(l_Parent_0.Packages.Framework);
local l_ContextServices_0 = v4.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_UI_0 = v4.UI;
local l_DragSource_0 = l_UI_0.DragSource;
local l_Pane_0 = l_UI_0.Pane;
local l_Tooltip_0 = l_UI_0.Tooltip;
local l_Util_0 = v4.Util;
local l_StyleModifier_0 = l_Util_0.StyleModifier;
local _ = l_Util_0.FitFrame.FitFrameOnAxis;
local l_LayoutOrderIterator_0 = l_Util_0.LayoutOrderIterator;
local l_GetTextSize_0 = l_Util_0.GetTextSize;
local v16 = require(l_Parent_0.Src.Actions.SetEditingAssets);
local v17 = require(l_Parent_0.Src.Actions.ChangeAssetAlias);
local v18 = require(l_Parent_0.Src.Thunks.GetAssetPreviewData);
local v19 = require(l_Parent_0.Src.Thunks.OnAssetDoubleClick);
local v20 = require(l_Parent_0.Src.Thunks.OnAssetRightClick);
local v21 = require(l_Parent_0.Src.Thunks.OnAssetSingleClick);
local v22 = require(l_Parent_0.Src.Thunks.OnRecentAssetRightClick);
local v23 = require(l_Parent_0.Src.Util.ReviewStatus);
local v24 = require(l_Parent_0.Src.Util.ModerationUtil);
local v25 = require(l_Parent_0.Src.Util.ModernIcons);
local l_AssetManagerService_0 = game:GetService("AssetManagerService");
local l_ContentProvider_0 = game:GetService("ContentProvider");
local l_StudioService_0 = game:GetService("StudioService");
local v29 = v2.PureComponent:extend("ListItem");
local l_enableAudioImport_0 = require(l_Parent_0.Src.Util.AssetManagerUtilities).enableAudioImport;
local l_enableVideoImport_0 = require(l_Parent_0.Src.Util.AssetManagerUtilities).enableVideoImport;
local function _(v32)
    return (string.gsub(string.gsub(string.gsub(v32, "%s+", ""), "\n", ""), "\t", ""));
end;
local function v36(v34)
    local l_assetType_0 = v34.assetType;
    if l_assetType_0 == Enum.AssetType.Place then
        if not v34.isRootPlace then
            return l_StudioService_0:GetClassIcon("Workspace");
        else
            return l_StudioService_0:GetClassIcon("SpawnLocation");
        end;
    elseif l_assetType_0 == Enum.AssetType.Package then
        return l_StudioService_0:GetClassIcon("Model");
    elseif l_assetType_0 == Enum.AssetType.Image then
        return l_StudioService_0:GetClassIcon("Decal");
    elseif l_assetType_0 == Enum.AssetType.MeshPart then
        return l_StudioService_0:GetClassIcon("MeshPart");
    elseif l_enableAudioImport_0() and l_assetType_0 == Enum.AssetType.Audio then
        return l_StudioService_0:GetClassIcon("Sound");
    elseif l_enableVideoImport_0() and l_assetType_0 == Enum.AssetType.Video then
        return l_StudioService_0:GetClassIcon("VideoFrame");
    elseif l_assetType_0 == Enum.AssetType.Model then
        return l_StudioService_0:GetClassIcon("Model");
    else
        return ;
    end;
end;
v29.isFolder = function(v37)
    return v37.props.AssetData.ClassName == "Folder";
end;
v29.init = function(v38)
    v38.state = {
        StyleModifier = nil, 
        assetFetchStatus = nil, 
        editText = ""
    };
    v38.editing = false;
    v38.textBoxRef = v2.createRef();
    v38.onMouseEnter = function()
        if v38.props.Enabled then
            if v38.state.StyleModifier == nil then
                v38:setState({
                    StyleModifier = l_StyleModifier_0.Hover
                });
            end;
            local l_AssetData_0 = v38.props.AssetData;
            local v40 = l_AssetData_0.ClassName == "Folder";
            local v41 = l_AssetData_0.assetType == Enum.AssetType.Place;
            if not (v40 or v41) and type(v38.props.AssetsTable.assetPreviewData[l_AssetData_0.id]) ~= "table" then
                v38.props.dispatchGetAssetPreviewData(v38.props.API:get(), {
                    l_AssetData_0.id
                });
            end;
            return ;
        else
            return ;
        end;
    end;
    v38.onMouseLeave = function()
        if v38.props.Enabled then
            if v38.state.StyleModifier == l_StyleModifier_0.Hover then
                v38:setState({
                    StyleModifier = v2.None
                });
            end;
            return ;
        else
            return ;
        end;
    end;
    v38.onClick = function(v42, v43)
        local l_props_0 = v38.props;
        if l_props_0.Enabled then
            local l_AssetData_1 = l_props_0.AssetData;
            if v43 == 0 then
                l_props_0.dispatchOnAssetSingleClick(v42, l_AssetData_1);
                return ;
            else
                if v43 == 1 then
                    l_props_0.dispatchOnAssetDoubleClick(l_props_0.Analytics, l_AssetData_1);
                end;
                return ;
            end;
        else
            return ;
        end;
    end;
    v38.onDragBegan = function(_)
        if not v38:isFolder() then
            local l_props_1 = v38.props;
            if l_props_1.OnAssetDrag then
                l_props_1.OnAssetDrag(l_props_1.AssetData);
                return ;
            else
                return ;
            end;
        else
            return ;
        end;
    end;
    v38.onRightClick = function()
        local l_props_2 = v38.props;
        if l_props_2.Enabled then
            local l_AssetData_2 = l_props_2.AssetData;
            if not (l_AssetData_2.ClassName == "Folder") then
                if not l_props_2.SelectedAssets[l_AssetData_2.key] then
                    l_props_2.dispatchOnAssetSingleClick(nil, l_AssetData_2);
                end;
            elseif not l_props_2.SelectedAssets[l_AssetData_2.Screen.LayoutOrder] then
                l_props_2.dispatchOnAssetSingleClick(nil, l_AssetData_2);
            end;
            if not l_props_2.RecentListItem then
                l_props_2:dispatchOnAssetRightClick();
                return ;
            else
                l_props_2:dispatchOnRecentAssetRightClick();
                return ;
            end;
        else
            return ;
        end;
    end;
    v38.onTextChanged = function(v50)
        local l_Text_0 = v50.Text;
        if l_Text_0 ~= v38.props.AssetData.name then
            v38:setState({
                editText = l_Text_0
            });
        end;
    end;
    v38.onTextBoxFocusLost = function(_, _, _)
        local l_props_3 = v38.props;
        local l_AssetData_3 = l_props_3.AssetData;
        local l_editText_0 = v38.state.editText;
        if utf8.len(l_editText_0) ~= 0 and utf8.len((string.gsub(string.gsub(string.gsub(l_editText_0, "%s+", ""), "\n", ""), "\t", ""))) ~= 0 then
            if l_AssetData_3.assetType == Enum.AssetType.Place then
                l_AssetManagerService_0:RenamePlace(l_AssetData_3.id, l_editText_0);
            elseif not ((l_AssetData_3.assetType ~= Enum.AssetType.Image and l_AssetData_3.assetType ~= Enum.AssetType.MeshPart) and (not l_enableAudioImport_0() or l_AssetData_3.assetType ~= Enum.AssetType.Audio)) or l_enableVideoImport_0() and l_AssetData_3.assetType == Enum.AssetType.Video then
                local v58 = nil;
                if l_AssetData_3.assetType == Enum.AssetType.Image then
                    v58 = "Images/";
                elseif l_AssetData_3.assetType == Enum.AssetType.MeshPart then
                    v58 = "Meshes/";
                elseif l_enableAudioImport_0() and l_AssetData_3.assetType == Enum.AssetType.Audio then
                    v58 = "Audio/";
                elseif l_enableVideoImport_0() and l_AssetData_3.assetType == Enum.AssetType.Video then
                    v58 = "Video/";
                elseif l_AssetData_3.assetType == Enum.AssetType.Model then
                    v58 = "Models/";
                end;
                l_AssetManagerService_0:RenameAlias(l_AssetData_3.assetType.Value, l_AssetData_3.id, v58 .. l_AssetData_3.name, v58 .. l_editText_0);
            end;
        end;
        l_props_3.dispatchSetEditingAssets({});
        l_props_3.dispatchChangeAssetAlias(tostring(l_AssetData_3.id), l_editText_0);
        v38:setState({
            editText = l_props_3.AssetData.name
        });
        v38.editing = false;
    end;
    local l_AssetData_4 = v38.props.AssetData;
    local v60 = l_AssetData_4.ClassName == "Folder";
    local l_id_0 = l_AssetData_4.id;
    if not v60 then
        if l_AssetData_4.assetType == Enum.AssetType.Place then
            v38.thumbnailUrl = string.format("rbxthumb://type=AutoGeneratedAsset&id=%i&w=%i&h=%i", l_id_0, 150, 150);
        else
            v38.thumbnailUrl = string.format("rbxthumb://type=Asset&id=%i&w=%i&h=%i", l_id_0, 150, 150);
        end;
        spawn(function()
            l_ContentProvider_0:PreloadAsync({
                v38.thumbnailUrl
            }, function(_, v63)
                v38:setState({
                    assetFetchStatus = v63
                });
            end);
        end);
    end;
end;
v29.didMount = function(v64)
    v64:setState({
        editText = v64.props.AssetData.name
    });
end;
v29.didUpdate = function(v65, _, _)
    local l_props_4 = v65.props;
    if l_props_4.EditingAssets[l_props_4.AssetData.id] then
        if not l_props_4.RecentListItem then
            if not ((not v65.textBoxRef or not v65.textBoxRef.current) or v65.editing) then
                local l_current_0 = v65.textBoxRef.current;
                l_current_0:CaptureFocus();
                l_current_0.SelectionStart = 1;
                l_current_0.CursorPosition = #l_current_0.Text + 1;
                v65.editing = true;
            end;
        else
            return ;
        end;
    end;
end;
v29.render = function(v70)
    local l_props_5 = v70.props;
    local l_Stylizer_0 = l_props_5.Stylizer;
    local l_Localization_0 = l_props_5.Localization;
    local l_Enabled_0 = l_props_5.Enabled;
    local l_Size_0 = l_Stylizer_0.Size;
    local l_AssetData_5 = l_props_5.AssetData;
    local l_BackgroundColor_0 = l_Stylizer_0.BackgroundColor;
    local l_BackgroundTransparency_0 = l_Stylizer_0.BackgroundTransparency;
    local l_Spacing_0 = l_Stylizer_0.Spacing;
    local v80 = {};
    local v81 = l_AssetData_5.ClassName == "Folder";
    if not v81 then
        if v70.state.assetFetchStatus == Enum.AssetFetchStatus.Success then
            if not (l_AssetData_5.assetType == Enum.AssetType.Place) or not l_AssetData_5.isRootPlace then
                v80.Image = v70.thumbnailUrl;
            else
                v80 = v36(l_AssetData_5);
            end;
        elseif not (v70.state.assetFetchStatus ~= Enum.AssetFetchStatus.Failure and not l_props_5.RecentListItem) then
            v80 = v36(l_AssetData_5);
        end;
    elseif l_AssetData_5.Screen.Image == nil then
        v80.Image = v25.getIconForCurrentTheme(v25.IconEnums.BlankFolder);
    else
        v80.Image = v25.getIconForCurrentTheme(l_AssetData_5.Screen.Image);
    end;
    local l_FrameSize_0 = l_Stylizer_0.Image.FrameSize;
    local l_ImageSize_0 = l_Stylizer_0.Image.ImageSize;
    local l_ImagePosition_0 = l_Stylizer_0.Image.ImagePosition;
    local l_ImageAnchorPosition_0 = l_Stylizer_0.Image.ImageAnchorPosition;
    local l_BackgroundColor_1 = l_Stylizer_0.Image.BackgroundColor;
    local l_Color_0 = l_Stylizer_0.Text.Color;
    local l_Font_0 = l_Stylizer_0.Font;
    local l_Size_1 = l_Stylizer_0.Text.Size;
    local l_BackgroundTransparency_1 = l_Stylizer_0.Text.BackgroundTransparency;
    local l_TextTruncate_0 = l_Stylizer_0.Text.TextTruncate;
    local l_XAlignment_0 = l_Stylizer_0.Text.XAlignment;
    local l_YAlignment_0 = l_Stylizer_0.Text.YAlignment;
    local l_Size_2 = l_Stylizer_0.Text.Frame.Size;
    local l_editText_1 = v70.state.editText;
    local v96 = l_props_5.EditingAssets[l_AssetData_5.id];
    local l_TextPadding_0 = l_Stylizer_0.EditText.TextPadding;
    local l_ClearTextOnFocus_0 = l_Stylizer_0.EditText.ClearTextOnFocus;
    local l_XAlignment_1 = l_Stylizer_0.Text.XAlignment;
    local l_BackgroundColor_2 = l_Stylizer_0.EditText.Frame.BackgroundColor;
    local l_BorderColor_0 = l_Stylizer_0.EditText.Frame.BorderColor;
    local v102 = l_GetTextSize_0(l_editText_1, l_Size_1, l_Font_0, Vector2.new(l_Stylizer_0.Size.X.Offset, math.huge));
    local l_name_0 = l_AssetData_5.name;
    local l_name_1 = l_AssetData_5.name;
    if l_Size_2.Y.Offset < l_GetTextSize_0(l_AssetData_5.name, l_Size_1, l_Font_0, Vector2.new(l_Size_2.X.Offset, math.huge)).Y then
        l_name_1 = string.sub(l_AssetData_5.name, 1, 12) .. "..." .. string.sub(l_AssetData_5.name, string.len(l_AssetData_5.name) - 5);
    end;
    local l_LayoutOrder_0 = l_props_5.LayoutOrder;
    local v106 = l_LayoutOrderIterator_0.new();
    local v107 = nil;
    local v108 = nil;
    local v109 = nil;
    l_Size_2 = UDim2.new(1, l_Stylizer_0.Text.Frame.XOffset, 0, l_Stylizer_0.Text.Frame.YOffset);
    if not v81 then
        local l_ModerationData_0 = l_props_5.ModerationData;
        if l_ModerationData_0 and next(l_ModerationData_0) ~= nil then
            local v111 = l_ModerationData_0.reviewStatus == v23.Pending;
            local v112 = v24.isApprovedAsset(l_ModerationData_0);
            v108 = v111 or not v112;
            if v108 then
                if not v111 then
                    if not v112 then
                        v107 = l_Stylizer_0.Image.ModerationStatus.Rejected;
                    end;
                else
                    v107 = l_Stylizer_0.Image.ModerationStatus.Pending;
                end;
                l_Size_2 = UDim2.new(1, 2 * l_Stylizer_0.Text.Frame.XOffset - l_Stylizer_0.Text.Frame.Padding, 0, l_Stylizer_0.Text.Frame.YOffset);
                v109 = v24.getModerationTooltip(l_Localization_0, l_ModerationData_0);
            end;
        end;
    end;
    return v2.createElement(l_DragSource_0, {
        Size = l_Size_0, 
        LayoutOrder = l_LayoutOrder_0, 
        OnClick = v70.onClick, 
        OnRightClick = v70.onRightClick, 
        OnDragBegan = v70.onDragBegan
    }, {
        ListItem = v2.createElement(l_Pane_0, {
            AutomaticSize = Enum.AutomaticSize.Y, 
            BackgroundColor = l_BackgroundColor_0, 
            Layout = Enum.FillDirection.Horizontal, 
            Spacing = l_Spacing_0, 
            Transparency = l_BackgroundTransparency_0, 
            [v2.Event.MouseEnter] = v70.onMouseEnter, 
            [v2.Event.MouseLeave] = v70.onMouseLeave
        }, {
            ImageFrame = v2.createElement("Frame", {
                Size = l_FrameSize_0, 
                LayoutOrder = v106:getNextOrder(), 
                BackgroundTransparency = 0, 
                BackgroundColor3 = l_BackgroundColor_1, 
                BorderSizePixel = 0
            }, {
                Image = v2.createElement("ImageLabel", v1.Dictionary.join(v80, {
                    Size = l_ImageSize_0, 
                    Position = l_ImagePosition_0, 
                    AnchorPoint = l_ImageAnchorPosition_0, 
                    BackgroundTransparency = 1
                }))
            }), 
            Name = not v96 and v2.createElement("TextLabel", {
                Size = l_Size_2, 
                LayoutOrder = v106:getNextOrder(), 
                Text = l_name_1, 
                TextColor3 = l_Color_0, 
                Font = l_Font_0, 
                TextSize = l_Size_1, 
                BackgroundTransparency = l_BackgroundTransparency_1, 
                TextXAlignment = l_XAlignment_0, 
                TextYAlignment = l_YAlignment_0, 
                TextTruncate = l_TextTruncate_0, 
                TextWrapped = true
            }, {
                NameTooltip = v2.createElement(l_Tooltip_0, {
                    Text = l_name_0, 
                    Enabled = l_Enabled_0
                })
            }), 
            RenameTextBox = v96 and v2.createElement("TextBox", {
                Size = UDim2.new(0, v102.X + l_TextPadding_0, 0, l_Size_2.Y.Offset), 
                LayoutOrder = v106:getNextOrder(), 
                BackgroundColor3 = l_BackgroundColor_2, 
                BorderColor3 = l_BorderColor_0, 
                Text = l_editText_1, 
                TextColor3 = l_Color_0, 
                Font = l_Font_0, 
                TextSize = l_Size_1, 
                TextXAlignment = l_XAlignment_1, 
                ClearTextOnFocus = l_ClearTextOnFocus_0, 
                [v2.Ref] = v70.textBoxRef, 
                [v2.Change.Text] = v70.onTextChanged, 
                [v2.Event.FocusLost] = v70.onTextBoxFocusLost
            }), 
            ModerationImageFrame = v108 and v2.createElement("Frame", {
                Size = l_FrameSize_0, 
                LayoutOrder = v106:getNextOrder(), 
                BackgroundTransparency = 1
            }, {
                Image = v2.createElement("ImageLabel", {
                    Image = v107, 
                    Size = l_ImageSize_0, 
                    Position = l_ImagePosition_0, 
                    AnchorPoint = l_ImageAnchorPosition_0, 
                    BackgroundTransparency = 1
                }), 
                ModerationTooltip = v2.createElement(l_Tooltip_0, {
                    Text = v109, 
                    Enabled = l_Enabled_0
                })
            })
        })
    });
end;
return v3.connect(function(v113, _)
    local l_AssetManagerReducer_0 = v113.AssetManagerReducer;
    return {
        AssetsTable = l_AssetManagerReducer_0.assetsTable, 
        EditingAssets = l_AssetManagerReducer_0.editingAssets, 
        SelectedAssets = l_AssetManagerReducer_0.selectedAssets
    };
end, function(v116)
    return {
        dispatchGetAssetPreviewData = function(v117, v118)
            v116(v18(v117, v118));
        end, 
        dispatchOnAssetDoubleClick = function(v119, v120)
            v116(v19(v119, v120));
        end, 
        dispatchOnAssetRightClick = function(v121)
            v116(v20(v121));
        end, 
        dispatchOnAssetSingleClick = function(v122, v123)
            v116(v21(v122, v123));
        end, 
        dispatchOnRecentAssetRightClick = function(v124)
            v116(v22(v124));
        end, 
        dispatchSetEditingAssets = function(v125)
            v116(v16(v125));
        end, 
        dispatchChangeAssetAlias = function(v126, v127)
            v116(v17(v126, v127));
        end
    };
end)((l_withContext_0({
    Analytics = l_ContextServices_0.Analytics, 
    API = l_ContextServices_0.API, 
    Localization = l_ContextServices_0.Localization, 
    Mouse = l_ContextServices_0.Mouse, 
    Plugin = l_ContextServices_0.Plugin, 
    Stylizer = l_ContextServices_0.Stylizer
})(v29)));
