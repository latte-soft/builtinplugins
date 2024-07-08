return function(v0, v1)
    local l_position_0 = v1[3 * (v0 - 1) + 1].position;
    local l_position_1 = v1[3 * (v0 - 1) + 2].position;
    local l_position_2 = v1[3 * (v0 - 1) + 3].position;
    local v5 = ((l_position_0 + l_position_1) + l_position_2) / 3;
    local l_Unit_0 = (v5 - l_position_0).Unit;
    local l_Unit_1 = (l_position_1 - l_position_0):Cross(l_position_2 - l_position_0).Unit;
    local v8 = l_Unit_0:Cross(l_Unit_1);
    return CFrame.new(v5.x, v5.y, v5.z, v8.x, l_Unit_0.x, l_Unit_1.x, v8.y, l_Unit_0.y, l_Unit_1.y, v8.z, l_Unit_0.z, l_Unit_1.z);
end;
