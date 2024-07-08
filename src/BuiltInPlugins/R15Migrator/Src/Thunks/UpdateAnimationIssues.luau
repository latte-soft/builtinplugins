local l_script_FirstAncestor_0 = script:FindFirstAncestor("R15Migrator");
local l_deepCopy_0 = require(l_script_FirstAncestor_0.Packages.Framework).Util.deepCopy;
local v2 = require(l_script_FirstAncestor_0.Packages.Cryo);
local l_AnimationConversion_0 = l_script_FirstAncestor_0.Src.Util.AnimationConversion;
local v4 = require(l_AnimationConversion_0.AnimationConversionManager);
local v5 = require(l_AnimationConversion_0.AnimationState);
local l_AssetType_0 = require(l_AnimationConversion_0.constants).AssetType;
local v7 = require(l_script_FirstAncestor_0.Src.Actions.SetAnimations);
local function v18(v8, v9, v10)
    for _, v12 in v9, nil, nil do
        local v13 = v4.getAnimationAssetInfo(v12.str);
        local l_id_0 = v13.id;
        local v15 = v8[l_id_0];
        if not v15 then
            v15 = v5.new(v13, v4.getCachedName(l_id_0) or tostring(l_id_0), v10, nil, v4.getConvertedAssetId(l_id_0));
            v10 = v10 + 1;
            v8[l_id_0] = v15;
        end;
        v15.refs[v12] = v13;
        v15.status = nil;
        for v16, _ in v15.oldRefs, nil, nil do
            if v16 == v12 then
                v15.oldRefs[v16] = nil;
            end;
        end;
    end;
end;
local function v28(v19, v20)
    for _, v22 in v20, nil, nil do
        local v23 = v19[v4.getAnimationAssetInfo(v22.str).id];
        local v24 = {};
        local v25 = 0;
        if v23 then
            for v26, v27 in v23.refs, nil, nil do
                if v27:IsA(l_AssetType_0.AssetIdString) and v26 == v22 then
                    table.insert(v24, v26);
                end;
                v25 = v25 + 1;
            end;
            if #v24 ~= 0 then
                v23:removeRefs(v24);
            end;
        end;
    end;
end;
local function v39(v29, v30)
    local v31 = {};
    for v32, v33 in v29, nil, nil do
        if v30[v32] then
            for _, v35 in v33, nil, nil do
                local v36 = false;
                for _, v38 in v30[v32], nil, nil do
                    if v35 == v38 then
                        v36 = true;
                        break;
                    end;
                end;
                if not v36 then
                    table.insert(v31, v35);
                end;
            end;
        else
            v31 = v2.List.join(v31, v33);
        end;
    end;
    return v31;
end;
return function(v40, v41)
    return function(v42)
        local v43 = v39(v41, v40);
        local v44 = v39(v40, v41);
        if #v43 == 0 and #v44 == 0 then
            return ;
        else
            local v45 = l_deepCopy_0(v42:getState().AnimationConversion.animations);
            local v46 = 0;
            for _, v48 in v45, nil, nil do
                if v46 <= v48.index then
                    v46 = v48.index + 1;
                end;
            end;
            v18(v45, v43, v46);
            v28(v45, v44);
            v42:dispatch(v7(v45));
            return ;
        end;
    end;
end;
