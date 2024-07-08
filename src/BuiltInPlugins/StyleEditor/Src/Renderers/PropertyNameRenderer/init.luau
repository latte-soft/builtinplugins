local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.React);
local l_useState_0 = v1.useState;
local l_useEffect_0 = v1.useEffect;
local v4 = require(l_Parent_0.Packages.Framework);
local l_Tooltip_0 = v4.UI.Tooltip;
local l_Pane_0 = v4.UI.Pane;
local l_TextInput_0 = v4.UI.TextInput;
local v8 = require(l_Parent_0.Packages.Dash);
local l_filter_0 = v8.filter;
local l_keys_0 = v8.keys;
local v11 = require(script.localizePropertyNameError);
local _ = require(l_Parent_0.Src.Renderers.RendererTypes);
local v13 = require(l_Parent_0.Src.Util.getAutocompleteItems);
local v14 = require(l_Parent_0.Src.Enums.PropertyNameValidationError);
local v15 = require(l_Parent_0.Src.Util.StyleSchema);
local v16 = require(l_Parent_0.Src.Hooks.useFrameworkContext);
local l_Attribute_0 = require(l_Parent_0.Src.Resources.PluginStyles):GetAttribute("TooltipMaxWidth");
local _ = require(l_Parent_0.Src.Types);
local _ = function(v19, v20)
    for _, v22 in v19, nil, nil do
        if v15.allProperties[v22][v20] ~= nil then
            return true;
        end;
    end;
    return false;
end;
return function(v24)
    local l_StyleRuleInfo_0 = v24.Schema.StyleRuleInfo;
    local l_Localization_0 = v16().Localization;
    if l_StyleRuleInfo_0 then
        assert(l_StyleRuleInfo_0 ~= nil, "expecting valid StyleRuleInfo");
        local v27, v28 = l_useState_0({
            text = v24.Value, 
            error = v14.None
        });
        local _ = function(v29)
            if not l_StyleRuleInfo_0.CanMatchAnyClass then
                local v30;
                for _, v32 in l_StyleRuleInfo_0.PossibleClasses, nil, nil do
                    if v15.allProperties[v32][v29] ~= nil then
                        v30 = true;
                        goto label0 --[[  true, false  ]];
                    end;
                end;
                v30 = false;
                ::label0::;
                if not v30 then
                    return v14.DoesNotExistOnType;
                end;
            elseif v15.possiblePropertyTypes[v29] == nil then
                return v14.DoesNotExist;
            end;
            local v33 = v24.Value ~= v29;
            local v34 = false;
            if l_StyleRuleInfo_0.Properties[v29] ~= nil then
                v34 = v33;
            end;
            if not v34 then
                return v14.None;
            else
                return v14.AlreadyDefined;
            end;
        end;
        local _ = function(v36)
            local v37, v38, v39;
            if not l_StyleRuleInfo_0.CanMatchAnyClass then
                for _, v41 in l_StyleRuleInfo_0.PossibleClasses, nil, nil do
                    if v15.allProperties[v41][v36] ~= nil then
                        v37 = true;
                        goto label2 --[[  true, false  ]];
                    end;
                end;
                v37 = false;
                ::label2::;
                if not v37 then
                    v39 = v14.DoesNotExistOnType;
                    goto label1 --[[  true, true  ]];
                end;
            elseif v15.possiblePropertyTypes[v36] == nil then
                v39 = v14.DoesNotExist;
                goto label1 --[[  true, true  ]];
            end;
            v37 = v24.Value ~= v36;
            v38 = false;
            if l_StyleRuleInfo_0.Properties[v36] ~= nil then
                v38 = v37;
            end;
            v39 = if not v38 then v14.None else v14.AlreadyDefined;
            ::label1::;
            v28({
                text = v36, 
                error = v39
            });
        end;
        local function v49(v43)
            local v44, v45, v46;
            if not l_StyleRuleInfo_0.CanMatchAnyClass then
                for _, v48 in l_StyleRuleInfo_0.PossibleClasses, nil, nil do
                    if v15.allProperties[v48][v43] ~= nil then
                        v44 = true;
                        goto label4 --[[  true, false  ]];
                    end;
                end;
                v44 = false;
                ::label4::;
                if not v44 then
                    v46 = v14.DoesNotExistOnType;
                    goto label3 --[[  true, true  ]];
                end;
            elseif v15.possiblePropertyTypes[v43] == nil then
                v46 = v14.DoesNotExist;
                goto label3 --[[  true, true  ]];
            end;
            v44 = v24.Value ~= v43;
            v45 = false;
            if l_StyleRuleInfo_0.Properties[v43] ~= nil then
                v45 = v44;
            end;
            v46 = if not v45 then v14.None else v14.AlreadyDefined;
            ::label3::;
            v28({
                text = v43, 
                error = v46
            });
        end;
        local function v61(v50, _)
            local v52, v53, v54;
            if not l_StyleRuleInfo_0.CanMatchAnyClass then
                for _, v56 in l_StyleRuleInfo_0.PossibleClasses, nil, nil do
                    if v15.allProperties[v56][v50] ~= nil then
                        v52 = true;
                        goto label6 --[[  true, false  ]];
                    end;
                end;
                v52 = false;
                ::label6::;
                if not v52 then
                    v54 = v14.DoesNotExistOnType;
                    goto label5 --[[  true, true  ]];
                end;
            elseif v15.possiblePropertyTypes[v50] == nil then
                v54 = v14.DoesNotExist;
                goto label5 --[[  true, true  ]];
            end;
            v52 = v24.Value ~= v50;
            v53 = false;
            if l_StyleRuleInfo_0.Properties[v50] ~= nil then
                v53 = v52;
            end;
            v54 = if not v53 then v14.None else v14.AlreadyDefined;
            ::label5::;
            if v54 == v14.None and v24.Value ~= v50 then
                v24.OnChanged(v50);
                return ;
            else
                v52 = v24.Value;
                local v57, v58;
                if not l_StyleRuleInfo_0.CanMatchAnyClass then
                    for _, v60 in l_StyleRuleInfo_0.PossibleClasses, nil, nil do
                        if v15.allProperties[v60][v52] ~= nil then
                            v57 = true;
                            goto label8 --[[  true, false  ]];
                        end;
                    end;
                    v57 = false;
                    ::label8::;
                    if not v57 then
                        v53 = v14.DoesNotExistOnType;
                        goto label7 --[[  true, true  ]];
                    end;
                elseif v15.possiblePropertyTypes[v52] == nil then
                    v53 = v14.DoesNotExist;
                    goto label7 --[[  true, true  ]];
                end;
                v57 = v24.Value ~= v52;
                v58 = false;
                if l_StyleRuleInfo_0.Properties[v52] ~= nil then
                    v58 = v57;
                end;
                v53 = if not v58 then v14.None else v14.AlreadyDefined;
                ::label7::;
                v28({
                    text = v52, 
                    error = v53
                });
                return ;
            end;
        end;
        l_useEffect_0(function()
            local l_Value_0 = v24.Value;
            local v63, v64, v65;
            if not l_StyleRuleInfo_0.CanMatchAnyClass then
                for _, v67 in l_StyleRuleInfo_0.PossibleClasses, nil, nil do
                    if v15.allProperties[v67][l_Value_0] ~= nil then
                        v63 = true;
                        goto label10 --[[  true, false  ]];
                    end;
                end;
                v63 = false;
                ::label10::;
                if not v63 then
                    v65 = v14.DoesNotExistOnType;
                    goto label9 --[[  true, true  ]];
                end;
            elseif v15.possiblePropertyTypes[l_Value_0] == nil then
                v65 = v14.DoesNotExist;
                goto label9 --[[  true, true  ]];
            end;
            v63 = v24.Value ~= l_Value_0;
            v64 = false;
            if l_StyleRuleInfo_0.Properties[l_Value_0] ~= nil then
                v64 = v63;
            end;
            v65 = if not v64 then v14.None else v14.AlreadyDefined;
            ::label9::;
            v28({
                text = l_Value_0, 
                error = v65
            });
        end, {
            v24.Schema, 
            v24.Value
        });
        local function v78(v68)
            local v69 = {};
            if not l_StyleRuleInfo_0.CanMatchAnyClass then
                local v70 = {};
                for _, v72 in l_StyleRuleInfo_0.PossibleClasses, nil, nil do
                    for _, v74 in v15.getPropertyNames(v72) do
                        v70[v74] = true;
                    end;
                end;
                v69 = l_keys_0(v70);
            else
                v69 = v15.getPropertyNames("");
            end;
            return v13(l_filter_0(v69, function(v75, _)
                local v77 = true;
                if v75 ~= v24.Value then
                    v77 = l_StyleRuleInfo_0.Properties[v75] == nil;
                end;
                return v77;
            end), v68);
        end;
        local v79 = v15.getPossiblePropertyTypes(v27.text);
        local v80 = {};
        if #v79 > 0 then
            table.insert(v80, table.concat(v79, ", "));
        end;
        if not l_StyleRuleInfo_0.CanMatchAnyClass then
            table.insert(v80, l_Localization_0:getText("Label", "PropertyAppliesTo", {
                classList = table.concat(l_filter_0(l_StyleRuleInfo_0.PossibleClasses, function(v81)
                    return v15.getPropertySchema(v24.Value, v81) ~= nil;
                end), ", ")
            }));
        end;
        local v82 = v27.error ~= v14.None;
        local v83 = v11(l_Localization_0, v27.error, {
            type = table.concat(l_StyleRuleInfo_0.PossibleClasses, ", ")
        });
        local l_createElement_0 = v1.createElement;
        local l_l_Pane_0_0 = l_Pane_0;
        local v86 = {};
        local v87 = {
            Input = v1.createElement(l_TextInput_0, {
                Disabled = v24.Disabled, 
                OnTextChanged = v49, 
                OnFocusLost = v61, 
                Size = if not v24.AutomaticSize then UDim2.fromScale(1, 1) else UDim2.new(1, 0, 0, v24.MinimumHeight or 24), 
                Text = v27.text, 
                GetAutocompleteItems = v78, 
                PlaceholderText = l_Localization_0:getText("Table", "PropertyNamePlaceholder"), 
                [v1.Tag] = if not v82 then nil else v24.Schema.ErrorStyle or "PropertyCellError"
            })
        };
        local v88 = false;
        if #v27.text > 0 then
            v88 = v1.createElement(l_Tooltip_0, {
                Text = if not v82 then table.concat(v80, "\n") else v83, 
                MaxWidth = l_Attribute_0
            });
        end;
        v87.Tooltip = v88;
        return l_createElement_0(l_l_Pane_0_0, v86, v87);
    else
        return v1.createElement(l_Pane_0, {}, {
            Input = v1.createElement(l_TextInput_0, {
                Disabled = true, 
                Size = if not v24.AutomaticSize then UDim2.fromScale(1, 1) else UDim2.new(1, 0, 0, v24.MinimumHeight or 24), 
                Text = v24.Value, 
                PlaceholderText = l_Localization_0:getText("Table", "PropertyNamePlaceholder"), 
                [v1.Tag] = "PropertyCellDisabled"
            })
        });
    end;
end;
