local v0 = {};
local l_Parent_0 = script.Parent.Parent.Parent;
local v2 = require(script.Parent.Stats);
local v3 = require(l_Parent_0.Src.Flags.getFFlagZoomToExtentsApi);
local l_Util_0 = l_Parent_0.Src.Util;
local v5 = require(l_Util_0.Utils);
local v6 = require(l_Util_0.Constants);
local v7 = require(l_Parent_0.Packages.TestLoader);
v0.fetchAllTexturesFromWorkspace = function()
    if not v7.isCli() then
        local v8 = {};
        local v9 = {};
        local v10 = v2.fetchTextureSizes();
        for _, v12 in pairs(game.Workspace:GetDescendants()) do
            local v13 = v6.INSTANCE_PROPERTIES_TO_PARSE[v12.ClassName];
            if v13 then
                for _, v15 in ipairs(v13) do
                    local v16 = v12[v15];
                    if v16 and #v16 > 0 then
                        if v8[v16] == nil then
                            v8[v16] = 1;
                            v9[v16] = {
                                v12
                            };
                        else
                            v8[v16] = v8[v16] + 1;
                            table.insert(v9[v16], v12);
                        end;
                    end;
                end;
            end;
        end;
        local v17 = {};
        for v18, v19 in pairs(v8) do
            local v20 = nil;
            local v21 = nil;
            if string.match(v18, "%d") == nil then
                v21 = v18;
                v20 = v21;
            else
                v21 = v5.parseIdFromTextureAlias(v18);
                v20 = "rbxassetid://" .. v21;
            end;
            table.insert(v17, {
                Texture = v20, 
                Id = v21, 
                Size = not not v10[v21] and v10[v21] or 0, 
                Count = v19, 
                Instances = v9[v18], 
                ZoomedInstanceIndex = 0
            });
        end;
        table.sort(v17, function(v22, v23)
            if v22.Size == v23.Size then
                if v22.Count == v23.Count then
                    return v23.Id < v22.Id;
                else
                    return v23.Count < v22.Count;
                end;
            else
                return v23.Size < v22.Size;
            end;
        end);
        return v17;
    else
        return {};
    end;
end;
v0.replaceAllTexturesWithId = function(v24, v25)
    for _, v27 in pairs(game.Workspace:GetDescendants()) do
        local v28 = v6.INSTANCE_PROPERTIES_TO_PARSE[v27.ClassName];
        if v28 then
            for _, v30 in ipairs(v28) do
                local v31 = v27[v30];
                if v5.doesTextureAliasContainId(v31) and v5.parseIdFromTextureAlias(v31) == v24 then
                    v27[v30] = v25;
                elseif v31 == v24 then
                    v27[v30] = v25;
                end;
            end;
        end;
    end;
end;
local function _(v32, v33)
    local l_ViewportSize_0 = v33.ViewportSize;
    return (v32.Magnitude / 2) / math.sin((math.atan(math.tan((math.rad(v33.FieldOfView / 2))) * math.min(1, l_ViewportSize_0.X / l_ViewportSize_0.Y))));
end;
v0.zoomToExtentsAndSelectInstance = function(v36, v37)
    local v38 = nil;
    local v39 = nil;
    local l_status_0, _ = pcall(function()
        local l_v37_0 = v37;
        if not l_v37_0:IsA("BasePart") then
            l_v37_0 = l_v37_0:FindFirstAncestorWhichIsA("BasePart");
        end;
        v38 = not not l_v37_0:IsA("Model") and l_v37_0:GetModelCFrame() or l_v37_0.CFrame;
        v39 = not not l_v37_0:IsA("Model") and l_v37_0:GetExtentsSize() or l_v37_0.Size;
    end);
    if l_status_0 then
        if not v3() then
            v36.CameraType = Enum.CameraType.Fixed;
            local l_v39_0 = v39;
            local l_ViewportSize_1 = v36.ViewportSize;
            local v45 = (l_v39_0.Magnitude / 2) / math.sin((math.atan(math.tan((math.rad(v36.FieldOfView / 2))) * math.min(1, l_ViewportSize_1.X / l_ViewportSize_1.Y))));
            l_v39_0 = v36.CFrame;
            v36.CFrame = ((l_v39_0 - l_v39_0.p) + v38.p) - l_v39_0.LookVector * v45;
            v36.Focus = v38;
        else
            v36:zoomToExtents(v38, v39);
        end;
        return true;
    else
        return nil;
    end;
end;
return v0;
