local l_script_FirstAncestor_0 = script:FindFirstAncestor("AvatarCompatibilityPreviewer");
local v1 = require(l_script_FirstAncestor_0.Packages.React);
local v2 = require(l_script_FirstAncestor_0.Src.Util.OriginalLimbContext);
local v3 = require(l_script_FirstAncestor_0.Src.Util.filterDescendants);
local v4 = require(l_script_FirstAncestor_0.Src.Util.Constants);
local _ = require(l_script_FirstAncestor_0.Src.Types);
local function v10(v6, v7)
    for _, v9 in v7:GetDescendants() do
        if v9:IsA("BasePart") then
            v6.markLimbAsOriginal(v9);
        end;
    end;
end;
return function(v11, v12)
    local v13, v14 = v1.useState(nil);
    local v15 = v1.useRef(v13);
    local v16 = v1.useContext(v2);
    v1.useEffect(function()
        v14(nil);
    end, {
        v11
    });
    v1.useEffect(function()
        if v13 == nil and v15.current ~= nil then
            v15.current.Parent = nil;
            return ;
        else
            v15.current = v13;
            return ;
        end;
    end, {
        v13
    });
    v1.useEffect(function()
        local l_current_0 = v15.current;
        if l_current_0 ~= nil and l_current_0:IsDescendantOf(game) then
            assert(l_current_0 ~= nil, v4.LUAU_ANALYZE_ERROR);
            task.spawn(function()
                l_current_0.Humanoid:ApplyDescription(v12);
            end);
            return nil;
        else
            local v18 = v11:Clone();
            v10(v16, v18);
            v3(v18, v4.ALL_ALLOWED_PART_NAMES);
            v14(v18);
            if v18:IsDescendantOf(game) then
                return nil;
            else
                local v19 = nil;
                v19 = v18.AncestryChanged:Connect(function()
                    if v18:IsDescendantOf(game) then
                        v19:Disconnect();
                        v18.Humanoid:ApplyDescription(v12);
                    end;
                end);
                return function()
                    v19:Disconnect();
                end;
            end;
        end;
    end, {
        v11, 
        v12
    });
    return v13;
end;
