local l_script_FirstAncestor_0 = script:FindFirstAncestor("AssetImporter");
local v1 = require(l_script_FirstAncestor_0.Packages.Roact);
local v2 = require(l_script_FirstAncestor_0.Packages.RoactRodux);
local v3 = require(l_script_FirstAncestor_0.Packages.Framework);
local l_ContextServices_0 = v3.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_Localization_0 = l_ContextServices_0.Localization;
local l_Stylizer_0 = l_ContextServices_0.Stylizer;
local l_UI_0 = v3.UI;
local l_Pane_0 = l_UI_0.Pane;
local l_TextLabel_0 = l_UI_0.TextLabel;
local l_Tooltip_0 = l_UI_0.Tooltip;
local v12 = require(l_script_FirstAncestor_0.Src.Components.Properties.PropertyStatus);
local v13 = require(l_script_FirstAncestor_0.Src.Thunks.UpdatePreviewInstance);
local l_shallowEqual_0 = v3.Dash.shallowEqual;
local v15 = require(l_script_FirstAncestor_0.Src.Utility.createCalloutComponents);
local v16 = require(l_script_FirstAncestor_0.Src.Utility.GetEditorFromType);
local v17 = require(l_script_FirstAncestor_0.Src.Utility.GetErrorChecked);
local v18 = require(l_script_FirstAncestor_0.Src.Actions.SetErrorNodeChecked);
local v19 = require(l_script_FirstAncestor_0.Src.Actions.SetSettingsChanged);
local v20 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagChooseAnimationForRestPose);
local v21 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagImporterOpensAvatarPreviewerBetaCheck);
local v22 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagAssetImportTrackPropertyChange);
local v23 = v1.PureComponent:extend("PropertyView");
local function v29(v24, v25)
    if v25 == nil then
        return {};
    else
        local v26 = {};
        for _, v28 in ipairs(v25) do
            v26[v28] = v24[v28];
        end;
        return v26;
    end;
end;
local function _(v30, v31)
    for v32, v33 in v30, nil, nil do
        if v31[v32] ~= v33 then
            return true;
        end;
    end;
    return false;
end;
v23._connect = function(v35)
    local l_PropertyMetadata_0 = v35.props.PropertyMetadata;
    if v35.props.Instance then
        if not v22() then
            v35._changedConnection = v35.props.Instance:GetPropertyChangedSignal(l_PropertyMetadata_0.Name):Connect(function()
                v35:setState({});
            end);
        else
            local l_props_0 = v35.props;
            v35._changedConnection = l_props_0.Instance.Changed:Connect(function(v38)
                if not (v38 ~= l_props_0.PropertyMetadata.Name) or v35.state.dependencies and v35.state.dependencies[v38] ~= nil then
                    v35:setState({
                        value = l_props_0.Instance[l_props_0.PropertyMetadata.Name], 
                        dependencies = v29(l_props_0.Instance, l_props_0.PropertyMetadata.Dependencies)
                    });
                end;
            end);
            return ;
        end;
    end;
end;
v23._disconnect = function(v39)
    if v39._changedConnection then
        v39._changedConnection:Disconnect();
        v39._changedConnection = nil;
    end;
end;
v23.init = function(v40)
    local function _()
        v40.props.UpdatePreviewInstance(v40.props.Instance:GetPreview());
    end;
    v40.onToggleItem = function()
        local l_PropertyMetadata_1 = v40.props.PropertyMetadata;
        v40.props.Instance[l_PropertyMetadata_1.Name] = not v40.props.Instance[l_PropertyMetadata_1.Name];
        v40.props.UpdatePreviewInstance(v40.props.Instance:GetPreview());
        v40.props.SetErrorNodeChecked(v17(v40.props.ImportTree));
        v40.props.SetSettingsChanged(true);
        v40.props.OnInteract();
        v40:setState({});
    end;
    v40.onSetItem = function(v43)
        local l_PropertyMetadata_2 = v40.props.PropertyMetadata;
        if l_PropertyMetadata_2.Name == "ImportName" and v40.props.Instance.ImportName ~= v43 then
            v40.props.SetSettingsChanged(true);
        end;
        v40.props.Instance[l_PropertyMetadata_2.Name] = v43;
        if v20() then
            v40.props.UpdatePreviewInstance(v40.props.Instance:GetPreview());
        end;
        v40.props.SetErrorNodeChecked(v17(v40.props.ImportTree));
        v40.props.OnInteract();
    end;
    v40.onSelectItem = function(v45)
        local l_PropertyMetadata_3 = v40.props.PropertyMetadata;
        local v47 = v40.props.Instance[l_PropertyMetadata_3.Name].EnumType[v45];
        if v47 == v40.props.Instance[l_PropertyMetadata_3.Name] then
            return ;
        else
            v40.props.Instance[l_PropertyMetadata_3.Name] = v47;
            v40.props.UpdatePreviewInstance(v40.props.Instance:GetPreview());
            v40.props.SetErrorNodeChecked(v17(v40.props.ImportTree));
            v40.props.SetSettingsChanged(true);
            v40.props.OnInteract();
            return ;
        end;
    end;
    if v22() then
        v40:setState({
            value = v40.props.Instance[v40.props.PropertyMetadata.Name], 
            dependencies = v29(v40.props.Instance, v40.props.PropertyMetadata.Dependencies)
        });
    end;
end;
v23.didMount = function(v48)
    v48:_connect();
end;
v23.willUnmount = function(v49)
    v49.state.connections = nil;
    v49:_disconnect();
end;
v23.didUpdate = function(v50, v51, _)
    if v51.Instance ~= v50.props.Instance then
        v50:_disconnect();
        v50:_connect();
    end;
end;
if v22() then
    v23.getDerivedStateFromProps = function(v53, _)
        return {
            value = v53.Instance[v53.PropertyMetadata.Name], 
            dependencies = v29(v53.Instance, v53.PropertyMetadata.Dependencies)
        };
    end;
end;
v23.render = function(v55)
    local l_props_1 = v55.props;
    local l_Localization_1 = l_props_1.Localization;
    local l_Stylizer_1 = l_props_1.Stylizer;
    local l_PropertyMetadata_4 = l_props_1.PropertyMetadata;
    local l_Instance_0 = l_props_1.Instance;
    local v61 = nil;
    local v62 = nil;
    local v63 = nil;
    if l_props_1.Status then
        v61 = l_props_1.Status.Level;
        v62 = l_props_1.Status.Type;
        v63 = l_props_1.Status.Context;
    end;
    local l_Editable_0 = l_PropertyMetadata_4.Editable;
    local l_Name_0 = l_PropertyMetadata_4.Name;
    local l_AllowPickFile_0 = l_PropertyMetadata_4.AllowPickFile;
    local v67 = l_Instance_0[l_Name_0];
    local v68 = nil;
    if l_PropertyMetadata_4.Dependencies then
        v68 = v29(l_Instance_0, l_PropertyMetadata_4.Dependencies);
    end;
    local v69 = nil;
    v69 = if not l_PropertyMetadata_4.ComponentFactory then v16(v67) else l_PropertyMetadata_4.ComponentFactory;
    local l_IconSize_0 = l_Stylizer_1.PropertyView.IconSize;
    local l_Spacing_0 = l_Stylizer_1.PropertyView.Spacing;
    local v72 = l_IconSize_0 + l_Spacing_0;
    local v73 = {};
    if not (not v21() or not l_PropertyMetadata_4.Callouts) then
        v73 = v15(l_PropertyMetadata_4.Callouts, l_Name_0, v55.props.AssetImportSession);
    end;
    v73.Tooltip = v1.createElement(l_Tooltip_0, {
        Text = l_Localization_1:getText("PropertiesTooltip", l_Name_0)
    });
    return v1.createElement(l_Pane_0, {
        LayoutOrder = l_props_1.LayoutOrder, 
        Size = UDim2.new(1, -l_Stylizer_1.PropertyView.ScrollBarOffset, 0, l_Stylizer_1.PropertyView.Height), 
        Layout = Enum.FillDirection.Horizontal, 
        HorizontalAlignment = Enum.HorizontalAlignment.Left, 
        Spacing = l_Spacing_0
    }, {
        StatusArea = v1.createElement(l_Pane_0, {
            HorizontalAlignment = Enum.HorizontalAlignment.Left, 
            Layout = Enum.FillDirection.Horizontal, 
            LayoutOrder = 3, 
            Size = UDim2.new(0, v72, 1, 0), 
            Padding = {
                Left = l_Spacing_0
            }
        }, {
            Icon = if not v61 then nil else v1.createElement(v12, {
                StatusLevel = v61, 
                StatusMessage = v62, 
                StatusContext = v63
            })
        }), 
        Label = v1.createElement(l_TextLabel_0, {
            AutomaticSize = Enum.AutomaticSize.Y, 
            Text = l_Localization_1:getText("Properties", l_Name_0), 
            TextWrapped = false, 
            TextXAlignment = Enum.TextXAlignment.Left, 
            LayoutOrder = 1, 
            Size = UDim2.new(0.5, -v72, 0, 0)
        }, v73), 
        Editor = v1.createElement(v69, {
            DependentValues = v68, 
            Editable = l_Editable_0, 
            LayoutOrder = 2, 
            Name = l_Name_0, 
            OnSelectItem = v55.onSelectItem, 
            OnSetItem = v55.onSetItem, 
            OnToggleItem = v55.onToggleItem, 
            Size = UDim2.new(0.5, -l_Stylizer_1.PropertyView.ScrollBarOffset, 0, l_Stylizer_1.PropertyView.EditorHeight), 
            Value = v67, 
            Localization = l_Localization_1, 
            PropertyMetadata = l_PropertyMetadata_4, 
            AllowPickFile = l_AllowPickFile_0, 
            Instance = l_Instance_0, 
            AssetImportSession = v55.props.AssetImportSession
        })
    });
end;
if v22() then
    v23.shouldUpdate = function(v74, v75, v76)
        local l_state_0 = v74.state;
        if l_state_0.value ~= v76.value then
            return true;
        else
            local l_dependencies_0 = l_state_0.dependencies;
            local l_dependencies_1 = v76.dependencies;
            local v80;
            for v81, v82 in l_dependencies_0, nil, nil do
                if l_dependencies_1[v81] ~= v82 then
                    v80 = true;
                    goto label0 --[[  true, false  ]];
                end;
            end;
            v80 = false;
            ::label0::;
            if not v80 then
                return not l_shallowEqual_0(v74.props, v75);
            else
                return true;
            end;
        end;
    end;
end;
return v2.connect(function(v83)
    return {
        AssetImportSession = v83.Preview.assetImportSession, 
        ImportTree = v83.Preview.importTree
    };
end, function(v84)
    return {
        SetSettingsChanged = function(v85)
            v84(v19(v85));
        end, 
        UpdatePreviewInstance = function(v86)
            v84(v13(v86));
        end, 
        SetErrorNodeChecked = function(v87)
            v84(v18(v87));
        end
    };
end)((l_withContext_0({
    Localization = l_Localization_0, 
    Stylizer = l_Stylizer_0
})(v23)));
