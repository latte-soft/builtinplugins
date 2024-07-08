local l_script_FirstAncestor_0 = script:FindFirstAncestor("AssetImporter");
local v1 = require(l_script_FirstAncestor_0.Packages.Roact);
local v2 = require(l_script_FirstAncestor_0.Packages.Framework);
local l_ContextServices_0 = v2.ContextServices;
local l_Localization_0 = l_ContextServices_0.Localization;
local l_UI_0 = v2.UI;
local l_Pane_0 = l_UI_0.Pane;
local l_LinkText_0 = l_UI_0.LinkText;
local l_Checkbox_0 = l_UI_0.Checkbox;
local l_Image_0 = l_UI_0.Image;
local l_Tooltip_0 = l_UI_0.Tooltip;
local v11 = require(l_script_FirstAncestor_0.Src.Components.Presets.PresetSelector);
local v12 = require(l_script_FirstAncestor_0.Src.Controllers.FileController);
local v13 = v1.PureComponent:extend("AssetListCell");
v13.init = function(v14)
    v14.openImportPreview = function()
        v14.props.FileController:requestPreview(v14.props.Row);
    end;
    v14.reopenFileSelection = function()
        v14.props.FileController:requestFileSwap(v14.props.Row.filepath);
    end;
    v14.getModelIcon = function()
        local l_status_0, l_result_0 = pcall(function()
            return game:GetService("StudioService"):GetClassIcon("Model");
        end);
        if not l_status_0 then
            return {
                Image = "rbxasset://textures/ClassImages.png", 
                ImageRectOffset = Vector2.new(0, 0), 
                ImageRectSize = Vector2.new(16, 16)
            };
        else
            return l_result_0;
        end;
    end;
    v14.toggleCheckbox = function()
        local l_props_0 = v14.props;
        l_props_0.CellProps.OnCheckboxToggle(l_props_0.Row.filepath);
    end;
end;
v13.renderCheckboxCell = function(v18)
    local l_props_1 = v18.props;
    if not (l_props_1.Row.validSession and not l_props_1.Row.uploaded) then
        return nil;
    else
        return (v1.createFragment({
            Layout = v1.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Horizontal, 
                HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                VerticalAlignment = Enum.VerticalAlignment.Center
            }), 
            Checkbox = v1.createElement(l_Checkbox_0, {
                OnClick = v18.toggleCheckbox, 
                Key = l_props_1.RowIndex, 
                Checked = l_props_1.Row.enabled
            })
        }));
    end;
end;
v13.renderAssetCell = function(v20)
    local l_props_2 = v20.props;
    local l_Localization_1 = l_props_2.Localization;
    local l_Style_0 = l_props_2.Style;
    local l_ImportQueue_0 = l_Style_0.ImportQueue;
    local l_Padding_0 = l_ImportQueue_0.Padding;
    local l_DisabledTransparancy_0 = l_ImportQueue_0.DisabledTransparancy;
    local l_Row_0 = l_props_2.Row;
    local v28 = not l_Row_0.enabled or l_Row_0.uploaded;
    local v29 = l_Row_0.errors + l_Row_0.warnings;
    local v30 = v20.getModelIcon();
    local l_X_0 = v30.ImageRectSize.X;
    local v32 = if v29 > 0 then l_props_2.CellProps.StatusIconSize + l_Padding_0 else 0;
    local v33 = if l_Row_0.errors > 0 then l_Style_0.ErrorIcon else l_Style_0.WarningIcon;
    return v1.createElement(l_Pane_0, {
        Layout = Enum.FillDirection.Horizontal, 
        HorizontalAlignment = Enum.HorizontalAlignment.Left, 
        Padding = {
            Left = l_Padding_0, 
            Right = l_Padding_0
        }, 
        Spacing = l_Padding_0
    }, {
        Icon = v1.createElement(l_Pane_0, {
            Size = UDim2.fromOffset(v30.ImageRectSize.X, v30.ImageRectSize.Y), 
            Image = v30.Image, 
            ImageTransparency = not v28 and 0 or l_DisabledTransparancy_0
        }), 
        AssetName = v1.createElement(l_LinkText_0, {
            LayoutOrder = 2, 
            TextXAlignment = Enum.TextXAlignment.Left, 
            OnClick = v20.openImportPreview, 
            Text = l_Row_0.assetName, 
            Size = UDim2.new(1, -((l_X_0 + l_Padding_0) + v32), 1, 0), 
            TextTruncate = Enum.TextTruncate.SplitWord, 
            Style = if not v28 then nil else "Disabled"
        }), 
        Status = if v29 > 0 then v1.createElement(l_Image_0, {
            LayoutOrder = 3, 
            Style = {
                Image = v33.Image
            }, 
            Size = v33.Size
        }, {
            Tooltip = v1.createElement(l_Tooltip_0, {
                Text = l_Localization_1:getText("AssetImportTree", "DescendantsContain2", {
                    statusCount = tostring(if l_Row_0.errors > 0 then l_Row_0.errors else l_Row_0.warnings), 
                    statusType = if l_Row_0.errors > 0 then l_Localization_1:getText("AssetImportTree", "Errors") else l_Localization_1:getText("AssetImportTree", "Warnings")
                })
            })
        }) else nil
    });
end;
v13.renderPresetCell = function(v34)
    local l_props_3 = v34.props;
    local l_Row_1 = l_props_3.Row;
    return v1.createFragment({
        PresetSelector = v1.createElement(v11, {
            ActiveQueueItem = l_Row_1, 
            Enabled = l_Row_1.enabled
        }), 
        Padding = v1.createElement("UIPadding", l_props_3.Style.AssetListCell.Padding)
    });
end;
v13.renderPathCell = function(v37)
    local l_props_4 = v37.props;
    local l_Padding_1 = l_props_4.Style.ImportQueue.Padding;
    local v40 = l_props_4.Width or UDim.new(1 / #l_props_4.Columns, 0);
    return v1.createFragment({
        Padding = v1.createElement("UIPadding", {
            PaddingLeft = UDim.new(0, l_Padding_1), 
            PaddingRight = UDim.new(0, l_Padding_1)
        }), 
        Path = v1.createElement(l_Pane_0, {
            Layout = Enum.FillDirection.Horizontal, 
            HorizontalAlignment = Enum.HorizontalAlignment.Left, 
            Spacing = l_Padding_1, 
            ClipsDescendants = true
        }, {
            PathText = v1.createElement(l_LinkText_0, {
                LayoutOrder = 1, 
                Size = UDim2.new(v40.Scale, v40.Offset, 1, 0), 
                AutomaticSize = Enum.AutomaticSize.Y, 
                Text = l_props_4.Row.filepath, 
                TextWrapped = false, 
                OnClick = v37.reopenFileSelection
            })
        })
    });
end;
v13.getContent = function(v41)
    local l_props_5 = v41.props;
    local l_Key_0 = l_props_5.Columns[l_props_5.ColumnIndex].Key;
    if l_Key_0 == "Checkbox" then
        return v41:renderCheckboxCell();
    elseif l_Key_0 == "Asset" then
        return v41:renderAssetCell();
    elseif l_Key_0 == "Preset" then
        return v41:renderPresetCell();
    elseif l_Key_0 == "Path" then
        return v41:renderPathCell();
    else
        return nil;
    end;
end;
v13.render = function(v44)
    local l_props_6 = v44.props;
    local l_Style_1 = l_props_6.Style;
    local v47 = l_props_6.Width or UDim.new(1 / #l_props_6.Columns, 0);
    return v1.createElement(l_Pane_0, {
        LayoutOrder = l_props_6.ColumnIndex, 
        BackgroundColor3 = l_Style_1.BackgroundOdd, 
        BorderSizePixel = 1, 
        BorderColor3 = l_Style_1.Border, 
        Size = UDim2.new(v47.Scale, v47.Offset, 1, 0), 
        ClipsDescendants = true
    }, {
        Content = v44:getContent()
    });
end;
return (l_ContextServices_0.withContext({
    Localization = l_Localization_0, 
    FileController = v12
})(v13));
