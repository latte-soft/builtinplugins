local l_DebugDisableLocalUGCValidation_0 = game:GetFastFlag("DebugDisableLocalUGCValidation");
local l_StudioService_0 = game:GetService("StudioService");
local l_ToolboxAdjustValidationReasonSize_0 = game:GetFastFlag("ToolboxAdjustValidationReasonSize");
local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local l_Packages_0 = l_Parent_0.Packages;
local v5 = require(l_Packages_0.Roact);
local v6 = require(l_Packages_0.RoactRodux);
local l_ScrollingFrame_0 = require(l_Packages_0.Framework).UI.ScrollingFrame;
local l_Util_0 = l_Parent_0.Core.Util;
local v9 = require(l_Util_0.Constants);
local v10 = require(l_Util_0.AssetConfigConstants);
local v11 = require(l_Util_0.AssetConfigUtil);
local v12 = require(l_Util_0.fixUpPreValidation);
local v13 = require(l_Util_0.getUGCValidationRestrictedUserTable);
local v14 = require(l_Packages_0.UGCValidation);
local l_ContextServices_0 = require(l_Packages_0.Framework).ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local v17 = require(l_Parent_0.Core.Actions.SetCurrentScreen);
local l_Components_0 = l_Parent_0.Core.Components;
local v19 = require(l_Components_0.AssetConfiguration.LoadingBarWrapper);
local v20 = require(l_Components_0.AssetConfiguration.AssetThumbnailPreview);
local v21 = require(l_Components_0.NavButton);
local v22 = require(l_Parent_0.Core.Flags.getFFlagToolboxAddNewUGCAssetTypes);
local v23 = require(l_Util_0.SharedFlags.getFFlagEnableUGCToolboxFixAccessories);
local v24 = not l_ToolboxAdjustValidationReasonSize_0 and 400 or 600;
local v25 = not l_ToolboxAdjustValidationReasonSize_0 and 72 or 400;
local v26 = v5.PureComponent:extend("AssetValidation");
v26.init = function(v27, _)
    v27.state = {
        failed = false, 
        isLoading = true
    };
    local function v35(v29)
        local v30 = {};
        local v31 = v29 or {};
        for v32, v33 in v31, nil, nil do
            local v34 = v33:Clone();
            v12(v34);
            v30[v32] = v34;
        end;
        return v30;
    end;
    if l_DebugDisableLocalUGCValidation_0 and l_StudioService_0:HasInternalPermission() or not v11.isCatalogAsset(v27.props.assetTypeEnum) then
        v27.props.nextScreen();
        return ;
    elseif not v22() then
        v14.validateAsync(if not v23() then v27.props.instances else v35(v27.props.instances), v27.props.assetTypeEnum, function(v36, v37)
            if not v36 then
                v27:setState({
                    onFinish = function()
                        v27:setState({
                            isLoading = false, 
                            reasons = v37
                        });
                    end
                });
                return ;
            else
                v27:setState({
                    onFinish = v27.props.nextScreen
                });
                return ;
            end;
        end);
        return ;
    else
        local function v40(v38, v39)
            if not v38 then
                v27:setState({
                    onFinish = function()
                        v27:setState({
                            isLoading = false, 
                            reasons = v39
                        });
                    end
                });
                return ;
            else
                v27:setState({
                    onFinish = v27.props.nextScreen
                });
                return ;
            end;
        end;
        if Enum.AssetType.DynamicHead == v27.props.assetTypeEnum then
            v14.validateAsyncMeshPartFormat(if not v23() then v27.props.instances else v35(v27.props.instances), v27.props.assetTypeEnum, v40, false, false, v13());
            return ;
        else
            v14.validateAsync(if not v23() then v27.props.instances else v35(v27.props.instances), v27.props.assetTypeEnum, v40, false, false, v13());
            return ;
        end;
    end;
end;
v26.render = function(v41)
    local l_props_0 = v41.props;
    local l_state_0 = v41.state;
    local l_Stylizer_0 = l_props_0.Stylizer;
    local v45 = "Reason:\n" .. if not l_ToolboxAdjustValidationReasonSize_0 then table.concat(v41.state.reasons or {}, "\n") else table.concat(v41.state.reasons or {}, "\n\n");
    return v5.createElement("Frame", {
        BackgroundColor3 = l_Stylizer_0.typeValidation.background, 
        BackgroundTransparency = 0, 
        BorderSizePixel = 0, 
        Size = l_props_0.Size
    }, {
        Preview = v5.createElement(v20, {
            titleHeight = 24, 
            titlePadding = 12, 
            Position = UDim2.new(0.5, -75, 0, 48), 
            Size = UDim2.new(0, 150, 0, 186)
        }), 
        LoadingBar = v41.state.isLoading and v5.createElement(v19, {
            loadingText = "Validating", 
            loadingTime = 0.5, 
            holdPercent = 0.92, 
            Size = UDim2.new(0, 400, 0, 6), 
            Position = UDim2.new(0.5, -200, 0, 314), 
            onFinish = l_state_0.onFinish
        }), 
        LoadingResult = not v41.state.isLoading and v5.createElement("Frame", {
            Position = UDim2.new(0, 0, 0, 279), 
            Size = UDim2.new(1, 0, 1, -279), 
            BackgroundTransparency = 1
        }, {
            Title = v5.createElement("TextLabel", {
                BackgroundTransparency = 1, 
                Font = v9.FONT, 
                Position = UDim2.new(0.5, -200, 0, 0), 
                Size = UDim2.new(0, 400, 0, 36), 
                Text = "Validation Failed", 
                TextColor3 = l_Stylizer_0.loading.text, 
                TextSize = v9.FONT_SIZE_TITLE, 
                TextXAlignment = Enum.TextXAlignment.Center, 
                TextYAlignment = Enum.TextYAlignment.Center
            }), 
            Reason = not l_ToolboxAdjustValidationReasonSize_0 and v5.createElement("TextLabel", {
                BackgroundTransparency = 1, 
                Font = v9.FONT, 
                Position = UDim2.new(0.5, -v24 / 2, 0, 49), 
                Size = UDim2.new(0, v24, 0, v25), 
                Text = v45, 
                TextWrapped = true, 
                TextColor3 = l_Stylizer_0.loading.text, 
                TextSize = v9.FONT_SIZE_MEDIUM, 
                TextXAlignment = Enum.TextXAlignment.Center, 
                TextYAlignment = Enum.TextYAlignment.Top
            }), 
            ScrollingFrame = l_ToolboxAdjustValidationReasonSize_0 and v5.createElement(l_ScrollingFrame_0, {
                BackgroundTransparency = 1, 
                Position = UDim2.new(0.5, -v24 / 2, 0, 49), 
                Size = UDim2.new(0, v24, 1, -111), 
                CanvasSize = UDim2.new(0, v24, 0, v25)
            }, {
                Reason = v5.createElement("TextLabel", {
                    BackgroundTransparency = 1, 
                    Font = v9.FONT, 
                    Position = UDim2.new(0.5, -v24 / 2, 0, 49), 
                    Size = UDim2.new(0, v24, 0, v25), 
                    Text = v45, 
                    TextWrapped = true, 
                    TextColor3 = l_Stylizer_0.loading.text, 
                    TextSize = v9.FONT_SIZE_MEDIUM, 
                    TextXAlignment = Enum.TextXAlignment.Left, 
                    TextYAlignment = Enum.TextYAlignment.Top
                })
            })
        }), 
        Footer = not v41.state.isLoading and v5.createElement("Frame", {
            BackgroundTransparency = 1, 
            Position = UDim2.new(0, 0, 1, -62), 
            Size = UDim2.new(1, 0, 0, 62)
        }, {
            CloseButton = v5.createElement(v21, {
                onClick = l_props_0.onClose, 
                titleText = "Close", 
                LayoutOrder = 0, 
                Position = UDim2.new(0.5, -60, 0.5, -16), 
                Size = UDim2.new(0, 120, 0, 32)
            })
        })
    });
end;
return v6.connect(function(v46, _)
    v46 = v46 or {};
    return {
        instances = v46.instances, 
        assetTypeEnum = v46.assetTypeEnum
    };
end, function(v48)
    return {
        nextScreen = function()
            v48(v17(v10.SCREENS.CONFIGURE_ASSET));
        end
    };
end)((l_withContext_0({
    Stylizer = l_ContextServices_0.Stylizer
})(v26)));
