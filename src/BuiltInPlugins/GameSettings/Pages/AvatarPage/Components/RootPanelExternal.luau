local l_Parent_0 = script.Parent.Parent;
local v1 = require(script.Parent.Parent.Parent.Parent.Packages.Roact);
local v2 = require(l_Parent_0.Util.StateModelTemplate);
local v3 = require(l_Parent_0.Components.AvatarUpdater);
local v4 = require(l_Parent_0.Components.MorpherTemplateContainer);
local v5 = v1.Component:extend("ComponentRootPanelExternal");
local v6 = nil;
v5.init = function(v7)
    local v8, v9 = v1.createBinding(0);
    v7.absoluteSizeChange = v8;
    v7.updateAbsoluteSizeChange = v9;
end;
v5.render = function(v10)
    return v1.createElement("Frame", {
        Size = v10.absoluteSizeChange:map(function(v11)
            return UDim2.new(1, 0, 0, v11);
        end), 
        BorderSizePixel = 0, 
        BackgroundTransparency = 1
    }, {
        v1.createElement("UIListLayout", {
            [v1.Change.AbsoluteContentSize] = function(v12)
                v10.updateAbsoluteSizeChange(v12.AbsoluteContentSize.y);
            end
        }), 
        v1.createElement(v4, {
            ThemeData = {
                theme = v10.props.ThemeData
            }, 
            StateTemplates = {
                templates = {
                    v2.fromUniverseData(v10.props)
                }
            }, 
            IsEnabled = v10.props.IsEnabled, 
            IsGameShutdownRequired = v10.props.IsGameShutdownRequired, 
            AssetOverrideErrors = v10.props.AssetOverrideErrors, 
            Mouse = v10.props.Mouse, 
            IsPlacePublished = v10.props.IsPlacePublished, 
            clobberTemplate = function(_, v14)
                v6(v10, v14);
            end
        }), 
        if not game:GetFastFlag("DisableGameSettingsAvatarPreview") then v1.createElement(v3, {
            StateTemplates = v10.props.StateTemplates
        }) else nil
    });
end;
v6 = function(v15, v16)
    if not (not v16 or not v15.props.IsEnabled) then
        local v17 = v2.fromUniverseData(v15.props);
        if not v16:isAvatarTypeEqualTo(v17) then
            v15.props.OnAvatarTypeChanged(v16.RigTypeValue);
        end;
        if not v16:isAnimationEqualTo(v17) then
            v15.props.OnAvatarAnimationChanged(v16.AnimationValue);
        end;
        if not v16:isCollisionEqualTo(v17) then
            v15.props.OnAvatarCollisionChanged(v16.CollisionValue);
        end;
        if not v16:areAssetsEqualTo(v17) then
            v15.props.OnAvatarAssetOverridesChanged(v16:extractAssetOverridesForSaving());
        end;
        if not v16:areMinScalesEqualTo(v17) then
            v15.props.OnAvatarScalingMinChanged(v16:extractScalingMinForSaving());
        end;
        if not v16:areMaxScalesEqualTo(v17) then
            v15.props.OnAvatarScalingMaxChanged(v16:extractScalingMaxForSaving());
        end;
    end;
end;
return v5;
