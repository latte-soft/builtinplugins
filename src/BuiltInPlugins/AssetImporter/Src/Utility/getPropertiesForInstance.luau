local _ = require(script:FindFirstAncestor("AssetImporter").Src.Types);
local v1 = require(script.Parent.ImportDataProps);
local l_RootProps_0 = v1.RootProps;
local l_MeshProps_0 = v1.MeshProps;
local l_MaterialProps_0 = v1.MaterialProps;
local l_GroupProps_0 = v1.GroupProps;
local l_JointProps_0 = v1.JointProps;
local l_BaseProps_0 = v1.BaseProps;
local v8 = {
    RootImportData = l_RootProps_0, 
    MeshImportData = l_MeshProps_0, 
    MaterialImportData = l_MaterialProps_0, 
    GroupImportData = l_GroupProps_0, 
    JointImportData = l_JointProps_0, 
    AnimationImportData = l_BaseProps_0, 
    FacsImportData = l_BaseProps_0
};
return function(v9)
    if not v9:IsA("BaseImportData") then
        error("Unexpected instance type: ", v9.ClassName);
        return ;
    else
        local v10 = v8[v9.ClassName];
        if v10 then
            return v10;
        else
            warn("Unexpected instance type deriving from BaseImportData: ", v9.ClassName);
            return l_BaseProps_0;
        end;
    end;
end;
