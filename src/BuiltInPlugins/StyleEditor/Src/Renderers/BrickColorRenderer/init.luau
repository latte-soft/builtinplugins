local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.React);
local l_useState_0 = v1.useState;
local l_useEffect_0 = v1.useEffect;
local l_useRef_0 = v1.useRef;
local v5 = require(l_Parent_0.Packages.Framework);
local l_IconButton_0 = v5.UI.IconButton;
local l_Pane_0 = v5.UI.Pane;
local l_TextInput_0 = v5.UI.TextInput;
local l_TextLabel_0 = v5.UI.TextLabel;
local v10 = require(l_Parent_0.Packages.Dash);
local l_map_0 = v10.map;
local l_filter_0 = v10.filter;
local v13 = require(script.getAllBrickColors);
local _ = require(l_Parent_0.Src.Renderers.RendererTypes);
local _ = require(l_Parent_0.Src.Types);
local v17 = l_map_0(v13(), function(v16)
    return {
        Value = v16.Name, 
        BrickColor = v16, 
        NameLower = v16.Name:lower()
    };
end);
local function v21(v18)
    local v19 = v18:lower();
    return l_filter_0(v17, function(v20)
        return v20.NameLower:match(v19);
    end);
end;
local function v25(v22)
    if typeof(v22) == "BrickColor" then
        return v22;
    elseif typeof(v22) == "Color3" then
        return BrickColor.new(v22);
    elseif typeof(v22) == "string" then
        local l_status_0, l_result_0 = pcall(function()
            return Color3.fromHex(v22);
        end);
        if not l_status_0 then
            return BrickColor.new(v22);
        else
            return BrickColor.new(l_result_0);
        end;
    else
        return nil;
    end;
end;
return function(v26)
    local v27 = l_useRef_0(nil);
    local v28, v29 = l_useState_0(nil);
    local function v30()
        if v27.current then
            v27.current:CaptureFocus();
        end;
    end;
    local function v32(v31)
        v29(v31);
    end;
    local function v33()
        v29(nil);
    end;
    local function v37(v34, _)
        if v28 ~= nil then
            local v36 = v25(v34);
            if v36 and v36 ~= v26.Value then
                v26.OnChanged(v36);
            end;
        end;
        v29(nil);
    end;
    l_useEffect_0(function()
        v29(nil);
    end, {
        v26.Schema, 
        v26.Value
    });
    local function v39(v38)
        return v21(v38);
    end;
    local v40 = nil;
    local v41 = nil;
    if not v28 then
        local v42 = v25(v26.Value) or v26.Schema.GetDefaultValue();
        v40 = v42.Color;
        v41 = v42.Name;
    else
        local v43 = v25(v28);
        v40 = not not v43 and v43.Color or nil;
        v41 = v28;
    end;
    return v1.createElement(l_Pane_0, {}, {
        Input = v1.createElement(l_TextInput_0, {
            Disabled = v26.Disabled, 
            LeadingComponent = l_IconButton_0, 
            LeadingComponentProps = {
                BackgroundColor = v40, 
                Cursor = "PointingHand", 
                OnClick = v30, 
                [v1.Tag] = "Icon16"
            }, 
            ForwardRef = v27, 
            OnTextChanged = v32, 
            OnFocused = v33, 
            OnFocusLost = v37, 
            Size = if not v26.AutomaticSize then UDim2.fromScale(1, 1) else UDim2.new(1, 0, 0, v26.MinimumHeight or 24), 
            Text = v41, 
            GetAutocompleteItems = v39, 
            OnRenderAutocompleteItem = function(v44, v45, v46, _)
                return v1.createElement(l_Pane_0, {
                    key = v44.NameLower, 
                    LayoutOrder = v45, 
                    OnPress = v46, 
                    [v1.Tag] = "X-Pad X-RowM X-Middle DropdownItem"
                }, {
                    Preview = v1.createElement(l_Pane_0, {
                        BackgroundColor3 = v44.BrickColor.Color, 
                        LayoutOrder = 1, 
                        [v1.Tag] = "X-Corner Icon16"
                    }, {}), 
                    Text = v1.createElement(l_TextLabel_0, {
                        LayoutOrder = 2, 
                        Text = v44.BrickColor.Name, 
                        [v1.Tag] = "TextXAlignLeft"
                    }, {})
                });
            end
        })
    });
end;
