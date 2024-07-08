local l_Parent_0 = script.Parent.Parent.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Framework);
local v2 = require(l_Parent_0.Packages.Cryo);
local v3 = require(l_Parent_0.Packages.Roact);
local l_ContextServices_0 = v1.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local v6 = require(script.Parent.LabeledTextInput);
local function _(v7, v8)
    local v9 = 10 ^ (v8 or 3);
    return math.floor(v7 * v9 + 0.5) / v9;
end;
local v11 = v3.PureComponent:extend("NumberTextInput");
v11.defaultProps = {
    MaxGraphemes = 12
};
v11.init = function(v12, _)
    v12.isValid = true;
    v12.handlePrecision = function(v14)
        if not v12.props.Precision or not tonumber(v14) then
            return v14;
        else
            local v15 = tonumber(v14);
            local v16 = 10 ^ (v12.props.Precision or 3);
            return math.floor(v15 * v16 + 0.5) / v16;
        end;
    end;
    v12.onFocusLost = function(v17, v18)
        if utf8.len(v18) == 0 then
            v18 = v12.props.Value;
        end;
        local v19 = v12.handlePrecision(v18);
        if v12.props.OnFocusLost then
            v12.props.OnFocusLost(v12.props.Key, v17, v19, v12.isValid);
        end;
        return v19;
    end;
    v12.getLocalization = function()
        return v12.props.Localization;
    end;
    v12.isTextValid = function(v20)
        if utf8.len(v20) == 0 then
            return true, nil;
        else
            local v21 = tonumber(v20);
            local v22 = nil;
            local v23 = nil;
            if not v21 then
                v22 = false;
                v23 = v12.getLocalization():getText("Warning", "InvalidNumber");
            elseif v12.props.Min and v21 < v12.props.Min then
                v22 = false;
                v23 = v12.getLocalization():getText("Warning", "MinimumSize", {
                    v12.props.Min
                });
            elseif v12.props.Max and v12.props.Max < v21 then
                v22 = false;
                v23 = v12.getLocalization():getText("Warning", "MaximumSize", {
                    v12.props.Max
                });
            else
                v22 = true;
            end;
            if not v22 then
                return false, v23;
            else
                return true, nil;
            end;
        end;
    end;
    v12.validateText = function(v24)
        local v25, v26 = v12.isTextValid(v24);
        v12.isValid = v25;
        if v12.props.OnValueChanged then
            if utf8.len(v24) == 0 then
                v12.props.OnValueChanged(v12.props.Key, v12.props.Value, v12.isValid);
            else
                v12.props.OnValueChanged(v12.props.Key, v24, v12.isValid);
            end;
        end;
        if not v12.isValid then
            return v24, v26;
        else
            return v24, nil;
        end;
    end;
    v12.isValid = v12.isTextValid(v12.props.Value);
end;
v11.render = function(v27)
    return v3.createElement(v6, (v2.Dictionary.join(v27.props, {
        Value = v2.None, 
        Text = v27.handlePrecision(v27.props.Value), 
        OnFocusLost = v27.onFocusLost, 
        ValidateText = v27.validateText, 
        Key = v2.None, 
        Min = v2.None, 
        Max = v2.None, 
        Precision = v2.None, 
        OnValueChanged = v2.None
    })));
end;
return (l_withContext_0({
    Localization = l_ContextServices_0.Localization
})(v11));
