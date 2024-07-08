local v0 = require(script.Parent.Utility);
local v1 = require(script.Parent.List);
local function v6(v2, v3, v4, v5)
    if not v5 then
        v2.CFrame = v2.CFrame + v3;
    else
        v2.TranslateFromTo(v2.CFrame, v2.CFrame + v3);
    end;
    return v4 + v3;
end;
local function v7(v8, v9, v10, v11, v12, v13)
    if math.abs(v11) < 1.0E-4 then
        return ;
    else
        while true do
            if v1.itemsHasItemNotInList(v8:GetTouchingParts(), v9) then
                searchOut(v8, v9, v10, v11 * -0.5, v12, v13);
                return ;
            else
                v13 = v8.CFrame.p;
                if v8.CFrame.p + v10.Unit * v11 == v12 then
                    v7(v8, v9, v10, v11 * 0.5, v12, v13);
                    return ;
                else
                    local v14 = v10.Unit * v11;
                    local v15 = Vector3.new(0, 0, 0);
                    v8.CFrame = v8.CFrame + v14;
                    local _ = v15 + v14;
                end;
            end;
        end;
    end;
end;
searchOut = function(v17, v18, v19, v20, v21, v22)
    if math.abs(v20) < 1.0E-4 then
        v17.CFrame = (v17.CFrame - v17.CFrame.p) + v22;
        return ;
    else
        while true do
            if not v1.itemsHasItemNotInList(v17:GetTouchingParts(), v18) then
                v7(v17, v18, v19, v20 * -0.5, v21, v22);
                return ;
            else
                v21 = v17.CFrame.p;
                if v22 and v17.CFrame.p + v19.Unit * v20 == v22 then
                    searchOut(v17, v18, v19, v20 * 0.5, v21, v22);
                    return ;
                else
                    local v23 = v19.Unit * v20;
                    local v24 = Vector3.new(0, 0, 0);
                    v17.CFrame = v17.CFrame + v23;
                    local _ = v24 + v23;
                end;
            end;
        end;
    end;
end;
local function v38(v26, v27)
    local v28 = v26.CFrame:pointToObjectSpace(v27.Origin);
    local l_Unit_0 = (v26.CFrame:pointToObjectSpace(v27.Origin + v27.Direction) - v28).Unit;
    local v30 = v26.Size / 2;
    local v31 = (l_Unit_0 / Vector3.new(math.abs(l_Unit_0.X), math.abs(l_Unit_0.Y), (math.abs(l_Unit_0.Z)))) * v30;
    if (v31 * 2 - v28).Magnitude < v28.Magnitude then
        return nil;
    else
        local v32 = Vector3.new(v31.X, ((v31.X - v28.X) / l_Unit_0.X) * l_Unit_0.Y + v28.Y, ((v31.X - v28.X) / l_Unit_0.X) * l_Unit_0.Z + v28.Z);
        local v33 = Vector3.new(((v31.Y - v28.Y) / l_Unit_0.Y) * l_Unit_0.X + v28.X, v31.Y, ((v31.Y - v28.Y) / l_Unit_0.Y) * l_Unit_0.Z + v28.Z);
        local v34 = Vector3.new(((v31.Z - v28.Z) / l_Unit_0.Z) * l_Unit_0.X + v28.X, ((v31.Z - v28.Z) / l_Unit_0.Z) * l_Unit_0.Y + v28.Y, v31.Z);
        local v35 = (((v32.Y <= v30.Y and -v30.Y <= v32.Y) and v32.Z <= v30.Z) and -v30.Z <= v32.Z) and (v32 - v28).Magnitude or 10000;
        local v36 = (((v33.X <= v30.X and -v30.X <= v33.X) and v33.Z <= v30.Z) and -v30.Z <= v33.Z) and (v33 - v28).Magnitude or 10000;
        local v37 = v0.min(v35, v36, (((v34.X <= v30.X and -v30.X <= v34.X) and v34.Y <= v30.Y) and -v30.Y <= v34.Y) and (v34 - v28).Magnitude or 10000);
        if v37 == 10000 then
            return nil;
        elseif v37 == v35 then
            return v26.CFrame:pointToWorldSpace(v32);
        elseif v37 == v36 then
            return v26.CFrame:pointToWorldSpace(v33);
        else
            return v26.CFrame:pointToWorldSpace(v34);
        end;
    end;
end;
local function v51(v39, _, v41, v42)
    local v43 = v1.filterOutItems(v41, v39:GetTouchingParts());
    local v44 = Ray.new(v39.CFrame.p, v42.Unit);
    local v45 = nil;
    local v46 = 0;
    for _, v48 in ipairs(v43) do
        local v49 = v38(v48, v44);
        if v49 then
            local l_Magnitude_0 = (v49 - v39.CFrame.p).Magnitude;
            if v46 < l_Magnitude_0 then
                v46 = l_Magnitude_0;
                v45 = v49;
            end;
        end;
    end;
    if v45 then
        v39.CFrame = (v39.CFrame - v39.CFrame.p) + v45;
    end;
end;
local function v58(v52, v53, v54)
    if v54.magnitude == 0 then
        return ;
    else
        local v55 = v1.filterOutItems(v53, v52:GetTouchingParts());
        if not (not (#v55 > 0) or not v1.listDoesNotContainType(v55, "Terrain")) then
            local v56 = true;
            while v56 do
                v51(v52, 0.002, v53, v54);
                local v57 = v1.filterOutItems(v55, v1.filterOutItems(v53, v52:GetTouchingParts()));
                if #v57 == 0 then
                    v56 = false;
                else
                    v55 = v1.combineLists(v55, v57);
                end;
            end;
            searchOut(v52, v53, v54 * -1, 0 - math.min(v52.Size.X / 2, v52.Size.Y / 2, v52.Size.Z / 2), v52.CFrame.p, nil);
        end;
        return ;
    end;
end;
local function v59(v60, v61, v62, v63, v64, v65, v66, v67)
    if v66 > 13 then
        return ;
    elseif v64 <= 2.0E-4 then
        return ;
    else
        local v68 = v63.Unit * v64;
        local l_v62_0 = v62;
        if not v67 then
            v60.CFrame = v60.CFrame + v68;
        else
            v60.TranslateFromTo(v60.CFrame, v60.CFrame + v68);
        end;
        v62 = l_v62_0 + v68;
        if v62 ~= v62 then
            return ;
        elseif not v1.itemsHasItemNotInList(v60:GetTouchingParts(), v61) then
            v59(v60, v61, v62, v63, v64, v65, v66 + 1, v67);
            return ;
        else
            v68 = v63.Unit * -v64;
            l_v62_0 = v62;
            if not v67 then
                v60.CFrame = v60.CFrame + v68;
            else
                v60.TranslateFromTo(v60.CFrame, v60.CFrame + v68);
            end;
            v59(v60, v61, l_v62_0 + v68, v63, v64 * 0.5, v65, v66 + 1, v67);
            return ;
        end;
    end;
end;
local function v70(v71, v72, v73, v74, v75, v76)
    if v73.Magnitude > 1000 then
        return ;
    else
        local l_Unit_1 = v74.Unit;
        local l_v73_0 = v73;
        if not v76 then
            v71.CFrame = v71.CFrame + l_Unit_1;
        else
            v71.TranslateFromTo(v71.CFrame, v71.CFrame + l_Unit_1);
        end;
        v73 = l_v73_0 + l_Unit_1;
        if v73 ~= v73 then
            return ;
        elseif not v1.itemsHasItemNotInList(v71:GetTouchingParts(), v72) then
            v59(v71, v72, v73, v74 * -1, 0.5, v75, 0, v76);
            return ;
        else
            v70(v71, v72, v73, v74, v75, v76);
            return ;
        end;
    end;
end;
local function _(v79, v80, v81, v82, v83)
    if v1.itemsHasItemNotInList(v79:GetTouchingParts(), v80) then
        v70(v79, v80, Vector3.new(0, 0, 0), v81 * -1, v82, v83);
    end;
end;
local function v85(v86, v87, v88, v89, v90, v91, v92)
    local l_Magnitude_1 = v88.Magnitude;
    if l_Magnitude_1 > 1000 then
        return false;
    else
        local l_Unit_2 = v89.Unit;
        local l_v88_0 = v88;
        if not v92 then
            v86.CFrame = v86.CFrame + l_Unit_2;
        else
            v86.TranslateFromTo(v86.CFrame, v86.CFrame + l_Unit_2);
        end;
        v88 = l_v88_0 + l_Unit_2;
        if v88 ~= v88 then
            return false;
        elseif not v1.itemsHasItemNotInList(v86:GetTouchingParts(), v87) then
            if v91 < l_Magnitude_1 + 1 then
                return false;
            else
                return v85(v86, v87, v88, v89, v90, v91, v92);
            end;
        else
            if v1.itemsHasItemNotInList(v86:GetTouchingParts(), v87) then
                v70(v86, v87, Vector3.new(0, 0, 0), v89 * -1, v90, v92);
            end;
            return true;
        end;
    end;
end;
return {
    SafeMove = v58, 
    MovePrimitivesDelta = v6, 
    moveUntilCollide = function(v96, v97, v98, v99, v100)
        if v1.itemsHasItemNotInList(v96:GetTouchingParts(), v97) then
            return false;
        else
            return v85(v96, v97, Vector3.new(0, 0, 0), v98, v99, v100);
        end;
    end, 
    moveUntilCollideMetapart = function(v101, v102, v103, v104)
        if v1.itemsHasItemNotInList(v101:GetTouchingParts(), v102) then
            return false;
        else
            return v85(v101, v102, Vector3.new(0, 0, 0), v103, 2.0E-4, v104, true);
        end;
    end
};
