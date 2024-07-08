local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Roact);
local v2 = require(l_Parent_0.Packages.Otter);
local v3 = require(l_Parent_0.Packages.Cryo);
local v4 = require(l_Parent_0.Packages.Framework);
local l_ContextServices_0 = v4.ContextServices;
local l_Pane_0 = v4.UI.Pane;
local v7 = require(l_Parent_0.Src.Components.KeyBarTile);
local l_UserInputService_0 = game:GetService("UserInputService");
local v9 = Color3.new(0, 1, 0);
local v10 = {
    [1] = Color3.new(1, 1, 1), 
    [2] = Color3.new(1, 1, 0)
};
local v11 = {
    [Enum.UserInputType.Keyboard] = 1, 
    [Enum.UserInputType.Gamepad1] = 2, 
    [Enum.UserInputType.Gamepad2] = 2, 
    [Enum.UserInputType.Gamepad3] = 2, 
    [Enum.UserInputType.Gamepad4] = 2, 
    [Enum.UserInputType.Gamepad5] = 2, 
    [Enum.UserInputType.Gamepad6] = 2, 
    [Enum.UserInputType.Gamepad7] = 2, 
    [Enum.UserInputType.Gamepad8] = 2
};
local v12 = {
    [Enum.KeyCode.Thumbstick1] = 1, 
    [Enum.KeyCode.Thumbstick2] = 1
};
local v13 = v1.PureComponent:extend("InputVisualizer");
local v14 = 0;
local v15;
do
    local l_v14_0 = v14;
    v15 = function()
        l_v14_0 = l_v14_0 + 1;
        return l_v14_0;
    end;
end;
v14 = function(v17, v18, v19, v20)
    local v21, v22 = v1.createBinding(UDim2.fromOffset(0, 0));
    local v23, v24 = v1.createBinding(UDim2.fromOffset(0, 0));
    local v25, v26 = v1.createBinding(0);
    return {
        id = v15(), 
        buttonId = v17, 
        color = v10[v17], 
        position = v21, 
        updatePosition = v22, 
        size = v23, 
        updateSize = v24, 
        transparency = v25, 
        image = v18, 
        zIndex = v19 or 1, 
        updateTransparency = v26, 
        motor = v2.createGroupMotor({
            size = 0, 
            transparency = v20 or 0
        })
    };
end;
local function v35(v27, v28)
    local v29, v30 = v1.createBinding(UDim2.fromOffset(v27, 50));
    local v31, v32 = v1.createBinding(v28);
    local v33, v34 = v1.createBinding(v28);
    return {
        size = v29, 
        updateSize = v30, 
        backgroundTransparency = v31, 
        updateBackgroundTransparency = v32, 
        foregroundTransparency = v33, 
        updateForegroundTransparency = v34, 
        motor = v2.createGroupMotor({
            size = v27 or UDim2.new(), 
            transparency = v28 or 0
        })
    };
end;
v13.init = function(v36)
    v36.state = {
        visibleCursorRingIds = {}, 
        keyRows = {}
    };
    v36.cursorRings = {};
    v36.currentCursorRingsByButtonId = {};
    v36.mouseButtonIsDown = {};
    v36.connections = {};
    v36.touchMap = {};
    v36.keyTileData = {};
    local v37, v38 = v1.createBinding(UDim2.fromOffset(0, 0));
    v36.fakeCursorPosition = v37;
    v36.updateFakeCursorPosition = v38;
    v36.onMouseDown = function(v39, v40)
        if not v36.currentCursorRingsByButtonId[v40] then
            local v41 = v14(v40, "rbxasset://textures/UserInputPlaybackPlugin/Ring.png");
            table.insert(v36.cursorRings, v41);
            v41.updatePosition(UDim2.fromOffset(v39.X, v39.Y));
            v41.updateSize(UDim2.fromOffset(1, 1));
            v41.updateTransparency(0);
            v41.motor:onStep(function(v42)
                v41.updateSize(UDim2.fromOffset(v42.size, v42.size));
                v41.updateTransparency(v42.transparency);
            end);
            v41.motor:setGoal({
                size = v2.spring(50, {
                    frequency = 1
                }), 
                transparency = v2.instant(0)
            });
            v36:setState({
                visibleCursorRingIds = v3.Dictionary.join(v36.state.visibleCursorRingIds, {
                    [v41.id] = true
                })
            });
            v36.currentCursorRingsByButtonId[v40] = v41;
            v36.mouseButtonIsDown[v40] = true;
            return ;
        else
            return ;
        end;
    end;
    v36.onMouseMove = function(v43)
        v36.updateFakeCursorPosition(UDim2.fromOffset(v43.X, v43.Y));
        for v44 = 1, 2 do
            if not (not v36.currentCursorRingsByButtonId[v44] or not v36.mouseButtonIsDown[v44]) then
                v36.currentCursorRingsByButtonId[v44].updatePosition(UDim2.fromOffset(v43.X, v43.Y));
            end;
        end;
        l_UserInputService_0.OverrideMouseIconBehavior = Enum.OverrideMouseIconBehavior.ForceHide;
    end;
    v36.removeCursorRing = function(v45)
        if v36.isMounted then
            v36:setState({
                visibleCursorRingIds = v3.Dictionary.join(v36.state.visibleCursorRingIds, {
                    [v45.id] = false
                })
            });
            local v46 = table.find(v36.cursorRings, v45);
            assert(v46 ~= nil, "Couldn't find ring");
            table.remove(v36.cursorRings, v46);
            return ;
        else
            return ;
        end;
    end;
    v36.onMouseUp = function(v47, v48)
        local v49 = v36.currentCursorRingsByButtonId[v48];
        if v49 then
            v49.updatePosition(UDim2.fromOffset(v47.X, v47.Y));
            v49.motor:setGoal({
                size = v2.spring(100, {
                    frequency = 1
                }), 
                transparency = v2.spring(1, {
                    frequency = 1
                })
            });
            v49.motor:onComplete(function()
                v36.removeCursorRing(v49);
            end);
        end;
        v36.currentCursorRingsByButtonId[v48] = nil;
        v36.mouseButtonIsDown[v48] = false;
    end;
    v36.onTouchStarted = function(v50)
        local l_Position_0 = v50.Position;
        local v52 = UDim2.fromOffset(l_Position_0.X, l_Position_0.Y);
        local v53 = v14(0, "rbxasset://textures/UserInputPlaybackPlugin/Ring.png", 2, 0);
        table.insert(v36.cursorRings, v53);
        v53.updatePosition(v52);
        v53.motor:onStep(function(v54)
            v53.updateSize(UDim2.fromOffset(v54.size, v54.size));
            v53.updateTransparency(v54.transparency);
        end);
        v53.motor:setGoal({
            size = v2.spring(50, {
                frequency = 1
            }), 
            transparency = v2.instant(0)
        });
        local v55 = v14(0, "rbxasset://textures/UserInputPlaybackPlugin/TapCursor.png", 1, 1);
        table.insert(v36.cursorRings, v55);
        v55.color = v9;
        v55.updatePosition(v52);
        v55.updateTransparency(1);
        v55.updateSize(UDim2.fromOffset(64, 64));
        v55.motor:onStep(function(v56)
            v55.updateTransparency(v56.transparency);
        end);
        v55.motor:setGoal({
            transparency = v2.spring(0, {
                frequency = 2.5
            })
        });
        local l_visibleCursorRingIds_0 = v36.state.visibleCursorRingIds;
        l_visibleCursorRingIds_0[v53.id] = true;
        l_visibleCursorRingIds_0[v55.id] = true;
        v36:setState({
            visibleCursorRingIds = l_visibleCursorRingIds_0
        });
        v36.touchMap[v50] = {
            tapImage = v55, 
            ring = v53
        };
    end;
    v36.onTouchMoved = function(v58)
        local v59 = v36.touchMap[v58];
        if v59 then
            local l_Position_1 = v58.Position;
            local v61 = UDim2.fromOffset(l_Position_1.X, l_Position_1.Y);
            v59.tapImage.updatePosition(v61);
            v59.ring.updatePosition(v61);
        end;
    end;
    v36.onTouchEnded = function(v62)
        local v63 = v36.touchMap[v62];
        if v63 then
            v36.onTouchMoved(v62);
            v63.ring.motor:setGoal({
                size = v2.spring(100, {
                    frequency = 1
                }), 
                transparency = v2.spring(1, {
                    frequency = 1
                })
            });
            v63.ring.motor:onComplete(function()
                v36.removeCursorRing(v63.ring);
            end);
            v63.tapImage.motor:setGoal({
                transparency = v2.spring(1, {
                    frequency = 1
                })
            });
            v63.tapImage.motor:onComplete(function()
                v36.removeCursorRing(v63.tapImage);
            end);
        end;
    end;
    v36.onKeyDown = function(v64)
        if not v12[v64] then
            v36:setState(function(v65, _)
                local v67 = v3.Dictionary.join(v65.keyRows);
                local v68 = v67[1];
                if not v68 or v68.numberOfKeys >= 6 then
                    v68 = {
                        lastUpdateTime = tick(), 
                        numberOfKeys = 0, 
                        keys = {}, 
                        dataId = v15()
                    };
                    table.insert(v67, 1, v68);
                    local v69 = v35(0, 1);
                    v36.keyTileData[v68.dataId] = v69;
                    v69.updateSize(UDim2.fromOffset(50, 0));
                    local l_v69_0 = v69 --[[ copy: 5 -> 7 ]];
                    v69.motor:onStep(function(v71)
                        l_v69_0.updateSize(UDim2.fromOffset(50, v71.size));
                    end);
                    v69.motor:setGoal({
                        size = v2.spring(50, {
                            frequency = 2.5
                        })
                    });
                end;
                local v72 = v35(0, 1);
                local v73 = v15();
                v36.keyTileData[v73] = v72;
                v72.motor:onStep(function(v74)
                    v72.updateSize(UDim2.fromOffset(v74.size, 50));
                    v72.updateForegroundTransparency(v74.transparency);
                    v72.updateBackgroundTransparency(1 - (1 - v74.transparency) * 0.6);
                end);
                v72.motor:setGoal({
                    size = v2.spring(50, {
                        frequency = 2.5
                    }), 
                    transparency = v2.spring(0, {
                        frequency = 2.5
                    })
                });
                v68.lastUpdateTime = tick();
                v68.numberOfKeys = v68.numberOfKeys + 1;
                table.insert(v68.keys, {
                    keyCode = v64, 
                    dataId = v73
                });
                return {
                    keyRows = v67
                };
            end);
            return ;
        else
            return ;
        end;
    end;
    v36.deleteKeyRowThread = function()
        local _ = function(v75)
            if v36.isMounted then
                v36:setState(function(v76, _)
                    local v78 = v3.Dictionary.join(v76.keyRows);
                    local v79 = nil;
                    local v80 = nil;
                    for v81, v82 in ipairs(v78) do
                        if v82.dataId == v75 then
                            v79 = v82;
                            v80 = v81;
                            break;
                        end;
                    end;
                    if v79 then
                        v36.keyTileData[v79.dataId] = nil;
                        for _, v84 in ipairs(v79.keys) do
                            v36.keyTileData[v84.dataId] = nil;
                        end;
                        v79.keys = nil;
                        table.remove(v78, v80);
                        return {
                            keyRows = v78
                        };
                    else
                        return ;
                    end;
                end);
                return ;
            else
                return ;
            end;
        end;
        local function v100(v86)
            for v87, v88 in ipairs(v86.keys) do
                local v89 = v36.keyTileData[v88.dataId];
                v89.motor:setGoal({
                    transparency = v2.spring(1, {
                        frequency = 2
                    })
                });
                if v87 == 1 then
                    v89.motor:onComplete(function()
                        local l_dataId_0 = v86.dataId;
                        if v36.isMounted then
                            v36:setState(function(v91, _)
                                local v93 = v3.Dictionary.join(v91.keyRows);
                                local v94 = nil;
                                local v95 = nil;
                                for v96, v97 in ipairs(v93) do
                                    if v97.dataId == l_dataId_0 then
                                        v94 = v97;
                                        v95 = v96;
                                        break;
                                    end;
                                end;
                                if v94 then
                                    v36.keyTileData[v94.dataId] = nil;
                                    for _, v99 in ipairs(v94.keys) do
                                        v36.keyTileData[v99.dataId] = nil;
                                    end;
                                    v94.keys = nil;
                                    table.remove(v93, v95);
                                    return {
                                        keyRows = v93
                                    };
                                else
                                    return ;
                                end;
                            end);
                            return ;
                        else
                            return ;
                        end;
                    end);
                end;
            end;
        end;
        while v36.isMounted do
            for _, v102 in ipairs(v36.state.keyRows) do
                if tick() - v102.lastUpdateTime > 1.5 then
                    v100(v102);
                end;
            end;
            wait(0.5);
        end;
    end;
end;
v13.didMount = function(v103)
    table.insert(v103.connections, l_UserInputService_0.InputBegan:connect(function(v104)
        local l_Position_2 = v104.Position;
        if v104.UserInputType == Enum.UserInputType.MouseButton1 then
            v103.onMouseDown(Vector2.new(l_Position_2.X, l_Position_2.Y), 1);
            return ;
        elseif v104.UserInputType == Enum.UserInputType.MouseButton2 then
            v103.onMouseDown(Vector2.new(l_Position_2.X, l_Position_2.Y), 2);
            return ;
        elseif v104.UserInputType == Enum.UserInputType.Touch then
            v103.onTouchStarted(v104);
            return ;
        else
            if v11[v104.UserInputType] then
                v103.onKeyDown(v104.KeyCode);
            end;
            return ;
        end;
    end));
    table.insert(v103.connections, l_UserInputService_0.InputEnded:connect(function(v106)
        local l_Position_3 = v106.Position;
        if v106.UserInputType == Enum.UserInputType.MouseButton1 then
            v103.onMouseUp(Vector2.new(l_Position_3.X, l_Position_3.Y), 1);
            return ;
        elseif v106.UserInputType == Enum.UserInputType.MouseButton2 then
            v103.onMouseUp(Vector2.new(l_Position_3.X, l_Position_3.Y), 2);
            return ;
        else
            if v106.UserInputType == Enum.UserInputType.Touch then
                v103.onTouchEnded(v106);
            end;
            return ;
        end;
    end));
    table.insert(v103.connections, l_UserInputService_0.InputChanged:connect(function(v108)
        local l_Position_4 = v108.Position;
        if v108.UserInputType == Enum.UserInputType.MouseMovement then
            v103.onMouseMove(Vector2.new(l_Position_4.X, l_Position_4.Y));
            return ;
        else
            if v108.UserInputType == Enum.UserInputType.Touch then
                v103.onTouchMoved(v108);
            end;
            return ;
        end;
    end));
    v103.isMounted = true;
    task.defer(v103.deleteKeyRowThread);
end;
v13.willUnmount = function(v110)
    for _, v112 in ipairs(v110.connections) do
        v112:Disconnect();
    end;
    v110.connections = {};
    v110.isMounted = false;
end;
v13.render = function(v113)
    local l_props_0 = v113.props;
    local l_state_0 = v113.state;
    local l_Stylizer_0 = l_props_0.Stylizer;
    local v117 = {};
    for v118, v119 in ipairs(l_state_0.keyRows) do
        local v120 = {};
        for v121, v122 in ipairs(v119.keys) do
            local v123 = v113.keyTileData[v122.dataId];
            if v123 then
                v120[v121] = v1.createElement(v7, {
                    KeyCode = v122.keyCode, 
                    LayoutOrder = v121, 
                    Size = v123.size, 
                    ForegroundTransparency = v123.foregroundTransparency, 
                    BackgroundTransparency = v123.backgroundTransparency
                });
            end;
        end;
        local v124 = v113.keyTileData[v119.dataId];
        if v124 then
            v117[v118] = v1.createElement(l_Pane_0, {
                Layout = Enum.FillDirection.Horizontal, 
                HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                VerticalAlignment = Enum.VerticalAlignment.Bottom, 
                Spacing = l_Stylizer_0.KeyBarRowSpacingPx, 
                Size = v124.size, 
                LayoutOrder = -v118
            }, v120);
        end;
    end;
    local v125 = {
        FakeCursorImage = v1.createElement("ImageLabel", {
            BackgroundTransparency = 1, 
            BorderSizePixel = 0, 
            Image = "rbxasset://textures/UserInputPlaybackPlugin/ArrowCursor.png", 
            Position = v113.fakeCursorPosition, 
            Size = UDim2.fromOffset(64, 64), 
            AnchorPoint = Vector2.new(0.5, 0.5), 
            Visible = true, 
            ImageColor3 = v9, 
            ZIndex = 1
        }), 
        KeyBar = v1.createElement(l_Pane_0, {
            Layout = Enum.FillDirection.Vertical, 
            Spacing = l_Stylizer_0.KeyBarRowSpacingPx, 
            HorizontalAlignment = Enum.HorizontalAlignment.Left, 
            VerticalAlignment = Enum.VerticalAlignment.Bottom, 
            Size = l_Stylizer_0.KeyBarSize, 
            Position = UDim2.fromScale(0, 1), 
            AnchorPoint = Vector2.new(0, 1)
        }, v117)
    };
    for _, v127 in ipairs(v113.cursorRings) do
        if l_state_0.visibleCursorRingIds[v127.id] then
            v125[v127.id] = v1.createElement("ImageLabel", {
                BackgroundTransparency = 1, 
                BorderSizePixel = 0, 
                Image = v127.image, 
                ZIndex = v127.zIndex, 
                AnchorPoint = Vector2.new(0.5, 0.5), 
                Size = v127.size, 
                Position = v127.position, 
                ImageTransparency = v127.transparency, 
                ImageColor3 = v127.color, 
                Visible = true
            });
        end;
    end;
    return v1.createFragment(v125);
end;
return (l_ContextServices_0.withContext({
    Stylizer = l_ContextServices_0.Stylizer
})(v13));
