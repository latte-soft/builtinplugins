local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.React);
local l_useState_0 = v1.useState;
local l_useEffect_0 = v1.useEffect;
local l_useMemo_0 = v1.useMemo;
local l_useRef_0 = v1.useRef;
local l_useCallback_0 = v1.useCallback;
local v7 = require(l_Parent_0.Packages.Framework);
local l_Pane_0 = v7.UI.Pane;
local l_TextInput_0 = v7.UI.TextInput;
local l_collectArray_0 = require(l_Parent_0.Packages.Dash).collectArray;
local v11 = require(script.TokenAutocompleteItem);
local v12 = require(script.TokenTooltip);
local _ = require(script.Types);
local v14 = require(l_Parent_0.Src.Util.escapeStringPattern);
local v15 = require(l_Parent_0.Src.Util.TokenHelpers);
local v16 = require(l_Parent_0.Src.Enums.TokenValidationError);
local _ = require(l_Parent_0.Src.Types);
local _ = require(l_Parent_0.Src.Renderers.RendererTypes);
return function(v19)
    local v20, v21 = l_useState_0(v19.Value);
    local v22 = l_useRef_0(nil);
    local v23 = l_useMemo_0(function()
        return v15.getAllAttributes(v19.Schema.Instance);
    end, {
        v19.Schema.Instance
    });
    local v24 = l_useMemo_0(function()
        return v15.getDerivedAttributes(v19.Schema.Instance);
    end, {
        v19.Schema.Instance
    });
    local v28 = l_useMemo_0(function()
        local v25, v26 = v15.validateToken(v23, v20, v19.Schema.ExpectedTypes);
        local v27 = nil;
        if v26 == v16.None then
            v27 = v15.getTokenSourceStyleSheet(v19.Schema.Instance, v20);
        end;
        return {
            Name = v20, 
            Value = v25, 
            Error = v26, 
            Source = v27, 
            ExpectedTypes = v19.Schema.ExpectedTypes
        };
    end, {
        v20, 
        v19.Schema.Instance, 
        v19.Schema.ExpectedTypes, 
        v23
    });
    local v30 = l_useCallback_0(function(v29)
        v21(v29);
    end, {
        v21
    });
    l_useEffect_0(function()
        v30(v19.Value);
    end, {
        v19.Value, 
        v30
    });
    return v1.createElement(l_Pane_0, {}, {
        Input = v1.createElement(l_TextInput_0, {
            GetAutocompleteItems = l_useCallback_0(function(v31)
                if v19.Schema.Instance then
                    local v32 = (v15.parseAttributeName(v31) or v31):lower();
                    local v33 = if not v19.Schema.HideSelfTokens then v23 else v24;
                    return l_collectArray_0(v15.stripStyleEditorMetaAttributes(v33), function(v34, _)
                        if v34:lower():find(v14(v32)) then
                            local v36 = "$" .. v34;
                            local v37, v38 = v15.validateToken(v33, v36, v19.Schema.ExpectedTypes);
                            if v38 ~= v16.None then
                                return nil;
                            else
                                return {
                                    Id = v36, 
                                    Value = v36, 
                                    TokenInfo = {
                                        Name = v36, 
                                        Value = v37, 
                                        Error = v38, 
                                        Source = v15.getTokenSourceStyleSheet(v19.Schema.Instance, v36), 
                                        ExpectedTypes = v19.Schema.ExpectedTypes
                                    }
                                };
                            end;
                        else
                            return nil;
                        end;
                    end);
                else
                    return {};
                end;
            end, {
                v19.Schema, 
                v19.Schema.ExpectedTypes
            }), 
            OnRenderAutocompleteItem = function(v39, v40, v41, _)
                return v1.createElement(v11, {
                    TokenInfo = v39.TokenInfo, 
                    OnActivated = v41, 
                    ErrorStyle = v19.Schema.ErrorStyle, 
                    LayoutOrder = v40
                });
            end, 
            Disabled = v19.Disabled, 
            OnTextChanged = v30, 
            OnFocusLost = function(v43, _)
                if v43 == v19.Value then
                    return ;
                else
                    v21(v43);
                    v19.OnChanged(v43);
                    return ;
                end;
            end, 
            Size = if not v19.AutomaticSize then UDim2.fromScale(1, 1) else UDim2.new(1, 0, 0, v19.MinimumHeight or 24), 
            Text = v20, 
            ForwardRef = v22, 
            [v1.Tag] = if not (v28.Error ~= v16.None) then nil else v19.Schema.ErrorStyle
        }), 
        Tooltip = v1.createElement(v12, {
            TokenInfo = v28, 
            ErrorStyle = v19.Schema.ErrorStyle
        })
    });
end;
