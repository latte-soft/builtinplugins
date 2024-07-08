local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.React);
local l_useState_0 = v1.useState;
local l_useRef_0 = v1.useRef;
local l_useEffect_0 = v1.useEffect;
local v5 = require(l_Parent_0.Packages.Framework);
local l_Pane_0 = v5.UI.Pane;
local l_TextInput_0 = v5.UI.TextInput;
local l_Tooltip_0 = v5.UI.Tooltip;
local v9 = require(l_Parent_0.Packages.Dash);
local l_join_0 = v9.join;
local l_map_0 = v9.map;
local v12 = require(l_Parent_0.Src.Renderers.SequenceRenderers.PreviewButton);
local v13 = require(script.SequenceLine);
local v14 = require(script.KeypointControls);
local v15 = require(l_Parent_0.Src.Util.bind);
local v16 = require(l_Parent_0.Src.Renderers.SequenceRenderers.mouseCoordsRelativeToElement);
local v17 = require(l_Parent_0.Src.Renderers.SequenceRenderers.useKeypointSequence);
local v18 = require(l_Parent_0.Src.Renderers.SequenceRenderers.Keypoint);
local v19 = require(l_Parent_0.Src.Renderers.Modal);
local v20 = require(l_Parent_0.Src.Util.roundDecimal);
local _ = require(l_Parent_0.Src.Types);
local _ = require(l_Parent_0.Src.Renderers.RendererTypes);
local _ = require(l_Parent_0.Src.Renderers.SequenceRenderers.Types);
local v24 = ColorSequence.new(Color3.fromRGB(255, 255, 255));
local function _(v25)
    local l_Keypoints_0 = v25.Keypoints;
    if #l_Keypoints_0 > 2 then
        return "<NumberSequence>";
    elseif l_Keypoints_0[1].Value ~= l_Keypoints_0[2].Value then
        return "<NumberSequence>";
    else
        return (tostring(v20(l_Keypoints_0[1].Value, 3)));
    end;
end;
local function _(v28)
    return NumberSequence.new(l_map_0(v28, function(v29)
        return NumberSequenceKeypoint.new(v29.Time, v29.Value, v29.Envelope);
    end));
end;
local function _(v31)
    return (l_map_0(v31.Keypoints, function(v32)
        return {
            Time = v32.Time, 
            Value = v32.Value, 
            Envelope = v32.Envelope
        };
    end));
end;
local function v38(v34)
    local v35 = tonumber(v34);
    if v35 then
        assert(typeof(v35) == "number", "expecting a number");
        if not (v35 >= 0) or v35 > 1 then
            return nil, "Error: number out of range, expecting 0 < num < 1";
        else
            local l_status_0, l_result_0 = pcall(function()
                return NumberSequence.new(v35);
            end);
            if l_status_0 then
                return l_result_0;
            else
                return nil, "Error: something went wrong";
            end;
        end;
    else
        return nil, "Error: invalid number";
    end;
end;
return function(v39)
    local v40 = l_useRef_0(nil);
    local v41 = l_useRef_0(nil);
    local v42, v43 = l_useState_0(false);
    local l_l_useState_0_0 = l_useState_0;
    local l_Keypoints_1 = v39.Value.Keypoints;
    local v46;
    l_l_useState_0_0, v46 = l_l_useState_0_0(#l_Keypoints_1 > 2 and "<NumberSequence>" or (l_Keypoints_1[1].Value ~= l_Keypoints_1[2].Value and "<NumberSequence>" or tostring(v20(l_Keypoints_1[1].Value, 3))));
    local v47;
    v47, l_Keypoints_1 = l_useState_0(nil);
    local v48, v49 = l_useState_0(Vector2.one);
    local v51 = v17((l_map_0(v39.Value.Keypoints, function(v50)
        return {
            Time = v50.Time, 
            Value = v50.Value, 
            Envelope = v50.Envelope
        };
    end)));
    l_useEffect_0(function()
        if v39.Value then
            l_Keypoints_1(nil);
            local l_v46_0 = v46;
            local l_Keypoints_2 = v39.Value.Keypoints;
            l_v46_0(#l_Keypoints_2 > 2 and "<NumberSequence>" or (l_Keypoints_2[1].Value ~= l_Keypoints_2[2].Value and "<NumberSequence>" or tostring(v20(l_Keypoints_2[1].Value, 3))));
        end;
    end, {
        v39.Value, 
        l_Keypoints_1, 
        v46
    });
    local function _()
        v51.save(function(v54)
            local v56 = NumberSequence.new(l_map_0(v54, function(v55)
                return NumberSequenceKeypoint.new(v55.Time, v55.Value, v55.Envelope);
            end));
            if v56 ~= v39.Value then
                v39.OnChanged(v56);
            end;
        end);
    end;
    local function v58()
        v43(true);
    end;
    local function v62()
        v51.save(function(v59)
            local v61 = NumberSequence.new(l_map_0(v59, function(v60)
                return NumberSequenceKeypoint.new(v60.Time, v60.Value, v60.Envelope);
            end));
            if v61 ~= v39.Value then
                v39.OnChanged(v61);
            end;
        end);
        v43(false);
    end;
    local function v66()
        v51.remove();
        v51.save(function(v63)
            local v65 = NumberSequence.new(l_map_0(v63, function(v64)
                return NumberSequenceKeypoint.new(v64.Time, v64.Value, v64.Envelope);
            end));
            if v65 ~= v39.Value then
                v39.OnChanged(v65);
            end;
        end);
    end;
    local function v71(v67)
        v51.update(v67);
        v51.save(function(v68)
            local v70 = NumberSequence.new(l_map_0(v68, function(v69)
                return NumberSequenceKeypoint.new(v69.Time, v69.Value, v69.Envelope);
            end));
            if v70 ~= v39.Value then
                v39.OnChanged(v70);
            end;
        end);
    end;
    local function v73(v72)
        v51.select(v72);
    end;
    local function v77(v74)
        if v40.current then
            if not v51.isFixedKeypointSelected() then
                local v75 = v51.getSelectedKeypoint();
                local v76 = v16(v40.current, v74);
                v51.update((l_join_0(v75, {
                    Time = v76.X, 
                    Value = 1 - v76.Y
                })));
                return ;
            else
                return ;
            end;
        else
            return ;
        end;
    end;
    local function v84(_, v79)
        if v79.UserInputType == Enum.UserInputType.MouseButton1 then
            local v80 = v16(v40.current, (Vector2.new(v79.Position.X, v79.Position.Y)));
            v51.add({
                Time = v80.X, 
                Value = 1 - v80.Y, 
                Envelope = 0
            });
            v51.save(function(v81)
                local v83 = NumberSequence.new(l_map_0(v81, function(v82)
                    return NumberSequenceKeypoint.new(v82.Time, v82.Value, v82.Envelope);
                end));
                if v83 ~= v39.Value then
                    v39.OnChanged(v83);
                end;
            end);
        end;
    end;
    local function v91(v85, _)
        if v85 == "<NumberSequence>" then
            return ;
        else
            local v87, _ = v38(v85);
            if v87 and v87 ~= v39.Value then
                v39.OnChanged(v87);
                return ;
            else
                local l_v46_1 = v46;
                local l_Keypoints_3 = v39.Value.Keypoints;
                l_v46_1(#l_Keypoints_3 > 2 and "<NumberSequence>" or (l_Keypoints_3[1].Value ~= l_Keypoints_3[2].Value and "<NumberSequence>" or tostring(v20(l_Keypoints_3[1].Value, 3))));
                return ;
            end;
        end;
    end;
    local function v95(v92)
        v46(v92);
        if v92 == "<NumberSequence>" then
            l_Keypoints_1(nil);
            return ;
        else
            local _, v94 = v38(v92);
            l_Keypoints_1(v94);
            return ;
        end;
    end;
    local v96 = {};
    for v97, v98 in v51.keypoints, nil, nil do
        v96["Keypoint_" .. v97] = v1.createElement(v18, {
            Position = Vector2.new(v98.Time, v98.Value), 
            Selected = v97 == v51.selectedIndex, 
            Tag = "NumberSequenceKeypoint", 
            OnMoved = v77, 
            OnHoverStart = v15(v73, {
                v97
            }), 
            OnDragEnd = function()
                v51.save(function(v99)
                    local v101 = NumberSequence.new(l_map_0(v99, function(v100)
                        return NumberSequenceKeypoint.new(v100.Time, v100.Value, v100.Envelope);
                    end));
                    if v101 ~= v39.Value then
                        v39.OnChanged(v101);
                    end;
                end);
            end
        });
    end;
    for v102 = 1, #v51.keypoints - 1 do
        v96["SequenceLine_" .. v102 .. "_" .. v102 + 1] = v1.createElement(v13, {
            StartKeypoint = v51.keypoints[v102], 
            EndKeypoint = v51.keypoints[v102 + 1], 
            PlotAbsoluteSize = v48, 
            StartKeypointSelected = v51.selectedIndex == v102, 
            EndKeypointSelected = v51.selectedIndex == v102 + 1
        });
    end;
    local v103 = v47 ~= nil;
    return v1.createElement(l_Pane_0, {
        [v1.Tag] = "X-Fill"
    }, {
        NumberSequenceInput = v1.createElement(l_TextInput_0, {
            Disabled = v39.Disabled, 
            LeadingComponent = v12, 
            LeadingComponentProps = {
                OnClick = v58, 
                ForwardRef = v41, 
                Color = v24, 
                Transparency = v39.Value
            }, 
            OnFocusLost = v91, 
            OnTextChanged = v95, 
            Size = if not v39.AutomaticSize then UDim2.fromScale(1, 1) else UDim2.new(1, 0, 0, v39.MinimumHeight or 24), 
            Text = l_l_useState_0_0, 
            [v1.Tag] = if not v103 then nil else "PropertyCellError"
        }), 
        Tooltip = v1.createElement(l_Tooltip_0, {
            Enabled = v103, 
            Text = v47 or ""
        }), 
        NumberSequenceModal = v1.createElement(v19, {
            Open = v42, 
            MaxSize = Vector2.new(800, 275), 
            MinSize = Vector2.new(600, 225), 
            ObjectRef = v41, 
            OnFocusLost = v62
        }, {
            Container = v1.createElement(l_Pane_0, {
                [v1.Tag] = "X-Pad X-ColumnM X-FitY"
            }, {
                Plot = v1.createElement(l_Pane_0, {
                    Active = true, 
                    LayoutOrder = 1, 
                    Size = UDim2.new(1, 0, 0, 200), 
                    ForwardRef = v40, 
                    OnClick = v84, 
                    [v1.Tag] = "Contrast X-Clip", 
                    [v1.Change.AbsoluteSize] = function(v104)
                        if v104 then
                            v49(v104.AbsoluteSize);
                        end;
                    end
                }, v96), 
                KeypointControls = v1.createElement(v14, {
                    Keypoint = v51.getSelectedKeypoint(), 
                    IsKeypointFixed = v51.isFixedKeypointSelected(), 
                    OnEdit = v71, 
                    OnDelete = v66, 
                    OnSave = v62, 
                    LayoutOrder = 2
                })
            })
        })
    });
end;
