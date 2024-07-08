local l_Parent_0 = script.Parent.Parent.Parent;
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_find_0 = require(l_Parent_0.Packages.Dash).find;
local function v10(v3, v4)
    if not v4:FindFirstChild(v3) then
        local l__Index_0 = l_Parent_0.Packages._Index;
        local v6 = v3 .. "-";
        local v9 = l_find_0(l__Index_0:GetChildren(), function(v7)
            local v8 = true;
            if v7.Name ~= v3 then
                v8 = v7.Name:sub(1, #v6) == v6;
            end;
            return v8;
        end);
        if v9 then
            v9:FindFirstChild(v3):Clone().Parent = v4;
        end;
        return ;
    else
        return ;
    end;
end;
return function()
    local l_Packages_0 = l_ReplicatedStorage_0:FindFirstChild("Packages");
    if not l_Packages_0 then
        l_Packages_0 = Instance.new("Folder");
        l_Packages_0.Name = "Packages";
        l_Packages_0.Parent = l_ReplicatedStorage_0;
    end;
    v10("Dash", l_Packages_0);
    v10("DeveloperTools", l_Packages_0);
end;
