local l_script_FirstAncestor_0 = script:FindFirstAncestor("MaterialGenerator");
local v1 = require(l_script_FirstAncestor_0.Packages.Dash);
local _ = require(l_script_FirstAncestor_0.Src.Types);
return function(v3, v4, v5, v6)
    local v7 = v6[1];
    local v8 = {
        materialVariants = v3, 
        promptText = v4, 
        filteredPromptText = v5
    };
    if v7 and v7.promptText == v4 then
        v1.append(v8.materialVariants, v7.materialVariants);
        return v1.append({
            v8
        }, v1.slice(v6, 2));
    else
        return v1.append({
            v8
        }, v6);
    end;
end;
