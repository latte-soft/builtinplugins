local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.React);
local l_useState_0 = v1.useState;
local l_useRef_0 = v1.useRef;
local l_useEffect_0 = v1.useEffect;
local v5 = require(l_Parent_0.Packages.Framework);
local l_ColorPicker_0 = v5.UI.ColorPicker;
local l_IconButton_0 = v5.UI.IconButton;
local l_Pane_0 = v5.UI.Pane;
local l_TextInput_0 = v5.UI.TextInput;
local v10 = require(l_Parent_0.Src.Util.colorFromString);
local v11 = require(l_Parent_0.Src.Renderers.Modal);
local _ = require(l_Parent_0.Src.Types);
local _ = require(l_Parent_0.Src.Renderers.RendererTypes);
local l_Attribute_0 = require(l_Parent_0.Src.Resources.PluginStyles):GetAttribute("Icon16");
local function _(v15)
    local l_status_0, l_result_0 = pcall(function()
        return v15:ToHex();
    end);
    if not l_status_0 then
        return "#";
    else
        return "#" .. l_result_0;
    end;
end;
return function(v19)
    local v20, v21 = l_useState_0(false);
    local v22, v23 = l_useState_0(nil);
    local l_l_useState_0_0 = l_useState_0;
    local l_Value_0 = v19.Value;
    local l_l_Value_0_0 = l_Value_0 --[[ copy: 7 -> 11 ]];
    local l_status_1, l_result_1 = pcall(function()
        return l_l_Value_0_0:ToHex();
    end);
    local v29;
    l_l_useState_0_0, v29 = l_l_useState_0_0(not l_status_1 and "#" or "#" .. l_result_1);
    l_Value_0 = l_useRef_0(nil);
    l_status_1 = l_useRef_0(tick());
    l_useEffect_0(function()
        local l_v29_0 = v29;
        local l_Value_1 = v19.Value;
        local l_status_2, l_result_2 = pcall(function()
            return l_Value_1:ToHex();
        end);
        l_v29_0(not l_status_2 and "#" or "#" .. l_result_2);
    end, {
        v19.Value
    });
    l_result_1 = function()
        v21(true);
    end;
    local function _()
        v21(false);
    end;
    return v1.createElement(l_Pane_0, {}, {
        Input = v1.createElement(l_TextInput_0, {
            Disabled = v19.Disabled, 
            LeadingComponent = l_IconButton_0, 
            LeadingComponentProps = {
                BackgroundColor = v19.Value, 
                Size = l_Attribute_0, 
                OnClick = l_result_1, 
                ForwardRef = l_Value_0
            }, 
            OnFocusLost = function(v35, _)
                local v37 = v10(v35);
                if v37 and v37 ~= v19.Value then
                    v19.OnChanged(v37);
                    return ;
                else
                    local l_v29_1 = v29;
                    local l_Value_2 = v19.Value;
                    local l_status_3, l_result_3 = pcall(function()
                        return l_Value_2:ToHex();
                    end);
                    l_v29_1(not l_status_3 and "#" or "#" .. l_result_3);
                    return ;
                end;
            end, 
            OnTextChanged = function(v42)
                local v43 = v10(v42);
                v29(v42);
                if not v43 then
                    v23("Error: invalid color");
                    return ;
                else
                    v23(nil);
                    return ;
                end;
            end, 
            Size = if not v19.AutomaticSize then UDim2.fromScale(1, 1) else UDim2.new(1, 0, 0, v19.MinimumHeight or 24), 
            Text = l_l_useState_0_0, 
            [v1.Tag] = if not (v22 ~= nil) then nil else "PropertyCellError"
        }), 
        Modal = v1.createElement(v11, {
            Open = v20, 
            MaxSize = Vector2.new(325, 250), 
            MinSize = Vector2.new(325, 250), 
            ObjectRef = l_Value_0, 
            OnFocusLost = function()
                v21(false);
            end
        }, {
            Container = v1.createElement(l_Pane_0, {
                [v1.Tag] = "X-Fit"
            }, {
                ColorPicker = v1.createElement(l_ColorPicker_0, {
                    Size = UDim2.fromOffset(325, 225), 
                    Color = v19.Value, 
                    OnColorChanged = function(v44)
                        if v44 ~= v19.Value and (l_status_1.current or 0) + 0.05 < tick() then
                            l_status_1.current = tick();
                            v19.OnChanged(v44);
                        end;
                    end
                })
            })
        })
    });
end;
