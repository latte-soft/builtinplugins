local v0 = require(script.Parent.Adornments);
local v1 = nil;
local v2 = {};
local v3 = {};
local v4 = false;
local v5 = nil;
local function v6(v7)
    if not v7:IsA("BasePart") then
        local l_v7_Children_0 = v7:GetChildren();
        for v9 = 1, #l_v7_Children_0 do
            local v10 = v6(l_v7_Children_0[v9]);
            if v10 then
                return v10;
            end;
        end;
        return nil;
    else
        return v7.CFrame;
    end;
end;
local function v11(v12, v13, v14, v15)
    local l_v12_Children_0 = v12:GetChildren();
    local l_CurrentCamera_0 = workspace.CurrentCamera;
    local v18 = v15 or {};
    for _, v20 in ipairs(l_v12_Children_0) do
        local v21 = nil;
        local v22 = false;
        if not v20:IsA("BasePart") then
            if not v20:IsA("Model") or v20:IsA("Workspace") then
                if not v20:IsA("Tool") then
                    if v20:IsA("Folder") then
                        v11(v20, v13, v14, v18);
                    end;
                else
                    v21 = v6(v20) and v21.p;
                    v22 = false;
                end;
            else
                v21 = if not v20.PrimaryPart then v20:GetModelCFrame().p else v20:GetPrimaryPartCFrame().p;
                v22 = false;
            end;
        else
            v21 = v20.CFrame.p;
            v22 = v20.Locked;
        end;
        if v21 and l_CurrentCamera_0.CoordinateFrame:pointToObjectSpace(v21).Z < 0 then
            local v23 = l_CurrentCamera_0:WorldToScreenPoint(v21);
            if (((not v22 and v23.X < math.max(v13.X, v14.X)) and math.min(v13.X, v14.X) < v23.X) and v23.Y < math.max(v13.Y, v14.Y)) and math.min(v13.Y, v14.Y) < v23.Y then
                table.insert(v18, v20);
            end;
        end;
    end;
    return v18;
end;
local function v24()
    return v4;
end;
startRubberbandDrag = function(v25)
    v4 = true;
    v0.setPlaneVisibility(false);
    v5 = v25;
    v3 = {};
    if not v1 then
        v1 = Instance.new("ScreenGui", game:GetService("CoreGui"));
        v2[1] = Instance.new("Frame", v1);
        v2[1].BorderSizePixel = 0;
        v2[1].BackgroundColor3 = Color3.new(0, 0, 0);
        v2[2] = Instance.new("Frame", v1);
        v2[2].BorderSizePixel = 0;
        v2[2].BackgroundColor3 = Color3.new(0, 0, 0);
        v2[3] = Instance.new("Frame", v1);
        v2[3].BorderSizePixel = 0;
        v2[3].BackgroundColor3 = Color3.new(0, 0, 0);
        v2[4] = Instance.new("Frame", v1);
        v2[4].BorderSizePixel = 0;
        v2[4].BackgroundColor3 = Color3.new(0, 0, 0);
    end;
end;
finishRubberbandDrag = function()
    if v4 then
        v4 = false;
        game:GetService("Selection"):Set(v3);
        v5 = nil;
        if v1 then
            v1:Destroy();
            v1 = nil;
        end;
        return ;
    else
        return ;
    end;
end;
updateRubberBand = function(v26)
    if v4 then
        local v27 = v26.X - v5.X;
        local v28 = v26.Y - v5.Y;
        v2[1].Size = UDim2.new(0, 2, 0, v28 + 2);
        v2[2].Size = UDim2.new(0, 2, 0, v28 + 2);
        v2[3].Size = UDim2.new(0, v27 + 2, 0, 2);
        v2[4].Size = UDim2.new(0, v27 + 2, 0, 2);
        v2[1].Position = UDim2.new(0, v5.X, 0, v5.Y);
        v2[2].Position = UDim2.new(0, v5.X + v27, 0, v5.Y);
        v2[3].Position = UDim2.new(0, v5.X, 0, v5.Y);
        v2[4].Position = UDim2.new(0, v5.X, 0, v5.Y + v28);
        v3 = v11(workspace, v5, v26);
        if #game:GetService("Selection"):Get() ~= #v3 then
            game:GetService("Selection"):Set(v3);
        end;
        return ;
    else
        return ;
    end;
end;
return {
    isRubberBandDragInProgress = v24, 
    startRubberbandDrag = startRubberbandDrag, 
    finishRubberbandDrag = finishRubberbandDrag, 
    updateRubberBand = updateRubberBand
};
