local v0 = {
    "Attachment", 
    "BasePart", 
    "BaseWrap", 
    "DataModelMesh", 
    "FaceControls", 
    "Humanoid", 
    "SurfaceAppearance", 
    "ValueBase"
};
local function v1(v2, v3)
    for _, v5 in v2:GetChildren() do
        local v6 = false;
        if not v5:IsA("BasePart") then
            for _, v8 in v0, nil, nil do
                if v5:IsA(v8) then
                    v6 = true;
                    break;
                end;
            end;
        elseif v3 ~= nil and table.find(v3, v5.Name) ~= nil then
            v6 = true;
        else
            v5:Destroy();
            continue;
        end;
        if not v6 then
            v5:Destroy();
        else
            v1(v5, v3);
        end;
    end;
end;
return v1;
