local l_Workspace_0 = game:GetService("Workspace");
local l_Parent_0 = script.Parent.Parent.Parent;
local v2 = require(l_Parent_0.Packages.Roact);
local v3 = require(l_Parent_0.Packages.DraggerFramework.Utility.BoundingBox);
local v4 = require(l_Parent_0.Src.Utility.AlignmentMode);
local v5 = require(l_Parent_0.Src.Utility.AlignmentSpace);
local v6 = require(l_Parent_0.Src.Utility.getDefaultBasisForObjects);
local v7 = Color3.fromRGB(253, 244, 161);
local v8 = Vector3.new(1, 1, 1);
local v9 = Vector3.new(1, 1, 1);
local v10 = Vector3.new();
local v11 = CFrame.fromMatrix(v10, Vector3.new(-1, 0, 0), (Vector3.new(0, 1, 0)));
local v12 = {
    Vector3.new(0.5, 0.5, 0.5), 
    Vector3.new(-0.5, 0.5, 0.5), 
    Vector3.new(-0.5, -0.5, 0.5), 
    Vector3.new(0.5, -0.5, 0.5), 
    Vector3.new(0.5, 0.5, -0.5), 
    Vector3.new(-0.5, 0.5, -0.5), 
    Vector3.new(-0.5, -0.5, -0.5), 
    (Vector3.new(0.5, -0.5, -0.5))
};
local v13 = {
    {
        v12[1], 
        v12[2]
    }, 
    {
        v12[2], 
        v12[3]
    }, 
    {
        v12[3], 
        v12[4]
    }, 
    {
        v12[4], 
        v12[1]
    }, 
    {
        v12[5], 
        v12[6]
    }, 
    {
        v12[6], 
        v12[7]
    }, 
    {
        v12[7], 
        v12[8]
    }, 
    {
        v12[8], 
        v12[5]
    }, 
    {
        v12[1], 
        v12[5]
    }, 
    {
        v12[2], 
        v12[6]
    }, 
    {
        v12[3], 
        v12[7]
    }, 
    {
        v12[4], 
        v12[8]
    }
};
local function _(v14)
    return ((not v14.X and 0 or 1) + (not v14.Y and 0 or 1)) + (not v14.Z and 0 or 1);
end;
getNormal = function(v16)
    return (Vector3.new(not v16.X and 0 or 1, not v16.Y and 0 or 1, not v16.Z and 0 or 1));
end;
getDirection = function(v17)
    return v9 - getNormal(v17);
end;
rotateVector = function(v18)
    return (Vector3.new(v18.Z, v18.X, v18.Y));
end;
getSmallestObjectSize = function(v19)
    local l_huge_0 = math.huge;
    for _, v22 in pairs(v19) do
        l_huge_0 = math.min(l_huge_0, v22.size.Magnitude);
    end;
    return l_huge_0;
end;
getModifiedSize = function(v23)
    if v23 < 10 then
        return v23;
    elseif v23 < 110 then
        return 10 + ((v23 - 10) / 100) * 12;
    else
        return 22;
    end;
end;
local function v30(v24, _, _, v27, v28)
    local v29 = v28 * 0.05;
    v24.SphereNormal = v2.createElement("SphereHandleAdornment", {
        Adornee = l_Workspace_0.Terrain, 
        Radius = v29, 
        Color3 = v7, 
        CFrame = CFrame.new(v27), 
        ZIndex = 0
    });
    v24.SphereOnTop = v2.createElement("SphereHandleAdornment", {
        Adornee = l_Workspace_0.Terrain, 
        Radius = v29, 
        AlwaysOnTop = true, 
        Transparency = 0.3, 
        Color3 = v7, 
        CFrame = CFrame.new(v27), 
        ZIndex = 0
    });
end;
local function v45(v31, v32, v33, v34, v35, v36)
    local v37 = (v33 * v35).Magnitude + 1;
    local v38 = v32:VectorToWorldSpace(v35);
    local v39 = (0.5 * v37) * v38;
    v34 = v34 - v32:PointToObjectSpace(v34):Dot(v35) * v38;
    local v40 = CFrame.lookAt(v34, v34 - v39);
    local v41 = 0.01 * v36;
    v31.MainLineNormal = v2.createElement("CylinderHandleAdornment", {
        Adornee = l_Workspace_0.Terrain, 
        Height = v37, 
        Radius = v41, 
        Color3 = v7, 
        CFrame = v40, 
        ZIndex = 1
    });
    v31.MainLineOnTop = v2.createElement("CylinderHandleAdornment", {
        Adornee = l_Workspace_0.Terrain, 
        Height = v37, 
        Radius = v41, 
        AlwaysOnTop = true, 
        Transparency = 0.3, 
        Color3 = v7, 
        CFrame = v40, 
        ZIndex = 1
    });
    local v42 = 0.03 * v36;
    local v43 = 0.1 * v36;
    local v44 = CFrame.new(0, 0, (v37 * 0.5 + v43) - 0.0325 * v36);
    v31.Cone1 = v2.createElement("ConeHandleAdornment", {
        Adornee = l_Workspace_0.Terrain, 
        Height = v43, 
        Radius = v42, 
        Color3 = v7, 
        ZIndex = 1, 
        CFrame = v40 * v44
    });
    v31.Cone2 = v2.createElement("ConeHandleAdornment", {
        Adornee = l_Workspace_0.Terrain, 
        Height = v43, 
        Radius = v42, 
        Color3 = v7, 
        ZIndex = 1, 
        CFrame = (v40 * v11) * v44
    });
end;
local function v58(v46, v47, v48, v49, v50)
    local v51 = v9 - v50;
    local v52 = v47:PointToObjectSpace(v49) * (v50 * Vector3.new(1.001, 1.001, 1.001));
    v48 = (v48 + v8) * v51;
    v47 = v47 * CFrame.new(v52);
    v46.Plane = v2.createElement("BoxHandleAdornment", {
        Adornee = l_Workspace_0.Terrain, 
        Size = v48, 
        CFrame = v47, 
        Transparency = 0.3, 
        Color3 = v7, 
        ZIndex = 0
    });
    local v53 = rotateVector(v50);
    local v54 = rotateVector(v53);
    for v55 = 1, 4 do
        local l_Magnitude_0 = (v54 * v48).Magnitude;
        v46["Line" .. v55] = v2.createElement("LineHandleAdornment", {
            Adornee = l_Workspace_0.Terrain, 
            Length = l_Magnitude_0, 
            CFrame = (v47 * CFrame.fromMatrix(v10, v53, v50)) * CFrame.new(0.5 * (v53 * v48).Magnitude, 0, 0.5 * l_Magnitude_0), 
            AlwaysOnTop = true, 
            Thickness = 3, 
            Color3 = v7, 
            ZIndex = 0
        });
        local l_v54_0 = v54;
        v54 = -v53;
        v53 = l_v54_0;
    end;
end;
local v59 = {
    "EdgeA", 
    "EdgeB", 
    "EdgeC", 
    "EdgeD", 
    "EdgeE", 
    "EdgeF", 
    "EdgeG", 
    "EdgeH", 
    "EdgeI", 
    "EdgeJ", 
    "EdgeK", 
    "EdgeL"
};
local function v67(v60, v61, v62)
    for v63, v64 in pairs(v13) do
        local v65 = v61:PointToWorldSpace(v62 * v64[1]);
        local v66 = v61:PointToWorldSpace(v62 * v64[2]);
        v60[v59[v63]] = v2.createElement("LineHandleAdornment", {
            Adornee = l_Workspace_0.Terrain, 
            ZIndex = 0, 
            Thickness = 1, 
            Length = (v66 - v65).Magnitude, 
            CFrame = CFrame.lookAt(v65, v66), 
            Color3 = v7
        });
    end;
end;
return function(v68, v69, v70, v71, v72)
    if #v68 == 0 then
        return nil;
    else
        local v73 = nil;
        v73 = if v69 == v5.Local then v6(not not v72 and {
            v72
        } or v68) else CFrame.new();
        local v74, v75, v76 = v3.fromObjectsComputeAll(v68, v73);
        local v77 = nil;
        local v78 = nil;
        if not v72 then
            v77 = v73:PointToWorldSpace(v74);
            v78 = v73:VectorToWorldSpace(v75);
        else
            local v79 = v76[v72];
            v77 = v73:PointToWorldSpace(v79.offset);
            v78 = v73:VectorToWorldSpace(v79.size);
        end;
        local v80 = nil;
        v80 = if v71 == v4.Min then v77 - 0.5 * v78 else if v71 == v4.Max then v77 + 0.5 * v78 else v77;
        local v81 = ((not v70.X and 0 or 1) + (not v70.Y and 0 or 1)) + (not v70.Z and 0 or 1);
        local v82 = v73 * CFrame.new(v74);
        local v83 = {};
        if v81 == 3 then
            v30(v83, v82, v75, v80, getModifiedSize(getSmallestObjectSize(v76)));
        elseif v81 == 2 then
            v45(v83, v82, v75, v80, getDirection(v70), getModifiedSize(getSmallestObjectSize(v76)));
        elseif v81 == 1 then
            v58(v83, v82, v75, v80, getNormal(v70));
        end;
        v67(v83, v82, v75);
        return v2.createFragment(v83);
    end;
end;
