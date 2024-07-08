local l_Parent_0 = script.Parent.Parent.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Framework);
local v2 = require(l_Parent_0.Packages.Cryo);
local v3 = require(l_Parent_0.Packages.Roact);
local l_ContextServices_0 = v1.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local v6 = require(script.Parent.VectorTextInput);
local v7 = require(l_Parent_0.Src.Util.Constants);
local _ = function(v8, v9)
    if v9 then
        local v10 = 1;
        for _, v12 in pairs(v8) do
            local v13 = tonumber(v12);
            if v13 then
                v10 = v10 * v13;
            end;
        end;
        return v10 <= v9;
    else
        return true;
    end;
end;
local function v28(_, v16, v17, v18)
    for _, v20 in pairs(v18) do
        for _, v22 in pairs(v20) do
            if not v22 then
                return false;
            end;
        end;
    end;
    local v23;
    if v17 then
        local v24 = 1;
        for _, v26 in pairs(v16) do
            local v27 = tonumber(v26);
            if v27 then
                v24 = v24 * v27;
            end;
        end;
        v23 = v24 <= v17;
    else
        v23 = true;
    end;
    if v23 then
        return true;
    else
        return false;
    end;
end;
local v29 = v3.PureComponent:extend(script.Name);
v29.init = function(v30, _)
    v30.validFieldState = {
        Position = {
            X = true, 
            Y = true, 
            Z = true
        }, 
        Size = {
            X = true, 
            Y = true, 
            Z = true
        }
    };
    local function v38(v32, v33, v34)
        local l_Position_0 = v30.props.Position;
        local l_Size_0 = v30.props.Size;
        if v32 == "Position" then
            l_Position_0 = v2.Dictionary.join(l_Position_0, {
                [v33] = v34
            });
        elseif v32 == "Size" then
            l_Size_0 = v2.Dictionary.join(l_Size_0, {
                [v33] = v34
            });
        end;
        local v37 = v28(l_Position_0, l_Size_0, v30.props.MaxVolume, v30.validFieldState);
        if v30.props.SetMapSettingsValid then
            v30.props.SetMapSettingsValid(v37);
        end;
        return v37;
    end;
    local function v43(v39, v40, v41, v42)
        if v39 == "Position" then
            if v30.props.OnPositionChanged then
                v30.props.OnPositionChanged(v39, v40, v41, v42);
                return ;
            end;
        elseif v39 == "Size" then
            if v30.props.OnSizeChanged then
                v30.props.OnSizeChanged(v39, v40, v41, v42);
                return ;
            end;
        else
            warn("MapSettings dispatchVectorChanged unknown vector", v39);
        end;
    end;
    v30.onVectorFocusLost = function(v44, v45, _, v47, v48)
        if not (not (utf8.len(v47) > 0) or not v38(v44, v45, v47)) then
            v43(v44, v45, v47, v48);
        end;
    end;
    v30.onVectorValueChanged = function(v49, v50, v51, v52)
        v30.validFieldState[v49][v50] = v52;
        v38(v49, v50, v51);
        v43(v49, v50, v51, v52);
    end;
end;
v29.render = function(v53)
    local l_Localization_0 = v53.props.Localization;
    local l_Position_1 = v53.props.Position;
    local l_Size_1 = v53.props.Size;
    local v57 = v53.props.InitialLayoutOrder or 1;
    local v58 = l_Position_1 ~= nil;
    local v59 = l_Size_1 ~= nil;
    local v60 = v57 + (not v58 and 0 or 1);
    local l_MaxVolume_0 = v53.props.MaxVolume;
    local v62;
    if l_MaxVolume_0 then
        local v63 = 1;
        for _, v65 in pairs(l_Size_1) do
            local v66 = tonumber(v65);
            if v66 then
                v63 = v63 * v66;
            end;
        end;
        v62 = v63 <= l_MaxVolume_0;
    else
        v62 = true;
    end;
    return v3.createFragment({
        PositionInput = v58 and v3.createElement(v6, {
            LayoutOrder = v57, 
            Text = l_Localization_0:getText("MapSettings", "Position"), 
            Key = "Position", 
            Vector = l_Position_1, 
            Precisions = {
                X = 0, 
                Y = 0, 
                Z = 0
            }, 
            OnFocusLost = v53.onVectorFocusLost, 
            OnValueChanged = v53.onVectorValueChanged
        }), 
        SizeInput = v59 and v3.createElement(v6, {
            LayoutOrder = v60, 
            Text = l_Localization_0:getText("MapSettings", "Size"), 
            Key = "Size", 
            Vector = l_Size_1, 
            MinValues = {
                X = v7.REGION_MIN_SIZE, 
                Y = v7.REGION_MIN_SIZE, 
                Z = v7.REGION_MIN_SIZE
            }, 
            MaxValues = {
                X = v7.REGION_MAX_SIZE, 
                Y = v7.REGION_MAX_SIZE, 
                Z = v7.REGION_MAX_SIZE
            }, 
            Precisions = {
                X = 0, 
                Y = 0, 
                Z = 0
            }, 
            OnFocusLost = v53.onVectorFocusLost, 
            OnValueChanged = v53.onVectorValueChanged, 
            ErrorMessage = not v62 and l_Localization_0:getText("Warning", "VolumeTooLarge")
        })
    });
end;
return (l_withContext_0({
    Localization = l_ContextServices_0.Localization
})(v29));
