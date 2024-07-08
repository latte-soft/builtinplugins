local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Src.Util.Orientation);
local v2 = require(l_Parent_0.Packages.Roact);
local v3 = require(l_Parent_0.Src.Util.mockContext);
local v4 = require(l_Parent_0.Packages.Cryo);
local l_RunService_0 = game:GetService("RunService");
local v25 = {
    withTestComponent = function(v6, v7, v8)
        local l_9SliceEditorMockGui_0 = game.CoreGui:FindFirstChild("9SliceEditorMockGui");
        if l_9SliceEditorMockGui_0 then
            l_9SliceEditorMockGui_0:Destroy();
        end;
        local l_ScreenGui_0 = Instance.new("ScreenGui");
        l_ScreenGui_0.Name = "9SliceEditorMockGui";
        l_ScreenGui_0.Parent = game.CoreGui;
        local v11 = v2.mount(v3(v2.createElement(v6, v7)), l_ScreenGui_0);
        v8(l_ScreenGui_0, function(v12)
            v2.update(v11, v3(v2.createElement(v6, v4.Dictionary.join(v7, v12))));
        end);
        v2.unmount(v11);
        l_ScreenGui_0.Parent = nil;
        l_ScreenGui_0:Destroy();
    end, 
    numericalArrayFuzzyEquality = function(v13, v14, v15)
        if #v13 ~= #v14 then
            return false;
        else
            v15 = v15 or 1.0E-4;
            for v16 = 1, #v13 do
                if not (type(v13[v16]) == "number") or type(v14[v16]) ~= "number" then
                    return false;
                elseif v15 < math.abs(v13[v16] - v14[v16]) then
                    return false;
                end;
            end;
            return true;
        end;
    end, 
    waitForHeartbeat = function(v17)
        v17 = v17 or 10;
        local v18 = 0;
        local v19 = l_RunService_0.Heartbeat:Connect(function()
            v18 = v18 + 1;
        end);
        local v20 = tick();
        while tick() < v20 + v17 and v18 < 10 do
            wait();
        end;
        v19:Disconnect();
    end, 
    findFirstDescendantWhichIsA = function(v21, v22)
        for _, v24 in ipairs((v21:GetDescendants())) do
            if v24.ClassName == v22 then
                return v24;
            end;
        end;
        return nil;
    end
};
local v26 = v1.Left.rawValue();
local v27 = v1.Right.rawValue();
local v28 = v1.Top.rawValue();
local v29 = v1.Bottom.rawValue();
v25.getOffsetsFromSliceRect = function(v30, v31)
    return {
        v30[v26], 
        v31.x - v30[v27], 
        v30[v28], 
        v31.y - v30[v29]
    };
end;
v25.getSliceRectFromOffsets = function(v32, v33)
    return {
        v32[v26], 
        v33.x - v32[v27], 
        v32[v28], 
        v33.y - v32[v29]
    };
end;
v25.getSliceRectFromSliceCenterRect = function(v34)
    return {
        v34.Min.X, 
        v34.Max.X, 
        v34.Min.Y, 
        v34.Max.Y
    };
end;
v25.getSliceCenterRectFromSliceRect = function(v35)
    return Rect.new(v35[v26], v35[v28], v35[v27], v35[v29]);
end;
return v25;
