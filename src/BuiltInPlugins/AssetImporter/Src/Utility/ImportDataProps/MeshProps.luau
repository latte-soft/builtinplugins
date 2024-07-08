local l_script_FirstAncestor_0 = script:FindFirstAncestor("AssetImporter");
local v1 = require(l_script_FirstAncestor_0.Src.Components.Properties.Types.VisibilityProperty);
local v2 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagLCQualityCheckDisplay);
return {
    {
        Section = "ObjectGeneral", 
        Properties = {
            {
                Name = "ImportName", 
                Editable = true
            }, 
            {
                Name = "Anchored", 
                Editable = true
            }, 
            {
                Name = "UseImportedPivot", 
                Editable = true
            }
        }
    }, 
    {
        Section = "ObjectGeometry", 
        Properties = {
            {
                Name = "Dimensions", 
                Editable = false
            }, 
            {
                Name = "PolygonCount", 
                Editable = false
            }, 
            {
                Name = "DoubleSided", 
                Editable = true
            }, 
            {
                Name = "IgnoreVertexColors", 
                Editable = true
            }, 
            {
                Name = "CageNonManifoldPreview", 
                Editable = true, 
                ComponentFactory = v1, 
                ShouldHide = function(v3, v4)
                    if v2() then
                        if v4:GetImportTree().UsesCages then
                            if not (not v3.ImportName:match("_OuterCage") and not v3.ImportName:match("_InnerCage")) then
                                return v3.CageManifold;
                            end;
                        else
                            return true;
                        end;
                    end;
                    return true;
                end
            }, 
            {
                Name = "CageOverlappingVerticesPreview", 
                Editable = true, 
                ComponentFactory = v1, 
                ShouldHide = function(v5, v6)
                    if v2() then
                        if v6:GetImportTree().UsesCages then
                            if not (not v5.ImportName:match("_OuterCage") and not v5.ImportName:match("_InnerCage")) then
                                return v5.CageNoOverlappingVertices;
                            end;
                        else
                            return true;
                        end;
                    end;
                    return true;
                end
            }, 
            {
                Name = "CageUVMisMatchedPreview", 
                Editable = true, 
                ComponentFactory = v1, 
                ShouldHide = function(v7, v8)
                    if v2() then
                        if v8:GetImportTree().UsesCages then
                            if not (not v7.ImportName:match("_OuterCage") and not v7.ImportName:match("_InnerCage")) then
                                return v7.CageUVMatched;
                            end;
                        else
                            return true;
                        end;
                    end;
                    return true;
                end
            }, 
            {
                Name = "CageMeshIntersectedPreview", 
                Editable = true, 
                ComponentFactory = v1, 
                ShouldHide = function(v9, v10)
                    if v2() then
                        if v10:GetImportTree().UsesCages then
                            if not (not v9.ImportName:match("_OuterCage") and not v9.ImportName:match("_InnerCage")) then
                                return v9.CageMeshNotIntersected;
                            end;
                        else
                            return true;
                        end;
                    end;
                    return true;
                end
            }, 
            {
                Name = "MeshHoleDetectedPreview", 
                Editable = true, 
                ComponentFactory = v1, 
                ShouldHide = function(v11, v12)
                    if v2() then
                        if v12:GetImportTree().UsesCages then
                            if not v11.ImportName:match("_Att") then
                                return v11.MeshNoHoleDetected;
                            end;
                        else
                            return true;
                        end;
                    end;
                    return true;
                end
            }, 
            {
                Name = "IrrelevantCageModifiedPreview", 
                Editable = true, 
                ComponentFactory = v1, 
                ShouldHide = function(v13, v14)
                    if v2() then
                        if v14:GetImportTree().UsesCages then
                            if not (not v13.ImportName:match("_OuterCage") and not v13.ImportName:match("_InnerCage")) then
                                return v13.NoIrrelevantCageModified;
                            end;
                        else
                            return true;
                        end;
                    end;
                    return true;
                end
            }, 
            {
                Name = "OuterCageFarExtendedFromMeshPreview", 
                Editable = true, 
                ComponentFactory = v1, 
                ShouldHide = function(v15, v16)
                    if v2() then
                        if v16:GetImportTree().UsesCages then
                            if v15.ImportName:match("_OuterCage") then
                                return v15.NoOuterCageFarExtendedFromMesh;
                            end;
                        else
                            return true;
                        end;
                    end;
                    return true;
                end
            }
        }
    }
};
