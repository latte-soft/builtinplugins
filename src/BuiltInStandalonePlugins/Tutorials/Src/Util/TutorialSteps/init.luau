local v0 = {};
for _, v2 in ipairs(script:GetChildren()) do
    if v2:IsA("ModuleScript") then
        local v3 = require(v2);
        if v3.kind then
            v0[v3.kind] = v3;
        end;
    end;
end;
return v0;
