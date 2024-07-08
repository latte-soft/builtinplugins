local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Roact);
local v2 = require(l_Parent_0.Packages.RoactRodux);
local v3 = require(l_Parent_0.Packages.Framework);
local l_ContextServices_0 = v3.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_Util_0 = v3.Util;
local l_StyleModifier_0 = l_Util_0.StyleModifier;
local l_GetTextSize_0 = l_Util_0.GetTextSize;
local l_UI_0 = v3.UI;
local l_DragSource_0 = l_UI_0.DragSource;
local l_Pane_0 = l_UI_0.Pane;
local l_Tooltip_0 = l_UI_0.Tooltip;
local v13 = require(l_Parent_0.Src.Components.PopUpButton);
local l_enableAudioImport_0 = require(l_Parent_0.Src.Util.AssetManagerUtilities).enableAudioImport;
local l_enableVideoImport_0 = require(l_Parent_0.Src.Util.AssetManagerUtilities).enableVideoImport;
local v16 = require(l_Parent_0.Src.Actions.SetEditingAssets);
local v17 = require(l_Parent_0.Src.Actions.ChangeAssetAlias);
local v18 = require(l_Parent_0.Src.Thunks.GetAssetPreviewData);
local v19 = require(l_Parent_0.Src.Thunks.OnAssetDoubleClick);
local v20 = require(l_Parent_0.Src.Thunks.OnAssetRightClick);
local v21 = require(l_Parent_0.Src.Thunks.OnAssetSingleClick);
local v22 = require(l_Parent_0.Src.Util.ReviewStatus);
local v23 = require(l_Parent_0.Src.Util.ModerationUtil);
local v24 = require(l_Parent_0.Src.Util.ModernIcons);
local l_AssetManagerService_0 = game:GetService("AssetManagerService");
local l_ContentProvider_0 = game:GetService("ContentProvider");
local v27 = v1.PureComponent:extend("Tile");
local function _(v28)
    return (string.gsub(string.gsub(string.gsub(v28, "%s+", ""), "\n", ""), "\t", ""));
end;
v27.init = function(v30)
    v30.state = {
        StyleModifier = nil, 
        assetFetchStatus = nil, 
        assetPreviewButtonHovered = false, 
        editText = ""
    };
    v30.editing = false;
    v30.textBoxRef = v1.createRef();
    v30.onMouseEnter = function()
        if v30.props.Enabled then
            if v30.state.StyleModifier == nil then
                v30:setState({
                    StyleModifier = l_StyleModifier_0.Hover
                });
            end;
            v30:setState({
                assetPreviewButtonHovered = true
            });
            local l_AssetData_0 = v30.props.AssetData;
            local v32 = l_AssetData_0.ClassName == "Folder";
            local v33 = l_AssetData_0.assetType == Enum.AssetType.Place;
            if not (v32 or v33) and type(v30.props.AssetsTable.assetPreviewData[l_AssetData_0.id]) ~= "table" then
                v30.props.dispatchGetAssetPreviewData(v30.props.API:get(), {
                    l_AssetData_0.id
                });
            end;
            return ;
        else
            return ;
        end;
    end;
    v30.onMouseLeave = function()
        if v30.props.Enabled then
            if v30.state.StyleModifier == l_StyleModifier_0.Hover then
                v30:setState({
                    StyleModifier = v1.None
                });
            end;
            v30:setState({
                assetPreviewButtonHovered = false
            });
            return ;
        else
            return ;
        end;
    end;
    v30.onClick = function(v34, v35)
        local l_props_0 = v30.props;
        if l_props_0.Enabled then
            local l_AssetData_1 = l_props_0.AssetData;
            if v35 == 0 then
                l_props_0.dispatchOnAssetSingleClick(v34, l_AssetData_1);
                return ;
            else
                if v35 == 1 then
                    l_props_0.dispatchOnAssetDoubleClick(l_props_0.Analytics, l_AssetData_1);
                end;
                return ;
            end;
        else
            return ;
        end;
    end;
    v30.onDragBegan = function(_)
        local l_props_1 = v30.props;
        l_props_1.OnAssetDrag(l_props_1.AssetData);
    end;
    v30.onRightClick = function()
        local l_props_2 = v30.props;
        if l_props_2.Enabled then
            local l_AssetData_2 = l_props_2.AssetData;
            if not (l_AssetData_2.ClassName == "Folder") then
                if not l_props_2.SelectedAssets[l_AssetData_2.key] then
                    l_props_2.dispatchOnAssetSingleClick(nil, l_AssetData_2);
                end;
            elseif not l_props_2.SelectedAssets[l_AssetData_2.Screen.LayoutOrder] then
                l_props_2.dispatchOnAssetSingleClick(nil, l_AssetData_2);
            end;
            l_props_2:dispatchOnAssetRightClick();
            return ;
        else
            return ;
        end;
    end;
    v30.openAssetPreview = function()
        v30:setState({
            assetPreviewButtonHovered = false
        });
        v30.props.OnOpenAssetPreview(v30.props.AssetData);
    end;
    v30.onTextChanged = function(v42)
        local l_Text_0 = v42.Text;
        if l_Text_0 ~= v30.props.AssetData.name then
            v30:setState({
                editText = l_Text_0
            });
        end;
    end;
    v30.onTextBoxFocusLost = function(_, _, _)
        local l_props_3 = v30.props;
        local l_AssetData_3 = l_props_3.AssetData;
        local l_editText_0 = v30.state.editText;
        if utf8.len(l_editText_0) ~= 0 and utf8.len((string.gsub(string.gsub(string.gsub(l_editText_0, "%s+", ""), "\n", ""), "\t", ""))) ~= 0 then
            if l_AssetData_3.assetType == Enum.AssetType.Place then
                l_AssetManagerService_0:RenamePlace(l_AssetData_3.id, l_editText_0);
            elseif not ((l_AssetData_3.assetType ~= Enum.AssetType.Image and l_AssetData_3.assetType ~= Enum.AssetType.MeshPart) and (not l_enableAudioImport_0() or l_AssetData_3.assetType ~= Enum.AssetType.Audio)) or l_enableVideoImport_0() and l_AssetData_3.assetType == Enum.AssetType.Video then
                local v50 = nil;
                if l_AssetData_3.assetType == Enum.AssetType.Image then
                    v50 = "Images/";
                elseif l_AssetData_3.assetType == Enum.AssetType.MeshPart then
                    v50 = "Meshes/";
                elseif l_enableAudioImport_0() and l_AssetData_3.assetType == Enum.AssetType.Audio then
                    v50 = "Audio/";
                elseif l_enableVideoImport_0() and l_AssetData_3.assetType == Enum.AssetType.Video then
                    v50 = "Video/";
                elseif l_AssetData_3.assetType == Enum.AssetType.Model then
                    v50 = "Models/";
                end;
                l_AssetManagerService_0:RenameAlias(l_AssetData_3.assetType.Value, l_AssetData_3.id, v50 .. l_AssetData_3.name, v50 .. l_editText_0);
            end;
        end;
        l_props_3.dispatchSetEditingAssets({});
        l_props_3.dispatchChangeAssetAlias(tostring(l_AssetData_3.id), l_editText_0);
        v30:setState({
            editText = l_props_3.AssetData.name
        });
        v30.editing = false;
    end;
    local l_AssetData_4 = v30.props.AssetData;
    local v52 = l_AssetData_4.ClassName == "Folder";
    local l_id_0 = l_AssetData_4.id;
    if not v52 then
        if l_AssetData_4.assetType == Enum.AssetType.Place then
            v30.thumbnailUrl = string.format("rbxthumb://type=AutoGeneratedAsset&id=%i&w=%i&h=%i", l_id_0, 150, 150);
        else
            v30.thumbnailUrl = string.format("rbxthumb://type=Asset&id=%i&w=%i&h=%i", l_id_0, 150, 150);
        end;
        spawn(function()
            l_ContentProvider_0:PreloadAsync({
                v30.thumbnailUrl
            }, function(_, v55)
                v30:setState({
                    assetFetchStatus = v55
                });
            end);
        end);
    end;
end;
v27.didMount = function(v56)
    v56:setState({
        editText = v56.props.AssetData.name
    });
end;
v27.didUpdate = function(v57, _, _)
    local l_props_4 = v57.props;
    if l_props_4.EditingAssets[l_props_4.AssetData.id] then
        if not l_props_4.RecentListItem then
            if not ((not v57.textBoxRef or not v57.textBoxRef.current) or v57.editing) then
                local l_current_0 = v57.textBoxRef.current;
                l_current_0:CaptureFocus();
                l_current_0.SelectionStart = 1;
                l_current_0.CursorPosition = #l_current_0.Text + 1;
                v57.editing = true;
            end;
        else
            return ;
        end;
    end;
end;
v27.render = function(v62)
    local l_props_5 = v62.props;
    local l_Stylizer_0 = l_props_5.Stylizer;
    local l_Localization_0 = l_props_5.Localization;
    local l_Enabled_0 = l_props_5.Enabled;
    local l_Size_0 = l_Stylizer_0.Size;
    local l_AssetData_5 = l_props_5.AssetData;
    local l_BackgroundColor_0 = l_Stylizer_0.BackgroundColor;
    local l_BackgroundTransparency_0 = l_Stylizer_0.BackgroundTransparency;
    local _ = l_Stylizer_0.BorderSizePixel;
    local l_Color_0 = l_Stylizer_0.Text.Color;
    local l_Font_0 = l_Stylizer_0.Font;
    local l_Size_1 = l_Stylizer_0.Text.Size;
    local l_BackgroundTransparency_1 = l_Stylizer_0.Text.BackgroundTransparency;
    local l_TextTruncate_0 = l_Stylizer_0.Text.TextTruncate;
    local l_XAlignment_0 = l_Stylizer_0.Text.XAlignment;
    local l_YAlignment_0 = l_Stylizer_0.Text.YAlignment;
    local l_Size_2 = l_Stylizer_0.Text.Frame.Size;
    local l_Position_0 = l_Stylizer_0.Text.Frame.Position;
    local l_editText_1 = v62.state.editText;
    local v82 = l_props_5.EditingAssets[l_AssetData_5.id];
    local l_TextWrapped_0 = l_Stylizer_0.EditText.TextWrapped;
    local l_ClearTextOnFocus_0 = l_Stylizer_0.EditText.ClearTextOnFocus;
    local l_XAlignment_1 = l_Stylizer_0.Text.XAlignment;
    local l_BackgroundColor_1 = l_Stylizer_0.EditText.Frame.BackgroundColor;
    local l_BorderColor_0 = l_Stylizer_0.EditText.Frame.BorderColor;
    local v88 = l_GetTextSize_0(l_editText_1, l_Size_1, l_Font_0, Vector2.new(l_Stylizer_0.Size.X.Offset, math.huge));
    local v89 = nil;
    v89 = if v88.X < l_Stylizer_0.Size.X.Offset then l_Stylizer_0.EditText.TextPadding else 0;
    local l_name_0 = l_AssetData_5.name;
    local l_name_1 = l_AssetData_5.name;
    if l_Size_2.Y.Offset < l_GetTextSize_0(l_AssetData_5.name, l_Size_1, l_Font_0, Vector2.new(l_Size_2.X.Offset, math.huge)).Y then
        l_name_1 = string.sub(l_AssetData_5.name, 1, 12) .. "..." .. string.sub(l_AssetData_5.name, string.len(l_AssetData_5.name) - 5);
    end;
    local v92 = l_AssetData_5.ClassName == "Folder";
    local v93 = l_AssetData_5.assetType == Enum.AssetType.Place;
    local v94 = nil;
    v94 = if not v92 then v62.state.assetFetchStatus == Enum.AssetFetchStatus.Success and v62.thumbnailUrl or l_Stylizer_0.Image.PlaceHolder else v24.getIconForCurrentTheme(l_AssetData_5.Screen.Image);
    local l_FrameSize_0 = l_Stylizer_0.Image.FrameSize;
    local l_ImageSize_0 = l_Stylizer_0.Image.ImageSize;
    local l_Position_1 = l_Stylizer_0.Image.Position;
    local l_FolderPosition_0 = l_Stylizer_0.Image.FolderPosition;
    local l_FolderAnchorPosition_0 = l_Stylizer_0.Image.FolderAnchorPosition;
    local l_BackgroundColor_2 = l_Stylizer_0.Image.BackgroundColor;
    local v101 = not v92 and not v93;
    local l_assetPreviewButtonHovered_0 = v62.state.assetPreviewButtonHovered;
    local v103 = v24.getIconForCurrentTheme(v24.IconEnums.Zoom);
    local l_Offset_0 = l_Stylizer_0.AssetPreview.Button.Offset;
    local l_isRootPlace_0 = l_AssetData_5.isRootPlace;
    local l_Size_3 = l_Stylizer_0.Image.StartingPlace.Size;
    local v107 = v24.getIconForCurrentTheme(v24.IconEnums.Spawn);
    local l_XOffset_0 = l_Stylizer_0.Image.StartingPlace.XOffset;
    local l_YOffset_0 = l_Stylizer_0.Image.StartingPlace.YOffset;
    local l_LayoutOrder_0 = l_props_5.LayoutOrder;
    local v111 = not v92 and "ImageLabel" or "Frame";
    local v112 = {
        Size = l_FrameSize_0, 
        Position = l_Position_1, 
        BackgroundTransparency = 0, 
        BackgroundColor3 = l_BackgroundColor_2, 
        BorderSizePixel = 0
    };
    if not v92 then
        v112.Image = v94;
    end;
    local v113 = nil;
    local v114 = nil;
    local v115 = nil;
    local v116 = nil;
    local v117 = nil;
    local v118 = nil;
    if not v92 then
        local l_ModerationData_0 = l_props_5.ModerationData;
        if l_ModerationData_0 and next(l_ModerationData_0) ~= nil then
            local v120 = l_ModerationData_0.reviewStatus == v22.Pending;
            local v121 = v23.isApprovedAsset(l_ModerationData_0);
            v113 = v120 or not v121;
            if v113 then
                if not v120 then
                    if not v121 then
                        v114 = l_Stylizer_0.Image.ModerationStatus.Rejected;
                    end;
                else
                    v114 = l_Stylizer_0.Image.ModerationStatus.Pending;
                end;
                v115 = l_Stylizer_0.Image.ModerationStatus.Size;
                v116 = l_Stylizer_0.Image.ModerationStatus.XOffset;
                v117 = l_Stylizer_0.Image.ModerationStatus.YOffset;
                v118 = v23.getModerationTooltip(l_Localization_0, l_ModerationData_0);
            end;
        end;
    end;
    return v1.createElement(l_DragSource_0, {
        AutomaticSize = Enum.AutomaticSize.XY, 
        LayoutOrder = l_LayoutOrder_0, 
        OnClick = v62.onClick, 
        OnRightClick = v62.onRightClick, 
        OnDragBegan = v62.onDragBegan
    }, {
        Button = v1.createElement(l_Pane_0, {
            BackgroundColor = l_BackgroundColor_0, 
            Size = l_Size_0, 
            Transparency = l_BackgroundTransparency_0, 
            [v1.Event.MouseEnter] = v62.onMouseEnter, 
            [v1.Event.MouseLeave] = v62.onMouseLeave
        }, {
            ThumbnailContainer = v1.createElement(v111, v112, {
                AssetPreviewButton = v101 and v1.createElement(v13, {
                    Position = UDim2.new(1, -l_Offset_0, 0, l_Offset_0), 
                    Image = v103, 
                    ShowIcon = l_assetPreviewButtonHovered_0, 
                    OnClick = v62.openAssetPreview, 
                    OnRightClick = v62.onRightClick
                }), 
                RootPlaceImage = l_isRootPlace_0 and v1.createElement("ImageLabel", {
                    Size = UDim2.new(0, l_Size_3, 0, l_Size_3), 
                    Position = UDim2.new(0, l_XOffset_0, 0, l_YOffset_0), 
                    Image = v107, 
                    BackgroundTransparency = 1
                }), 
                ModerationStatusImage = v113 and v1.createElement("ImageLabel", {
                    Size = UDim2.new(0, v115, 0, v115), 
                    Position = UDim2.new(0, v116, 0, v117), 
                    Image = v114, 
                    BackgroundTransparency = 1
                }, {
                    ModerationTooltip = v1.createElement(l_Tooltip_0, {
                        Text = v118, 
                        Enabled = l_Enabled_0
                    })
                }), 
                FolderImage = v92 and v1.createElement("ImageLabel", {
                    Size = l_ImageSize_0, 
                    Image = v94, 
                    Position = l_FolderPosition_0, 
                    AnchorPoint = l_FolderAnchorPosition_0, 
                    BackgroundTransparency = 1
                })
            }), 
            Name = not v82 and v1.createElement("TextLabel", {
                Size = l_Size_2, 
                Position = l_Position_0, 
                Text = l_name_1, 
                TextColor3 = l_Color_0, 
                Font = l_Font_0, 
                TextSize = l_Size_1, 
                BackgroundTransparency = l_BackgroundTransparency_1, 
                TextXAlignment = l_XAlignment_0, 
                TextYAlignment = l_YAlignment_0, 
                TextTruncate = l_TextTruncate_0, 
                TextWrapped = true
            }), 
            RenameTextBox = v82 and v1.createElement("TextBox", {
                Size = UDim2.new(0, v88.X + v89, 0, v88.Y), 
                Position = l_Position_0, 
                BackgroundColor3 = l_BackgroundColor_1, 
                BorderColor3 = l_BorderColor_0, 
                Text = l_editText_1, 
                TextColor3 = l_Color_0, 
                Font = l_Font_0, 
                TextSize = l_Size_1, 
                TextXAlignment = l_XAlignment_1, 
                TextTruncate = Enum.TextTruncate.None, 
                TextWrapped = l_TextWrapped_0, 
                ClearTextOnFocus = l_ClearTextOnFocus_0, 
                [v1.Ref] = v62.textBoxRef, 
                [v1.Change.Text] = v62.onTextChanged, 
                [v1.Event.FocusLost] = v62.onTextBoxFocusLost
            }), 
            NameTooltip = v1.createElement(l_Tooltip_0, {
                Text = l_name_0, 
                Enabled = l_Enabled_0
            }), 
            DEPRECATED_Tooltip = l_Enabled_0 and v1.createElement(l_Tooltip_0, {
                Text = l_name_0, 
                Enabled = true
            })
        })
    });
end;
return v2.connect(function(v122, _)
    local l_AssetManagerReducer_0 = v122.AssetManagerReducer;
    return {
        AssetsTable = l_AssetManagerReducer_0.assetsTable, 
        EditingAssets = l_AssetManagerReducer_0.editingAssets, 
        SelectedAssets = l_AssetManagerReducer_0.selectedAssets
    };
end, function(v125)
    return {
        dispatchGetAssetPreviewData = function(v126, v127)
            v125(v18(v126, v127));
        end, 
        dispatchOnAssetDoubleClick = function(v128, v129)
            v125(v19(v128, v129));
        end, 
        dispatchOnAssetRightClick = function(v130)
            v125(v20(v130));
        end, 
        dispatchOnAssetSingleClick = function(v131, v132)
            v125(v21(v131, v132));
        end, 
        dispatchSetEditingAssets = function(v133)
            v125(v16(v133));
        end, 
        dispatchChangeAssetAlias = function(v134, v135)
            v125(v17(v134, v135));
        end
    };
end)((l_withContext_0({
    Analytics = l_ContextServices_0.Analytics, 
    API = l_ContextServices_0.API, 
    Localization = l_ContextServices_0.Localization, 
    Mouse = l_ContextServices_0.Mouse, 
    Plugin = l_ContextServices_0.Plugin, 
    Stylizer = l_ContextServices_0.Stylizer
})(v27)));
