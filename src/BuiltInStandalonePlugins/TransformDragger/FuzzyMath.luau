local v0 = require(script.Parent.Round);
fuzzyCompare = function(v1, v2, v3)
    if not v3 then
        v3 = 1.0E-4;
    end;
    if v1 - v3 <= v2 and v2 <= v1 + v3 then
        return true;
    else
        return false;
    end;
end;
fuzzyCompareVector3 = function(v4, v5, v6)
    if (not fuzzyCompare(v4.x, v5.x, v6) or not fuzzyCompare(v4.y, v5.y, v6)) or not fuzzyCompare(v4.z, v5.z, v6) then
        return false;
    else
        return true;
    end;
end;
fuzzyCompareCFrame = function(v7, v8, v9)
    local _, _, _, v13, v14, v15, v16, v17, v18, v19, v20, v21 = v7:components();
    local _, _, _, v25, v26, v27, v28, v29, v30, v31, v32, v33 = v8:components();
    if (((((((not fuzzyCompare(v13, v25, v9) or not fuzzyCompare(v14, v26, v9)) or not fuzzyCompare(v15, v27, v9)) or not fuzzyCompare(v16, v28, v9)) or not fuzzyCompare(v17, v29, v9)) or not fuzzyCompare(v18, v30, v9)) or not fuzzyCompare(v19, v31, v9)) or not fuzzyCompare(v20, v32, v9)) or not fuzzyCompare(v21, v33, v9) then
        return false;
    else
        return true;
    end;
end;
fuzzyRound = function(v34)
    return v0.roundToNearest(v34, 1.0E-4);
end;
visiblyIdentityCFrame = function(v35, _)
    local _, _, _, v40, v41, v42, v43, v44, v45, v46, v47, v48 = v35:components();
    local v49 = false;
    local v50 = false;
    local v51 = false;
    if not fuzzyCompare(math.abs(v40), 1) then
        if not fuzzyCompare(v40, 0) then
            return false;
        end;
    elseif not v49 then
        v49 = true;
    else
        return false;
    end;
    if not fuzzyCompare(math.abs(v41), 1) then
        if not fuzzyCompare(v41, 0) then
            return false;
        end;
    elseif not v49 then
        v49 = true;
    else
        return false;
    end;
    if not fuzzyCompare(math.abs(v42), 1) then
        if not fuzzyCompare(v42, 0) then
            return false;
        end;
    elseif not v49 then
        v49 = true;
    else
        return false;
    end;
    if v49 then
        if not fuzzyCompare(math.abs(v43), 1) then
            if not fuzzyCompare(v43, 0) then
                return false;
            end;
        elseif not v50 then
            v50 = true;
        else
            return false;
        end;
        if not fuzzyCompare(math.abs(v44), 1) then
            if not fuzzyCompare(v44, 0) then
                return false;
            end;
        elseif not v50 then
            v50 = true;
        else
            return false;
        end;
        if not fuzzyCompare(math.abs(v45), 1) then
            if not fuzzyCompare(v45, 0) then
                return false;
            end;
        elseif not v50 then
            v50 = true;
        else
            return false;
        end;
        if v50 then
            if not fuzzyCompare(math.abs(v46), 1) then
                if not fuzzyCompare(v46, 0) then
                    return false;
                end;
            elseif not v51 then
                v51 = true;
            else
                return false;
            end;
            if not fuzzyCompare(math.abs(v47), 1) then
                if not fuzzyCompare(v47, 0) then
                    return false;
                end;
            elseif not v51 then
                v51 = true;
            else
                return false;
            end;
            if not fuzzyCompare(math.abs(v48), 1) then
                if not fuzzyCompare(v48, 0) then
                    return false;
                end;
            elseif not v51 then
                v51 = true;
            else
                return false;
            end;
            if v51 then
                return true;
            else
                return false;
            end;
        else
            return false;
        end;
    else
        return false;
    end;
end;
return {
    fuzzyCompare = fuzzyCompare, 
    fuzzyCompareVector3 = fuzzyCompareVector3, 
    visiblyIdentityCFrame = visiblyIdentityCFrame
};
