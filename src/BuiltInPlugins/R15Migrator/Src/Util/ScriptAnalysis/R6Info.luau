local v0 = {
    AttachmentsKey = "Attachments", 
    AttachmentKey = "Attachment", 
    PartsKey = "Parts", 
    PartKey = "Part", 
    JointsKey = "Joints", 
    JointKey = "Joint", 
    HumanoidKey = "Humanoid", 
    AnimationKey = "Animation", 
    RigTypeKey = "RigTypeKey"
};
v0.HumanoidNames = {
    v0.HumanoidKey, 
    "humanoid", 
    "hum"
};
v0.R6RigType = "Enum.HumanoidRigType.R6";
v0.R15RigType = "Enum.HumanoidRigType.R15";
v0.Conversions = {
    [v0.HumanoidKey] = {
        Torso = "HumanoidRootPart", 
        LeftArm = "LeftUpperArm", 
        RightArm = "RightUpperArm", 
        LeftLeg = "LeftUpperLeg", 
        RightLeg = "RightUpperLeg", 
        ["Left Arm"] = "LeftUpperArm", 
        ["Right Arm"] = "RightUpperArm", 
        ["Left Leg"] = "LeftUpperLeg", 
        ["Right Leg"] = "RightUpperLeg"
    }, 
    [v0.PartsKey] = {
        LeftArm = {
            "LeftUpperArm", 
            "LeftLowerArm", 
            "LeftHand"
        }, 
        RightArm = {
            "RightUpperArm", 
            "RightLowerArm", 
            "RightHand"
        }, 
        LeftLeg = {
            "LeftUpperLeg", 
            "LeftLowerLeg", 
            "LeftFoot"
        }, 
        RightLeg = {
            "RightUpperLeg", 
            "RightLowerLeg", 
            "RightFoot"
        }, 
        ["Left Arm"] = {
            "LeftUpperArm", 
            "LeftLowerArm", 
            "LeftHand"
        }, 
        ["Right Arm"] = {
            "RightUpperArm", 
            "RightLowerArm", 
            "RightHand"
        }, 
        ["Left Leg"] = {
            "LeftUpperLeg", 
            "LeftLowerLeg", 
            "LeftFoot"
        }, 
        ["Right Leg"] = {
            "RightUpperLeg", 
            "RightLowerLeg", 
            "RightFoot"
        }, 
        Torso = {
            "UpperTorso", 
            "LowerTorso", 
            "HumanoidRootPart"
        }
    }, 
    [v0.AttachmentsKey] = {
        FaceCenterAttachment = {
            [v0.PartKey] = {
                "Head"
            }, 
            [v0.AttachmentKey] = "FaceCenterAttachment"
        }, 
        FaceFrontAttachment = {
            [v0.PartKey] = {
                "Head"
            }, 
            [v0.AttachmentKey] = "FaceFrontAttachment"
        }, 
        HairAttachment = {
            [v0.PartKey] = {
                "Head"
            }, 
            [v0.AttachmentKey] = "HairAttachment"
        }, 
        HatAttachment = {
            [v0.PartKey] = {
                "Head"
            }, 
            [v0.AttachmentKey] = "HatAttachment"
        }, 
        RootAttachment = {
            [v0.PartKey] = {
                "HumanoidRootPart"
            }, 
            [v0.AttachmentKey] = "RootRigAttachment"
        }, 
        LeftGripAttachment = {
            [v0.PartKey] = {
                "LeftHand"
            }, 
            [v0.AttachmentKey] = "LeftGripAttachment"
        }, 
        LeftShoulderAttachment = {
            [v0.PartKey] = {
                "LeftUpperArm"
            }, 
            [v0.AttachmentKey] = "LeftShoulderAttachment"
        }, 
        LeftFootAttachment = {
            [v0.PartKey] = {
                "LeftFoot"
            }, 
            [v0.AttachmentKey] = "LeftAnkleRigAttachment"
        }, 
        RightGripAttachment = {
            [v0.PartKey] = {
                "RightHand"
            }, 
            [v0.AttachmentKey] = "RightGripAttachment"
        }, 
        RightShoulderAttachment = {
            [v0.PartKey] = {
                "RightUpperArm"
            }, 
            [v0.AttachmentKey] = "RightShoulderAttachment"
        }, 
        RightFootAttachment = {
            [v0.PartKey] = {
                "RightFoot"
            }, 
            [v0.AttachmentKey] = "RightAnkleRigAttachment"
        }, 
        BodyBackAttachment = {
            [v0.PartKey] = {
                "UpperTorso"
            }, 
            [v0.AttachmentKey] = "BodyBackAttachment"
        }, 
        BodyFrontAttachment = {
            [v0.PartKey] = {
                "UpperTorso"
            }, 
            [v0.AttachmentKey] = "BodyFrontAttachment"
        }, 
        LeftCollarAttachment = {
            [v0.PartKey] = {
                "UpperTorso"
            }, 
            [v0.AttachmentKey] = "LeftCollarAttachment"
        }, 
        NeckAttachment = {
            [v0.PartKey] = {
                "UpperTorso"
            }, 
            [v0.AttachmentKey] = "NeckAttachment"
        }, 
        RightCollarAttachment = {
            [v0.PartKey] = {
                "UpperTorso"
            }, 
            [v0.AttachmentKey] = "RightCollarAttachment"
        }, 
        WaistBackAttachment = {
            [v0.PartKey] = {
                "LowerTorso"
            }, 
            [v0.AttachmentKey] = "WaistBackAttachment"
        }, 
        WaistCenterAttachment = {
            [v0.PartKey] = {
                "LowerTorso"
            }, 
            [v0.AttachmentKey] = "WaistCenterAttachment"
        }, 
        WaistFrontAttachment = {
            [v0.PartKey] = {
                "LowerTorso"
            }, 
            [v0.AttachmentKey] = "WaistFrontAttachment"
        }, 
        RootRigAttachment = {
            [v0.PartKey] = {
                "HumanoidRootPart", 
                "LowerTorso"
            }, 
            [v0.AttachmentKey] = "RootRigAttachment"
        }, 
        RightHipRigAttachment = {
            [v0.PartKey] = {
                "LowerTorso", 
                "RightUpperLeg"
            }, 
            [v0.AttachmentKey] = "RightHipRigAttachment"
        }, 
        LeftHipRigAttachment = {
            [v0.PartKey] = {
                "LowerTorso", 
                "LeftUpperLeg"
            }, 
            [v0.AttachmentKey] = "LeftHipRigAttachment"
        }, 
        LeftKneeRigAttachment = {
            [v0.PartKey] = {
                "LeftUpperLeg", 
                "LeftLowerLeg"
            }, 
            [v0.AttachmentKey] = "LeftKneeRigAttachment"
        }, 
        RightKneeRigAttachment = {
            [v0.PartKey] = {
                "RightUpperLeg", 
                "RightLowerLeg"
            }, 
            [v0.AttachmentKey] = "RightKneeRigAttachment"
        }, 
        RightElbowRigAttachment = {
            [v0.PartKey] = {
                "RightUpperArm", 
                "RightLowerArm"
            }, 
            [v0.AttachmentKey] = "RightElbowRigAttachment"
        }, 
        LeftElbowRigAttachment = {
            [v0.PartKey] = {
                "LeftUpperArm", 
                "LeftLowerArm"
            }, 
            [v0.AttachmentKey] = "LeftElbowRigAttachment"
        }, 
        WaistRigAttachment = {
            [v0.PartKey] = {
                "UpperTorso", 
                "LowerTorso"
            }, 
            [v0.AttachmentKey] = "WaistRigAttachment"
        }, 
        LeftShoulderRigAttachment = {
            [v0.PartKey] = {
                "UpperTorso", 
                "LeftUpperArm"
            }, 
            [v0.AttachmentKey] = "LeftShoulderRigAttachment"
        }, 
        RightShoulderRigAttachment = {
            [v0.PartKey] = {
                "UpperTorso", 
                "RightUpperArm"
            }, 
            [v0.AttachmentKey] = "RightShoulderRigAttachment"
        }, 
        NeckRigAttachment = {
            [v0.PartKey] = {
                "UpperTorso", 
                "Head"
            }, 
            [v0.AttachmentKey] = "NeckRigAttachment"
        }, 
        RightAnkleRigAttachment = {
            [v0.PartKey] = {
                "RightLowerLeg", 
                "RightFoot"
            }, 
            [v0.AttachmentKey] = "RightAnkleRigAttachment"
        }, 
        LeftAnkleRigAttachment = {
            [v0.PartKey] = {
                "LeftLowerLeg", 
                "LeftFoot"
            }, 
            [v0.AttachmentKey] = "LeftAnkleRigAttachment"
        }, 
        RightWristRigAttachment = {
            [v0.PartKey] = {
                "RightLowerArm", 
                "RightHand"
            }, 
            [v0.AttachmentKey] = "RightWristRigAttachment"
        }, 
        LeftWristRigAttachment = {
            [v0.PartKey] = {
                "LeftLowerArm", 
                "LeftHand"
            }, 
            [v0.AttachmentKey] = "LeftWristRigAttachment"
        }
    }, 
    [v0.JointsKey] = {
        RootJoint = {
            [v0.PartKey] = {
                "LowerTorso"
            }, 
            [v0.JointKey] = "Root"
        }, 
        Root = {
            [v0.PartKey] = {
                "LowerTorso"
            }, 
            [v0.JointKey] = "Root"
        }, 
        LeftGrip = {
            [v0.PartKey] = {
                "LeftHand"
            }, 
            [v0.JointKey] = "LeftGrip"
        }, 
        RightGrip = {
            [v0.PartKey] = {
                "RightHand"
            }, 
            [v0.JointKey] = "RightGrip"
        }, 
        ["Left Hip"] = {
            [v0.PartKey] = {
                "LeftUpperLeg"
            }, 
            [v0.JointKey] = "LeftHip"
        }, 
        LeftHip = {
            [v0.PartKey] = {
                "LeftUpperLeg"
            }, 
            [v0.JointKey] = "LeftHip"
        }, 
        ["Left Shoulder"] = {
            [v0.PartKey] = {
                "LeftUpperArm"
            }, 
            [v0.JointKey] = "LeftShoulder"
        }, 
        LeftShoulder = {
            [v0.PartKey] = {
                "LeftUpperArm"
            }, 
            [v0.JointKey] = "LeftShoulder"
        }, 
        LeftKnee = {
            [v0.PartKey] = {
                "LeftLowerLeg"
            }, 
            [v0.JointKey] = "LeftKnee"
        }, 
        LeftAnkle = {
            [v0.PartKey] = {
                "LeftFoot"
            }, 
            [v0.JointKey] = "LeftAnkle"
        }, 
        LeftElbow = {
            [v0.PartKey] = {
                "LeftLowerArm"
            }, 
            [v0.JointKey] = "LeftElbow"
        }, 
        LeftWrist = {
            [v0.PartKey] = {
                "LeftHand"
            }, 
            [v0.JointKey] = "LeftWrist"
        }, 
        Neck = {
            [v0.PartKey] = {
                "Head"
            }, 
            [v0.JointKey] = "Neck"
        }, 
        ["Right Hip"] = {
            [v0.PartKey] = {
                "RightUpperLeg"
            }, 
            [v0.JointKey] = "RightHip"
        }, 
        RightHip = {
            [v0.PartKey] = {
                "RightUpperLeg"
            }, 
            [v0.JointKey] = "RightHip"
        }, 
        RightKnee = {
            [v0.PartKey] = {
                "RightLowerLeg"
            }, 
            [v0.JointKey] = "RightKnee"
        }, 
        RightAnkle = {
            [v0.PartKey] = {
                "RightFoot"
            }, 
            [v0.JointKey] = "RightAnkle"
        }, 
        ["Right Shoulder"] = {
            [v0.PartKey] = {
                "RightUpperArm"
            }, 
            [v0.JointKey] = "RightShoulder"
        }, 
        RightShoulder = {
            [v0.PartKey] = {
                "RightUpperArm"
            }, 
            [v0.JointKey] = "RightShoulder"
        }, 
        RightElbow = {
            [v0.PartKey] = {
                "RightLowerArm"
            }, 
            [v0.JointKey] = "RightElbow"
        }, 
        RightWrist = {
            [v0.PartKey] = {
                "RightHand"
            }, 
            [v0.JointKey] = "RightWrist"
        }, 
        Waist = {
            [v0.PartKey] = {
                "UpperTorso"
            }, 
            [v0.JointKey] = "Waist"
        }
    }
};
local function _(v1)
    local v2 = {};
    for v3 in pairs(v1) do
        table.insert(v2, v3);
    end;
    return v2;
end;
v0.GetPartNames = function()
    local l_Parts_0 = v0.Conversions.Parts;
    local v6 = {};
    for v7 in pairs(l_Parts_0) do
        table.insert(v6, v7);
    end;
    return v6;
end;
v0.GetR15PartNames = function()
    local v8 = {};
    for _, v10 in v0.Conversions.Parts, nil, nil do
        for _, v12 in ipairs(v10) do
            v8[v12] = v12;
        end;
    end;
    v8.Head = "Head";
    return v8;
end;
v0.GetAttachmentNames = function()
    local l_Attachments_0 = v0.Conversions.Attachments;
    local v14 = {};
    for v15 in pairs(l_Attachments_0) do
        table.insert(v14, v15);
    end;
    return v14;
end;
v0.GetJointNames = function()
    local l_Joints_0 = v0.Conversions.Joints;
    local v17 = {};
    for v18 in pairs(l_Joints_0) do
        table.insert(v17, v18);
    end;
    return v17;
end;
v0.IsHumanoidName = function(v19)
    if not string.find(string.lower(v19), string.lower(v0.HumanoidKey)) then
        for _, v21 in v0.HumanoidNames, nil, nil do
            if v21 == v19 then
                return true;
            end;
        end;
        return false;
    else
        return true;
    end;
end;
return v0;
