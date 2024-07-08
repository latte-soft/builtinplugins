local l_script_FirstAncestor_0 = script:FindFirstAncestor("AssetImporter");
local v1 = require(l_script_FirstAncestor_0.Packages.Roact);
local v2 = require(l_script_FirstAncestor_0.Src.Components.Dialogs.TeachingCallout);
return function(v3, v4, v5)
    local v6 = {};
    for _, v8 in v3, nil, nil do
        if v8.ShouldShow(v5) then
            v6[v8.Name] = v1.createElement(v2, {
                DefinitionId = v8.Name, 
                LocationId = v4
            });
        end;
    end;
    return v6;
end;
