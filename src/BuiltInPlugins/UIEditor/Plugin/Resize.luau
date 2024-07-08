local v0 = require(script.Parent.AdornmentModule);
local v1 = require(script.Parent.Analytics);
local v2 = require(script.Parent.CoreGuiManager);
local v3 = require(script.Parent.Convert);
local v4 = require(script.Parent.Enum.Direction);
local v5 = require(script.Parent.Extents2D);
local _ = require(script.Parent.FFlag);
local v7 = require(script.Parent.GlobalValues);
local v8 = require(script.Parent.MouseIconManager);
local v9 = require(script.Parent.SelectionManager);
local v10 = require(script.Parent.SnappingPointManager);
local v11 = require(script.Parent.Utility);
local v12 = require(script.Parent.Enum.SnappingType);
local l_ChangeHistoryService_0 = game:GetService("ChangeHistoryService");
local l_UserInputService_0 = game:GetService("UserInputService");
local v15 = Color3.fromRGB(255, 255, 255);
local v16 = Color3.fromRGB(255, 255, 255);
local v17 = Color3.fromRGB(136, 136, 136);
local v18 = Color3.fromRGB(222, 222, 222);
local _ = Vector2.new(1, 1);
local l_NOT_SET_0 = v4.NOT_SET;
local l_NW_0 = v4.NW;
local l_N_0 = v4.N;
local l_NE_0 = v4.NE;
local l_W_0 = v4.W;
local l_E_0 = v4.E;
local l_SW_0 = v4.SW;
local l_S_0 = v4.S;
local l_SE_0 = v4.SE;
local v29 = nil;
local v30 = nil;
local v31 = nil;
local v32 = nil;
local v33 = {};
local v34 = {};
local v35 = {};
local v36 = nil;
local v37 = nil;
local v38 = nil;
local v39 = {};
local v40 = false;
local v41 = true;
local l_l_NOT_SET_0_0 = l_NOT_SET_0;
local l_game_FastFlag_0 = game:GetFastFlag("StudioUIEditorDontClipOutsideSafeArea", false);
local function _(v44)
    l_l_NOT_SET_0_0 = v44;
end;
local function _(v46)
    if v46 == l_l_NOT_SET_0_0 then
        l_l_NOT_SET_0_0 = l_NOT_SET_0;
    end;
end;
local function v48()
    v32 = Instance.new("Frame");
    v32.Name = "UIEditorResizeHandleParent";
    v32.AnchorPoint = Vector2.new(0, 0);
    v32.BackgroundTransparency = 1;
    v32.BackgroundColor3 = Color3.new(0, 0, 255);
    v32.BorderSizePixel = 0;
end;
local function _()
    local v49 = 7;
    if v30 then
        v49 = math.clamp(v30.AbsoluteSize.Y * 0.00875, 3, 7);
    end;
    return UDim2.new(0, v49, 0, v49);
end;
local function v54()
    for v51 = 1, #v33 do
        local v52 = v33[v51];
        local v53 = 7;
        if v30 then
            v53 = math.clamp(v30.AbsoluteSize.Y * 0.00875, 3, 7);
        end;
        v52.Size = UDim2.new(0, v53, 0, v53);
        v52:FindFirstChildWhichIsA("ImageLabel").Size = UDim2.new(0, v52.AbsoluteSize.X + 8, 0, v52.AbsoluteSize.Y + 8);
    end;
end;
local function v65()
    local v55 = {
        [v4.E] = Vector2.new(0, 0.5), 
        [v4.SE] = Vector2.new(0, 0), 
        [v4.S] = Vector2.new(0.5, 0), 
        [v4.SW] = Vector2.new(1, 0), 
        [v4.W] = Vector2.new(1, 0.5), 
        [v4.NW] = Vector2.new(1, 1), 
        [v4.N] = Vector2.new(0.5, 1), 
        [v4.NE] = Vector2.new(0, 1)
    };
    local v56 = {
        [v4.E] = UDim2.new(1, -2, 0.5, 0), 
        [v4.SE] = UDim2.new(1, -2, 1, -2), 
        [v4.S] = UDim2.new(0.5, 0, 1, -2), 
        [v4.SW] = UDim2.new(0, 2, 1, -2), 
        [v4.W] = UDim2.new(0, 2, 0.5, 0), 
        [v4.NW] = UDim2.new(0, 2, 0, 2), 
        [v4.N] = UDim2.new(0.5, 0, 0, 2), 
        [v4.NE] = UDim2.new(1, -2, 0, 2)
    };
    for v57 = v4.FIRST, v4.LAST do
        local l_Frame_0 = Instance.new("Frame");
        l_Frame_0.Name = "ResizeHandle_" .. v4:toShortName(v57);
        l_Frame_0.AnchorPoint = v55[v57];
        local v59 = 7;
        if v30 then
            v59 = math.clamp(v30.AbsoluteSize.Y * 0.00875, 3, 7);
        end;
        l_Frame_0.Size = UDim2.new(0, v59, 0, v59);
        l_Frame_0.Position = v56[v57];
        l_Frame_0.BackgroundColor3 = v16;
        l_Frame_0.BorderColor3 = v17;
        l_Frame_0.ZIndex = 3;
        local l_ImageLabel_0 = Instance.new("ImageLabel");
        l_ImageLabel_0.Image = "rbxasset://textures/StudioUIEditor/resizeHandleDropShadow.png";
        l_ImageLabel_0.Name = "ResizeHandleDropShadow_" .. v4:toShortName(v57);
        l_ImageLabel_0.Size = UDim2.new(0, l_Frame_0.AbsoluteSize.X + 8, 0, l_Frame_0.AbsoluteSize.Y + 8);
        l_ImageLabel_0.Position = UDim2.new(0, -4, 0, -3);
        l_ImageLabel_0.BackgroundTransparency = 1;
        l_ImageLabel_0.BorderSizePixel = 0;
        l_ImageLabel_0.ImageColor3 = Color3.fromRGB(0, 0, 0);
        l_ImageLabel_0.ImageTransparency = 0.6;
        l_ImageLabel_0.ScaleType = Enum.ScaleType.Slice;
        l_ImageLabel_0.SliceCenter = Rect.new(4, 4, 12, 12);
        l_ImageLabel_0.ZIndex = 2;
        l_ImageLabel_0.Parent = l_Frame_0;
        l_Frame_0.MouseEnter:connect(function(_, _)
            l_l_NOT_SET_0_0 = v57;
        end);
        l_Frame_0.MouseLeave:connect(function(_, _)
            if v57 == l_l_NOT_SET_0_0 then
                l_l_NOT_SET_0_0 = l_NOT_SET_0;
            end;
        end);
        l_Frame_0.Parent = v32;
        v33[v57] = l_Frame_0;
    end;
end;
local function v71()
    local v66 = {
        Vector2.new(0, 0.5), 
        Vector2.new(0.5, 0), 
        Vector2.new(1, 0.5), 
        Vector2.new(0.5, 1)
    };
    local v67 = {
        UDim2.new(1, 0, 0.5, 0), 
        UDim2.new(0.5, 0, 1, 0), 
        UDim2.new(0, 0, 0.5, 0), 
        UDim2.new(0.5, 0, 0, 0)
    };
    local v68 = {
        UDim2.new(0, 1, 1, 2), 
        UDim2.new(1, 2, 0, 1), 
        UDim2.new(0, 1, 1, 2), 
        UDim2.new(1, 2, 0, 1)
    };
    for v69 = 1, 4 do
        local l_Frame_1 = Instance.new("Frame");
        l_Frame_1.AnchorPoint = v66[v69];
        l_Frame_1.BackgroundColor3 = v18;
        l_Frame_1.BorderSizePixel = 0;
        l_Frame_1.Position = v67[v69];
        l_Frame_1.Size = v68[v69];
        v34[v69] = l_Frame_1;
        v34[v69].Parent = v32;
    end;
end;
local function _()
    return #v33 > 0;
end;
local function _(v73, v74)
    if v74 == l_NW_0 then
        return v73.TopLeft;
    elseif v74 == l_N_0 then
        return Vector2.new(v73.Center.X, v73.Top);
    elseif v74 == l_NE_0 then
        return v73.TopRight;
    elseif v74 == l_W_0 then
        return Vector2.new(v73.Left, v73.Center.Y);
    elseif v74 == l_E_0 then
        return Vector2.new(v73.Right, v73.Center.Y);
    elseif v74 == l_SW_0 then
        return v73.BottomLeft;
    elseif v74 == l_S_0 then
        return Vector2.new(v73.Center.X, v73.Bottom);
    elseif v74 == l_SE_0 then
        return v73.BottomRight;
    else
        return v73.Center;
    end;
end;
local function _(v76)
    if v76 == l_NW_0 then
        return v12.ResizeXnYn;
    elseif v76 == l_N_0 then
        return v12.ResizeYn;
    elseif v76 == l_NE_0 then
        return v12.ResizeXpYn;
    elseif v76 == l_W_0 then
        return v12.ResizeXn;
    elseif v76 == l_E_0 then
        return v12.ResizeXp;
    elseif v76 == l_SW_0 then
        return v12.ResizeXnYp;
    elseif v76 == l_S_0 then
        return v12.ResizeYp;
    elseif v76 == l_SE_0 then
        return v12.ResizeXpYp;
    else
        return nil;
    end;
end;
local function v81(v78)
    if v78 == nil then
        return ;
    else
        local l_Size_0 = v78.Size;
        local l_TopLeft_0 = v78.TopLeft;
        if v32 == nil then
            return ;
        else
            v32.Position = UDim2.new(0, l_TopLeft_0.X, 0, l_TopLeft_0.Y);
            v32.Size = UDim2.new(0, l_Size_0.X, 0, l_Size_0.Y);
            if #v35 == 1 then
                v32.Rotation = v35[1].AbsoluteRotation;
            else
                v32.Rotation = 0;
            end;
            v54();
            return ;
        end;
    end;
end;
local function v83()
    if not (#v33 > 0) then
        local v82 = v2:findOrCreateFolder("m_handles");
        if not v30 then
            v30 = Instance.new("ScreenGui", v82);
            v30.Enabled = false;
            if l_game_FastFlag_0 then
                v30.ClipToDeviceSafeArea = false;
                v30.SafeAreaCompatibility = Enum.SafeAreaCompatibility.None;
            end;
        end;
        v48();
        v32.Parent = v30;
        v65();
        v71();
        return ;
    else
        return ;
    end;
end;
local function v86()
    for v84 = 1, #v33 do
        v33[v84]:Destroy();
    end;
    for v85 = 1, #v34 do
        v34[v85]:Destroy();
    end;
    v33 = {};
    v34 = {};
    l_l_NOT_SET_0_0 = l_NOT_SET_0;
    if v32 then
        v32:Destroy();
        v32 = nil;
    end;
    if v30 then
        v30:Destroy();
        v30 = nil;
    end;
end;
hasSelection = function()
    return #v35 > 0;
end;
local v87 = {};
v87.onSelectionChanged = function(_)
    v35 = v9:getFilteredSelection();
    if v9:hasFilteredSelection() then
        v87:updatePosition();
        v87:show();
        return ;
    else
        v87:hide();
        return ;
    end;
end;
v87.updatePosition = function(_)
    if #v35 == 0 then
        return ;
    else
        v81(v5:getExtentsFromGuis(v35));
        return ;
    end;
end;
v87.isOverAHandle = function(_)
    if hasSelection() then
        return l_l_NOT_SET_0_0 ~= l_NOT_SET_0;
    else
        return false;
    end;
end;
v87.updateHandleHighlight = function(_, v92)
    if hasSelection() then
        for v93 = v4.FIRST, v4.LAST do
            if not v92 and l_l_NOT_SET_0_0 == v93 then
                v33[v93].BackgroundColor3 = v15;
            else
                v33[v93].BackgroundColor3 = v16;
            end;
        end;
        return ;
    else
        return ;
    end;
end;
v87.isDragInProgress = function(_)
    return v40;
end;
v87.updateMouseIcon = function(_)
    if l_l_NOT_SET_0_0 ~= v4.NOT_SET then
        if #v35 == 1 then
            v8:setToResizeIcon((v8:calcMouseIconDirection(l_l_NOT_SET_0_0, v35[1].AbsoluteRotation)));
            return ;
        else
            v8:setToResizeIcon(l_l_NOT_SET_0_0);
        end;
    end;
end;
onlyShowHandle = function(v96)
    for v97 = 1, #v33 do
        if v97 == v96 then
            v33[v97].Visible = true;
        else
            v33[v97].Visible = false;
        end;
    end;
end;
v87.startDrag = function(_, v99)
    if hasSelection() then
        if not v40 then
            v40 = true;
            v31 = l_l_NOT_SET_0_0;
            onlyShowHandle(v31);
            for v100 = 1, #v35 do
                table.insert(v39, {
                    v35[v100], 
                    v35[v100].AbsolutePosition, 
                    v35[v100].Position, 
                    v35[v100].AbsoluteSize, 
                    v35[v100].Size
                });
            end;
            v38 = v5:getExtentsFromGuis(v35);
            v36 = v38.Width / v38.Height;
            v37 = v99;
            v29:onResizeBegan(v99);
            return ;
        else
            return ;
        end;
    else
        return ;
    end;
end;
local function v122(v101, v102, v103, v104)
    local v105 = v103 and not v104;
    local v106 = v104 and not v103;
    if not (v31 ~= l_E_0) or v31 == l_W_0 then
        v101:expandFromCenter(Vector2.new(0, v101.Width / v36 - v101.Height));
        return ;
    elseif not (v31 ~= l_N_0) or v31 == l_S_0 then
        v101:expandFromCenter(Vector2.new(v36 * v101.Height - v101.Width, 0));
        return ;
    elseif v31 == l_SE_0 then
        local v107 = v102 - v38.TopLeft;
        local v108 = v107.X / v107.Y;
        local v109 = true;
        if v107.Y > 0 then
            v109 = v36 < v108;
        end;
        if not v109 and not v105 or v106 then
            v101.BottomRight = v101.TopLeft + Vector2.new(v36 * v101.Height, v101.Height);
            return ;
        else
            v101.BottomRight = v101.TopLeft + Vector2.new(v101.Width, v101.Width / v36);
            return ;
        end;
    elseif v31 == l_NE_0 then
        local v110 = Vector2.new(1, -1);
        local v111 = (v102 - v38.BottomLeft) * v110;
        local v112 = v111.X / v111.Y;
        local v113 = true;
        if v111.y > 0 then
            v113 = v36 < v112;
        end;
        if not v113 then
            v101.TopRight = v101.BottomLeft + Vector2.new(v36 * v101.Height, v101.Height) * v110;
            return ;
        else
            v101.TopRight = v101.BottomLeft + Vector2.new(v101.Width, v101.Width / v36) * v110;
            return ;
        end;
    elseif v31 == l_SW_0 then
        local v114 = Vector2.new(-1, 1);
        local v115 = (v102 - v38.TopRight) * v114;
        local v116 = v115.X / v115.Y;
        local v117 = true;
        if v115.y > 0 then
            v117 = v36 < v116;
        end;
        if not v117 then
            v101.BottomLeft = v101.TopRight + Vector2.new(v36 * v101.Height, v101.Height) * v114;
            return ;
        else
            v101.BottomLeft = v101.TopRight + Vector2.new(v101.Width, v101.Width / v36) * v114;
            return ;
        end;
    else
        if v31 == l_NW_0 then
            local v118 = Vector2.new(-1, -1);
            local v119 = (v102 - v38.BottomRight) * v118;
            local v120 = v119.X / v119.Y;
            local v121 = true;
            if v119.y > 0 then
                v121 = v36 < v120;
            end;
            if not v121 and not v105 or v106 then
                v101.TopLeft = v101.BottomRight + Vector2.new(v36 * v101.Height, v101.Height) * v118;
            else
                v101.TopLeft = v101.BottomRight + Vector2.new(v101.Width, v101.Width / v36) * v118;
                return ;
            end;
        end;
        return ;
    end;
end;
local function v135(v123, v124, v125)
    local v126 = l_UserInputService_0:IsKeyDown(Enum.KeyCode.LeftShift) or l_UserInputService_0:IsKeyDown(Enum.KeyCode.RightShift);
    if v126 then
        v122(v123, v124, false, false);
    end;
    local v127 = nil;
    local v128 = nil;
    local v129 = nil;
    local v130, v131, v132, v133 = v10:snapExtents(v123, if v125 == l_NW_0 then v12.ResizeXnYn else if v125 == l_N_0 then v12.ResizeYn else if v125 == l_NE_0 then v12.ResizeXpYn else if v125 == l_W_0 then v12.ResizeXn else if v125 == l_E_0 then v12.ResizeXp else if v125 == l_SW_0 then v12.ResizeXnYp else if v125 == l_S_0 then v12.ResizeYp else if v125 == l_SE_0 then v12.ResizeXpYp else nil);
    v123 = v130;
    v127 = v131;
    v128 = v132;
    v129 = v133;
    for v134 = 1, #v127 do
        v0:showSnappingLine(v127[v134]);
    end;
    if v126 then
        v122(v123, v124, v128, v129);
    end;
    return v123, (v126 or v128) or v129;
end;
local function v138(v136)
    local _ = nil;
    if not (v136 ~= l_SE_0 and v136 ~= l_E_0) or v136 == l_S_0 then
        return (Vector2.new(-0.5, -0.5));
    elseif not (v136 ~= l_NW_0 and v136 ~= l_N_0) or v136 == l_W_0 then
        return (Vector2.new(0.5, 0.5));
    elseif v136 == l_SW_0 then
        return (Vector2.new(0.5, -0.5));
    else
        return (Vector2.new(-0.5, 0.5));
    end;
end;
local function v141(v139, v140)
    if not (v31 ~= l_NW_0 and v31 ~= l_W_0) or v31 == l_SW_0 then
        v139:translate(Vector2.new(v140.X, 0));
        v139:resize(v139.Size - Vector2.new(v140.X, 0));
    elseif not (v31 ~= l_NE_0 and v31 ~= l_E_0) or v31 == l_SE_0 then
        v139:resize(v139.Size + Vector2.new(v140.X, 0));
    end;
    if not (v31 ~= l_NW_0 and v31 ~= l_N_0) or v31 == l_NE_0 then
        v139:translate(Vector2.new(0, v140.Y));
        v139:resize(v139.Size - Vector2.new(0, v140.Y));
        return ;
    else
        if not (v31 ~= l_SW_0 and v31 ~= l_S_0) or v31 == l_SE_0 then
            v139:resize(v139.Size + Vector2.new(0, v140.Y));
        end;
        return ;
    end;
end;
local function _(v142)
    local l_zero_0 = Vector2.zero;
    if not (v31 ~= l_NW_0 and v31 ~= l_W_0) or v31 == l_SW_0 then
        l_zero_0 = l_zero_0 + Vector2.new(-v142.X, 0);
    elseif not (v31 ~= l_NE_0 and v31 ~= l_E_0) or v31 == l_SE_0 then
        l_zero_0 = l_zero_0 + Vector2.new(v142.X, 0);
    end;
    if not (v31 ~= l_NW_0 and v31 ~= l_N_0) or v31 == l_NE_0 then
        return l_zero_0 + Vector2.new(0, -v142.Y);
    else
        if not (v31 ~= l_SW_0 and v31 ~= l_S_0) or v31 == l_SE_0 then
            l_zero_0 = l_zero_0 + Vector2.new(0, v142.Y);
        end;
        return l_zero_0;
    end;
end;
local function v152(v145, v146, v147)
    local v148 = 1;
    local v149 = 1;
    local v150 = 0;
    local v151 = 0;
    if v38.Size.X ~= 0 then
        v148 = v146.Size.X / v145.Size.X;
    else
        v150 = v147.X;
    end;
    if v38.Size.Y ~= 0 then
        v149 = v146.Size.Y / v145.Size.Y;
    else
        v151 = v147.Y;
    end;
    return UDim2.new(v148, v150, v149, v151);
end;
v87.updateDrag = function(_, v154)
    if v40 then
        local v155 = v9:getFilteredSelection();
        local v156 = v11:cloneTable(v38);
        v0:hideSnappingLines();
        local v157 = 0;
        if #v155 == 1 then
            v157 = v155[1].AbsoluteRotation;
        end;
        local v158 = v11:rotate(v154 - v37, Vector2.zero, -v157);
        v141(v156, v158);
        local v159 = false;
        if v157 == 0 then
            local v160, v161 = v135(v156, v154, v31);
            v156 = v160;
            v159 = v161;
        end;
        local v162 = v152(v38, v156, v158);
        local v163 = v138(v31);
        local v164 = v38.Center + v11:rotate(v163 * v38.Size, Vector2.zero, v157);
        local l_zero_1 = Vector2.zero;
        if not (not (v157 == 0) or not v159) then
            l_zero_1 = (v156.Center + v163 * v156.Size) - (v38.Center + v163 * v38.Size);
        end;
        v156:translate(l_zero_1);
        local v166 = {};
        local v167 = {};
        for v168 = 1, #v39 do
            local v169 = v39[v168];
            local v170 = v169[1];
            local v171 = v11:rotate((v169[2] + v169[4] * 0.5) - v164, Vector2.zero, -v157);
            local v172 = v171 + v11:rotate(v169[4] / 2, Vector2.zero, v170.AbsoluteRotation - v157);
            local v173 = v11:multUDimWithVector(UDim2.new(v162.X.Scale, v162.X.Offset / 2, v162.Y.Scale, v162.Y.Offset / 2), v171);
            local v174 = 2 * v11:rotate(v11:multUDimWithVector(v162, v172) - v173, Vector2.zero, v157 - v170.AbsoluteRotation);
            local v175, v176 = v3:convertAbsoluteToScaleOrOffset(v11:isOnlyScaleUDim2(v169[3]) or not v11:isOnlyOffsetUDim2(v169[3]) and v7:isScale(), v11:isOnlyScaleUDim2(v169[5]) or not v11:isOnlyOffsetUDim2(v169[5]) and v7:isScale(), ((v164 + v11:rotate(v173, Vector2.zero, v157)) - v174 * 0.5) + l_zero_1, v174, v169[3], v169[5], v170:FindFirstAncestorWhichIsA("GuiBase2d"), v170.AnchorPoint);
            v166[v170] = v175;
            v167[v170] = v176;
        end;
        for v177 = 1, #v39 do
            local v178 = v39[v177][1];
            v178.Position = v166[v178];
            v178.Size = v167[v178];
        end;
        v81(v5:getExtentsFromGuis(v155));
        v29:onResizeChanged(v154);
        return ;
    else
        return ;
    end;
end;
v87.finishDrag = function(_, v180)
    if v40 then
        v0:hideSnappingLines();
        if v37 ~= v180 then
            v1:reportEvent("Resize");
            l_ChangeHistoryService_0:SetWaypoint("Resize");
        end;
        v40 = false;
        v0:hideXSnappingLine();
        v0:hideYSnappingLine();
        v39 = {};
        v37 = nil;
        v38 = nil;
        v31 = nil;
        for v181 = 1, #v33 do
            v33[v181].Visible = true;
        end;
        v29:onResizeEnded(v180);
        return ;
    else
        return ;
    end;
end;
v87.hide = function(_)
    if not v41 then
        v41 = true;
        if v30 then
            v30.Enabled = false;
        end;
        return ;
    else
        return ;
    end;
end;
v87.show = function(_)
    if not v41 or #v35 == 0 then
        return ;
    else
        v41 = false;
        if v30 then
            v30.Enabled = true;
        end;
        return ;
    end;
end;
v87.setActionMediator = function(_, v185)
    v29 = v185;
end;
v87.On = function(_)
    v83();
end;
v87.Off = function(_)
    v87:hide();
    v86();
end;
v87.updateSize = function(_)
    v54();
end;
return v87;
