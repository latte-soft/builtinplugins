local l_script_FirstAncestor_0 = script:FindFirstAncestor("TerrainEditor");
local v1 = require(l_script_FirstAncestor_0.Src.Util.getBinarySearchedSize);
local v2 = require(l_script_FirstAncestor_0.Src.Resources.Constants);
local _ = require(l_script_FirstAncestor_0.Src.Flags.getFFlagTerrainEditorGenerationFeature);
local v4 = {};
v4.__index = v4;
v4.new = function(v5, v6)
    return (setmetatable({
        _draggerContext = v5, 
        _max = if not v6 then nil else v6.Max, 
        _volume = if (not not v6 and v6.Max) and v6.UseVolume then (v6.Max.X * v6.Max.Y) * v6.Max.Z else nil
    }, v4));
end;
v4.getBoundingBox = function(_, _, v9)
    return v9:getBoundingBox();
end;
v4.shouldScaleFromCenter = function(v10, _, _, _)
    return v10._draggerContext:isCtrlKeyDown();
end;
v4.axesToScale = function(v14, _, v16)
    if not v14._draggerContext:isShiftKeyDown() then
        return ({
            {
                X = true
            }, 
            {
                Y = true
            }, 
            {
                Z = true
            }
        })[v16];
    else
        return {
            X = true, 
            Y = true, 
            Z = true
        };
    end;
end;
v4.getMinMaxSizes = function(v17, v18, v19, v20)
    local v21 = Vector3.one * 4;
    local v22 = v17._max or (Vector3.one * 4096) * 4;
    if v17._volume then
        if not (not v18 or not v19) and v20 then
            if (not v19.X or not v19.Y) or not v19.Z then
                if not v19.X then
                    if not v19.Y then
                        if v19.Z then
                            local l_X_0 = v20.X;
                            local l_Y_0 = v20.Y;
                            v22 = Vector3.new(l_X_0, l_Y_0, v17._volume / (l_X_0 * l_Y_0));
                        end;
                    else
                        local l_X_1 = v20.X;
                        local l_Z_0 = v20.Z;
                        v22 = Vector3.new(l_X_1, v17._volume / (l_X_1 * l_Z_0), l_Z_0);
                    end;
                else
                    local l_Y_1 = v20.Y;
                    local l_Z_1 = v20.Z;
                    v22 = Vector3.new(v17._volume / (l_Y_1 * l_Z_1), l_Y_1, l_Z_1);
                end;
            else
                v22 = v1(v20, v17._volume);
            end;
        else
            return v21, v17._calculatedMax;
        end;
    end;
    v22 = v22:Min(Vector3.one * v2.MaxRegion);
    v17._calculatedMin = v21;
    v17._calculatedMax = v22;
    return v21, v22;
end;
v4.beginScale = function(v29, v30, v31, _)
    local v33, _, v35 = v29:getBoundingBox(v30, v31);
    v29._originalBoundingBoxCFrame = v33;
    v29._originalBoundingBoxSize = v35;
end;
v4.updateScale = function(v36, v37, v38)
    local v39 = v36._originalBoundingBoxCFrame + v36._originalBoundingBoxCFrame.Rotation * v38;
    local v40 = v36._originalBoundingBoxSize + v37;
    local v41, v42 = v36:getMinMaxSizes();
    if ((((v40.X <= v42.X and v40.Y <= v42.Y) and v40.Z <= v42.Z) and v41.X <= v40.X) and v41.Y <= v40.Y) and v41.Z <= v40.Z then
        v36._draggerContext.updateRegion(v39, v40);
        return v37, v38;
    elseif not (v37.X >= 0 and v37.Y >= 0) or v37.Z < 0 then
        return v37, Vector3.zero;
    else
        return Vector3.zero, Vector3.zero;
    end;
end;
v4.getPriority = function(_)
    return 1;
end;
v4.endScale = function(_)
end;
v4.render = function(_, _, _)
end;
return v4;
