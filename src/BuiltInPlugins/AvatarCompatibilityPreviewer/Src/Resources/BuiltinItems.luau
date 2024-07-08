local l_script_FirstAncestor_0 = script:FindFirstAncestor("AvatarCompatibilityPreviewer");
local _ = require(l_script_FirstAncestor_0.Src.Types);
local v2 = require(l_script_FirstAncestor_0.Src.Util.flatten);
local v3 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagAvatarPreviewerClothingTypeIcons);
local v4 = {};
local function v10(v5, v6)
    local v7 = {};
    for _, v9 in v6, nil, nil do
        table.insert(v7, {
            id = v9, 
            attachment = v5, 
            accessoryType = "rigid"
        });
    end;
    return v7;
end;
local function _(v11)
    return function(v12)
        return {
            id = v12, 
            attachment = v11, 
            accessoryType = "rigid"
        };
    end;
end;
local function _(v14)
    v14.accessoryType = "layered";
    return v14;
end;
local function v20(v16)
    local v17 = {};
    for _, v19 in v16, nil, nil do
        table.insert(v17, {
            id = v19, 
            accessoryType = "layered"
        });
    end;
    return v17;
end;
if not v3() then
    v4.hair = v10("HairAttachment", {
        13902886383, 
        11195420056, 
        10966682388, 
        846803597, 
        9244114211, 
        7193451306, 
        7193386173, 
        7193452166
    });
else
    local v21 = "HairAttachment";
    local l_v21_0 = v21 --[[ copy: 10 -> 23 ]];
    local function v24(v23)
        return {
            id = v23, 
            attachment = l_v21_0, 
            accessoryType = "rigid"
        };
    end;
    v21 = {};
    local v25 = v24(13902886383);
    local v26 = v24(11195420056);
    v26.accessoryType = "layered";
    local l_v26_0 = v26;
    v26 = v24(10966682388);
    local v28 = v24(846803597);
    local v29 = v24(9244114211);
    v29.accessoryType = "layered";
    local l_v29_0 = v29;
    local v31 = v24(7193451306);
    v31.accessoryType = "layered";
    v29 = v31;
    local v32 = v24(7193386173);
    v32.accessoryType = "layered";
    v31 = v32;
    local v33 = v24(7193452166);
    v33.accessoryType = "layered";
    v32 = v33;
    setlist { ['R010[1 to 8]'] = 'R011 to R018' };
    v4.hair = v21;
end;
v4.head = v10("HatAttachment", {
    9111390490, 
    16018338042, 
    1744330435, 
    3757852497
});
local v34 = "FaceCenterAttachment";
local l_v34_0 = v34 --[[ copy: 10 -> 24 ]];
local function v37(v36)
    return {
        id = v36, 
        attachment = l_v34_0, 
        accessoryType = "rigid"
    };
end;
local v38 = "FaceFrontAttachment";
local l_v38_0 = v38 --[[ copy: 11 -> 25 ]];
v34 = function(v40)
    return {
        id = v40, 
        attachment = l_v38_0, 
        accessoryType = "rigid"
    };
end;
if not v3() then
    v4.face = {
        v34(16640910727), 
        v34(16648934240), 
        v34(9992285857), 
        v34(14179786408), 
        v34(12794788453), 
        v34(12796340774), 
        v34(12794916165), 
        v34(12796163960), 
        v37(16648984941), 
        v37(16649071525), 
        v37(13538969595), 
        v37(16648586095)
    };
else
    v38 = {};
    local v41 = v34(16640910727);
    local v42 = v34(16648934240);
    local v43 = v34(9992285857);
    local v44 = v34(14179786408);
    local v45 = v34(12794788453);
    v45.accessoryType = "layered";
    local l_v45_0 = v45;
    local v47 = v34(12796340774);
    v47.accessoryType = "layered";
    v45 = v47;
    local v48 = v34(12794916165);
    v48.accessoryType = "layered";
    v47 = v48;
    local v49 = v34(12796163960);
    v49.accessoryType = "layered";
    v48 = v49;
    v49 = v37(16648984941);
    local v50 = v37(16649071525);
    local v51 = v37(13538969595);
    ??? = v37(16648586095);
    setlist { ['R011[1 to ???]'] = 'R012 to ???' };
    v4.face = v38;
end;
v4.front = v10("BodyFrontAttachment", {
    16648690355, 
    16648652231, 
    16648706823, 
    16648698037
});
v4.neck = v10("NeckAttachment", {
    16648958003, 
    16648625265, 
    3690490960, 
    15696295454
});
local v52 = "LeftCollarAttachment";
local l_v52_0 = v52 --[[ copy: 12 -> 26 ]];
v38 = function(v54)
    return {
        id = v54, 
        attachment = l_v52_0, 
        accessoryType = "rigid"
    };
end;
local v55 = "RightCollarAttachment";
local l_v55_0 = v55 --[[ copy: 13 -> 27 ]];
v52 = function(v57)
    return {
        id = v57, 
        attachment = l_v55_0, 
        accessoryType = "rigid"
    };
end;
local v58 = "LeftShoulderAttachment";
local l_v58_0 = v58 --[[ copy: 14 -> 28 ]];
v55 = function(v60)
    return {
        id = v60, 
        attachment = l_v58_0, 
        accessoryType = "rigid"
    };
end;
local v61 = "RightShoulderAttachment";
local l_v61_0 = v61 --[[ copy: 15 -> 29 ]];
v58 = function(v63)
    return {
        id = v63, 
        attachment = l_v61_0, 
        accessoryType = "rigid"
    };
end;
v4.shoulder = {
    v55(16648897492), 
    v58(16648905400), 
    v55(16648604510), 
    v58(16648615805), 
    v55(16649028183), 
    v58(16649036767), 
    v55(9175325868), 
    v58(9175327271), 
    v38(16648502798), 
    v52(16648553830), 
    v38(16648441318), 
    v52(16648488869), 
    v38(16648993618), 
    v52(16649003855), 
    v38(16648866296), 
    v52(16648873760)
};
v4.back = v10("BodyBackAttachment", {
    9111378574, 
    11774181392, 
    10685856744, 
    9175323644
});
local v64 = "WaistBackAttachment";
local l_v64_0 = v64 --[[ copy: 16 -> 30 ]];
v61 = function(v66)
    return {
        id = v66, 
        attachment = l_v64_0, 
        accessoryType = "rigid"
    };
end;
local v67 = "WaistCenterAttachment";
local l_v67_0 = v67 --[[ copy: 17 -> 31 ]];
v64 = function(v69)
    return {
        id = v69, 
        attachment = l_v67_0, 
        accessoryType = "rigid"
    };
end;
local v70 = "WaistFrontAttachment";
v67 = function(v71)
    return {
        id = v71, 
        attachment = v70, 
        accessoryType = "rigid"
    };
end;
v4.waist = {
    v67(16648852016), 
    v67(16648681897), 
    v67(7065897530), 
    v67(6494274794), 
    v64(16648672949), 
    v64(16649078388), 
    v64(8697885688), 
    v64(3230476122), 
    v61(10616839810), 
    v61(13902900757), 
    v61(13207223896), 
    v61(4707869391)
};
if not v3() then
    v4.allItems = v2(v4.hair, v4.head, v4.face, v4.front, v4.neck, v4.shoulder, v4.back, v4.waist);
    return v4;
else
    v4.shirts = v20({
        7178736794, 
        7178735702, 
        6984729814, 
        7178740556, 
        9620950227, 
        9620976296
    });
    v4.tshirts = v20({
        9112474888, 
        7178736794, 
        7178737816
    });
    v4.jackets = v20({
        6984765766, 
        6984767443, 
        7272485361, 
        7192535654, 
        7192544729
    });
    v4.sweaters = v20({
        9240758221, 
        9913119150, 
        9913110927, 
        9174379982, 
        6984769289, 
        6984771334, 
        9240757332, 
        9274353324
    });
    v4.pants = v20({
        6984763785, 
        6984740059, 
        7192673981, 
        7192681239, 
        7192679765
    });
    v4.shorts = v20({
        6984773235, 
        7192683061, 
        7192685245
    });
    v4.skirts = v20({
        7192691582, 
        7192690731, 
        9284466791, 
        10278865927, 
        7192695838
    });
    v4.shoes = v20({
        8722031289, 
        7193170137, 
        7193104827
    });
    v4.eyebrows = v20({
        11572097774
    });
    v4.eyelashes = v20({
        11572100557
    });
    v4.allItems = v2(v4.hair, v4.head, v4.face, v4.front, v4.neck, v4.shoulder, v4.back, v4.waist, v4.shirts, v4.tshirts, v4.jackets, v4.sweaters, v4.pants, v4.shorts, v4.skirts, v4.shoes, v4.eyebrows, v4.eyelashes);
    return v4;
end;
