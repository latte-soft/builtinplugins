local l_script_FirstAncestor_0 = script:FindFirstAncestor("AssetImporter");
local v1 = require(l_script_FirstAncestor_0.Packages.Framework);
local v2 = require(l_script_FirstAncestor_0.Packages.Roact);
local v3 = require(l_script_FirstAncestor_0.Packages.RoactRodux);
local v4 = require(l_script_FirstAncestor_0.Src.Resources.Images);
local l_ContextServices_0 = v1.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_Stylizer_0 = l_ContextServices_0.Stylizer;
local l_UI_0 = v1.UI;
local l_ThemeSwitcher_0 = v1.Style.ThemeSwitcher;
local l_Button_0 = l_UI_0.Button;
local l_Pane_0 = l_UI_0.Pane;
local l_Image_0 = l_UI_0.Image;
local v13 = require(l_script_FirstAncestor_0.Src.Components.Properties.Types.StringProperty);
local v14 = require(l_script_FirstAncestor_0.Src.Thunks.PickTextureFileWithPrompt);
local v15 = v2.PureComponent:extend("PathProperty");
local function _()
    local v16 = l_ThemeSwitcher_0.getThemeName();
    if not (v16 ~= "Dark") or v16 == "Default" then
        return v4.FILE_PICKER_DARK;
    else
        return v4.FILE_PICKER_LIGHT;
    end;
end;
v15.init = function(v18)
    v18.onTextureFilePickerButtonClicked = function()
        v18.props.pickTextureFileWithPrompt(v18.props.Instance, v18.props.Name);
    end;
end;
v15.render = function(v19)
    local l_props_0 = v19.props;
    local l_Value_0 = l_props_0.Value;
    local l_Stylizer_1 = l_props_0.Stylizer;
    local l_FilePickerSize_0 = l_Stylizer_1.PropertyView.FilePickerSize;
    local l_IconSpacing_0 = l_Stylizer_1.PropertyView.IconSpacing;
    local v25 = l_FilePickerSize_0 + l_IconSpacing_0;
    local l_createElement_0 = v2.createElement;
    local l_l_Pane_0_0 = l_Pane_0;
    local v28 = {
        Size = l_props_0.Size, 
        LayoutOrder = l_props_0.LayoutOrder, 
        Layout = Enum.FillDirection.Horizontal, 
        HorizontalAlignment = Enum.HorizontalAlignment.Left, 
        Spacing = l_IconSpacing_0
    };
    local v29 = {
        PathField = v2.createElement(v13, {
            Editable = l_props_0.Editable, 
            Size = UDim2.new(1, -v25, 1, 0), 
            Value = if l_Value_0 ~= "" then l_Value_0 else l_props_0.Localization:getText("Properties", "NoFilePath"), 
            LayoutOrder = 1, 
            OnSetItem = l_props_0.OnSetItem
        })
    };
    local v30;
    if l_props_0.AllowPickFile and l_Value_0 ~= "" then
        v30 = v2.createElement;
        local l_l_Button_0_0 = l_Button_0;
        local v32 = {
            OnClick = v19.onTextureFilePickerButtonClicked, 
            LayoutOrder = 2, 
            Size = UDim2.fromOffset(l_FilePickerSize_0, l_FilePickerSize_0)
        };
        local v33 = {};
        local l_createElement_1 = v2.createElement;
        local l_l_Image_0_0 = l_Image_0;
        local v36 = {
            Size = UDim2.fromOffset(l_FilePickerSize_0, l_FilePickerSize_0)
        };
        local v37 = l_ThemeSwitcher_0.getThemeName();
        v36.Image = if not (v37 ~= "Dark") or v37 == "Default" then v4.FILE_PICKER_DARK else v4.FILE_PICKER_LIGHT;
        v33.Icon = l_createElement_1(l_l_Image_0_0, v36);
        v30 = v30(l_l_Button_0_0, v32, v33);
    else
        v30 = nil;
    end;
    v29.TextureFilePickerButton = v30;
    return l_createElement_0(l_l_Pane_0_0, v28, v29);
end;
return v3.connect(nil, function(v38)
    return {
        pickTextureFileWithPrompt = function(v39, v40)
            v38(v14(v39, v40));
        end
    };
end)((l_withContext_0({
    Stylizer = l_Stylizer_0
})(v15)));
