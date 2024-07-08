local l_script_FirstAncestor_0 = script:FindFirstAncestor("R15Migrator");
local v1 = require(l_script_FirstAncestor_0.Packages.Rodux);
local v2 = require(l_script_FirstAncestor_0.Packages.Cryo);
local v3 = require(l_script_FirstAncestor_0.Src.Util.AnimationConversion.constants);
local function v4()
    return {
        selection = {}, 
        previewSelection = v2.None, 
        previewSpeed = 1, 
        animations = {}, 
        status = v3.Status.NotStarted
    };
end;
return v1.createReducer(v4(), {
    SetSelection = function(v5, v6)
        return v2.Dictionary.join(v5, {
            selection = v6.selection
        });
    end, 
    SetPreviewSelection = function(v7, v8)
        return v2.Dictionary.join(v7, {
            previewSelection = if not v8.previewSelection then v2.None else v8.previewSelection
        });
    end, 
    SetPreviewSpeed = function(v9, v10)
        return v2.Dictionary.join(v9, {
            previewSpeed = v10.previewSpeed
        });
    end, 
    SetAnimation = function(v11, v12)
        return v2.Dictionary.join(v11, {
            animations = v2.Dictionary.join(v11.animations, {
                [v12.id] = v12.animation
            })
        });
    end, 
    SetAnimations = function(v13, v14)
        return v2.Dictionary.join(v13, {
            animations = v14.animations
        });
    end, 
    SetStatus = function(v15, v16)
        return v2.Dictionary.join(v15, {
            status = v16.status
        });
    end, 
    ResetAllAnimationConversion = function(v17)
        return v2.Dictionary.join(v17, (v4()));
    end
});
