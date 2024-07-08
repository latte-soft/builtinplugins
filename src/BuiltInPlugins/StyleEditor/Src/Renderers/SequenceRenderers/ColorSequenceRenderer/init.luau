local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.React);
local l_useState_0 = v1.useState;
local l_useRef_0 = v1.useRef;
local l_useEffect_0 = v1.useEffect;
local l_useMemo_0 = v1.useMemo;
local v6 = require(l_Parent_0.Packages.Framework);
local l_Pane_0 = v6.UI.Pane;
local l_TextInput_0 = v6.UI.TextInput;
local l_Tooltip_0 = v6.UI.Tooltip;
local v10 = require(l_Parent_0.Packages.Dash);
local l_join_0 = v10.join;
local l_map_0 = v10.map;
local v13 = require(l_Parent_0.Src.Util.bind);
local v14 = require(l_Parent_0.Src.Util.colorFromString);
local v15 = require(l_Parent_0.Src.Renderers.SequenceRenderers.Keypoint);
local v16 = require(l_Parent_0.Src.Renderers.Modal);
local v17 = require(l_Parent_0.Src.Renderers.SequenceRenderers.mouseCoordsRelativeToElement);
local v18 = require(l_Parent_0.Src.Renderers.SequenceRenderers.PreviewButton);
local v19 = require(l_Parent_0.Src.Renderers.SequenceRenderers.useKeypointSequence);
local v20 = require(script.KeypointControls);
local v21 = require(script.KeypointLine);
local _ = require(l_Parent_0.Src.Types);
local _ = require(l_Parent_0.Src.Renderers.SequenceRenderers.Types);
local _ = require(l_Parent_0.Src.Renderers.RendererTypes);
local function _(v25)
    local l_Keypoints_0 = v25.Keypoints;
    if #l_Keypoints_0 > 2 then
        return "<ColorSequence>";
    elseif l_Keypoints_0[1].Value ~= l_Keypoints_0[2].Value then
        return "<ColorSequence>";
    else
        return "#" .. l_Keypoints_0[1].Value:ToHex();
    end;
end;
local function _(v28)
    local v29 = v14(v28);
    if not v29 then
        return nil, "Error: invalid color";
    else
        return ColorSequence.new(v29), nil;
    end;
end;
local function _(v31)
    return (l_map_0(v31.Keypoints, function(v32)
        return {
            Time = v32.Time, 
            Value = v32.Value
        };
    end));
end;
local function v36(v34)
    return ColorSequence.new(l_map_0(v34, function(v35)
        return ColorSequenceKeypoint.new(v35.Time, v35.Value);
    end));
end;
return function(v37)
    local v38 = l_useRef_0(nil);
    local v39 = l_useRef_0(nil);
    local v40, v41 = l_useState_0(false);
    local l_l_useState_0_0 = l_useState_0;
    local l_Keypoints_1 = v37.Value.Keypoints;
    local v44;
    l_l_useState_0_0, v44 = l_l_useState_0_0(#l_Keypoints_1 > 2 and "<ColorSequence>" or (l_Keypoints_1[1].Value ~= l_Keypoints_1[2].Value and "<ColorSequence>" or "#" .. l_Keypoints_1[1].Value:ToHex()));
    local v45;
    v45, l_Keypoints_1 = l_useState_0(nil);
    local v47 = v19((l_map_0(v37.Value.Keypoints, function(v46)
        return {
            Time = v46.Time, 
            Value = v46.Value
        };
    end)));
    local v48 = l_useMemo_0(function()
        return v36(v47.keypoints);
    end, {
        v47.keypoints
    });
    l_useEffect_0(function()
        l_Keypoints_1(nil);
        local l_v44_0 = v44;
        local l_Keypoints_2 = v37.Value.Keypoints;
        l_v44_0(#l_Keypoints_2 > 2 and "<ColorSequence>" or (l_Keypoints_2[1].Value ~= l_Keypoints_2[2].Value and "<ColorSequence>" or "#" .. l_Keypoints_2[1].Value:ToHex()));
    end, {
        v37.Value, 
        l_Keypoints_1, 
        v44
    });
    local function _()
        v47.save(function(v51)
            local v53 = ColorSequence.new(l_map_0(v51, function(v52)
                return ColorSequenceKeypoint.new(v52.Time, v52.Value);
            end));
            if v53 ~= v37.Value then
                v37.OnChanged(v53);
            end;
        end);
    end;
    local function v56()
        v47.reset((l_map_0(v37.Value.Keypoints, function(v55)
            return {
                Time = v55.Time, 
                Value = v55.Value
            };
        end)));
        v41(true);
    end;
    local function v60()
        v47.save(function(v57)
            local v59 = ColorSequence.new(l_map_0(v57, function(v58)
                return ColorSequenceKeypoint.new(v58.Time, v58.Value);
            end));
            if v59 ~= v37.Value then
                v37.OnChanged(v59);
            end;
        end);
        v41(false);
    end;
    local function v64()
        v47.remove();
        v47.save(function(v61)
            local v63 = ColorSequence.new(l_map_0(v61, function(v62)
                return ColorSequenceKeypoint.new(v62.Time, v62.Value);
            end));
            if v63 ~= v37.Value then
                v37.OnChanged(v63);
            end;
        end);
    end;
    local function v69(v65)
        v47.update(v65);
        v47.save(function(v66)
            local v68 = ColorSequence.new(l_map_0(v66, function(v67)
                return ColorSequenceKeypoint.new(v67.Time, v67.Value);
            end));
            if v68 ~= v37.Value then
                v37.OnChanged(v68);
            end;
        end);
    end;
    local function v77(v70, _)
        if v70 == "<ColorSequence>" then
            return ;
        else
            local v72 = v14(v70);
            local v73;
            if not v72 then
                v73 = nil;
                local _ = "Error: invalid color";
            else
                v73 = ColorSequence.new(v72);
                local _ = nil;
            end;
            if v73 and v73 ~= v37.Value then
                v37.OnChanged(v73);
                return ;
            else
                v72 = v44;
                local l_Keypoints_3 = v37.Value.Keypoints;
                v72(#l_Keypoints_3 > 2 and "<ColorSequence>" or (l_Keypoints_3[1].Value ~= l_Keypoints_3[2].Value and "<ColorSequence>" or "#" .. l_Keypoints_3[1].Value:ToHex()));
                return ;
            end;
        end;
    end;
    local function v83(v78)
        v44(v78);
        if v78 == "<ColorSequence>" then
            l_Keypoints_1(nil);
            return ;
        else
            local v79 = v14(v78);
            local v80;
            if not v79 then
                local _ = nil;
                v80 = "Error: invalid color";
            else
                local _ = ColorSequence.new(v79);
                v80 = nil;
            end;
            l_Keypoints_1(v80);
            return ;
        end;
    end;
    local function v88(v84)
        if v39.current then
            if not v47.isFixedKeypointSelected() then
                v47.update((l_join_0(v47.getSelectedKeypoint(), {
                    Time = v17(v39.current, v84).X
                })));
                v47.save(function(v85)
                    local v87 = ColorSequence.new(l_map_0(v85, function(v86)
                        return ColorSequenceKeypoint.new(v86.Time, v86.Value);
                    end));
                    if v87 ~= v37.Value then
                        v37.OnChanged(v87);
                    end;
                end);
                return ;
            else
                return ;
            end;
        else
            return ;
        end;
    end;
    local function v94(_, v90)
        if v90.UserInputType == Enum.UserInputType.MouseButton1 then
            v47.add({
                Time = v17(v39.current, (Vector2.new(v90.Position.X, v90.Position.Y))).X, 
                Value = v47.getSelectedKeypoint().Value
            });
            v47.save(function(v91)
                local v93 = ColorSequence.new(l_map_0(v91, function(v92)
                    return ColorSequenceKeypoint.new(v92.Time, v92.Value);
                end));
                if v93 ~= v37.Value then
                    v37.OnChanged(v93);
                end;
            end);
        end;
    end;
    local function v96(v95)
        v47.select(v95);
    end;
    local v97 = {};
    local v98 = {};
    for v99, v100 in v47.keypoints, nil, nil do
        local v101 = "Keypoint_" .. tostring(v99);
        local v102 = v47.selectedIndex == v99;
        v98[v101] = v1.createElement(v21, {
            Position = UDim2.fromScale(v100.Time, 0), 
            Selected = v102, 
            OnHoverStart = v13(v96, {
                v99
            })
        });
        v97[v101] = v1.createElement(v15, {
            Position = Vector2.new(v100.Time, 0), 
            Value = v100.Value, 
            Selected = v102, 
            Tag = "ColorSequenceKeypoint", 
            OnMoved = v88, 
            OnHoverStart = v13(v96, {
                v99
            }), 
            OnDragEnd = function()
                v47.save(function(v103)
                    local v105 = ColorSequence.new(l_map_0(v103, function(v104)
                        return ColorSequenceKeypoint.new(v104.Time, v104.Value);
                    end));
                    if v105 ~= v37.Value then
                        v37.OnChanged(v105);
                    end;
                end);
            end
        });
    end;
    local v106 = v45 ~= nil;
    return v1.createElement(l_Pane_0, {
        [v1.Tag] = "X-Fill"
    }, {
        Input = v1.createElement(l_TextInput_0, {
            Disabled = v37.Disabled, 
            LeadingComponent = v18, 
            LeadingComponentProps = {
                Color = v37.Value, 
                OnClick = v56, 
                ForwardRef = v38
            }, 
            OnFocusLost = v77, 
            OnTextChanged = v83, 
            Size = if not v37.AutomaticSize then UDim2.fromScale(1, 1) else UDim2.new(1, 0, 0, v37.MinimumHeight or 24), 
            Text = l_l_useState_0_0, 
            [v1.Tag] = if not v106 then nil else "PropertyCellError"
        }), 
        Tooltip = v1.createElement(l_Tooltip_0, {
            Enabled = v106, 
            Text = v45 or ""
        }), 
        SequencePickerModal = v1.createElement(v16, {
            Open = v40, 
            MaxSize = Vector2.new(800, 225), 
            MinSize = Vector2.new(400, 200), 
            ObjectRef = v38, 
            OnFocusLost = v60
        }, {
            SequenceTimelinePane = v1.createElement(l_Pane_0, {
                LayoutOrder = 1, 
                Size = UDim2.new(1, 0, 0, 150), 
                [v1.Tag] = "X-Pad X-Column", 
                OnClick = v94
            }, {
                SequenceTimelineContainer = v1.createElement(l_Pane_0, {
                    LayoutOrder = 1, 
                    BackgroundTransparency = 0, 
                    BackgroundColor3 = Color3.new(1, 1, 1), 
                    ForwardRef = v39, 
                    [v1.Tag] = "X-Fill"
                }, {
                    l_join_0(v98, {
                        UIGradient = v1.createElement("UIGradient", {
                            Color = v48
                        })
                    })
                }), 
                KeypointContainer = v1.createElement(l_Pane_0, {
                    LayoutOrder = 2, 
                    [v1.Tag] = "X-FitY"
                }, v97)
            }), 
            KeypointControls = v1.createElement(v20, {
                LayoutOrder = 2, 
                Keypoint = v47.getSelectedKeypoint(), 
                IsKeypointFixed = v47.isFixedKeypointSelected(), 
                OnSave = v60, 
                OnDelete = v64, 
                OnEdit = v69
            })
        })
    });
end;
