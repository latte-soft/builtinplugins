local l_script_FirstAncestor_0 = script:FindFirstAncestor("AvatarCompatibilityPreviewer");
local v1 = require(l_script_FirstAncestor_0.Packages.Cryo);
local v2 = require(l_script_FirstAncestor_0.Packages.Dash);
local v3 = require(l_script_FirstAncestor_0.Src.Resources.BuiltinItems);
local v4 = require(l_script_FirstAncestor_0.Src.Util.CatalogItemUtil);
local v5 = require(l_script_FirstAncestor_0.Src.Util.Constants);
local _ = require(l_script_FirstAncestor_0.Src.Types);
local v7 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagAvatarPreviewerClothingTypeIcons);
local v8 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagAvatarPreviewerNewCatalogAccessories);
local v9 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagAvatarPreviewerReorganizeCheckFace);
local v10 = game:DefineFastString("AvatarPreviewerEyebrowIds", "11572097774");
local v11 = game:DefineFastString("AvatarPreviewerEyelashIds", "11572100557");
local function _(v12)
    return BrickColor.new(v12).Color;
end;
local function _(v14)
    return v2.map(string.split(v14, ","), function(v15)
        return (tonumber(v15));
    end);
end;
local _ = function(v17)
    local v18 = {};
    for _, v20 in v17, nil, nil do
        table.insert(v18, v20.id);
    end;
    return v18;
end;
local v22 = {};
local v23;
if not v9() then
    v23 = v1.List.join;
    local v24 = {};
    local l_layeredClothingPalette_0 = v4.layeredClothingPalette;
    local v26 = "Hair";
    local l_HairAccessory_0 = Enum.AssetType.HairAccessory;
    local v28;
    if not v8() then
        v28 = {
            9244021842, 
            9244122897, 
            9243987340, 
            9244060144, 
            9174353649, 
            7193450455, 
            9244067444, 
            9244097555, 
            7193445686, 
            7193454569
        };
    else
        local l_hair_0 = v3.hair;
        local v30 = {};
        for _, v32 in l_hair_0, nil, nil do
            table.insert(v30, v32.id);
        end;
        v28 = v30;
    end;
    l_layeredClothingPalette_0 = l_layeredClothingPalette_0(v26, l_HairAccessory_0, v28, v5.PREFERRED_LAYERS.Hair);
    v26 = v4.basicAccessoryPalette;
    l_HairAccessory_0 = "Head";
    v28 = Enum.AssetType.Hat;
    local v33;
    if not v8() then
        v33 = {
            607702162, 
            7951064603, 
            7893381364, 
            102619342, 
            1374269, 
            1038669, 
            10527448135, 
            89615321, 
            13476872
        };
    else
        local l_head_0 = v3.head;
        local v35 = {};
        for _, v37 in l_head_0, nil, nil do
            table.insert(v35, v37.id);
        end;
        v33 = v35;
    end;
    v26 = v26(l_HairAccessory_0, v28, v33);
    l_HairAccessory_0 = v4.layeredClothingPalette;
    v28 = "Face";
    v33 = Enum.AssetType.FaceAccessory;
    local v38;
    if not v8() then
        v38 = {
            1192464705, 
            74970669, 
            1241185542, 
            20642008, 
            3210207381, 
            12313685, 
            158066137, 
            13702134
        };
    else
        local l_face_0 = v3.face;
        local v40 = {};
        for _, v42 in l_face_0, nil, nil do
            table.insert(v40, v42.id);
        end;
        v38 = v40;
    end;
    l_HairAccessory_0 = l_HairAccessory_0(v28, v33, v38, v5.PREFERRED_LAYERS.Face);
    v28 = v4.layeredClothingPalette;
    v33 = "Eyebrows";
    v38 = Enum.AssetType.EyebrowAccessory;
    local v43;
    if not v7() then
        v43 = v2.map(string.split(v10, ","), function(v44)
            return (tonumber(v44));
        end);
    else
        local l_eyebrows_0 = v3.eyebrows;
        local v46 = {};
        for _, v48 in l_eyebrows_0, nil, nil do
            table.insert(v46, v48.id);
        end;
        v43 = v46;
    end;
    v28 = v28(v33, v38, v43, v5.PREFERRED_LAYERS.Eyebrows);
    v33 = v4.layeredClothingPalette;
    v38 = "Eyelashes";
    v43 = Enum.AssetType.EyelashAccessory;
    local v49;
    if not v7() then
        v49 = v2.map(string.split(v11, ","), function(v50)
            return (tonumber(v50));
        end);
    else
        local l_eyelashes_0 = v3.eyelashes;
        local v52 = {};
        for _, v54 in l_eyelashes_0, nil, nil do
            table.insert(v52, v54.id);
        end;
        v49 = v52;
    end;
    ??? = v33(v38, v43, v49, v5.PREFERRED_LAYERS.Eyelashes);
    setlist { ['R017[1 to ???]'] = 'R018 to ???' };
    if not v8() then
        l_layeredClothingPalette_0 = {};
    else
        l_layeredClothingPalette_0 = {};
        v26 = v4.basicAccessoryPalette;
        l_HairAccessory_0 = "Front";
        v28 = Enum.AssetType.FrontAccessory;
        v38 = v3.front;
        v43 = {};
        for _, v56 in v38, nil, nil do
            table.insert(v43, v56.id);
        end;
        ??? = v26(l_HairAccessory_0, v28, v43);
        setlist { ['R018[1 to ???]'] = 'R019 to ???' };
    end;
    v26 = {};
    l_HairAccessory_0 = v4.basicAccessoryPalette;
    v28 = "Neck";
    v33 = Enum.AssetType.NeckAccessory;
    if not v8() then
        v38 = {
            13881788203, 
            12566318504, 
            12272017766, 
            11515295880, 
            12272010851, 
            10648495674
        };
    else
        v43 = v3.neck;
        v49 = {};
        for _, v58 in v43, nil, nil do
            table.insert(v49, v58.id);
        end;
        v38 = v49;
    end;
    l_HairAccessory_0 = l_HairAccessory_0(v28, v33, v38);
    v28 = v4.basicAccessoryPalette;
    v33 = "Shoulder";
    v38 = Enum.AssetType.ShoulderAccessory;
    if not v8() then
        v43 = {
            2620477453, 
            106709021, 
            7243878029, 
            8760832521, 
            6467614725
        };
    else
        v49 = v3.shoulder;
        local v59 = {};
        for _, v61 in v49, nil, nil do
            table.insert(v59, v61.id);
        end;
        v43 = v59;
    end;
    v28 = v28(v33, v38, v43);
    v33 = v4.basicAccessoryPalette;
    v38 = "Back";
    v43 = Enum.AssetType.BackAccessory;
    if not v8() then
        v49 = {
            1180432276, 
            11821667294, 
            12272035364, 
            13820443205, 
            1744123855
        };
    else
        local l_back_0 = v3.back;
        local v63 = {};
        for _, v65 in l_back_0, nil, nil do
            table.insert(v63, v65.id);
        end;
        v49 = v63;
    end;
    v33 = v33(v38, v43, v49);
    v38 = v4.basicAccessoryPalette;
    v43 = "Waist";
    v49 = Enum.AssetType.WaistAccessory;
    local v66;
    if not v8() then
        v66 = {
            791329052, 
            187846604, 
            738679517, 
            472507574, 
            3576665068, 
            1117719026, 
            8697885688, 
            10616839810, 
            3230476122, 
            7065897530
        };
    else
        local l_waist_0 = v3.waist;
        local v68 = {};
        for _, v70 in l_waist_0, nil, nil do
            table.insert(v68, v70.id);
        end;
        v66 = v68;
    end;
    ??? = v38(v43, v49, v66);
    setlist { ['R019[1 to ???]'] = 'R020 to ???' };
    v23 = v23(v24, l_layeredClothingPalette_0, v26);
else
    v23 = v1.List.join;
    local v71 = {};
    local l_layeredClothingPalette_1 = v4.layeredClothingPalette;
    local v73 = "Hair";
    local l_HairAccessory_1 = Enum.AssetType.HairAccessory;
    local l_hair_1 = v3.hair;
    local v76 = {};
    for _, v78 in l_hair_1, nil, nil do
        table.insert(v76, v78.id);
    end;
    ??? = l_layeredClothingPalette_1(v73, l_HairAccessory_1, v76, v5.PREFERRED_LAYERS.Hair);
    setlist { ['R017[1 to ???]'] = 'R018 to ???' };
    if not v8() then
        l_layeredClothingPalette_1 = {};
    else
        l_layeredClothingPalette_1 = {};
        v73 = v4.basicAccessoryPalette;
        l_HairAccessory_1 = "Front";
        local l_FrontAccessory_0 = Enum.AssetType.FrontAccessory;
        v76 = v3.front;
        local v80 = {};
        for _, v82 in v76, nil, nil do
            table.insert(v80, v82.id);
        end;
        ??? = v73(l_HairAccessory_1, l_FrontAccessory_0, v80);
        setlist { ['R018[1 to ???]'] = 'R019 to ???' };
    end;
    v73 = {};
    l_HairAccessory_1 = v4.basicAccessoryPalette;
    local v83 = "Neck";
    l_hair_1 = Enum.AssetType.NeckAccessory;
    if not v8() then
        v76 = {
            13881788203, 
            12566318504, 
            12272017766, 
            11515295880, 
            12272010851, 
            10648495674
        };
    else
        local l_neck_0 = v3.neck;
        local v85 = {};
        for _, v87 in l_neck_0, nil, nil do
            table.insert(v85, v87.id);
        end;
        v76 = v85;
    end;
    l_HairAccessory_1 = l_HairAccessory_1(v83, l_hair_1, v76);
    v83 = v4.basicAccessoryPalette;
    l_hair_1 = "Shoulder";
    v76 = Enum.AssetType.ShoulderAccessory;
    local v88;
    if not v8() then
        v88 = {
            2620477453, 
            106709021, 
            7243878029, 
            8760832521, 
            6467614725
        };
    else
        local l_shoulder_0 = v3.shoulder;
        local v90 = {};
        for _, v92 in l_shoulder_0, nil, nil do
            table.insert(v90, v92.id);
        end;
        v88 = v90;
    end;
    v83 = v83(l_hair_1, v76, v88);
    l_hair_1 = v4.basicAccessoryPalette;
    v76 = "Back";
    v88 = Enum.AssetType.BackAccessory;
    local v93;
    if not v8() then
        v93 = {
            1180432276, 
            11821667294, 
            12272035364, 
            13820443205, 
            1744123855
        };
    else
        local l_back_1 = v3.back;
        local v95 = {};
        for _, v97 in l_back_1, nil, nil do
            table.insert(v95, v97.id);
        end;
        v93 = v95;
    end;
    l_hair_1 = l_hair_1(v76, v88, v93);
    v76 = v4.basicAccessoryPalette;
    v88 = "Waist";
    v93 = Enum.AssetType.WaistAccessory;
    local v98;
    if not v8() then
        v98 = {
            791329052, 
            187846604, 
            738679517, 
            472507574, 
            3576665068, 
            1117719026, 
            8697885688, 
            10616839810, 
            3230476122, 
            7065897530
        };
    else
        local l_waist_1 = v3.waist;
        local v100 = {};
        for _, v102 in l_waist_1, nil, nil do
            table.insert(v100, v102.id);
        end;
        v98 = v100;
    end;
    ??? = v76(v88, v93, v98);
    setlist { ['R019[1 to ???]'] = 'R020 to ???' };
    v23 = v23(v71, l_layeredClothingPalette_1, v73);
end;
v22.accessories = v23;
v22.animations = {
    v4.createBodyAnimationPalette("Movement", {
        16540596584, 
        16562317918, 
        16562332340, 
        16562326358, 
        16562321958, 
        16562307212, 
        16562311455, 
        16562329379
    }), 
    v4.createBodyAnimationPalette("BodyEmotes", {
        16569676514, 
        16569175989, 
        16569548328, 
        16569163126, 
        10714358528, 
        10714395441, 
        10714383856, 
        4940563117, 
        10714347256, 
        10714369325
    })
};
v22.body = v1.List.join({
    v4.skinPalette({
        BrickColor.new("Dirt brown").Color, 
        BrickColor.new("Reddish brown").Color, 
        BrickColor.new("Brown").Color, 
        BrickColor.new("Sand red").Color, 
        BrickColor.new("Linen").Color, 
        BrickColor.new("Burlap").Color, 
        BrickColor.new("Brick yellow").Color, 
        BrickColor.new("Medium red").Color, 
        BrickColor.new("Dusty Rose").Color, 
        BrickColor.new("CGA brown").Color, 
        BrickColor.new("Dark orange").Color, 
        BrickColor.new("Nougat").Color, 
        BrickColor.new("Light orange").Color, 
        BrickColor.new("Pastel brown").Color, 
        BrickColor.new("Neon orange").Color, 
        BrickColor.new("Bright orange").Color, 
        BrickColor.new("Br. yellowish orange").Color, 
        BrickColor.new("Deep orange").Color, 
        BrickColor.new("Bright yellow").Color, 
        BrickColor.new("Daisy orange").Color, 
        BrickColor.new("Cool yellow").Color, 
        BrickColor.new("Earth green").Color, 
        BrickColor.new("Camo").Color, 
        BrickColor.new("Dark green").Color, 
        BrickColor.new("Bright green").Color, 
        BrickColor.new("Shamrock").Color, 
        BrickColor.new("Moss").Color, 
        BrickColor.new("Br. yellowish green").Color, 
        BrickColor.new("Navy blue").Color, 
        BrickColor.new("Deep blue").Color, 
        BrickColor.new("Really blue").Color, 
        BrickColor.new("Bright blue").Color, 
        BrickColor.new("Steel blue").Color, 
        BrickColor.new("Medium blue").Color, 
        BrickColor.new("Light blue").Color, 
        BrickColor.new("Bright bluish green").Color, 
        BrickColor.new("Teal").Color, 
        BrickColor.new("Pastel blue-green").Color, 
        BrickColor.new("Toothpaste").Color, 
        BrickColor.new("Cyan").Color, 
        BrickColor.new("Pastel Blue").Color, 
        BrickColor.new("Pastel light blue").Color, 
        BrickColor.new("Bright violet").Color, 
        BrickColor.new("Lavender").Color, 
        BrickColor.new("Lilac").Color, 
        BrickColor.new("Magenta").Color, 
        BrickColor.new("Royal purple").Color, 
        BrickColor.new("Alder").Color, 
        BrickColor.new("Pastel violet").Color, 
        BrickColor.new("Bright red").Color, 
        BrickColor.new("Really red").Color, 
        BrickColor.new("Hot pink").Color, 
        BrickColor.new("Pink").Color, 
        BrickColor.new("Carnation pink").Color, 
        BrickColor.new("Light reddish violet").Color, 
        BrickColor.new("Pastel orange").Color, 
        BrickColor.new("Dark taupe").Color, 
        BrickColor.new("Cork").Color, 
        BrickColor.new("Olive").Color, 
        BrickColor.new("Medium green").Color, 
        BrickColor.new("Grime").Color, 
        BrickColor.new("Sand green").Color, 
        BrickColor.new("Sand blue").Color, 
        BrickColor.new("Lime green").Color, 
        BrickColor.new("Pastel green").Color, 
        BrickColor.new("New Yeller").Color, 
        BrickColor.new("Pastel yellow").Color, 
        BrickColor.new("Really black").Color, 
        BrickColor.new("Black").Color, 
        BrickColor.new("Dark stone grey").Color, 
        BrickColor.new("Medium stone grey").Color, 
        BrickColor.new("Mid gray").Color, 
        BrickColor.new("Light stone grey").Color, 
        BrickColor.new("White").Color
    }), 
    v4.createHeadPalette({
        10687288296, 
        10725626210, 
        11572085825, 
        11584333045, 
        9107287520, 
        4908014528, 
        11775683481, 
        10407915508, 
        13207192743
    })
}, v4.createBodyCategory({
    {
        Torso = 10610645439, 
        LeftArm = 10610637502, 
        RightArm = 10610642340, 
        LeftLeg = 10610640030, 
        RightLeg = 10610643939
    }, 
    {
        Torso = 11572083496, 
        LeftArm = 11572074613, 
        RightArm = 11572079320, 
        LeftLeg = 11572076845, 
        RightLeg = 11572081357
    }, 
    {
        Torso = 11740060397, 
        LeftArm = 11740050465, 
        RightArm = 11740055375, 
        LeftLeg = 11740052832, 
        RightLeg = 11740057815
    }, 
    {
        Torso = 11775682187, 
        LeftArm = 11775676733, 
        RightArm = 11775679683, 
        LeftLeg = 11775678171, 
        RightLeg = 11775680970
    }, 
    {
        Torso = 7200824885, 
        LeftArm = 7200822331, 
        RightArm = 7200823471, 
        LeftLeg = 7200822888, 
        RightLeg = 7200824015
    }, 
    {
        Torso = 13207187481, 
        LeftArm = 13207165801, 
        RightArm = 13207181458, 
        LeftLeg = 13207168831, 
        RightLeg = 13207184265
    }
}));
v23 = {};
local l_layeredClothingPalette_2 = v4.layeredClothingPalette;
local v104 = "Shirts";
local l_ShirtAccessory_0 = Enum.AssetType.ShirtAccessory;
local v106;
if not v7() then
    v106 = {
        7178736794, 
        7178735702, 
        6984729814, 
        7178740556, 
        9620950227, 
        9620976296
    };
else
    local l_shirts_0 = v3.shirts;
    local v108 = {};
    for _, v110 in l_shirts_0, nil, nil do
        table.insert(v108, v110.id);
    end;
    v106 = v108;
end;
l_layeredClothingPalette_2 = l_layeredClothingPalette_2(v104, l_ShirtAccessory_0, v106, v5.PREFERRED_LAYERS.Tops);
v104 = v4.layeredClothingPalette;
l_ShirtAccessory_0 = "TShirts";
v106 = Enum.AssetType.TShirtAccessory;
local v111;
if not v7() then
    v111 = {
        9112474888, 
        7178736794, 
        7178737816
    };
else
    local l_tshirts_0 = v3.tshirts;
    local v113 = {};
    for _, v115 in l_tshirts_0, nil, nil do
        table.insert(v113, v115.id);
    end;
    v111 = v113;
end;
v104 = v104(l_ShirtAccessory_0, v106, v111, v5.PREFERRED_LAYERS.Tops);
l_ShirtAccessory_0 = v4.layeredClothingPalette;
v106 = "Jackets";
v111 = Enum.AssetType.JacketAccessory;
local v116;
if not v7() then
    v116 = {
        6984765766, 
        6984767443, 
        7272485361, 
        7192535654, 
        7192544729
    };
else
    local l_jackets_0 = v3.jackets;
    local v118 = {};
    for _, v120 in l_jackets_0, nil, nil do
        table.insert(v118, v120.id);
    end;
    v116 = v118;
end;
l_ShirtAccessory_0 = l_ShirtAccessory_0(v106, v111, v116, v5.PREFERRED_LAYERS.Outerwear);
v106 = v4.layeredClothingPalette;
v111 = "Sweaters";
v116 = Enum.AssetType.SweaterAccessory;
local v121;
if not v7() then
    v121 = {
        9240758221, 
        9913119150, 
        9913110927, 
        9174379982, 
        6984769289, 
        6984771334, 
        9240757332, 
        9274353324
    };
else
    local l_sweaters_0 = v3.sweaters;
    local v123 = {};
    for _, v125 in l_sweaters_0, nil, nil do
        table.insert(v123, v125.id);
    end;
    v121 = v123;
end;
v106 = v106(v111, v116, v121, v5.PREFERRED_LAYERS.Tops);
v111 = v4.layeredClothingPalette;
v116 = "Pants";
v121 = Enum.AssetType.PantsAccessory;
local v126;
if not v7() then
    v126 = {
        6984763785, 
        6984740059, 
        7192673981, 
        7192681239, 
        7192679765
    };
else
    local l_pants_0 = v3.pants;
    local v128 = {};
    for _, v130 in l_pants_0, nil, nil do
        table.insert(v128, v130.id);
    end;
    v126 = v128;
end;
v111 = v111(v116, v121, v126, v5.PREFERRED_LAYERS.Bottoms);
v116 = v4.layeredClothingPalette;
v121 = "Shorts";
v126 = Enum.AssetType.ShortsAccessory;
local v131;
if not v7() then
    v131 = {
        6984773235, 
        7192683061, 
        7192685245
    };
else
    local l_shorts_0 = v3.shorts;
    local v133 = {};
    for _, v135 in l_shorts_0, nil, nil do
        table.insert(v133, v135.id);
    end;
    v131 = v133;
end;
v116 = v116(v121, v126, v131, v5.PREFERRED_LAYERS.Bottoms);
v121 = v4.layeredClothingPalette;
v126 = "Skirts";
v131 = Enum.AssetType.DressSkirtAccessory;
local v136;
if not v7() then
    v136 = {
        7192691582, 
        7192690731, 
        9284466791, 
        10278865927, 
        7192695838
    };
else
    local l_skirts_0 = v3.skirts;
    local v138 = {};
    for _, v140 in l_skirts_0, nil, nil do
        table.insert(v138, v140.id);
    end;
    v136 = v138;
end;
v121 = v121(v126, v131, v136, v5.PREFERRED_LAYERS.Bottoms);
v126 = v4.shoesPalette({
    {
        left = 8722031289, 
        right = 8722020587
    }, 
    {
        left = 7193170137, 
        right = 7193171232
    }, 
    {
        left = 7193104827, 
        right = 7193106211
    }
});
setlist { ['R016[1 to 8]'] = 'R017 to R024' };
v22.clothing = v23;
v22.face = if v9() then nil else {
    v4.emotionPalette({
        13965126930, 
        13965139478, 
        13965076233, 
        13965039145, 
        13965064041, 
        13965162732
    })
};
v22.animations_face = if not v9() then nil else {
    v4.emotionPalette({
        13965126930, 
        13965139478, 
        13965076233, 
        13965039145, 
        13965064041, 
        13965162732
    })
};
if not v9() then
    v23 = nil;
else
    v23 = {};
    l_layeredClothingPalette_2 = v4.basicAccessoryPalette;
    v104 = "Head";
    l_ShirtAccessory_0 = Enum.AssetType.Hat;
    if not v8() then
        v106 = {
            607702162, 
            7951064603, 
            7893381364, 
            102619342, 
            1374269, 
            1038669, 
            10527448135, 
            89615321, 
            13476872
        };
    else
        v111 = v3.head;
        v116 = {};
        for _, v142 in v111, nil, nil do
            table.insert(v116, v142.id);
        end;
        v106 = v116;
    end;
    l_layeredClothingPalette_2 = l_layeredClothingPalette_2(v104, l_ShirtAccessory_0, v106);
    v104 = v4.layeredClothingPalette;
    l_ShirtAccessory_0 = "Face";
    v106 = Enum.AssetType.FaceAccessory;
    if not v8() then
        v111 = {
            1192464705, 
            74970669, 
            1241185542, 
            20642008, 
            3210207381, 
            12313685, 
            158066137, 
            13702134
        };
    else
        v116 = v3.face;
        v121 = {};
        for _, v144 in v116, nil, nil do
            table.insert(v121, v144.id);
        end;
        v111 = v121;
    end;
    v104 = v104(l_ShirtAccessory_0, v106, v111, v5.PREFERRED_LAYERS.Face);
    l_ShirtAccessory_0 = v4.layeredClothingPalette;
    v106 = "Eyebrows";
    v111 = Enum.AssetType.EyebrowAccessory;
    if not v7() then
        v116 = v2.map(string.split(v10, ","), function(v145)
            return (tonumber(v145));
        end);
    else
        v121 = v3.eyebrows;
        v126 = {};
        for _, v147 in v121, nil, nil do
            table.insert(v126, v147.id);
        end;
        v116 = v126;
    end;
    l_ShirtAccessory_0 = l_ShirtAccessory_0(v106, v111, v116, v5.PREFERRED_LAYERS.Eyebrows);
    v106 = v4.layeredClothingPalette;
    v111 = "Eyelashes";
    v116 = Enum.AssetType.EyelashAccessory;
    if not v7() then
        v121 = v2.map(string.split(v11, ","), function(v148)
            return (tonumber(v148));
        end);
    else
        v126 = v3.eyelashes;
        v131 = {};
        for _, v150 in v126, nil, nil do
            table.insert(v131, v150.id);
        end;
        v121 = v131;
    end;
    ??? = v106(v111, v116, v121, v5.PREFERRED_LAYERS.Eyelashes);
    setlist { ['R016[1 to ???]'] = 'R017 to ???' };
end;
v22.accessories_face = v23;
return v22;
