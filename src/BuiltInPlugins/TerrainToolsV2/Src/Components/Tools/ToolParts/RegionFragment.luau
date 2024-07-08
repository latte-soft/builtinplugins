local l_Parent_0 = script.Parent.Parent.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Framework);
local v2 = require(l_Parent_0.Packages.Cryo);
local v3 = require(l_Parent_0.Packages.Roact);
local l_ContextServices_0 = v1.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_LayoutOrderIterator_0 = v1.Util.LayoutOrderIterator;
local l_Pane_0 = v1.UI.Pane;
local l_Parent_1 = script.Parent;
local v9 = require(l_Parent_1.LabeledToggle);
local v10 = require(l_Parent_1.VectorTextInput);
local v11 = require(l_Parent_1.VolumeDragger);
local v12 = require(l_Parent_0.Src.Util.Constants);
local _ = function(v13, v14)
    if v14 then
        local _ = 1;
        return (v13.X * v13.Y) * v13.Z <= v14;
    else
        return true;
    end;
end;
local function v25(v17, v18, v19)
    for _, v21 in pairs(v19) do
        for _, v23 in pairs(v21) do
            if not v23 then
                return false;
            end;
        end;
    end;
    if v18 then
        local _ = 1;
        return (v17.X * v17.Y) * v17.Z <= v18;
    else
        return true;
    end;
end;
local function _(v26, v27, v28)
    if v27 == "X" then
        return (Vector3.new(v28, v26.Y, v26.Z));
    elseif v27 == "Y" then
        return (Vector3.new(v26.X, v28, v26.Z));
    elseif v27 == "Z" then
        return (Vector3.new(v26.X, v26.Y, v28));
    else
        return Vector3.zero;
    end;
end;
local v30 = v3.PureComponent:extend(script.Name);
v30.init = function(v31)
    v31.validFieldState = {
        Position = {
            X = true, 
            Y = true, 
            Z = true
        }, 
        Size = {
            X = true, 
            Y = true, 
            Z = true
        }, 
        Rotation = {
            X = true, 
            Y = true, 
            Z = true
        }
    };
    v31.warnings = {};
    local function _(v32, v33, v34)
        local l_props_0 = v31.props;
        local v36;
        if v32 == "Size" then
            local l_Size_0 = l_props_0.Size;
            v36 = if v33 == "X" then Vector3.new(v34, l_Size_0.Y, l_Size_0.Z) else if v33 == "Y" then Vector3.new(l_Size_0.X, v34, l_Size_0.Z) else if v33 == "Z" then Vector3.new(l_Size_0.X, l_Size_0.Y, v34) else Vector3.zero;
        else
            v36 = l_props_0.Size;
        end;
        local v38 = v25(v36, v31.props.MaxVolume, v31.validFieldState);
        if l_props_0.SetMapSettingsValid then
            l_props_0.SetMapSettingsValid(v38);
        end;
        return v38;
    end;
    local function v54(v40, v41, v42, v43, v44)
        local l_props_1 = v31.props;
        if v43 or not l_props_1.SetWarnings then
            local l_Position_0 = l_props_1.Transform.Position;
            local v47 = Vector3.new(l_props_1.Transform:ToEulerAnglesXYZ());
            local l_Size_1 = l_props_1.Size;
            if v40 == "Position" then
                local l_l_Position_0_0 = l_Position_0;
                l_Position_0 = if v41 == "X" then Vector3.new(v42, l_l_Position_0_0.Y, l_l_Position_0_0.Z) else if v41 == "Y" then Vector3.new(l_l_Position_0_0.X, v42, l_l_Position_0_0.Z) else if v41 == "Z" then Vector3.new(l_l_Position_0_0.X, l_l_Position_0_0.Y, v42) else Vector3.zero;
            elseif v40 == "Size" then
                local l_l_Size_1_0 = l_Size_1;
                l_Size_1 = if v41 == "X" then Vector3.new(v42, l_l_Size_1_0.Y, l_l_Size_1_0.Z) else if v41 == "Y" then Vector3.new(l_l_Size_1_0.X, v42, l_l_Size_1_0.Z) else if v41 == "Z" then Vector3.new(l_l_Size_1_0.X, l_l_Size_1_0.Y, v42) else Vector3.zero;
            elseif v40 == "Rotation" then
                local l_v47_0 = v47;
                local v52 = (v42 * 3.141592653589793) / 180;
                v47 = if v41 == "X" then Vector3.new(v52, l_v47_0.Y, l_v47_0.Z) else if v41 == "Y" then Vector3.new(l_v47_0.X, v52, l_v47_0.Z) else if v41 == "Z" then Vector3.new(l_v47_0.X, l_v47_0.Y, v52) else Vector3.zero;
            else
                warn("MapSettings dispatchVectorChanged unknown vector", v40);
            end;
            if v44 then
                local v53 = CFrame.Angles(v47.X, v47.Y, v47.Z) + l_Position_0;
                v31:setState({
                    Size = l_Size_1, 
                    Transform = v53
                });
                l_props_1.SetRegion(v53, l_Size_1);
            end;
            return ;
        else
            if l_props_1.SetWarnings then
                v2.Dictionary.join(v31.warnings, {
                    [v40 .. v41] = not v43
                });
                l_props_1.SetWarnings(v31.warnings);
            end;
            return ;
        end;
    end;
    v31.onVectorFocusLost = function(v55, v56, _, v58, v59)
        if utf8.len(v58) > 0 then
            local l_props_2 = v31.props;
            local v61;
            if v55 == "Size" then
                local l_Size_2 = l_props_2.Size;
                v61 = if v56 == "X" then Vector3.new(v58, l_Size_2.Y, l_Size_2.Z) else if v56 == "Y" then Vector3.new(l_Size_2.X, v58, l_Size_2.Z) else if v56 == "Z" then Vector3.new(l_Size_2.X, l_Size_2.Y, v58) else Vector3.zero;
            else
                v61 = l_props_2.Size;
            end;
            local v63 = v25(v61, v31.props.MaxVolume, v31.validFieldState);
            if l_props_2.SetMapSettingsValid then
                l_props_2.SetMapSettingsValid(v63);
            end;
            if v63 then
                v54(v55, v56, v58, v59, true);
            end;
        end;
    end;
    v31.onVectorValueChanged = function(v64, v65, v66, v67)
        v31.validFieldState[v64][v65] = v67;
        local l_props_3 = v31.props;
        local v69;
        if v64 == "Size" then
            local l_Size_3 = l_props_3.Size;
            v69 = if v65 == "X" then Vector3.new(v66, l_Size_3.Y, l_Size_3.Z) else if v65 == "Y" then Vector3.new(l_Size_3.X, v66, l_Size_3.Z) else if v65 == "Z" then Vector3.new(l_Size_3.X, l_Size_3.Y, v66) else Vector3.zero;
        else
            v69 = l_props_3.Size;
        end;
        local v71 = v25(v69, v31.props.MaxVolume, v31.validFieldState);
        if l_props_3.SetMapSettingsValid then
            l_props_3.SetMapSettingsValid(v71);
        end;
        v54(v64, v65, v66, v67, false);
    end;
    v31.setRegion = function(v72)
        v31:setState({
            Size = v72.size, 
            Transform = v72.transform
        });
    end;
end;
v30.render = function(v73)
    local l_props_4 = v73.props;
    local l_LayoutOrder_0 = l_props_4.LayoutOrder;
    local l_Localization_0 = l_props_4.Localization;
    local l_Region_0 = l_props_4.Region;
    local l_SetSnapToVoxels_0 = l_props_4.SetSnapToVoxels;
    local v79 = v73.state.Size or l_props_4.Size;
    local l_ShowRotation_0 = l_props_4.ShowRotation;
    local l_ShowTooltip_0 = l_props_4.ShowTooltip;
    local l_SnapToVoxels_0 = l_props_4.SnapToVoxels;
    local l_SourceTransform_0 = l_props_4.SourceTransform;
    local l_SourceSize_0 = l_props_4.SourceSize;
    local l_ToolName_0 = l_props_4.ToolName;
    local v86 = v73.state.Transform or l_props_4.Transform;
    local v87 = not l_props_4.HideWireframe;
    local v88 = if not v86 then nil else v86.Position;
    local v89 = if not not l_ShowRotation_0 and v86 then (Vector3.new(v86:ToEulerAnglesXYZ()) * 180) / 3.141592653589793 else nil;
    local v90 = l_LayoutOrderIterator_0.new();
    local l_MaxVolume_0 = v73.props.MaxVolume;
    local v92;
    if l_MaxVolume_0 then
        local _ = 1;
        v92 = (v79.X * v79.Y) * v79.Z <= l_MaxVolume_0;
    else
        v92 = true;
    end;
    local v94 = not v92;
    v92 = not l_SnapToVoxels_0 and 3 or 0;
    return v3.createElement(l_Pane_0, {
        AutomaticSize = Enum.AutomaticSize.Y, 
        Layout = Enum.FillDirection.Vertical, 
        LayoutOrder = l_LayoutOrder_0, 
        Size = UDim2.fromScale(1, 0), 
        Spacing = 12
    }, {
        PositionInput = if not v88 then nil else v3.createElement(v10, {
            LayoutOrder = v90:getNextOrder(), 
            Text = l_Localization_0:getText("RegionSettings", "Position"), 
            Key = "Position", 
            Vector = v88, 
            Precisions = {
                X = v92, 
                Y = v92, 
                Z = v92
            }, 
            OnFocusLost = v73.onVectorFocusLost, 
            OnValueChanged = v73.onVectorValueChanged
        }), 
        SizeInput = if not v79 then nil else v3.createElement(v10, {
            LayoutOrder = v90:getNextOrder(), 
            Text = l_Localization_0:getText("RegionSettings", "Size"), 
            Key = "Size", 
            Vector = v79, 
            MinValues = {
                X = v12.REGION_MIN_SIZE, 
                Y = v12.REGION_MIN_SIZE, 
                Z = v12.REGION_MIN_SIZE
            }, 
            MaxValues = {
                X = v12.REGION_MAX_SIZE, 
                Y = v12.REGION_MAX_SIZE, 
                Z = v12.REGION_MAX_SIZE
            }, 
            Precisions = {
                X = v92, 
                Y = v92, 
                Z = v92
            }, 
            OnFocusLost = v73.onVectorFocusLost, 
            OnValueChanged = v73.onVectorValueChanged, 
            ErrorMessage = v94 and l_Localization_0:getText("Warning", "VolumeTooLarge")
        }), 
        Rotation = if not v89 then nil else v3.createElement(v10, {
            LayoutOrder = v90:getNextOrder(), 
            Text = l_Localization_0:getText("RegionSettings", "Rotation"), 
            Key = "Rotation", 
            Vector = v89, 
            Precisions = {
                X = 0, 
                Y = 0, 
                Z = 0
            }, 
            OnFocusLost = v73.onVectorFocusLost, 
            OnValueChanged = v73.onVectorValueChanged
        }), 
        SnapToVoxels = if not l_SetSnapToVoxels_0 then nil else v3.createElement(v9, {
            LayoutOrder = v90:getNextOrder(), 
            Text = l_Localization_0:getText("RegionSettings", "SnapToVoxels"), 
            IsOn = l_SnapToVoxels_0, 
            SetIsOn = l_SetSnapToVoxels_0
        }), 
        Dragger = if not not v86 and v79 then v3.createElement(v11, {
            TargetCFrame = v86, 
            TargetSize = v79, 
            Region = l_Region_0, 
            SetRegion = function(v95, v96)
                if v96 then
                    l_props_4.SetRegion(v95.transform, v95.size);
                end;
                v73.setRegion(v95);
            end, 
            ShowRotation = l_ShowRotation_0, 
            SnapToVoxels = not l_SetSnapToVoxels_0 and true or l_SnapToVoxels_0, 
            SourceCFrame = l_SourceTransform_0 or v86, 
            SourceSize = l_SourceSize_0 or v79, 
            ShowTooltip = l_ShowTooltip_0, 
            Tool = l_ToolName_0, 
            Wireframe = v87
        }) else nil
    });
end;
return (l_withContext_0({
    Localization = l_ContextServices_0.Localization
})(v30));
