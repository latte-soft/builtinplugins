local l_Selection_0 = game:GetService("Selection");
local l_Signal_0 = require(script.Parent.Parent.Parent.Packages.Framework).Util.Signal;
local v2 = require(script.Parent.AxisLockedDragger);
local l_EnumItems_0 = Enum.NormalId:GetEnumItems();
local v4 = {};
v4.__index = v4;
v4.new = function(v5, v6)
    local v7 = setmetatable({
        _mouse = v5, 
        _target = v6, 
        _position = Vector3.new(), 
        _size = Vector3.new(4, 4, 4), 
        _onSizeChanged = l_Signal_0.new()
    }, v4);
    assert(v7._mouse, "Mouse missing in LargeVoxelRegionPreview");
    local function _(v8, v9)
        return function(v10)
            if not (not v7._adorns or not v7._adorns[v8]) and v7._adorns[v9] then
                local v11 = v7._adorns[v8]:getPosition();
                local v12 = v7._adorns[v9]:getPosition();
                local v13 = v11 - v12;
                local v14 = v13.Unit:Dot(v10 - v12);
                if v14 < 4 then
                    return v12 + v13.Unit * 4;
                elseif v14 > 16000 then
                    return v12 + v13.Unit * 16000;
                else
                    v7._position = (v10 + v12) / 2;
                    local v15 = v10 - v12;
                    local l_Magnitude_0 = v15.Magnitude;
                    v7._size = Vector3.new(v15.x ~= 0 and l_Magnitude_0 or v7._size.x, v15.y ~= 0 and l_Magnitude_0 or v7._size.y, v15.z ~= 0 and l_Magnitude_0 or v7._size.z);
                    v7._onSizeChanged:Fire(v7._size, v7._position);
                    v7:updateBlockMesh();
                    v7:updateAdorns();
                    return v10;
                end;
            else
                return v10;
            end;
        end;
    end;
    v7._adorns = {};
    local l__adorns_0 = v7._adorns;
    local l_Right_0 = Enum.NormalId.Right;
    local l_new_0 = v2.new;
    local l_v5_0 = v5;
    local v22 = Vector3.new(0, 0, 0);
    local v23 = Vector3.new(1, 0, 0);
    local l_Right_1 = Enum.NormalId.Right;
    local l_Left_0 = Enum.NormalId.Left;
    local l_l_Right_1_0 = l_Right_1 --[[ copy: 11 -> 13 ]];
    local l_l_Left_0_0 = l_Left_0 --[[ copy: 12 -> 14 ]];
    l__adorns_0[l_Right_0] = l_new_0(l_v5_0, v22, v23, function(v28)
        if not (not v7._adorns or not v7._adorns[l_l_Right_1_0]) and v7._adorns[l_l_Left_0_0] then
            local v29 = v7._adorns[l_l_Right_1_0]:getPosition();
            local v30 = v7._adorns[l_l_Left_0_0]:getPosition();
            local v31 = v29 - v30;
            local v32 = v31.Unit:Dot(v28 - v30);
            if v32 < 4 then
                return v30 + v31.Unit * 4;
            elseif v32 > 16000 then
                return v30 + v31.Unit * 16000;
            else
                v7._position = (v28 + v30) / 2;
                local v33 = v28 - v30;
                local l_Magnitude_1 = v33.Magnitude;
                v7._size = Vector3.new(v33.x ~= 0 and l_Magnitude_1 or v7._size.x, v33.y ~= 0 and l_Magnitude_1 or v7._size.y, v33.z ~= 0 and l_Magnitude_1 or v7._size.z);
                v7._onSizeChanged:Fire(v7._size, v7._position);
                v7:updateBlockMesh();
                v7:updateAdorns();
                return v28;
            end;
        else
            return v28;
        end;
    end);
    l__adorns_0 = v7._adorns;
    l_Right_0 = Enum.NormalId.Left;
    l_new_0 = v2.new;
    l_v5_0 = v5;
    v22 = Vector3.new(0, 0, 0);
    v23 = Vector3.new(-1, 0, 0);
    l_Right_1 = Enum.NormalId.Left;
    l_Left_0 = Enum.NormalId.Right;
    local l_l_Right_1_1 = l_Right_1 --[[ copy: 11 -> 15 ]];
    local l_l_Left_0_1 = l_Left_0 --[[ copy: 12 -> 16 ]];
    l__adorns_0[l_Right_0] = l_new_0(l_v5_0, v22, v23, function(v37)
        if not (not v7._adorns or not v7._adorns[l_l_Right_1_1]) and v7._adorns[l_l_Left_0_1] then
            local v38 = v7._adorns[l_l_Right_1_1]:getPosition();
            local v39 = v7._adorns[l_l_Left_0_1]:getPosition();
            local v40 = v38 - v39;
            local v41 = v40.Unit:Dot(v37 - v39);
            if v41 < 4 then
                return v39 + v40.Unit * 4;
            elseif v41 > 16000 then
                return v39 + v40.Unit * 16000;
            else
                v7._position = (v37 + v39) / 2;
                local v42 = v37 - v39;
                local l_Magnitude_2 = v42.Magnitude;
                v7._size = Vector3.new(v42.x ~= 0 and l_Magnitude_2 or v7._size.x, v42.y ~= 0 and l_Magnitude_2 or v7._size.y, v42.z ~= 0 and l_Magnitude_2 or v7._size.z);
                v7._onSizeChanged:Fire(v7._size, v7._position);
                v7:updateBlockMesh();
                v7:updateAdorns();
                return v37;
            end;
        else
            return v37;
        end;
    end);
    l__adorns_0 = v7._adorns;
    l_Right_0 = Enum.NormalId.Top;
    l_new_0 = v2.new;
    l_v5_0 = v5;
    v22 = Vector3.new(0, 0, 0);
    v23 = Vector3.new(0, 1, 0);
    l_Right_1 = Enum.NormalId.Top;
    l_Left_0 = Enum.NormalId.Bottom;
    local l_l_Right_1_2 = l_Right_1 --[[ copy: 11 -> 17 ]];
    local l_l_Left_0_2 = l_Left_0 --[[ copy: 12 -> 18 ]];
    l__adorns_0[l_Right_0] = l_new_0(l_v5_0, v22, v23, function(v46)
        if not (not v7._adorns or not v7._adorns[l_l_Right_1_2]) and v7._adorns[l_l_Left_0_2] then
            local v47 = v7._adorns[l_l_Right_1_2]:getPosition();
            local v48 = v7._adorns[l_l_Left_0_2]:getPosition();
            local v49 = v47 - v48;
            local v50 = v49.Unit:Dot(v46 - v48);
            if v50 < 4 then
                return v48 + v49.Unit * 4;
            elseif v50 > 16000 then
                return v48 + v49.Unit * 16000;
            else
                v7._position = (v46 + v48) / 2;
                local v51 = v46 - v48;
                local l_Magnitude_3 = v51.Magnitude;
                v7._size = Vector3.new(v51.x ~= 0 and l_Magnitude_3 or v7._size.x, v51.y ~= 0 and l_Magnitude_3 or v7._size.y, v51.z ~= 0 and l_Magnitude_3 or v7._size.z);
                v7._onSizeChanged:Fire(v7._size, v7._position);
                v7:updateBlockMesh();
                v7:updateAdorns();
                return v46;
            end;
        else
            return v46;
        end;
    end);
    l__adorns_0 = v7._adorns;
    l_Right_0 = Enum.NormalId.Bottom;
    l_new_0 = v2.new;
    l_v5_0 = v5;
    v22 = Vector3.new(0, 0, 0);
    v23 = Vector3.new(0, -1, 0);
    l_Right_1 = Enum.NormalId.Bottom;
    l_Left_0 = Enum.NormalId.Top;
    local l_l_Right_1_3 = l_Right_1 --[[ copy: 11 -> 19 ]];
    local l_l_Left_0_3 = l_Left_0 --[[ copy: 12 -> 20 ]];
    l__adorns_0[l_Right_0] = l_new_0(l_v5_0, v22, v23, function(v55)
        if not (not v7._adorns or not v7._adorns[l_l_Right_1_3]) and v7._adorns[l_l_Left_0_3] then
            local v56 = v7._adorns[l_l_Right_1_3]:getPosition();
            local v57 = v7._adorns[l_l_Left_0_3]:getPosition();
            local v58 = v56 - v57;
            local v59 = v58.Unit:Dot(v55 - v57);
            if v59 < 4 then
                return v57 + v58.Unit * 4;
            elseif v59 > 16000 then
                return v57 + v58.Unit * 16000;
            else
                v7._position = (v55 + v57) / 2;
                local v60 = v55 - v57;
                local l_Magnitude_4 = v60.Magnitude;
                v7._size = Vector3.new(v60.x ~= 0 and l_Magnitude_4 or v7._size.x, v60.y ~= 0 and l_Magnitude_4 or v7._size.y, v60.z ~= 0 and l_Magnitude_4 or v7._size.z);
                v7._onSizeChanged:Fire(v7._size, v7._position);
                v7:updateBlockMesh();
                v7:updateAdorns();
                return v55;
            end;
        else
            return v55;
        end;
    end);
    l__adorns_0 = v7._adorns;
    l_Right_0 = Enum.NormalId.Front;
    l_new_0 = v2.new;
    l_v5_0 = v5;
    v22 = Vector3.new(0, 0, 0);
    v23 = Vector3.new(0, 0, 1);
    l_Right_1 = Enum.NormalId.Front;
    l_Left_0 = Enum.NormalId.Back;
    local l_l_Right_1_4 = l_Right_1 --[[ copy: 11 -> 21 ]];
    local l_l_Left_0_4 = l_Left_0 --[[ copy: 12 -> 22 ]];
    l__adorns_0[l_Right_0] = l_new_0(l_v5_0, v22, v23, function(v64)
        if not (not v7._adorns or not v7._adorns[l_l_Right_1_4]) and v7._adorns[l_l_Left_0_4] then
            local v65 = v7._adorns[l_l_Right_1_4]:getPosition();
            local v66 = v7._adorns[l_l_Left_0_4]:getPosition();
            local v67 = v65 - v66;
            local v68 = v67.Unit:Dot(v64 - v66);
            if v68 < 4 then
                return v66 + v67.Unit * 4;
            elseif v68 > 16000 then
                return v66 + v67.Unit * 16000;
            else
                v7._position = (v64 + v66) / 2;
                local v69 = v64 - v66;
                local l_Magnitude_5 = v69.Magnitude;
                v7._size = Vector3.new(v69.x ~= 0 and l_Magnitude_5 or v7._size.x, v69.y ~= 0 and l_Magnitude_5 or v7._size.y, v69.z ~= 0 and l_Magnitude_5 or v7._size.z);
                v7._onSizeChanged:Fire(v7._size, v7._position);
                v7:updateBlockMesh();
                v7:updateAdorns();
                return v64;
            end;
        else
            return v64;
        end;
    end);
    l__adorns_0 = v7._adorns;
    l_Right_0 = Enum.NormalId.Back;
    l_new_0 = v2.new;
    l_v5_0 = v5;
    v22 = Vector3.new(0, 0, 0);
    v23 = Vector3.new(0, 0, -1);
    l_Right_1 = Enum.NormalId.Back;
    l_Left_0 = Enum.NormalId.Front;
    l__adorns_0[l_Right_0] = l_new_0(l_v5_0, v22, v23, function(v71)
        if not (not v7._adorns or not v7._adorns[l_Right_1]) and v7._adorns[l_Left_0] then
            local v72 = v7._adorns[l_Right_1]:getPosition();
            local v73 = v7._adorns[l_Left_0]:getPosition();
            local v74 = v72 - v73;
            local v75 = v74.Unit:Dot(v71 - v73);
            if v75 < 4 then
                return v73 + v74.Unit * 4;
            elseif v75 > 16000 then
                return v73 + v74.Unit * 16000;
            else
                v7._position = (v71 + v73) / 2;
                local v76 = v71 - v73;
                local l_Magnitude_6 = v76.Magnitude;
                v7._size = Vector3.new(v76.x ~= 0 and l_Magnitude_6 or v7._size.x, v76.y ~= 0 and l_Magnitude_6 or v7._size.y, v76.z ~= 0 and l_Magnitude_6 or v7._size.z);
                v7._onSizeChanged:Fire(v7._size, v7._position);
                v7:updateBlockMesh();
                v7:updateAdorns();
                return v71;
            end;
        else
            return v71;
        end;
    end);
    v7._borders = {};
    return v7;
end;
v4.getOnSizeChanged = function(v78)
    return v78._onSizeChanged;
end;
v4.destroy = function(v79)
    if v79._rootModel then
        v79._rootModel:Destroy();
        v79._rootModel = nil;
    end;
    if v79._centerPart then
        v79._centerPart:Destroy();
        v79._centerPart = nil;
    end;
    if v79._blockMesh then
        v79._blockMesh:Destroy();
        v79._blockMesh = nil;
    end;
    for _, v81 in pairs(v79._adorns) do
        v81:destroy();
    end;
    v79._adorns = nil;
    for _, v83 in pairs(v79._borders) do
        v83:Destroy();
    end;
    v79._borders = nil;
    l_Selection_0:ClearTerrainSelectionHack();
end;
v4.updateVisibility = function(v84, v85)
    if v84._centerPart then
        v84._centerPart.Transparency = not v85 and 1 or 0.9;
    end;
    for _, v87 in pairs(v84._borders) do
        v87.Transparency = not v85 and 1 or 0.5;
    end;
    for _, v89 in pairs(v84._adorns) do
        v89:updateVisibility(v85);
    end;
end;
v4.updateBlockMesh = function(v90, _)
    if not v90._rootModel then
        local l_Model_0 = Instance.new("Model");
        l_Model_0.Name = "RegionPreview";
        l_Model_0.Archivable = false;
        v90._rootModel = l_Model_0;
        v90._rootModel.Parent = v90._target;
    end;
    if not v90._centerPart then
        local l_Part_0 = Instance.new("Part");
        l_Part_0.Name = "RegionCenter";
        l_Part_0.Size = Vector3.new(1, 1, 1);
        l_Part_0.TopSurface = "Smooth";
        l_Part_0.BottomSurface = "Smooth";
        l_Part_0.CastShadow = false;
        l_Part_0.Locked = true;
        l_Part_0.Anchored = true;
        l_Part_0.CanCollide = false;
        l_Part_0.BrickColor = BrickColor.new("Toothpaste");
        l_Part_0.Material = Enum.Material.Neon;
        l_Part_0.Archivable = false;
        l_Part_0.Transparency = 1;
        local l_BlockMesh_0 = Instance.new("BlockMesh");
        l_BlockMesh_0.Scale = Vector3.new(1, 1, 1);
        l_BlockMesh_0.Parent = l_Part_0;
        v90._blockMesh = l_BlockMesh_0;
        v90._centerPart = l_Part_0;
    end;
    v90._centerPart.Position = v90._position;
    v90._centerPart.Parent = v90._rootModel;
    v90._blockMesh.Scale = v90._size;
end;
v4.updateAdorns = function(v95)
    local l__position_0 = v95._position;
    local v97 = v95._size / 2;
    v95._adorns[Enum.NormalId.Right]:setPosition(l__position_0 + Vector3.new(v97.x, 0, 0));
    v95._adorns[Enum.NormalId.Left]:setPosition(l__position_0 + Vector3.new(-v97.x, 0, 0));
    v95._adorns[Enum.NormalId.Top]:setPosition(l__position_0 + Vector3.new(0, v97.y, 0));
    v95._adorns[Enum.NormalId.Bottom]:setPosition(l__position_0 + Vector3.new(0, -v97.y, 0));
    v95._adorns[Enum.NormalId.Front]:setPosition(l__position_0 + Vector3.new(0, 0, v97.z));
    v95._adorns[Enum.NormalId.Back]:setPosition(l__position_0 + Vector3.new(0, 0, -v97.z));
end;
v4.updateBorder = function(v98, v99, v100)
    assert(v98._adorns[v99] and v98._adorns[v100], "accessing invalid terrain");
    local v101 = string.format("%d_%d", v99.Value, v100.Value);
    local v102 = (v98._adorns[v99]:getPosition() - v98._position) + (v98._adorns[v100]:getPosition() - v98._position);
    if v102.Magnitude < 1 then
        return ;
    else
        local v103 = Vector3.new(v102.x == 0 and v98._size.x or 8, v102.y == 0 and v98._size.y or 8, v102.z == 0 and v98._size.z or 8);
        v102 = v102 + v98._position;
        if not v98._borders[v101] then
            local l_Part_1 = Instance.new("Part");
            l_Part_1.Name = "RegionBorder";
            l_Part_1.Size = Vector3.new(1, 1, 1);
            l_Part_1.TopSurface = "Smooth";
            l_Part_1.BottomSurface = "Smooth";
            l_Part_1.Locked = true;
            l_Part_1.Anchored = true;
            l_Part_1.CanCollide = false;
            l_Part_1.BrickColor = BrickColor.new("Toothpaste");
            l_Part_1.Material = Enum.Material.Neon;
            l_Part_1.Archivable = false;
            l_Part_1.Transparency = 1;
            l_Part_1.CastShadow = false;
            l_Part_1.Parent = v98._rootModel;
            v98._borders[v101] = l_Part_1;
            local l_BlockMesh_1 = Instance.new("BlockMesh");
            l_BlockMesh_1.Name = "BorderMesh";
            l_BlockMesh_1.Parent = l_Part_1;
        end;
        v98._borders[v101].BorderMesh.Scale = v103;
        v98._borders[v101].Position = v102;
        return ;
    end;
end;
v4.updateBorders = function(v106)
    if not v106._centerPart then
        v106:updateBlockMesh();
    end;
    for v107 = 1, #l_EnumItems_0 - 1 do
        for v108 = v107 + 1, #l_EnumItems_0 do
            v106:updateBorder(l_EnumItems_0[v107], l_EnumItems_0[v108]);
        end;
    end;
end;
v4.setSizeAndPosition = function(v109, v110, v111)
    v109._position = v111;
    v109._size = v110;
    v109:updateBlockMesh();
    v109:updateAdorns();
    v109:updateBorders();
    l_Selection_0:SetTerrainSelectionHack(v111, v110);
end;
return v4;
