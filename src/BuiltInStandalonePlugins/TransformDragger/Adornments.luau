local v0 = require(script.Parent.Metapart);
local v1 = require(script.Parent.Input);
local v2 = require(script.Parent.Utility);
local v3 = require(script.Parent.RecyclingBin);
local v4 = game:DefineFastFlag("TransformToolCorrectCamera", false);
local v5 = {};
local v6 = {};
local v7 = {};
local l_CoreGui_0 = game:GetService("CoreGui");
local v9 = Instance.new("Folder", l_CoreGui_0);
v9.Name = "TransformTempAdornments";
local v10 = false;
local v11 = nil;
local v12 = nil;
local v13 = nil;
local v14 = nil;
local v15 = nil;
local v16 = nil;
local v17 = nil;
local v18 = nil;
local v19 = nil;
local v20 = {};
local v21 = {};
local v22 = {};
local v23 = {};
local v24 = {};
local v25 = false;
local v26 = false;
local v27 = false;
local v28 = 0;
local v29 = false;
local v30 = {};
local v31 = 0;
local v32 = {};
local v33 = 1;
local function v39(v34, v35, v36, v37, v38)
    if v34 then
        v35.Text = v37;
        v35.Size = UDim2.new(0, v35.TextBounds.X, 0, v35.TextBounds.Y);
        v35.Position = UDim2.new(0, 3, 0, 0);
        v36.Text = v38 == 1 and "studs" or "o";
        v36.Size = UDim2.new(0, v36.TextBounds.X, 0, v36.TextBounds.Y);
        v36.Position = UDim2.new(0, v35.TextBounds.X + 4, 0, v38 == 1 and 7 or 0);
        v34.Size = UDim2.new(0, (v35.TextBounds.X + v36.TextBounds.X) + 7, 0, v35.TextBounds.Y + 2);
        return ;
    else
        return ;
    end;
end;
local function v48(v40, v41, v42, v43, v44, v45, v46, v47)
    v40.CFrame = (((CFrame.new(v46, v45) - v46) + v45) + (v46 - v45).unit * v40.Height) + v47;
    v41.CFrame = (((CFrame.new(v45, v46) - v45) + v46) - (v46 - v45).unit * v41.Height) + v47;
    v42.CFrame = CFrame.new(v45 + v47, v46 + v47);
    v42.Length = (v45 - v46).magnitude;
    v43.CFrame = CFrame.new(v45, v45 + v47);
    v43.Length = v47.magnitude;
    v44.CFrame = CFrame.new(v46, v46 + v47);
    v44.Length = v47.magnitude;
end;
local v49 = Instance.new("Folder", v9);
v49.Name = "Rotation";
local function _()
    local l_v49_Children_0 = v49:GetChildren();
    if #l_v49_Children_0 > 0 then
        v3:RecycleObjects(l_v49_Children_0);
    end;
end;
local function v66(v52, v53, v54)
    if v54 == 0 then
        local l_v49_Children_1 = v49:GetChildren();
        if #l_v49_Children_1 > 0 then
            v3:RecycleObjects(l_v49_Children_1);
        end;
        return ;
    else
        local v56 = v54 / math.abs(v54);
        local v57 = nil;
        v57 = if not v4 then v52:pointToObjectSpace(game.Workspace.Camera.CoordinateFrame.p).Z > 0 else v52:pointToObjectSpace(game.Workspace.CurrentCamera.CFrame.Position).Z > 0;
        if v57 then
            v56 = v56 * -1;
        end;
        if not v26 then
            v54 = if v56 > 0 then math.floor(v54) else math.ceil(v54);
            v53 = v53 * 1.15;
        end;
        local v58 = math.abs(v54);
        local v59 = {};
        local function v61(v60)
            table.insert(v59, {
                CFrame = v52:toWorldSpace(CFrame.Angles(not v57 and 0 or 3.141592653589793, 0, (math.rad(v58 * v56))) * CFrame.new((Vector3.new(-v53 * 0.5, v53 * 0.5, 0)))), 
                Image = v60
            });
        end;
        while v58 >= 90 do
            if v56 < 0 then
                v58 = v58 - 90;
            end;
            v61("rbxasset://textures/transformNinetyDegrees.png");
            if v56 > 0 then
                v58 = v58 - 90;
            end;
        end;
        while v26 and v58 >= 22.5 do
            if v56 < 0 then
                v58 = v58 - 22.5;
            end;
            v61("rbxasset://textures/transformTwentyTwoDegrees.png");
            if v56 > 0 then
                v58 = v58 - 22.5;
            end;
        end;
        while v58 >= 5 do
            if v56 < 0 then
                v58 = v58 - 5;
            end;
            v61("rbxasset://textures/transformFiveDegrees.png");
            if v56 > 0 then
                v58 = v58 - 5;
            end;
        end;
        while v58 >= 1 do
            if v56 < 0 then
                v58 = v58 - 1;
            end;
            v61("rbxasset://textures/transformOneDegree.png");
            if v56 > 0 then
                v58 = v58 - 1;
            end;
        end;
        local v62 = v3:Allocate("ImageHandleAdornment", #v59, v49);
        for v63, v64 in ipairs(v59) do
            local v65 = v62[v63];
            v65.Adornee = v12;
            v65.ZIndex = 1;
            v65.AlwaysOnTop = true;
            v65.Size = Vector2.new(v53, v53);
            v65.Color3 = Color3.new(1, 0, 0);
            v65.Transparency = 0.6;
            v65.CFrame = v64.CFrame;
            v65.Image = v64.Image;
        end;
        return ;
    end;
end;
local v67 = nil;
local v68 = nil;
local v69 = nil;
local function v81(v70, v71, v72)
    v25 = true;
    local v73 = v71 / 10;
    local v74 = v73 / 2;
    for v75 = 1, 72 do
        v23[v75].Length = (v75 - 1) % 9 == 0 and v73 or v74;
        local v76 = (v75 - 1) * 5;
        local v77 = Vector3.new(math.cos((math.rad(v76))), math.sin((math.rad(v76))), 0) * v71;
        v23[v75].Transparency = not v26 and 0 or 0.4;
        v23[v75].CFrame = v70:toWorldSpace(CFrame.new(v77, v77 * 2));
    end;
    for v78 = 73, 88 do
        v23[v78].Length = v73;
        local v79 = (v78 - 73) * 22.5;
        local v80 = Vector3.new(math.cos((math.rad(v79))), math.sin((math.rad(v79))), 0) * v71;
        v23[v78].Transparency = not v26 and 0.4 or 0;
        v23[v78].CFrame = v70:toWorldSpace(CFrame.new(v80, v80 * 0.5));
    end;
    v67 = v70;
    v68 = v71;
    v69 = v72;
end;
local function v83(v82)
    v22[1].CFrame = v82:toWorldSpace(CFrame.new(Vector3.new(0, 0.3, 0), (Vector3.new(0, 2, 0))));
    v22[2].CFrame = v82:toWorldSpace(CFrame.new(Vector3.new(0, -0.3, 0), (Vector3.new(0, -2, 0))));
    v22[3].CFrame = v82:toWorldSpace(CFrame.new(Vector3.new(0.3, 0, 0), (Vector3.new(2, 0, 0))));
    v22[4].CFrame = v82:toWorldSpace(CFrame.new(Vector3.new(-0.3, 0, 0), (Vector3.new(-2, 0, 0))));
    v22[5].CFrame = v82:toWorldSpace(CFrame.new(Vector3.new(0, 0, 0.3), (Vector3.new(0, 0, 2))));
    v22[6].CFrame = v82:toWorldSpace(CFrame.new(Vector3.new(0, 0, -0.3), (Vector3.new(0, 0, -2))));
end;
local v84 = false;
local v85 = false;
local function v87(v86)
    v32[v86] = true;
    if v5[v86][2].Visible and not v1.getButtonState(v1.Enum.Key.MOUSE_BUTTON1) then
        if v86 == v31 then
            v85 = true;
        end;
        if v31 <= v86 and v31 ~= 0 then
            return ;
        else
            if v86 == 14 then
                v27 = true;
            elseif not v29 then
                v5[v86][2].Color3 = v5[v86][4][1];
                v5[v86][2].Transparency = v5[v86][4][2];
                if v6[v86] then
                    v6[v86].Color3 = v5[v86][4][1];
                    v6[v86].Transparency = 0.2;
                end;
            end;
            v31 = v86;
            v85 = true;
            return ;
        end;
    else
        return ;
    end;
end;
local function _(v88)
    v5[v88][2].Color3 = v5[v88][5][1];
    v5[v88][2].Transparency = v5[v88][5][2];
    if v6[v88] then
        v6[v88].Color3 = Color3.new(0, 0, 0);
        v6[v88].Transparency = 0.7;
    end;
end;
local function v94(v90)
    v32[v90] = nil;
    if v90 == v31 then
        v85 = false;
    end;
    if not v1.getButtonState(v1.Enum.Key.MOUSE_BUTTON1) then
        if v90 == 14 then
            v27 = false;
        else
            v5[v90][2].Color3 = v5[v90][5][1];
            v5[v90][2].Transparency = v5[v90][5][2];
            if v6[v90] then
                v6[v90].Color3 = Color3.new(0, 0, 0);
                v6[v90].Transparency = 0.7;
            end;
        end;
        local v91 = 0;
        for v92, v93 in pairs(v32) do
            if v93 then
                v91 = v92;
            end;
        end;
        v31 = 0;
        if v91 ~= 0 then
            if v91 == 14 then
                v32[14] = nil;
                return ;
            else
                v87(v91);
            end;
        end;
        return ;
    else
        return ;
    end;
end;
local function _(v95)
    if v95.UserInputType == Enum.UserInputType.MouseButton1 then
        v84 = true;
    end;
end;
local function _(v97)
    if v97.UserInputType == Enum.UserInputType.MouseButton1 then
        if not (not (v31 == 14) or not v84) then
            v29 = not v29;
        end;
        v84 = false;
    end;
end;
local function _(v99, v100, v101, v102, v103)
    if v103 == nil then
        v103 = 0;
    end;
    local v104 = Instance.new("BoxHandleAdornment", l_CoreGui_0);
    v104.SizeRelativeOffset = v99;
    v104.Size = v100;
    v104.Color3 = v101;
    v104.AlwaysOnTop = v102;
    v104.ZIndex = v103;
    return v104;
end;
local function _(v106, v107, v108, v109, v110, v111, v112, v113)
    local v114 = Instance.new("ImageHandleAdornment", l_CoreGui_0);
    v114.Image = v113;
    v114.SizeRelativeOffset = v106;
    v114.Size = v107;
    v114.CFrame = v111;
    v114.Color3 = v108[1];
    v114.ZIndex = v110;
    v114.Transparency = v108[2];
    v114.AlwaysOnTop = v109;
    v114.Visible = v112;
    return v114;
end;
local function _(v116, v117, v118, v119, v120, v121)
    local v122 = Instance.new("ConeHandleAdornment", l_CoreGui_0);
    v122.SizeRelativeOffset = v116;
    v122.CFrame = v121;
    v122.Height = v117.X;
    v122.Radius = v117.Y;
    v122.Color3 = v118[1];
    v122.ZIndex = v120;
    v122.AlwaysOnTop = v119;
    return v122;
end;
local v124 = Color3.new(0.14901960784313725, 0.5333333333333333, 0.9411764705882353);
local v125 = Color3.new(0.08235294117647059, 0.10196078431372549, 0.34901960784313724);
local v126 = Color3.new(0, 0, 0);
local v127 = Color3.new(1, 1, 1);
local v128 = Color3.new(0.9372549019607843, 0.9019607843137255, 0.25098039215686274);
local v129 = Color3.new(0.7215686274509804, 0.7215686274509804, 0.7215686274509804);
local v130 = Color3.new(0, 0.6352941176470588, 1);
local v131 = Color3.new(0.24705882352941178, 0.7764705882352941, 0.4745098039215686);
local v132 = Color3.new(0.8862745098039215, 0.13725490196078433, 0.10196078431372549);
local l_Color_0 = BrickColor.Red().Color;
local function v164(v134, v135, v136, v137, v138, v139, v140, v141, v142)
    if v141 == nil then
        v141 = CFrame.new();
    end;
    if v134 == 0 then
        local v143 = v137[1];
        local v144 = 2;
        if v144 == nil then
            v144 = 0;
        end;
        local v145 = Instance.new("BoxHandleAdornment", l_CoreGui_0);
        v145.SizeRelativeOffset = v140;
        v145.Size = v138;
        v145.Color3 = v143;
        v145.AlwaysOnTop = true;
        v145.ZIndex = v144;
        local l_v145_0 = v145;
        v144 = v126;
        v145 = 1;
        if v145 == nil then
            v145 = 0;
        end;
        local v147 = Instance.new("BoxHandleAdornment", l_CoreGui_0);
        v147.SizeRelativeOffset = v140;
        v147.Size = v138;
        v147.Color3 = v144;
        v147.AlwaysOnTop = true;
        v147.ZIndex = v145;
        v143 = v147;
        v143.Transparency = 0.7;
        l_v145_0.MouseEnter:connect(function()
            v87(v135);
        end);
        l_v145_0.MouseLeave:connect(function()
            v94(v135);
        end);
        v5[v135] = {
            l_v145_0, 
            l_v145_0, 
            v135, 
            v136, 
            v137, 
            v138, 
            v139
        };
        v6[v135] = v143;
        return ;
    elseif v134 == 1 then
        local v148 = v137[1];
        local v149 = 3;
        if v149 == nil then
            v149 = 0;
        end;
        local v150 = Instance.new("BoxHandleAdornment", l_CoreGui_0);
        v150.SizeRelativeOffset = v140;
        v150.Size = v139;
        v150.Color3 = v148;
        v150.AlwaysOnTop = true;
        v150.ZIndex = v149;
        local l_v150_0 = v150;
        v149 = v126;
        v150 = 2;
        if v150 == nil then
            v150 = 0;
        end;
        local v152 = Instance.new("BoxHandleAdornment", l_CoreGui_0);
        v152.SizeRelativeOffset = v140;
        v152.Size = v138;
        v152.Color3 = v149;
        v152.AlwaysOnTop = true;
        v152.ZIndex = v150;
        v148 = v152;
        v150 = v126;
        v152 = 1;
        if v152 == nil then
            v152 = 0;
        end;
        local v153 = Instance.new("BoxHandleAdornment", l_CoreGui_0);
        v153.SizeRelativeOffset = v140;
        v153.Size = v138;
        v153.Color3 = v150;
        v153.AlwaysOnTop = true;
        v153.ZIndex = v152;
        v149 = v153;
        v149.Transparency = 0.7;
        v148.MouseEnter:connect(function()
            v87(v135);
        end);
        v148.MouseLeave:connect(function()
            v94(v135);
        end);
        v5[v135] = {
            v148, 
            l_v150_0, 
            v135, 
            v136, 
            v137, 
            v138, 
            v139
        };
        v6[v135] = v149;
        return ;
    elseif v134 == 2 then
        local l_v141_0 = v141;
        local v155 = Instance.new("ConeHandleAdornment", l_CoreGui_0);
        v155.SizeRelativeOffset = v140;
        v155.CFrame = l_v141_0;
        v155.Height = v139.X;
        v155.Radius = v139.Y;
        v155.Color3 = v137[1];
        v155.ZIndex = 2;
        v155.AlwaysOnTop = true;
        local l_v155_0 = v155;
        v155 = {
            v126, 
            0
        };
        local v157 = v141 - Vector3.new(0, 0.05, 0);
        local v158 = Instance.new("ConeHandleAdornment", l_CoreGui_0);
        v158.SizeRelativeOffset = v140;
        v158.CFrame = v157;
        v158.Height = v138.X;
        v158.Radius = v138.Y;
        v158.Color3 = v155[1];
        v158.ZIndex = 1;
        v158.AlwaysOnTop = true;
        l_v141_0 = v158;
        l_v141_0.MouseEnter:connect(function()
            v87(1);
        end);
        l_v141_0.MouseLeave:connect(function()
            v94(1);
        end);
        v5[v135] = {
            l_v141_0, 
            l_v155_0, 
            v135, 
            v136, 
            v137, 
            v138, 
            v139
        };
        return ;
    else
        if v134 == 3 then
            local l_v141_1 = v141;
            local v160 = Instance.new("ImageHandleAdornment", l_CoreGui_0);
            v160.Image = v142;
            v160.SizeRelativeOffset = v140;
            v160.Size = v138;
            v160.CFrame = l_v141_1;
            v160.Color3 = v137[1];
            v160.ZIndex = 6;
            v160.Transparency = v137[2];
            v160.AlwaysOnTop = true;
            v160.Visible = true;
            local l_v160_0 = v160;
            v160 = {
                v126, 
                0
            };
            local l_v141_2 = v141;
            local v163 = Instance.new("ImageHandleAdornment", l_CoreGui_0);
            v163.Image = v142;
            v163.SizeRelativeOffset = v140;
            v163.Size = v139;
            v163.CFrame = l_v141_2;
            v163.Color3 = v160[1];
            v163.ZIndex = 2;
            v163.Transparency = v160[2];
            v163.AlwaysOnTop = true;
            v163.Visible = false;
            l_v141_1 = v163;
            if v135 == 12 then
                l_v160_0.Name = "R_XY";
            end;
            l_v160_0.MouseEnter:connect(function()
                v87(v135);
            end);
            l_v160_0.MouseLeave:connect(function()
                v94(v135);
            end);
            v5[v135] = {
                l_v141_1, 
                l_v160_0, 
                v135, 
                v136, 
                v137, 
                v138, 
                v139
            };
        end;
        return ;
    end;
end;
local function v173()
    v164(2, 1, {
        l_Color_0, 
        0
    }, {
        v128, 
        0
    }, Vector3.new(0.8, 0.3, 0), Vector3.new(0.6, 0.21, 0), Vector3.new(0, 1, 0), CFrame.new(Vector3.new(0, 3.05, 0), (Vector3.new(0, 5, 0))));
    v164(0, 2, {
        l_Color_0, 
        0
    }, {
        v125, 
        0
    }, Vector3.new(0.1, 0.1, 0.1), Vector3.new(0.1, 0.1, 0.1), (Vector3.new(1, -1, 0)));
    v164(0, 3, {
        l_Color_0, 
        0
    }, {
        v125, 
        0
    }, Vector3.new(0.1, 0.1, 0.1), Vector3.new(0.1, 0.1, 0.1), (Vector3.new(-1, -1, 0)));
    v164(0, 4, {
        l_Color_0, 
        0
    }, {
        v125, 
        0
    }, Vector3.new(0.1, 0.1, 0.1), Vector3.new(0.1, 0.1, 0.1), (Vector3.new(0, -1, 1)));
    v164(0, 5, {
        l_Color_0, 
        0
    }, {
        v125, 
        0
    }, Vector3.new(0.1, 0.1, 0.1), Vector3.new(0.1, 0.1, 0.1), (Vector3.new(0, -1, -1)));
    v164(1, 7, {
        l_Color_0, 
        0
    }, {
        v127, 
        0
    }, Vector3.new(0.15, 0.15, 0.15), Vector3.new(0.1, 0.1, 0.1), (Vector3.new(1, -1, 1)));
    v164(1, 8, {
        l_Color_0, 
        0
    }, {
        v127, 
        0
    }, Vector3.new(0.15, 0.15, 0.15), Vector3.new(0.1, 0.1, 0.1), (Vector3.new(1, -1, -1)));
    v164(1, 9, {
        l_Color_0, 
        0
    }, {
        v127, 
        0
    }, Vector3.new(0.15, 0.15, 0.15), Vector3.new(0.1, 0.1, 0.1), (Vector3.new(-1, -1, 1)));
    v164(1, 10, {
        l_Color_0, 
        0
    }, {
        v127, 
        0
    }, Vector3.new(0.15, 0.15, 0.15), Vector3.new(0.1, 0.1, 0.1), (Vector3.new(-1, -1, -1)));
    v164(1, 6, {
        l_Color_0, 
        0
    }, {
        v127, 
        0
    }, Vector3.new(0.15, 0.15, 0.15), Vector3.new(0.1, 0.1, 0.1), (Vector3.new(0, 1, 0)));
    v164(3, 11, {
        v130, 
        0
    }, {
        v130, 
        0.3
    }, Vector2.new(1, 1), Vector2.new(1, 1), Vector3.new(-1, 1, -1), CFrame.new(Vector3.new(0, 0, 0), (Vector3.new(0, 0, 1))), "rbxasset://textures/rotationArrow.png");
    v164(3, 12, {
        v131, 
        0
    }, {
        v131, 
        0.3
    }, Vector2.new(1, 1), Vector2.new(1, 1), Vector3.new(-1, 1, 1), CFrame.new(Vector3.new(0, 0, 0), (Vector3.new(0, 1, 0))), "rbxasset://textures/rotationArrow.png");
    v164(3, 13, {
        v132, 
        0
    }, {
        v132, 
        0.3
    }, Vector2.new(1, 1), Vector2.new(1, 1), Vector3.new(1, 1, 1), CFrame.new(Vector3.new(0, 0, 0), (Vector3.new(1, 0, 0))), "rbxasset://textures/rotationArrow.png");
    v13 = Instance.new("ScreenGui", l_CoreGui_0);
    v13.Name = "PrecisionDraggerGui";
    local v165 = Instance.new("ImageLabel", v13);
    v165.Image = "rbxasset://textures/whiteCircle.png";
    v165.BackgroundTransparency = 1;
    v165.BorderSizePixel = 0;
    v165.ImageColor3 = v126;
    v165.Size = UDim2.new(0, 80, 0, 80);
    v165.Position = UDim2.new(0, 5, 0, 5);
    v165.ImageTransparency = 0.5;
    v165.MouseEnter:connect(function()
        v87(14);
    end);
    v165.MouseLeave:connect(function()
        v94(14);
    end);
    v165.InputBegan:connect(function(v166)
        if v166.UserInputType == Enum.UserInputType.MouseButton1 then
            v84 = true;
        end;
    end);
    v165.InputEnded:connect(function(v167)
        if v167.UserInputType == Enum.UserInputType.MouseButton1 then
            if not (not (v31 == 14) or not v84) then
                v29 = not v29;
            end;
            v84 = false;
        end;
    end);
    v5[14] = {
        v165, 
        v165, 
        14, 
        {
            v129, 
            0
        }, 
        {
            v126, 
            0.5
        }, 
        Vector2.new(1, 1), 
        Vector2.new(1, 1)
    };
    v24[1] = Instance.new("LineHandleAdornment", l_CoreGui_0);
    v24[1].Visible = false;
    v24[1].Color3 = v132;
    v24[1].Thickness = 3;
    v24[1].ZIndex = 5;
    v24[2] = v24[1]:Clone();
    v24[2].Parent = l_CoreGui_0;
    v24[2].Color3 = v131;
    v24[3] = v24[1]:Clone();
    v24[3].Parent = l_CoreGui_0;
    v24[3].Color3 = v130;
    if not v12 then
        v14 = Instance.new("Frame", v13);
        v14.Visible = false;
        v14.Name = "MeasureFrame";
        v14.BackgroundTransparency = 0.45;
        v14.BorderSizePixel = 0;
        v14.BackgroundColor3 = v127;
        v17 = v14:Clone();
        v17.Parent = v13;
        v15 = Instance.new("TextLabel", v14);
        v15.Name = "MeasureLabel";
        v15.Font = Enum.Font.ArialBold;
        v15.FontSize = Enum.FontSize.Size24;
        v15.BackgroundTransparency = 1;
        v15.BorderSizePixel = 0;
        v18 = v15:Clone();
        v18.Parent = v17;
        v16 = Instance.new("TextLabel", v14);
        v16.Name = "UnitLabel";
        v16.Font = Enum.Font.ArialBold;
        v16.FontSize = Enum.FontSize.Size14;
        v16.BackgroundTransparency = 1;
        v16.BorderSizePixel = 0;
        v19 = v16:Clone();
        v19.Parent = v17;
        v12 = Instance.new("Part", game.CoreGui);
        v12.Anchored = true;
        v12.CFrame = CFrame.new();
        v20[1] = Instance.new("LineHandleAdornment", l_CoreGui_0);
        v20[1].Visible = false;
        v20[1].Color3 = v126;
        v20[1].Adornee = v12;
        v20[1].AlwaysOnTop = true;
        v20[1].ZIndex = 5;
        v20[2] = v20[1]:Clone();
        v20[2].Parent = l_CoreGui_0;
        v20[3] = v20[1]:Clone();
        v20[3].Parent = l_CoreGui_0;
        v20[4] = v20[1]:Clone();
        v20[4].Parent = l_CoreGui_0;
        v20[5] = v20[1]:Clone();
        v20[5].Parent = l_CoreGui_0;
        v20[6] = v20[1]:Clone();
        v20[6].Parent = l_CoreGui_0;
        v22[1] = v20[1]:Clone();
        v22[1].Color3 = v128;
        v22[1].Parent = l_CoreGui_0;
        v22[1].Thickness = 2;
        v22[1].Length = 0.6;
        for v168 = 2, 6 do
            v22[v168] = v22[1]:Clone();
            v22[v168].Parent = l_CoreGui_0;
        end;
        v21[1] = Instance.new("ConeHandleAdornment", l_CoreGui_0);
        v21[1].Visible = false;
        v21[1].Color3 = v126;
        v21[1].Adornee = v12;
        v21[1].Height = 0.5;
        v21[1].Radius = 0.1;
        v21[1].AlwaysOnTop = true;
        v21[1].ZIndex = 5;
        v21[2] = v21[1]:Clone();
        v21[2].Parent = l_CoreGui_0;
        v21[3] = v21[1]:Clone();
        v21[3].Parent = l_CoreGui_0;
        v21[4] = v21[1]:Clone();
        v21[4].Parent = l_CoreGui_0;
        v30[1] = Instance.new("ImageLabel", v13);
        v30[1].Visible = false;
        v30[1].BackgroundTransparency = 1;
        v30[1].BorderSizePixel = 0;
        v30[1].Image = "rbxasset://textures/gradient.png";
        for v169 = 2, 8 do
            v30[v169] = v30[1]:Clone();
            v30[v169].Parent = v13;
        end;
    end;
    for _ = 1, 88 do
        local v171 = Instance.new("LineHandleAdornment", l_CoreGui_0);
        v171.Visible = false;
        v171.Adornee = v12;
        v171.AlwaysOnTop = true;
        v171.ZIndex = 2;
        v171.Color3 = v126;
        v171.Thickness = 2;
        table.insert(v23, v171);
    end;
    local v172 = Instance.new("LineHandleAdornment", l_CoreGui_0);
    v172.Length = 2;
    v172.Color3 = v126;
    v172.SizeRelativeOffset = Vector3.new(0, 1, 0);
    v172.CFrame = CFrame.new(Vector3.new(0, -1, 0), (Vector3.new(0, -1, 0)));
    v172.Thickness = 2;
    v7[1] = v172;
    v7[2] = v172:Clone();
    v7[2].Parent = l_CoreGui_0;
    v7[3] = v172:Clone();
    v7[3].Parent = l_CoreGui_0;
    v7[4] = v172:Clone();
    v7[4].Parent = l_CoreGui_0;
    v10 = true;
end;
local function _(v174, v175)
    v5[v174][1].Visible = v175;
    v5[v174][2].Visible = v175;
    if v6[v174] then
        v6[v174].Visible = v175;
    end;
end;
local function _(v177, v178)
    if v178 then
        v177.Position = UDim2.new(0, v178.X, 0, v178.Y);
    end;
end;
local function _(v180, v181, v182)
    if v182 then
        v180.Position = UDim2.new(0, v182.X, 0, v182.Y);
    end;
    v180.Visible = v181;
end;
local function _(v184)
    v20[1].Visible = v184;
    v20[2].Visible = v184;
    v20[3].Visible = v184;
    v21[1].Visible = v184;
    v21[2].Visible = v184;
end;
local function _(v186)
    v20[4].Visible = v186;
    v20[5].Visible = v186;
    v20[6].Visible = v186;
    v21[3].Visible = v186;
    v21[4].Visible = v186;
end;
local _ = function(v188)
    for _, v190 in ipairs(v23) do
        v190.Visible = v188;
    end;
end;
local function _(v192)
    v22[1].Visible = v192;
    v22[2].Visible = v192;
    v22[3].Visible = v192;
    v22[4].Visible = v192;
    v22[5].Visible = v192;
    v22[6].Visible = v192;
end;
local function _(v194, v195)
    v5[v194][1].Adornee = v195;
    v5[v194][2].Adornee = v195;
    if v6[v194] then
        v6[v194].Adornee = v195;
    end;
end;
local function v201(v197)
    for _, v199 in ipairs(v7) do
        v199.Visible = v197;
    end;
    v5[14][1].Visible = v197;
    v5[14][2].Visible = v197;
    if v6[14] then
        v6[14].Visible = v197;
    end;
    for v200 = 1, #v30 do
        v30[v200].Visible = v197;
    end;
end;
local function v205(v202)
    for _, v204 in ipairs(v7) do
        v204.Adornee = v202;
    end;
end;
local function v207(v206)
    v5[1][1].Visible = v206;
    v5[1][2].Visible = v206;
    if v6[1] then
        v6[1].Visible = v206;
    end;
end;
local function v209(v208)
    v5[1][1].Adornee = v208;
    v5[1][2].Adornee = v208;
    if v6[1] then
        v6[1].Adornee = v208;
    end;
end;
local function v211(v210)
    v5[2][1].Visible = v210;
    v5[2][2].Visible = v210;
    if v6[2] then
        v6[2].Visible = v210;
    end;
    v5[3][1].Visible = v210;
    v5[3][2].Visible = v210;
    if v6[3] then
        v6[3].Visible = v210;
    end;
    v5[4][1].Visible = v210;
    v5[4][2].Visible = v210;
    if v6[4] then
        v6[4].Visible = v210;
    end;
    v5[5][1].Visible = v210;
    v5[5][2].Visible = v210;
    if v6[5] then
        v6[5].Visible = v210;
    end;
    v5[6][1].Visible = v210;
    v5[6][2].Visible = v210;
    if v6[6] then
        v6[6].Visible = v210;
    end;
    v5[7][1].Visible = v210;
    v5[7][2].Visible = v210;
    if v6[7] then
        v6[7].Visible = v210;
    end;
    v5[8][1].Visible = v210;
    v5[8][2].Visible = v210;
    if v6[8] then
        v6[8].Visible = v210;
    end;
    v5[9][1].Visible = v210;
    v5[9][2].Visible = v210;
    if v6[9] then
        v6[9].Visible = v210;
    end;
    v5[10][1].Visible = v210;
    v5[10][2].Visible = v210;
    if v6[10] then
        v6[10].Visible = v210;
    end;
end;
local function v213(v212)
    v5[2][1].Adornee = v212;
    v5[2][2].Adornee = v212;
    if v6[2] then
        v6[2].Adornee = v212;
    end;
    v5[3][1].Adornee = v212;
    v5[3][2].Adornee = v212;
    if v6[3] then
        v6[3].Adornee = v212;
    end;
    v5[4][1].Adornee = v212;
    v5[4][2].Adornee = v212;
    if v6[4] then
        v6[4].Adornee = v212;
    end;
    v5[5][1].Adornee = v212;
    v5[5][2].Adornee = v212;
    if v6[5] then
        v6[5].Adornee = v212;
    end;
    v5[6][1].Adornee = v212;
    v5[6][2].Adornee = v212;
    if v6[6] then
        v6[6].Adornee = v212;
    end;
    v5[7][1].Adornee = v212;
    v5[7][2].Adornee = v212;
    if v6[7] then
        v6[7].Adornee = v212;
    end;
    v5[8][1].Adornee = v212;
    v5[8][2].Adornee = v212;
    if v6[8] then
        v6[8].Adornee = v212;
    end;
    v5[9][1].Adornee = v212;
    v5[9][2].Adornee = v212;
    if v6[9] then
        v6[9].Adornee = v212;
    end;
    v5[10][1].Adornee = v212;
    v5[10][2].Adornee = v212;
    if v6[10] then
        v6[10].Adornee = v212;
    end;
end;
local function v215(v214)
    v5[11][1].Visible = v214;
    v5[11][2].Visible = v214;
    if v6[11] then
        v6[11].Visible = v214;
    end;
    v5[12][1].Visible = v214;
    v5[12][2].Visible = v214;
    if v6[12] then
        v6[12].Visible = v214;
    end;
    v5[13][1].Visible = v214;
    v5[13][2].Visible = v214;
    if v6[13] then
        v6[13].Visible = v214;
    end;
end;
local function v217(v216)
    v5[11][1].Adornee = v216;
    v5[11][2].Adornee = v216;
    if v6[11] then
        v6[11].Adornee = v216;
    end;
    v5[12][1].Adornee = v216;
    v5[12][2].Adornee = v216;
    if v6[12] then
        v6[12].Adornee = v216;
    end;
    v5[13][1].Adornee = v216;
    v5[13][2].Adornee = v216;
    if v6[13] then
        v6[13].Adornee = v216;
    end;
end;
local v218 = {};
local v219 = Instance.new("Folder", v9);
v219.Name = "LineGrid";
local function _()
    local l_v219_Children_0 = v219:GetChildren();
    if #l_v219_Children_0 > 0 then
        v3:RecycleObjects(l_v219_Children_0);
    end;
end;
local function _(v222, v223, v224, v225, v226)
    if v226 then
        table.insert(v218, {
            v222, 
            v223, 
            v224, 
            v225, 
            v226
        });
    end;
end;
local function v241()
    local v228 = #v218;
    local v229 = v3:Allocate("LineHandleAdornment", v228, v219);
    for v230 = v228, 1, -1 do
        local v231 = v218[v230];
        v218[v230] = nil;
        local v232, v233, v234, v235, v236 = unpack(v231);
        local v237 = v229[v230];
        local v238 = v236.CFrame:pointToObjectSpace(v232);
        local v239 = v236.CFrame:pointToObjectSpace(v233);
        v237.Length = (v239 - v238).Magnitude;
        v237.CFrame = CFrame.new(v238, v239);
        local v240 = v2.smoothstep(0, 1, v28);
        v237.Color3 = v2.colorAdd(v2.colorMultiply(v129, v240), v2.colorMultiply(v126, 1 - v240));
        v237.Transparency = v234;
        v237.Thickness = (v235 * 1.2) * v240 + v235 * (1 - v240);
        v237.ZIndex = 1;
        v237.Adornee = v236;
    end;
end;
local function v247(v242, v243, v244)
    local v245 = (v244 - v243).magnitude + 1;
    local v246 = (v243 + v244) * 0.5;
    v30[v242].Rotation = math.deg((math.atan2(v244.Y - v243.Y, v244.X - v243.X)));
    v30[v242].Size = UDim2.new(0, v245, 0, 3);
    v30[v242].Position = UDim2.new(0, v246.X - v245 * 0.5, 0, v246.Y);
    v30[v242].Visible = true;
end;
local function v276(v248)
    local v249 = if not v4 then game.Workspace.Camera else game.Workspace.CurrentCamera;
    local l_ViewportSize_0 = v249.ViewportSize;
    local v251 = (-v248.p + v249.CoordinateFrame.p) + ((v249:ScreenPointToRay(l_ViewportSize_0.x * 0.5, l_ViewportSize_0.y * 0.5).Direction * 60) * 10) * 0.5;
    local v252 = v248:pointToWorldSpace((Vector3.new(-10, 0, -10))) + v251;
    local v253 = v248:pointToWorldSpace((Vector3.new(10, 0, -10))) + v251;
    local v254 = v248:pointToWorldSpace((Vector3.new(-10, 0, 10))) + v251;
    local v255 = v248:pointToWorldSpace((Vector3.new(10, 0, 10))) + v251;
    local v256 = v249:WorldToScreenPoint(v252);
    local v257 = v249:WorldToScreenPoint(v253);
    local v258 = v249:WorldToScreenPoint(v254);
    local v259 = v249:WorldToScreenPoint(v255);
    local v260 = 65 / math.max((v256 - v259).Magnitude, (v257 - v258).Magnitude);
    local v261 = l_ViewportSize_0 * 0.5;
    local v262 = Vector3.new(v261.x, v261.y, 0);
    local v263 = Vector2.new(45, 45) - Vector2.new(v261.x, v261.y);
    v256 = v262 + (v256 - v262) * v260;
    v257 = v262 + (v257 - v262) * v260;
    v258 = v262 + (v258 - v262) * v260;
    v259 = v262 + (v259 - v262) * v260;
    local v264 = Vector2.new(v256.x + v263.X, v256.y + v263.Y);
    local v265 = Vector2.new(v257.x + v263.X, v257.y + v263.Y);
    local v266 = Vector2.new(v258.x + v263.X, v258.y + v263.Y);
    local v267 = Vector2.new(v259.x + v263.X, v259.y + v263.Y);
    local v268 = (v264 * 2) / 3 + v265 / 3;
    local v269 = (v265 * 2) / 3 + v264 / 3;
    local v270 = (v264 * 2) / 3 + v266 / 3;
    local v271 = (v266 * 2) / 3 + v264 / 3;
    local v272 = (v265 * 2) / 3 + v267 / 3;
    local v273 = (v267 * 2) / 3 + v265 / 3;
    local v274 = (v266 * 2) / 3 + v267 / 3;
    local v275 = (v267 * 2) / 3 + v266 / 3;
    v247(1, v264, v265);
    v247(2, v265, v267);
    v247(3, v267, v266);
    v247(4, v266, v264);
    v247(5, v268, v274);
    v247(6, v269, v275);
    v247(7, v270, v272);
    v247(8, v271, v273);
end;
local function v316()
    local v277, v278 = v11();
    if v7[1].Visible or v25 then
        local l_Adornee_0 = v7[1].Adornee;
        local v280 = l_Adornee_0.Size / 2;
        local v281 = {};
        local v282 = {};
        local v283 = v1.getMouseLocation();
        local l_Magnitude_0 = (v283 - l_Adornee_0.CFrame:pointToWorldSpace((Vector3.new(0, -v278, 0)))).Magnitude;
        local v285 = v277:toObjectSpace(CFrame.new(l_Adornee_0.CFrame:pointToWorldSpace(-v280))).p * Vector3.new(1, 0, 1);
        local v286 = v277:toObjectSpace(CFrame.new(l_Adornee_0.CFrame:pointToWorldSpace(v280))).p * Vector3.new(1, 0, 1);
        local v287 = math.floor((math.min(v285.x, v286.x)));
        local v288 = math.ceil((math.max(v285.x, v286.x)));
        local v289 = math.floor((math.min(v285.z, v286.z)));
        local v290 = math.ceil((math.max(v285.z, v286.z)));
        v281[1] = 0;
        v282[1] = 0;
        local v291 = (-0.02 * l_Magnitude_0 + 1) + 1;
        local v292 = (-0.006666666666666667 * l_Magnitude_0 + 1.6666666666666667) + 1;
        v291 = math.max(math.min(v291, 0.9), 0);
        v292 = math.max(math.min(v292, 1), 0);
        if not v25 then
            v7[1].SizeRelativeOffset = Vector3.new(1, -1, 1);
            v7[1].CFrame = CFrame.new(Vector3.new(0, 0, 0), (Vector3.new(-1, 0, 0)));
            v7[1].Length = v7[1].Adornee.Size.X;
            v7[2].SizeRelativeOffset = Vector3.new(1, -1, -1);
            v7[2].CFrame = CFrame.new(Vector3.new(0, 0, 0), (Vector3.new(0, 0, 1)));
            v7[2].Length = v7[1].Adornee.Size.Z;
            v7[3].SizeRelativeOffset = Vector3.new(-1, -1, 1);
            v7[3].CFrame = CFrame.new(Vector3.new(0, 0, 0), (Vector3.new(0, 0, -1)));
            v7[3].Length = v7[1].Adornee.Size.Z;
            v7[4].SizeRelativeOffset = Vector3.new(-1, -1, -1);
            v7[4].CFrame = CFrame.new(Vector3.new(0, 0, 0), (Vector3.new(1, 0, 0)));
            v7[4].Length = v7[1].Adornee.Size.X;
            for v293 = v289 - 4, v290 + 4 do
                v281[0] = v287 - 4;
                v281[2] = v293;
                v282[0] = v288 + 4;
                v282[2] = v293;
                local v294 = v293 % 4 == 0;
                local v295 = true;
                if v293 % 16 ~= 0 then
                    v295 = true;
                    if v293 ~= v289 - 4 then
                        v295 = v293 == v290 + 4;
                    end;
                end;
                local v296 = 1 - if not v295 then v294 and v292 or v291 else 1;
                if ((v281[0] <= v282[0] and v281[1] <= v282[1]) and v281[2] <= v282[2]) and v296 < 1 then
                    local v297 = v277:pointToWorldSpace((Vector3.new(v281[0], v281[1], v281[2])));
                    local v298 = v277:pointToWorldSpace((Vector3.new(v282[0], v282[1], v282[2])));
                    local v299 = not v294 and 1.5 or 1.8;
                    if l_Adornee_0 then
                        table.insert(v218, {
                            v297, 
                            v298, 
                            v296, 
                            v299, 
                            l_Adornee_0
                        });
                    end;
                end;
            end;
            for v300 = v287 - 4, v288 + 4 do
                v281[0] = v300;
                v281[2] = v289 - 4;
                v282[0] = v300;
                v282[2] = v290 + 4;
                local v301 = v300 % 4 == 0;
                local v302 = true;
                if v300 % 16 ~= 0 then
                    v302 = true;
                    if v300 ~= v287 - 4 then
                        v302 = v300 == v288 + 4;
                    end;
                end;
                local v303 = 1 - if not v302 then v301 and v292 or v291 else 1;
                if ((v281[0] <= v282[0] and v281[1] <= v282[1]) and v281[2] <= v282[2]) and v303 < 1 then
                    local v304 = v277:pointToWorldSpace((Vector3.new(v281[0], v281[1], v281[2])));
                    local v305 = v277:pointToWorldSpace((Vector3.new(v282[0], v282[1], v282[2])));
                    local v306 = not v301 and 1.5 or 1.8;
                    if l_Adornee_0 then
                        table.insert(v218, {
                            v304, 
                            v305, 
                            v303, 
                            v306, 
                            l_Adornee_0
                        });
                    end;
                end;
            end;
            local v307 = v277:pointToWorldSpace(v277:pointToObjectSpace(l_Adornee_0.CFrame:pointToWorldSpace(v280 * Vector3.new(-1, 0, -1))) * Vector3.new(1, 0, 1));
            local v308 = v277:pointToWorldSpace(v277:pointToObjectSpace(l_Adornee_0.CFrame:pointToWorldSpace(v280 * Vector3.new(-1, 0, 1))) * Vector3.new(1, 0, 1));
            local v309 = v277:pointToWorldSpace(v277:pointToObjectSpace(l_Adornee_0.CFrame:pointToWorldSpace(v280 * Vector3.new(1, 0, -1))) * Vector3.new(1, 0, 1));
            local v310 = v277:pointToWorldSpace(v277:pointToObjectSpace(l_Adornee_0.CFrame:pointToWorldSpace(v280 * Vector3.new(1, 0, 1))) * Vector3.new(1, 0, 1));
            if l_Adornee_0 then
                table.insert(v218, {
                    v307, 
                    v308, 
                    0, 
                    2, 
                    l_Adornee_0
                });
            end;
            if l_Adornee_0 then
                table.insert(v218, {
                    v309, 
                    v310, 
                    0, 
                    2, 
                    l_Adornee_0
                });
            end;
            if l_Adornee_0 then
                table.insert(v218, {
                    v307, 
                    v309, 
                    0, 
                    2, 
                    l_Adornee_0
                });
            end;
            if l_Adornee_0 then
                table.insert(v218, {
                    v308, 
                    v310, 
                    0, 
                    2, 
                    l_Adornee_0
                });
            end;
            local v311 = v3:Allocate("BoxHandleAdornment", 1, v219)[1];
            v311.Size = l_Adornee_0.Size * Vector3.new(1, 0, 1) + Vector3.new(0, (v277:pointToObjectSpace(v283).y / 20) * 0.005, 0);
            local v312 = v277:toObjectSpace(l_Adornee_0.CFrame);
            v311.CFrame = l_Adornee_0.CFrame:toObjectSpace(v277:toWorldSpace(v312 - v312.p * Vector3.new(0, 1, 0)));
            v311.Color3 = v124;
            v311.Transparency = 0.5;
            v311.Adornee = l_Adornee_0;
            v241();
        else
            local l_v219_Children_1 = v219:GetChildren();
            if #l_v219_Children_1 > 0 then
                v3:RecycleObjects(l_v219_Children_1);
            end;
            for _, v315 in ipairs(v7) do
                v315.Visible = false;
            end;
            if v67 then
                v66(v67, v68, v69);
            end;
        end;
        v276(l_Adornee_0.CFrame);
        return ;
    else
        return ;
    end;
end;
local function v320(v317)
    if not v317 or not v317.Adornee then
        return CFrame.new();
    else
        local l_Adornee_1 = v317.Adornee;
        if not (not l_Adornee_1:IsA("Model") or l_Adornee_1:IsA("Workspace")) then
            l_Adornee_1 = v0.convertToPart(l_Adornee_1);
        end;
        local l_CFrame_0 = l_Adornee_1.CFrame;
        return l_CFrame_0 * v317.CFrame + (l_CFrame_0:pointToWorldSpace((v317.SizeRelativeOffset * l_Adornee_1.Size) * 0.5) - l_CFrame_0.p);
    end;
end;
local function v355()
    if v10 then
        if v5 and v5[11] then
            local v321 = v1.getButtonState(v1.Enum.Key.MOUSE_BUTTON1);
            local v322 = game:GetService("Selection"):Get();
            if #v322 <= 0 then
                v5[1][1].Visible = false;
                v5[1][2].Visible = false;
                if v6[1] then
                    v6[1].Visible = false;
                end;
                for _, v324 in ipairs(v7) do
                    v324.Visible = false;
                end;
                v5[14][1].Visible = false;
                v5[14][2].Visible = false;
                if v6[14] then
                    v6[14].Visible = false;
                end;
                for v325 = 1, #v30 do
                    v30[v325].Visible = false;
                end;
                v5[11][1].Visible = false;
                v5[11][2].Visible = false;
                if v6[11] then
                    v6[11].Visible = false;
                end;
                v5[12][1].Visible = false;
                v5[12][2].Visible = false;
                if v6[12] then
                    v6[12].Visible = false;
                end;
                v5[13][1].Visible = false;
                v5[13][2].Visible = false;
                if v6[13] then
                    v6[13].Visible = false;
                end;
                v211(false);
                local l_v219_Children_2 = v219:GetChildren();
                if #l_v219_Children_2 > 0 then
                    v3:RecycleObjects(l_v219_Children_2);
                end;
                return ;
            elseif v5[11][1].Adornee then
                local v327 = false;
                for _, v329 in ipairs(v322) do
                    if not ((not v329:IsA("PVInstance") or v329:IsA("Workspace")) or v329:IsA("Terrain")) then
                        v327 = true;
                        break;
                    end;
                end;
                if v327 then
                    if not v321 then
                        if not v29 then
                            v5[11][1].Visible = true;
                            v5[11][2].Visible = true;
                            if v6[11] then
                                v6[11].Visible = true;
                            end;
                            v5[12][1].Visible = true;
                            v5[12][2].Visible = true;
                            if v6[12] then
                                v6[12].Visible = true;
                            end;
                            v5[13][1].Visible = true;
                            v5[13][2].Visible = true;
                            if v6[13] then
                                v6[13].Visible = true;
                            end;
                            v5[1][1].Visible = true;
                            v5[1][2].Visible = true;
                            if v6[1] then
                                v6[1].Visible = true;
                            end;
                            if not (not (#v322 == 1) or not v322[1]:IsA("BasePart")) then
                                v211(true);
                                if v322[1]:IsA("Part") and v322[1].Shape == Enum.PartType.Ball then
                                    v5[11][1].Visible = false;
                                    v5[11][2].Visible = false;
                                    if v6[11] then
                                        v6[11].Visible = false;
                                    end;
                                    v5[12][1].Visible = false;
                                    v5[12][2].Visible = false;
                                    if v6[12] then
                                        v6[12].Visible = false;
                                    end;
                                    v5[13][1].Visible = false;
                                    v5[13][2].Visible = false;
                                    if v6[13] then
                                        v6[13].Visible = false;
                                    end;
                                    v211(false);
                                    v5[6][1].Visible = true;
                                    v5[6][2].Visible = true;
                                    if v6[6] then
                                        v6[6].Visible = true;
                                    end;
                                end;
                            end;
                        end;
                    elseif not (v31 ~= 11 and v31 ~= 12) or v31 == 13 then
                        v5[11][1].Visible = false;
                        v5[11][2].Visible = false;
                        if v6[11] then
                            v6[11].Visible = false;
                        end;
                        v5[12][1].Visible = false;
                        v5[12][2].Visible = false;
                        if v6[12] then
                            v6[12].Visible = false;
                        end;
                        v5[13][1].Visible = false;
                        v5[13][2].Visible = false;
                        if v6[13] then
                            v6[13].Visible = false;
                        end;
                        v211(false);
                        v5[1][1].Visible = false;
                        v5[1][2].Visible = false;
                        if v6[1] then
                            v6[1].Visible = false;
                        end;
                    elseif not (((((((v31 ~= 2 and v31 ~= 3) and v31 ~= 4) and v31 ~= 5) and v31 ~= 6) and v31 ~= 7) and v31 ~= 8) and v31 ~= 9) or v31 == 10 then
                        v5[11][1].Visible = false;
                        v5[11][2].Visible = false;
                        if v6[11] then
                            v6[11].Visible = false;
                        end;
                        v5[12][1].Visible = false;
                        v5[12][2].Visible = false;
                        if v6[12] then
                            v6[12].Visible = false;
                        end;
                        v5[13][1].Visible = false;
                        v5[13][2].Visible = false;
                        if v6[13] then
                            v6[13].Visible = false;
                        end;
                        v5[1][1].Visible = false;
                        v5[1][2].Visible = false;
                        if v6[1] then
                            v6[1].Visible = false;
                        end;
                        v211(false);
                        local l_v31_0 = v31;
                        v5[l_v31_0][1].Visible = true;
                        v5[l_v31_0][2].Visible = true;
                        if v6[l_v31_0] then
                            v6[l_v31_0].Visible = true;
                        end;
                    elseif v31 == 1 then
                        v5[1][1].Visible = true;
                        v5[1][2].Visible = true;
                        if v6[1] then
                            v6[1].Visible = true;
                        end;
                        v5[11][1].Visible = false;
                        v5[11][2].Visible = false;
                        if v6[11] then
                            v6[11].Visible = false;
                        end;
                        v5[12][1].Visible = false;
                        v5[12][2].Visible = false;
                        if v6[12] then
                            v6[12].Visible = false;
                        end;
                        v5[13][1].Visible = false;
                        v5[13][2].Visible = false;
                        if v6[13] then
                            v6[13].Visible = false;
                        end;
                        v211(false);
                    elseif v31 == 14 then
                        v5[11][1].Visible = false;
                        v5[11][2].Visible = false;
                        if v6[11] then
                            v6[11].Visible = false;
                        end;
                        v5[12][1].Visible = false;
                        v5[12][2].Visible = false;
                        if v6[12] then
                            v6[12].Visible = false;
                        end;
                        v5[13][1].Visible = false;
                        v5[13][2].Visible = false;
                        if v6[13] then
                            v6[13].Visible = false;
                        end;
                        v5[1][1].Visible = false;
                        v5[1][2].Visible = false;
                        if v6[1] then
                            v6[1].Visible = false;
                        end;
                        v211(false);
                    end;
                    local l_Adornee_2 = v5[11][1].Adornee;
                    local l_p_0 = game.Workspace.CurrentCamera.CoordinateFrame.p;
                    local l_Unit_0 = l_Adornee_2.CFrame:pointToObjectSpace(l_p_0).Unit;
                    local v334 = l_Unit_0 / Vector3.new(math.abs(l_Unit_0.X), math.abs(l_Unit_0.Y), (math.abs(l_Unit_0.Z)));
                    v334 = Vector3.new(v334.X == v334.X and v334.X or 1, v334.Y == v334.Y and v334.Y or 1, v334.Z == v334.Z and v334.Z or 1);
                    local l_Unit_1 = v5[1][1].Adornee.CFrame:pointToObjectSpace(l_p_0).Unit;
                    local v336 = l_Unit_1 / Vector3.new(math.abs(l_Unit_1.X), math.abs(l_Unit_1.Y), (math.abs(l_Unit_1.Z)));
                    local v337 = math.max(l_Adornee_2.CFrame:pointToObjectSpace(l_p_0).Magnitude / 15, 1) * 0.35;
                    if not v321 then
                        v5[1][1].SizeRelativeOffset = Vector3.new(0, v336.Y, 0);
                        v5[1][1].CFrame = CFrame.new(Vector3.new(0, ((v336.Y * v337) * 2) / 0.35, 0), (Vector3.new(0, ((v336.Y * v337) * 2) / 0.35 + v336.Y, 0)));
                        v5[1][2].SizeRelativeOffset = Vector3.new(0, v336.Y, 0);
                        v5[1][2].CFrame = v5[1][1].CFrame + Vector3.new(0, (v5[1][1].Height / 2 - v5[1][2].Height / 1.75) * v336.Y, 0);
                        v33 = v334.Y;
                        v5[6][1].SizeRelativeOffset = Vector3.new(0, v334.Y, 0);
                        v5[6][2].SizeRelativeOffset = Vector3.new(0, v334.Y, 0);
                        v6[6].SizeRelativeOffset = Vector3.new(0, v334.Y, 0);
                    end;
                    v5[11][2].SizeRelativeOffset = Vector3.new(v334.X, v334.Y, -v334.Z);
                    v5[11][2].CFrame = CFrame.new(Vector3.new(v334.X * v337, v334.Y * v337, 0), (Vector3.new(v334.X * v337, v334.Y * v337, v334.Z)));
                    v5[11][2].CFrame = v5[11][2].CFrame * CFrame.Angles(0, 0, (((v334.X > 0 and 1.5707963267948966 or 0) + (v334.Y > 0 and 0 or 1.5707963267948966)) + (v334.Z > 0 and 0 or (v334.Y > 0 and -1.5707963267948966 or 1.5707963267948966))) * (v334.X > 0 and 1 or -1));
                    v24[3].Visible = false;
                    v5[11][1].Visible = false;
                    if v31 == 11 then
                        local v338 = l_Adornee_2.Size.Z + 2;
                        v24[3].Adornee = l_Adornee_2;
                        v24[3].CFrame = CFrame.new((Vector3.new(0, 0, v338 * 0.5)));
                        v24[3].Length = v338;
                        v24[3].Visible = true;
                        if not v321 then
                            v5[11][1].SizeRelativeOffset = v5[11][2].SizeRelativeOffset;
                            v5[11][1].CFrame = v5[11][2].CFrame;
                            v5[11][1].Visible = true;
                            v5[11][2].CFrame = v5[11][2].CFrame + Vector3.new(0, 0, (v334.Z * 0.075) * v337);
                        end;
                    end;
                    v5[12][2].SizeRelativeOffset = Vector3.new(v334.X, -v334.Y, v334.Z);
                    v5[12][2].CFrame = CFrame.new(Vector3.new(v334.X * (v337 + 0.2), 0, v334.Z * (v337 + 0.2)), (Vector3.new(v334.X * (v337 + 0.2), v334.Y, v334.Z * (v337 + 0.2))));
                    v5[12][2].CFrame = v5[12][2].CFrame * CFrame.Angles(0, 0, (((v334.X > 0 and 1.5707963267948966 or 0) + (v334.Z > 0 and 1.5707963267948966 or 0)) + (v334.Y > 0 and 0 or (v334.Z > 0 and -1.5707963267948966 or 1.5707963267948966))) * (v334.X > 0 and 1 or -1) - 1.5707963267948966);
                    v24[2].Visible = false;
                    v5[12][1].Visible = false;
                    if v31 == 12 then
                        local v339 = l_Adornee_2.Size.Y + 2;
                        v24[2].Adornee = l_Adornee_2;
                        v24[2].CFrame = CFrame.new((Vector3.new(0, -v339 * 0.5, 0))) * CFrame.Angles(1.5707963267948966, 0, 0);
                        v24[2].Length = v339;
                        v24[2].Visible = true;
                        if not v321 then
                            v5[12][1].SizeRelativeOffset = v5[12][2].SizeRelativeOffset;
                            v5[12][1].CFrame = v5[12][2].CFrame;
                            v5[12][1].Visible = true;
                            v5[12][2].CFrame = v5[12][2].CFrame + Vector3.new(0, (v334.Y * 0.075) * v337, 0);
                        end;
                    end;
                    v5[13][2].SizeRelativeOffset = Vector3.new(-v334.X, v334.Y, v334.Z);
                    v5[13][2].CFrame = CFrame.new(Vector3.new(0, v334.Y * v337, v334.Z * v337), (Vector3.new(v334.X, v334.Y * v337, v334.Z * v337)));
                    v5[13][2].CFrame = v5[13][2].CFrame * CFrame.Angles(0, 0, (((v334.Z > 0 and 1.5707963267948966 or 0) + (v334.Y > 0 and 0 or 1.5707963267948966)) + if v334.X > 0 then v334.Y > 0 and -1.5707963267948966 or 1.5707963267948966 else 0) * (v334.Z > 0 and 1 or -1));
                    v24[1].Visible = false;
                    v5[13][1].Visible = false;
                    if v31 == 13 then
                        local v340 = l_Adornee_2.Size.X + 2;
                        v24[1].Adornee = l_Adornee_2;
                        v24[1].CFrame = CFrame.new((Vector3.new(v340 * 0.5, 0, 0))) * CFrame.Angles(0, 1.5707963267948966, 0);
                        v24[1].Length = v340;
                        v24[1].Visible = true;
                        if not v321 then
                            v5[13][1].SizeRelativeOffset = v5[13][2].SizeRelativeOffset;
                            v5[13][1].CFrame = v5[13][2].CFrame;
                            v5[13][1].Visible = true;
                            v5[13][2].CFrame = v5[13][2].CFrame + Vector3.new((v334.X * 0.075) * v337, 0, 0);
                        end;
                    end;
                    for v341, v342 in pairs(v5) do
                        if not (v341 == 14) then
                            local l_p_1 = v320(v342[2]).p;
                            if not v342[1]:IsA("BoxHandleAdornment") then
                                if not v342[1]:IsA("ConeHandleAdornment") then
                                    if v342[1]:IsA("ImageHandleAdornment") then
                                        local v344 = math.max((l_p_1 - l_p_0).Magnitude / 30 + 1, 1);
                                        v342[1].Size = v342[6] * v344;
                                        v342[2].Size = v342[7] * v344;
                                    end;
                                else
                                    local v345 = math.max((l_p_1 - l_p_0).Magnitude / 15, 1);
                                    v342[1].Height = v342[6].X * v345;
                                    v342[1].Radius = v342[6].Y * v345;
                                    v342[2].Height = v342[7].X * v345;
                                    v342[2].Radius = v342[7].Y * v345;
                                end;
                            else
                                local v346 = math.max((l_p_1 - l_p_0).Magnitude / 10, 1);
                                v342[1].Size = v342[6] * v346;
                                v342[2].Size = v342[7] * v346;
                                if v6[v341] then
                                    v6[v341].Size = v342[6] * v346;
                                end;
                                local v347 = v320(v342[1]).p - l_p_0;
                                local _, v349 = game.Workspace:FindPartOnRay((Ray.new(l_p_0, v347)));
                                if v347.magnitude - 0.2 <= (v349 - l_p_0).magnitude then
                                    v342[1].AlwaysOnTop = true;
                                    v342[2].AlwaysOnTop = true;
                                else
                                    v342[1].AlwaysOnTop = false;
                                    v342[2].AlwaysOnTop = false;
                                end;
                            end;
                        end;
                    end;
                    local v350 = nil;
                    if not v27 and not v29 then
                        if v28 > 0 then
                            v28 = math.max(v28 - 0.1, 0);
                            v350 = v2.smoothstep(0, 1, v28);
                        end;
                    elseif v28 < 1 then
                        v28 = math.min(v28 + 0.1, 1);
                        v350 = v2.smoothstep(0, 1, v28);
                    end;
                    if v350 then
                        v5[14][2].ImageColor3 = v2.colorAdd(v2.colorMultiply(v5[14][4][1], v350), (v2.colorMultiply(v5[14][5][1], 1 - v350)));
                        v5[14][2].ImageTransparency = v350 * v5[14][4][2] + (1 - v350) * v5[14][5][2];
                        for v351 = 1, 8 do
                            v30[v351].ImageColor3 = v2.colorAdd(v2.colorMultiply(v126, v350), v2.colorMultiply(v127, 1 - v350));
                        end;
                    end;
                    if v29 then
                        v5[14][2].ImageColor3 = v130;
                        v5[14][2].ImageTransparency = 0;
                    end;
                    v316();
                    return ;
                else
                    v5[1][1].Visible = false;
                    v5[1][2].Visible = false;
                    if v6[1] then
                        v6[1].Visible = false;
                    end;
                    for _, v353 in ipairs(v7) do
                        v353.Visible = false;
                    end;
                    v5[14][1].Visible = false;
                    v5[14][2].Visible = false;
                    if v6[14] then
                        v6[14].Visible = false;
                    end;
                    for v354 = 1, #v30 do
                        v30[v354].Visible = false;
                    end;
                    v5[11][1].Visible = false;
                    v5[11][2].Visible = false;
                    if v6[11] then
                        v6[11].Visible = false;
                    end;
                    v5[12][1].Visible = false;
                    v5[12][2].Visible = false;
                    if v6[12] then
                        v6[12].Visible = false;
                    end;
                    v5[13][1].Visible = false;
                    v5[13][2].Visible = false;
                    if v6[13] then
                        v6[13].Visible = false;
                    end;
                    v211(false);
                    return ;
                end;
            else
                return ;
            end;
        else
            return ;
        end;
    else
        return ;
    end;
end;
local function v356()
    return v5[v31];
end;
local function v358(v357)
    v11 = v357;
end;
local function v359()
    return v31;
end;
local function v361(v360)
    v31 = v360;
end;
local function v370(v362, v363, v364)
    v48(v21[1], v21[2], v20[1], v20[2], v20[3], v362, v363, v364);
    v39(v14, v15, v16, string.format("%.2f", (v362 - v363).magnitude), 1);
    v20[1].Visible = true;
    v20[2].Visible = true;
    v20[3].Visible = true;
    v21[1].Visible = true;
    v21[2].Visible = true;
    local v365 = (v362 + v363) / 2 + v364;
    if not v4 then
        local l_v14_0 = v14;
        local v367 = game.Workspace.Camera:WorldToScreenPoint(v365);
        if v367 then
            l_v14_0.Position = UDim2.new(0, v367.X, 0, v367.Y);
        end;
        l_v14_0.Visible = true;
        return ;
    else
        local l_v14_1 = v14;
        local v369 = game.Workspace.CurrentCamera:WorldToScreenPoint(v365);
        if v369 then
            l_v14_1.Position = UDim2.new(0, v369.X, 0, v369.Y);
        end;
        l_v14_1.Visible = true;
        return ;
    end;
end;
local function v379(v371, v372, v373)
    v48(v21[3], v21[4], v20[4], v20[5], v20[6], v371, v372, v373);
    v39(v17, v18, v19, string.format("%.2f", (v371 - v372).magnitude), 1);
    v20[4].Visible = true;
    v20[5].Visible = true;
    v20[6].Visible = true;
    v21[3].Visible = true;
    v21[4].Visible = true;
    local v374 = (v371 + v372) / 2 + v373;
    if not v4 then
        local l_v17_0 = v17;
        local v376 = game.Workspace.Camera:WorldToScreenPoint(v374);
        if v376 then
            l_v17_0.Position = UDim2.new(0, v376.X, 0, v376.Y);
        end;
        l_v17_0.Visible = true;
        return ;
    else
        local l_v17_1 = v17;
        local v378 = game.Workspace.CurrentCamera:WorldToScreenPoint(v374);
        if v378 then
            l_v17_1.Position = UDim2.new(0, v378.X, 0, v378.Y);
        end;
        l_v17_1.Visible = true;
        return ;
    end;
end;
local function v391(v380, v381, v382, v383)
    v26 = (v380.p - v383).magnitude < v381;
    if not v26 then
        v382 = math.floor(v382);
    end;
    if v382 > 180 then
        v382 = v382 - 360;
    elseif v382 < -180 then
        v382 = v382 + 360;
    end;
    v81(v380, v381, v382);
    for _, v385 in ipairs(v23) do
        v385.Visible = true;
    end;
    v39(v14, v15, v16, string.format(not v26 and "%d" or "%.1f", -v382), 2);
    local l_p_2 = (v380 * CFrame.Angles(0, 0, (math.rad(v382 + 180)))):toWorldSpace(CFrame.new((Vector3.new(v381, 0, 0)))).p;
    if not v4 then
        local l_v14_2 = v14;
        local v388 = game.Workspace.Camera:WorldToScreenPoint(l_p_2);
        if v388 then
            l_v14_2.Position = UDim2.new(0, v388.X, 0, v388.Y);
        end;
        l_v14_2.Visible = true;
        return ;
    else
        local l_v14_3 = v14;
        local v390 = game.Workspace.CurrentCamera:WorldToScreenPoint(l_p_2);
        if v390 then
            l_v14_3.Position = UDim2.new(0, v390.X, 0, v390.Y);
        end;
        l_v14_3.Visible = true;
        return ;
    end;
end;
local function v393(v392)
    v83(v392);
    v22[1].Visible = true;
    v22[2].Visible = true;
    v22[3].Visible = true;
    v22[4].Visible = true;
    v22[5].Visible = true;
    v22[6].Visible = true;
end;
local function v397()
    v14.Visible = false;
    v17.Visible = false;
    v20[1].Visible = false;
    v20[2].Visible = false;
    v20[3].Visible = false;
    v21[1].Visible = false;
    v21[2].Visible = false;
    v20[4].Visible = false;
    v20[5].Visible = false;
    v20[6].Visible = false;
    v21[3].Visible = false;
    v21[4].Visible = false;
    for _, v395 in ipairs(v23) do
        v395.Visible = false;
    end;
    v22[1].Visible = false;
    v22[2].Visible = false;
    v22[3].Visible = false;
    v22[4].Visible = false;
    v22[5].Visible = false;
    v22[6].Visible = false;
    local l_v49_Children_2 = v49:GetChildren();
    if #l_v49_Children_2 > 0 then
        v3:RecycleObjects(l_v49_Children_2);
    end;
    v25 = false;
end;
local function v399(v398)
    v5[11][1].Visible = v398;
    v5[11][2].Visible = v398;
    if v6[11] then
        v6[11].Visible = v398;
    end;
    v5[12][1].Visible = v398;
    v5[12][2].Visible = v398;
    if v6[12] then
        v6[12].Visible = v398;
    end;
    v5[13][1].Visible = v398;
    v5[13][2].Visible = v398;
    if v6[13] then
        v6[13].Visible = v398;
    end;
    v5[1][1].Visible = v398;
    v5[1][2].Visible = v398;
    if v6[1] then
        v6[1].Visible = v398;
    end;
    v211(v398);
end;
local function v401(v400)
    if v6[v400] then
        v6[v400].Color3 = Color3.new(0, 0, 0);
        v6[v400].Transparency = 0.7;
    end;
end;
local function v402()
    return v29;
end;
local function v404(v403)
    v29 = v403;
    v27 = v403;
end;
local function v424()
    v10 = false;
    for _, v406 in pairs(v5) do
        v406[1]:Destroy();
        if v406[2] then
            v406[2]:Destroy();
        end;
    end;
    v5 = {};
    for _, v408 in pairs(v6) do
        v408:Destroy();
    end;
    v6 = {};
    for _, v410 in pairs(v7) do
        v410:Destroy();
    end;
    v7 = {};
    for _, v412 in pairs(v30) do
        v412:Destroy();
    end;
    v30 = {};
    for _, v414 in pairs(v23) do
        v414:Destroy();
    end;
    v23 = {};
    for _, v416 in pairs(v20) do
        v416:Destroy();
    end;
    v20 = {};
    for _, v418 in pairs(v22) do
        v418:Destroy();
    end;
    v22 = {};
    for _, v420 in pairs(v21) do
        v420:Destroy();
    end;
    v21 = {};
    v13:Destroy();
    v13 = nil;
    for _, v422 in pairs(v24) do
        v422.Parent = nil;
    end;
    v12:Destroy();
    v12 = nil;
    local l_v219_Children_3 = v219:GetChildren();
    if #l_v219_Children_3 > 0 then
        v3:RecycleObjects(l_v219_Children_3);
    end;
end;
local function v425()
end;
local function v429()
    v397();
    if not v85 and v31 ~= 0 then
        if v31 == 14 then
            v27 = false;
        else
            v5[v31][2].Color3 = v5[v31][5][1];
            v5[v31][2].Transparency = v5[v31][5][2];
            local l_v31_1 = v31;
            if v6[l_v31_1] then
                v6[l_v31_1].Color3 = Color3.new(0, 0, 0);
                v6[l_v31_1].Transparency = 0.7;
            end;
        end;
        v31 = 0;
        for v427, _ in pairs(v32) do
            v31 = v427;
            break;
        end;
    end;
    if v31 ~= 14 then
        v29 = false;
        v27 = false;
    end;
end;
return {
    initializeAdorns = v173, 
    destroyAdorns = v424, 
    adornInstanceWithTranslate = v209, 
    adornInstanceWithScale = v213, 
    adornInstanceWithRotate = v217, 
    adornInstanceWithPlane = v205, 
    updateAdornmentPositions = v355, 
    setPlaneVisibility = v201, 
    setAllAdornVisibility = v399, 
    setRotateAdornVisibility = v215, 
    setTranslateAdornVisibility = v207, 
    setScaleAdornVisibility = v211, 
    getCurrentAdornment = v356, 
    scaleOne = v370, 
    scaleTwo = v379, 
    showRotate = v391, 
    clearExtraAdorns = v397, 
    hoverLeaveHandle = v94, 
    drawPlaneCenter = v393, 
    setWorkplaneAccessor = v358, 
    resetShadow = v401, 
    getCurrentHandle = v359, 
    setCurrentHandle = v361, 
    isPlaneSelectingModeOn = v402, 
    setPlaneSelectingMode = v404, 
    getAdornmentWorldCFrame = v320, 
    grabHandle = v425, 
    releaseHandle = v429, 
    isOverPlaneSelect = function()
        if v32[14] then
            local v430 = v5[14][1];
            local v431 = v430.AbsolutePosition - v430.AbsoluteSize / 2;
            local v432 = v430.AbsolutePosition + v430.AbsoluteSize / 2;
            local v433 = v1.getMouse();
            local l_X_0 = v433.X;
            local l_Y_0 = v433.Y;
            if not (l_X_0 >= v431.X) or v432.X < l_X_0 then
                return false;
            else
                local v436 = false;
                if v431.Y < l_Y_0 then
                    v436 = l_Y_0 < v432.Y;
                end;
                return v436;
            end;
        else
            return false;
        end;
    end, 
    getYScale = function()
        return v33;
    end, 
    resetDragger = function()
        for v437 = 1, 13 do
            v5[v437][2].Color3 = v5[v437][5][1];
            v5[v437][2].Transparency = v5[v437][5][2];
            if v6[v437] then
                v6[v437].Color3 = Color3.new(0, 0, 0);
                v6[v437].Transparency = 0.7;
            end;
        end;
        v429();
        v5[11][1].Visible = false;
        v5[11][2].Visible = false;
        if v6[11] then
            v6[11].Visible = false;
        end;
        v5[12][1].Visible = false;
        v5[12][2].Visible = false;
        if v6[12] then
            v6[12].Visible = false;
        end;
        v5[13][1].Visible = false;
        v5[13][2].Visible = false;
        if v6[13] then
            v6[13].Visible = false;
        end;
        v5[1][1].Visible = false;
        v5[1][2].Visible = false;
        if v6[1] then
            v6[1].Visible = false;
        end;
        v211(false);
        v32 = {};
        v31 = 0;
        v85 = false;
        v29 = false;
    end
};
