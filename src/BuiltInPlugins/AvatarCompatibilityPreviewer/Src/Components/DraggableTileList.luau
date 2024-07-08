local l_script_FirstAncestor_0 = script:FindFirstAncestor("AvatarCompatibilityPreviewer");
local v1 = require(l_script_FirstAncestor_0.Packages.Framework);
local v2 = require(l_script_FirstAncestor_0.Packages.React);
local v3 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagAvatarPreviewerSidebarHandCursor);
local v4 = v3();
local v5 = require(l_script_FirstAncestor_0.Src.Util.Constants);
local l_Plugin_0 = v1.ContextServices.Plugin;
local l_Pane_0 = v1.UI.Pane;
return function(v8)
    local v9 = nil;
    if v4 then
        v9 = l_Plugin_0:use():get():GetMouse();
    end;
    local function _(v10)
        v9.Icon = v10;
    end;
    local l_Offset_0 = v8.cellSize.Y.Offset;
    assert(v8.cellSize.Y.Scale == 0, "CellSize cannot have a scaled Y");
    local v13 = {};
    local v14, v15 = v2.useState(nil);
    local v16 = v2.useRef(nil);
    local v17, v18 = v2.useBinding(0);
    local v19, v20 = v2.useBinding(0);
    local v21, v22 = v2.useBinding(0);
    for v23, v24 in v8.tiles, nil, nil do
        local v25, v26 = v8.render(v24, v14 ~= nil);
        assert(v13[v26] == nil, "Render key has already been used");
        local v27 = UDim2.fromOffset(0, l_Offset_0 * (v23 - 1));
        if v14 ~= nil then
            v27 = if v14.index == v23 then v2.joinBindings({
                v21, 
                v19
            }):map(function(v28)
                return UDim2.fromOffset(0, (math.clamp(v28[1] - v14.cursorYOffset, 0, v28[2] - l_Offset_0)));
            end) else v21:map(function(v29)
                local v30 = math.floor(v29 / l_Offset_0) + 1;
                local l_v23_0 = v23;
                if v14.index < v30 then
                    if v23 <= v30 and v14.index < v23 then
                        l_v23_0 = l_v23_0 - 1;
                    end;
                elseif v30 <= v23 and v23 < v14.index then
                    l_v23_0 = l_v23_0 + 1;
                end;
                return UDim2.fromOffset(0, l_Offset_0 * (l_v23_0 - 1));
            end);
        end;
        v13[v26] = v2.createElement(l_Pane_0, {
            Position = v27, 
            Size = v8.cellSize, 
            ZIndex = (v14 ~= nil and v14.index == v23) and 2 or 1
        }, v25);
    end;
    local v35 = v2.useCallback(function(v32)
        local v33 = v32.Position.Y - v17:getValue();
        v22(v33);
        local v34 = {
            cursorYOffset = v33 % l_Offset_0, 
            index = math.floor(v33 / l_Offset_0) + 1
        };
        if v3() then
            v9.Icon = "rbxasset://SystemCursors/ClosedHand";
        end;
        v15(v34);
        v16.current = v34;
    end, {
        l_Offset_0
    });
    local v38 = v2.useCallback(function(_, v37)
        if v16.current == nil then
            if v3() then
                v9.Icon = "rbxasset://SystemCursors/OpenHand";
            end;
            return ;
        else
            if v3() then
                v9.Icon = "rbxasset://SystemCursors/ClosedHand";
            end;
            if v37.UserInputType ~= Enum.UserInputType.MouseMovement then
                return ;
            else
                v22(v37.Position.Y - v17:getValue());
                return ;
            end;
        end;
    end, {});
    local v43 = v2.useCallback(function(_, v40)
        if v3() and v40.UserInputType == Enum.UserInputType.MouseMovement then
            v9.Icon = "rbxasset://SystemCursors/Arrow";
        end;
        local l_current_0 = v16.current;
        if l_current_0 == nil then
            return ;
        else
            assert(l_current_0 ~= nil, v5.LUAU_ANALYZE_ERROR);
            if v40.UserInputType ~= Enum.UserInputType.MouseButton1 then
                return ;
            else
                if v3() and v9.Icon ~= "rbxasset://SystemCursors/Arrow" then
                    v9.Icon = "rbxasset://SystemCursors/OpenHand";
                end;
                v15(nil);
                v16.current = nil;
                local v42 = math.floor(v21:getValue() / l_Offset_0) + 1;
                if l_current_0.index == v42 then
                    return ;
                else
                    v8.move(l_current_0.index, v42);
                    return ;
                end;
            end;
        end;
    end, {
        v8.move
    });
    if v4 then
        v2.useEffect(function()
            return function()
                v9.Icon = "rbxasset://SystemCursors/Arrow";
            end;
        end, {});
    end;
    return v2.createElement(l_Pane_0, {
        LayoutOrder = v8.layoutOrder, 
        Size = UDim2.new(v8.cellSize.X, UDim.new(0, l_Offset_0 * #v8.tiles)), 
        OnPress = v35, 
        [v2.Event.InputChanged] = v38, 
        [v2.Event.InputEnded] = v43, 
        [v2.Change.AbsolutePosition] = function(v44)
            v18(v44.AbsolutePosition.Y);
        end, 
        [v2.Change.AbsoluteSize] = function(v45)
            v20(v45.AbsoluteSize.Y);
        end
    }, v13);
end;
