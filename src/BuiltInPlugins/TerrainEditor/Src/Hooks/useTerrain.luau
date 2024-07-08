local l_useState_0 = require(script:FindFirstAncestor("TerrainEditor").Packages.React).useState;
return function(v1, v2)
    local v3 = nil;
    if not v1 then
        v3 = game.Workspace.Terrain;
    elseif not v2 then
        v3 = {};
    else
        return ;
    end;
    return (l_useState_0(v3));
end;
