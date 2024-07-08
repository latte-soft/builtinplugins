local l_script_FirstAncestor_0 = script:FindFirstAncestor("AssetImporter");
local v1 = require(l_script_FirstAncestor_0.Src.Utility.DebugFlags);
local v2 = require(l_script_FirstAncestor_0.Src.Components.Properties.Types.AssetIdProperty);
local v3 = require(l_script_FirstAncestor_0.Src.Components.Properties.Types.AnimationListProperty);
local v4 = require(l_script_FirstAncestor_0.Src.Components.Properties.Types.UploadDestinationProperty);
local v5 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagShowOffCenterOriginImporter);
local v6 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagChooseAnimationForRestPose);
local v7 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagHideAnimationSettingForGltf);
local v8 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagImporterOpensAvatarPreviewerBetaCheck);
local v9 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagAssetImportUseUploadId);
local v10 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagKeepZeroInfluenceBones);
local function v13(_, v12)
    if not v7() or not v12:IsGltf() then
        if v6() then
            return not v12:HasAnimation();
        else
            return true;
        end;
    else
        return true;
    end;
end;
local function v16(_, v15)
    if not v7() or not v15:IsGltf() then
        if v6() then
            return not v15:HasAnimation() or not v15:usesCustomRestPoseLua();
        else
            return true;
        end;
    else
        return true;
    end;
end;
local function v19(_, v18)
    return not v18:IsR15();
end;
local function v22(_, v21)
    return not v8() or not v21:IsR15();
end;
local function v24(v23)
    return not v23.InsertInWorkspace;
end;
local function v26(v25)
    return not (v25.AddModelToInventory and v25.ImportAsPackage);
end;
local function v28(v27)
    return not v27.AddModelToInventory;
end;
local function _()
    return v8() and not v1.RunningUnderCLI();
end;
local function v31(v30)
    return (v8() and not v1.RunningUnderCLI()) and v30:IsR15();
end;
return {
    {
        Section = "FileGeneral", 
        Properties = {
            {
                Name = "ImportName", 
                Editable = true
            }, 
            {
                Name = "ImportAsModelAsset", 
                Editable = true
            }, 
            {
                Name = "AddModelToInventory", 
                Editable = true
            }, 
            {
                Name = "ImportAsPackage", 
                Editable = true, 
                ShouldHide = v28
            }, 
            {
                Name = "ExistingPackageId", 
                Editable = true, 
                ComponentFactory = v2, 
                ShouldHide = v26
            }, 
            {
                Name = "PreferredUploadId", 
                Editable = true, 
                ComponentFactory = v4, 
                ShouldHide = function()
                    return not v9();
                end
            }, 
            {
                Name = "InsertInWorkspace", 
                Editable = true
            }, 
            {
                Name = "InsertWithScenePosition", 
                Editable = true, 
                ShouldHide = v24
            }, 
            {
                Name = "UseSceneOriginAsCFrame", 
                Editable = true, 
                ShouldHide = function(_)
                    return not v5();
                end
            }, 
            {
                Name = "KeepZeroInfluenceBones", 
                Editable = true, 
                ShouldHide = function()
                    return not v10();
                end
            }, 
            {
                Name = "UseSceneOriginAsPivot", 
                Editable = true
            }, 
            {
                Name = "Anchored", 
                Editable = true
            }, 
            {
                Name = "UsesCages", 
                Editable = true
            }
        }
    }, 
    {
        Section = "RigGeneral", 
        Properties = {
            {
                Name = "RigType", 
                Editable = true
            }, 
            {
                Name = "ValidateUgcBody", 
                Editable = true, 
                ShouldHide = v22, 
                Callouts = {
                    {
                        Name = "OpenAvatarPreviewCallout", 
                        ShouldShow = v31
                    }
                }
            }, 
            {
                Name = "RigScale", 
                Editable = true, 
                ShouldHide = v19
            }
        }, 
        Callouts = {
            {
                Name = "OpenAvatarPreviewCallout", 
                ShouldShow = v31
            }
        }
    }, 
    {
        Section = "AnimationGeneral", 
        Properties = {
            {
                Name = "RestPose", 
                Editable = true, 
                ShouldHide = v13
            }, 
            {
                Name = "AnimationIdForRestPose", 
                Editable = true, 
                ComponentFactory = v3, 
                ShouldHide = v16
            }
        }
    }, 
    {
        Section = "FileTransform", 
        Properties = {
            {
                Name = "WorldForward", 
                Editable = true, 
                Dependencies = {
                    "WorldUp"
                }
            }, 
            {
                Name = "WorldUp", 
                Editable = true, 
                Dependencies = {
                    "WorldForward"
                }
            }
        }
    }, 
    {
        Section = "FileGeometry", 
        Properties = {
            {
                Name = "ScaleUnit", 
                Editable = true
            }, 
            {
                Name = "FileDimensions", 
                Editable = false, 
                Dependencies = {
                    "ScaleUnit"
                }
            }, 
            {
                Name = "PolygonCount", 
                Editable = false
            }, 
            {
                Name = "MergeMeshes", 
                Editable = true, 
                ShouldHide = function(v33)
                    return v33.AddModelToInventory and v33.ImportAsPackage;
                end
            }, 
            {
                Name = "InvertNegativeFaces", 
                Editable = true
            }
        }
    }
};
