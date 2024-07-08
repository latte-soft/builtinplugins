local l_script_FirstAncestor_0 = script:FindFirstAncestor("AssetImporter");
local _ = require(l_script_FirstAncestor_0.Src.Types);
local v2 = require(l_script_FirstAncestor_0.Src.Utility.GetLocalizedString);
local v3 = {
    FacsIncompletePosesWarning = "FacsIncompletePosesWarning1", 
    FacsNearNeutralWarning = "FacsNearNeutralWarning1", 
    FacsNoJointsError = "FacsNoJointsError1", 
    FacsMultipleRootFaceJointsError = "FacsMultipleRootFaceJointsError1", 
    FacsNoRootFaceJointError = "FacsNoRootFaceJointError1", 
    FacsMissingKeyFrameError = "FacsMissingKeyFrameError2", 
    FacsMissingBaseError = "FacsMissingBaseError2", 
    FacsMissingSupportCorrectiveWarning = "FacsMissingSupportCorrectiveWarning2", 
    FacsNoAttributesError = "FacsNoAttributesError1", 
    FacsHasFramesNoRootFaceJointError = "FacsHasFramesNoRootFaceJointError1", 
    FacsRootFaceJointExtraCharsError = "FacsRootFaceJointExtraCharsError1", 
    FacsDupeControlError = "FacsDupeControlError3", 
    FacsEmptyAttributeWarning = "FacsEmptyAttributeWarning1", 
    FacsUnparseableFrameNumberError = "FacsUnparseableFrameNumberError1", 
    FacsFrameAttrNotStringError = "FacsFrameAttrNotStringError1", 
    FacsCorrectiveDupeError = "FacsCorrectiveDupeError3", 
    FacsInvalidCorrectiveError = "FacsInvalidCorrectiveError2", 
    FacsUnrecognizedFacsError = "FacsUnrecognizedFACSError2", 
    FacsMax3CorrectivesError = "FacsMax3CorrectivesError3", 
    FacsFrameExtraCharsWarning = "FacsFrameExtraCharsWarning1", 
    NoRefMeshForCageWithSuggestionWarning = "NoRefMeshForCageWithSuggestionWarning1", 
    CageNameHasTypoWarning = "CageNameHasTypoWarning1"
};
return function(v4, v5, v6, v7)
    return v2(v4, "Statuses", v3[v5] or v5, v7) or v4:getText("Statuses", string.format("Default%s1", v6), {
        type = v5
    });
end;
