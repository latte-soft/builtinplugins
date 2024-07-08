local l_StudioService_0 = game:GetService("StudioService");
local v1 = require(script:FindFirstAncestor("AnimationClipEditor").Packages.Cryo);
local function _(v2)
    if not v2 then
        return nil;
    else
        return (string.lower(v2));
    end;
end;
return function(v4)
    local function v7(v5, v6)
        v4:SendEventDeferred("studio", "animationEditor", v5, (v1.Dictionary.join({
            studioSid = v4:GetSessionId(), 
            clientId = v4:GetClientId(), 
            placeId = game.PlaceId, 
            userId = l_StudioService_0:GetUserId()
        }, v6 or {})));
    end;
    local function _(v8, v9)
        v4:ReportCounter(v8, v9 or 1);
    end;
    local function _(v11, v12)
        v4:ReportStats(v11, v12 or 1);
    end;
    local function _(v14)
        return "studio" .. "." .. "animationEditor" .. "." .. v14;
    end;
    return {
        onEditorOpened = function(_, v17, v18, v19)
            v7("toolOpened", {
                method = 1, 
                timelineUnit = v17, 
                keyframeSnap = v18, 
                snapMode = v19
            });
            v4:ReportCounter("studio" .. "." .. "animationEditor" .. "." .. "EditorOpened", 1);
            v7("EditorOpened");
        end, 
        onEditorClosed = function(_, v21)
            v7("toolClosed", {
                timeOpen = v21, 
                method = 1
            });
        end, 
        onImportAnimation = function(_, v23, v24)
            v7("importAnimation", {
                animationId = v23, 
                guid = if not v24 then nil else string.lower(v24)
            });
        end, 
        onImportFbxAnimation = function(_, v26)
            v7("importFbxAnimation", {
                guid = if not v26 then nil else string.lower(v26)
            });
            v4:ReportCounter("studio" .. "." .. "animationEditor" .. "." .. "FBXAnimationImported", 1);
            v7("FBXAnimationImported");
        end, 
        onUserChoseFBXModelForAnimImport = function(_, v28)
            v4:ReportCounter("studio" .. "." .. "animationEditor" .. "." .. "UserChoseFBXModelForAnimImport", 1);
            v7("userChoseFBXModelForAnimImport", {
                guid = if not v28 then nil else string.lower(v28)
            });
        end, 
        onUserChoseSelectedModelForAnimImport = function(_, v30)
            v4:ReportCounter("studio" .. "." .. "animationEditor" .. "." .. "UserChoseSelectedModelForAnimImport", 1);
            v7("userChoseSelectedModelForAnimImport", {
                guid = if not v30 then nil else string.lower(v30)
            });
        end, 
        onExportAnimation = function(_, v32, v33, v34, v35)
            v7("exportAnimation", {
                animationType = v33, 
                hasFacs = v32, 
                assetId = v34, 
                guid = if not v35 then nil else string.lower(v35)
            });
        end, 
        onLoadAnimation = function(_, v37, v38, v39, v40, v41, v42)
            v7("loadAnimation", {
                animationType = v41, 
                name = v37, 
                numKeyframes = v38, 
                numPoses = v39, 
                numEvents = v40, 
                guid = if not v42 then nil else string.lower(v42)
            });
        end, 
        onSaveAnimation = function(_, v44, v45, v46, v47, v48, v49)
            v7("saveAnimation", {
                animationType = v48, 
                name = v44, 
                numKeyframes = v45, 
                numPoses = v46, 
                numEvents = v47, 
                guid = if not v49 then nil else string.lower(v49)
            });
            v4:ReportStats("studio" .. "." .. "animationEditor" .. "." .. "ExportedKeyframes", v45 or 1);
            v4:ReportStats("studio" .. "." .. "animationEditor" .. "." .. "ExportedPoses", v46 or 1);
            v4:ReportStats("studio" .. "." .. "animationEditor" .. "." .. "ExportedEvents", v47 or 1);
        end, 
        onCreateNewAnimation = function(_, v51, v52)
            v7("createNewAnimation", {
                name = v51, 
                guid = if not v52 then nil else string.lower(v52)
            });
        end, 
        onQuantizeSelection = function(_, v54)
            v7("quantizeSelection", {
                didQuantize = v54
            });
        end, 
        onTimeUnitChanged = function(_, v56)
            v7("timeUnitChanged", {
                timeUnit = v56
            });
        end, 
        onKeyframeSnapChanged = function(_, v58)
            v7("keyframeSnapChanged", {
                keyframeSnap = v58
            });
        end, 
        onToolChanged = function(_, v60)
            v7("toolChanged", {
                tool = v60
            });
        end, 
        onIkEnabled = function(_, v62)
            v7("ikEnabled", {
                guid = if not v62 then nil else string.lower(v62)
            });
            v4:ReportCounter("studio" .. "." .. "animationEditor" .. "." .. "IKEnabled", 1);
            v7("IKEnabled");
        end, 
        onIkDisabled = function(_, v64, v65)
            v7("ikDisabled", {
                timeOpen = v64, 
                guid = if not v65 then nil else string.lower(v65)
            });
        end, 
        onControlPressed = function(_, v67)
            v7("controlPressed", {
                control = v67
            });
        end, 
        onTrackAdded = function(_, v69, v70, v71)
            v7("trackAdded", {
                trackName = v69, 
                editorMode = v70, 
                guid = if not v71 then nil else string.lower(v71)
            });
        end, 
        onTrackDeleted = function(_, v73, v74, v75, v76)
            v7("trackDeleted", {
                trackName = v73, 
                hadKeyframes = v74, 
                editorMode = v75, 
                guid = if not v76 then nil else string.lower(v76)
            });
        end, 
        onTrackSelected = function(_, v78, v79, v80, v81)
            v7("trackSelected", {
                trackName = v78, 
                source = v79, 
                editorMode = v80, 
                guid = if not v81 then nil else string.lower(v81)
            });
        end, 
        onRenameKeyframe = function(_, v83, v84)
            v7("renameKeyframe", {
                name = v83, 
                guid = if not v84 then nil else string.lower(v84)
            });
        end, 
        onAddEvent = function(_, v86, v87, v88, v89)
            v7("addEvent", {
                name = v86, 
                parameter = v87, 
                editorMode = v88, 
                guid = if not v89 then nil else string.lower(v89)
            });
            v4:ReportCounter("studio" .. "." .. "animationEditor" .. "." .. "EventAdded", 1);
            v7("EventAdded");
        end, 
        onAddKeyframe = function(_, v91, v92, v93)
            v7("addKeyframe", {
                trackName = v91, 
                editorMode = v92, 
                guid = if not v93 then nil else string.lower(v93)
            });
            v4:ReportCounter("studio" .. "." .. "animationEditor" .. "." .. "KeyframeAdded", 1);
            v7("KeyframeAdded");
        end, 
        onDeleteKeyframe = function(_, v95, v96, v97)
            v7("deleteKeyframe", {
                trackName = v95, 
                editorMode = v96, 
                guid = if not v97 then nil else string.lower(v97)
            });
        end, 
        onPromoteAnimation = function(_, v99, v100, v101, v102, v103)
            v7("promoteAnimation", {
                name = v99, 
                numKeyframes = v101, 
                numTracks = v100, 
                numEvents = v102, 
                guid = if not v103 then nil else string.lower(v103)
            });
        end, 
        onAnimationEditorImportVideoCreate = function(_)
            v7("animationEditorImportVideoCreate", {});
        end, 
        onAnimationEditorImportVideoUploadCancel = function(_, v106)
            v7("animationEditorImportVideoUploadCancel", {
                duration = v106
            });
        end, 
        onAnimationEditorImportVideoUploadSucceed = function(_, v108)
            v7("animationEditorImportVideoUploadSucceed", {
                duration = v108
            });
        end, 
        onAnimationEditorImportVideoError = function(_, v110, v111)
            v7("animationEditorImportVideoError", {
                errorMsg = v110, 
                duration = v111
            });
        end, 
        onFacialAnimationRecordingEnabled = function(_)
            v7("facialAnimationRecordingEnabled", {});
        end, 
        onFacialAnimationRecordingStartRecording = function(_)
            v7("facialAnimationRecordingStartRecording", {});
        end, 
        onFacialAnimationRecordingEndRecording = function(_, v115)
            v7("facialAnimationRecordingEndRecording", {
                duration = v115
            });
        end, 
        onFacialAnimationRecordingReRecordPressed = function(_)
            v7("facialAnimationRecordingReRecordPressed", {});
        end, 
        onEditorModeSwitch = function(_, v118, v119, v120, v121)
            v7("editorModeSwitch", {
                oldMode = v118, 
                newMode = v119, 
                duration = v120, 
                guid = if not v121 then nil else string.lower(v121)
            });
        end, 
        onKeyframeReductionApply = function(_, v123, v124, v125, v126, v127, v128)
            v7("keyframeReductionApply", {
                isChannelAnimation = v124, 
                tracks = v123, 
                before = v125, 
                after = v126, 
                hasMoved = v127, 
                guid = if not v128 then nil else string.lower(v128)
            });
        end, 
        onKeyframeReductionCancel = function(_, v130, v131, v132, v133)
            v7("keyframeReductionCancel", {
                isChannelAnimation = v131, 
                tracks = v130, 
                hasMoved = v132, 
                guid = if not v133 then nil else string.lower(v133)
            });
        end, 
        onCreateFromVideo = function(_, v135)
            v7("createFromVideo", {
                guid = if not v135 then nil else string.lower(v135)
            });
        end, 
        onClipboardOperation = function(_, v137)
            v7("clipboardOperation", {
                operation = v137
            });
        end, 
        onMigrateAnimations = function(_, v139, v140, v141, v142)
            v7("migrateAnimations", {
                migrate = v139, 
                delete = v140, 
                ignore = v141, 
                skipped = v142
            });
        end
    };
end;
