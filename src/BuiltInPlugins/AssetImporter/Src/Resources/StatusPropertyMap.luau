local v0 = {
    ImportAsPackage = {
        "AnimationInPackageWarning"
    }, 
    Dimensions = {
        "MeshScaleWarning"
    }, 
    FileDimensions = {
        "MeshScaleWarning"
    }, 
    PolygonCount = {
        "MeshSizeWarning"
    }, 
    CageNonManifoldPreview = {
        "CageNonManifoldWarning"
    }, 
    CageOverlappingVerticesPreview = {
        "CageOverlappingVerticesWarning"
    }, 
    CageUVMisMatchedPreview = {
        "CageUVMisMatchedWarning"
    }, 
    CageMeshIntersectedPreview = {
        "CageMeshIntersectedWarning"
    }, 
    MeshHoleDetectedPreview = {
        "MeshHoleDetectedWarning"
    }, 
    IrrelevantCageModifiedPreview = {
        "IrrelevantCageModifiedWarning"
    }, 
    OuterCageFarExtendedFromMeshPreview = {
        "OuterCageFarExtendedFromMeshWarning"
    }, 
    RigType = {
        "IncorrectR15Warning"
    }, 
    DiffuseFilePath = {
        "CouldNotReadDiffuseError", 
        "DiffuseBadFileFormatError"
    }, 
    RoughnessFilePath = {
        "CouldNotReadRoughnessError", 
        "RoughnessBadFileFormatError"
    }, 
    NormalFilePath = {
        "CouldNotReadNormalError", 
        "NormalBadFileFormatError"
    }, 
    MetalnessFilePath = {
        "CouldNotReadMetalnessError", 
        "MetalnessBadFileFormatError"
    }, 
    FileGeneral = {
        "CantImportAvatarGltfsWarning", 
        "CantImportScaleOrWeightAnimationsWarning"
    }, 
    ValidateUgcBody = {
        "ValidateUgcButNoInsertError"
    }, 
    ObjectGeneral = {
        "MaterialIgnoredWarning", 
        "CouldNotReadTextureError", 
        "TextureBadFileFormatError", 
        "ContentNotFoundError", 
        "MeshIdNotFoundError", 
        "NoValidParentError", 
        "NullNodeError", 
        "ImportDataTypeMismatchError", 
        "ImportDataNotCreatedError", 
        "ImportDataInstanceNotCreatedError", 
        "TextureInvalidSizeError", 
        "IllegalNodeTypeError", 
        "BadCallError", 
        "PoseError", 
        "UncaughtExceptionError", 
        "UploadAlreadyRunningError", 
        "CageMismatchWarning", 
        "CageHasMaterialWarning", 
        "CageNoGeoParentError", 
        "UGCMeshVertColorsWarning", 
        "UGCMaxMeshTrianglesWarning", 
        "UGCExceedUVSpaceWarning", 
        "UGCExceedTextureSizeWarning", 
        "InnerButNoOuterCageWarning", 
        "NoRefMeshForCageWarning", 
        "NoRefMeshForCageWithSuggestionWarning", 
        "AvatarCagesMissingWarning", 
        "CageNameHasTypoWarning", 
        "DeletedCageGeometryWarning", 
        "UnsupportedPreviewTextureTypeWarning", 
        "OuterCageBloatingWarning", 
        "FacsFrameExtraCharsWarning", 
        "FacsMax3CorrectivesError", 
        "FacsUnrecognizedFacsError", 
        "FacsInvalidCorrectiveError", 
        "FacsCorrectiveDupeError", 
        "FacsRootFaceJointNotStringError", 
        "FacsRootFaceJointNoValueError", 
        "FacsFrameAttrNotStringError", 
        "FacsUnparseableFrameNumberError", 
        "FacsEmptyAttributeWarning", 
        "FacsDupeControlError", 
        "FacsRootFaceJointExtraCharsError", 
        "FacsHasFramesNoRootFaceJointError", 
        "FacsNoAttributesError", 
        "FacsNoNeutralError", 
        "FacsMissingSupportCorrectiveWarning", 
        "FacsMissingBaseError", 
        "FacsMissingKeyFrameError", 
        "FacsNoAnimationStackError", 
        "FacsMultipleAnimationStackWarning", 
        "FacsNoRootFaceJointError", 
        "FacsMultipleRootFaceJointsError", 
        "FacsNoJointsError", 
        "FacsNearNeutralWarning", 
        "FacsIncompletePosesWarning", 
        "FacsOnlyNeutralError", 
        "FacsNoFaceControlsAllowedError"
    }
};
local _ = function(v1)
    local v2 = {};
    for _, v4 in pairs(v1) do
        v2[v4] = true;
    end;
    return v2;
end;
for v6, v7 in pairs(v0) do
    local v8 = {};
    for _, v10 in pairs(v7) do
        v8[v10] = true;
    end;
    v0[v6] = v8;
end;
return v0;
