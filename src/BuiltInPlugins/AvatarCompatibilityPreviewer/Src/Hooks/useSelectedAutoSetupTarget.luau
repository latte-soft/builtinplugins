local l_script_FirstAncestor_0 = script:FindFirstAncestor("AvatarCompatibilityPreviewer");
local _ = require(l_script_FirstAncestor_0.Src.Types);
local v2 = require(l_script_FirstAncestor_0.Src.Util.Constants);
local v3 = require(l_script_FirstAncestor_0.Src.Hooks.useRememberLastValue);
local v4 = require(l_script_FirstAncestor_0.Src.Hooks.useTransformedSelectedInstance);
local v5 = {};
local function _(v6)
    if not v6:IsA("MeshPart") or not v6.Name:lower():match((("%*$"):format(v2.BODY_MESH_SUFFIX))) then
        return nil;
    else
        return v6;
    end;
end;
return function()
    local v8 = v3();
    local v9 = v3();
    return v4(function(v10)
        local v11 = if not not v10:IsA("MeshPart") and v10.Name:lower():match((("%*$"):format(v2.BODY_MESH_SUFFIX))) then v10 else nil;
        if v11 ~= nil then
            return {
                bodies = v8({
                    v11
                }), 
                otherChildren = v5
            };
        else
            if v10:IsA("Model") then
                local v12 = {
                    bodies = {}, 
                    otherChildren = {}, 
                    intendedName = v10.Name
                };
                for _, v14 in v10:GetChildren() do
                    local v15 = if not not v14:IsA("MeshPart") and v14.Name:lower():match((("%*$"):format(v2.BODY_MESH_SUFFIX))) then v14 else nil;
                    if v15 ~= nil then
                        table.insert(v12.bodies, v15);
                    else
                        table.insert(v12.otherChildren, v14);
                    end;
                end;
                v12.bodies = v8(v12.bodies);
                v12.otherChildren = v9(v12.otherChildren);
                if #v12.bodies > 0 then
                    return v12;
                end;
            end;
            return nil;
        end;
    end);
end;
