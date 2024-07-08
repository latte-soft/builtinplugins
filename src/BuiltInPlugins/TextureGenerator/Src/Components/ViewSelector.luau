local l_script_FirstAncestor_0 = script:FindFirstAncestor("TextureGenerator");
local v1 = require(l_script_FirstAncestor_0.Packages.Framework);
local v2 = require(l_script_FirstAncestor_0.Packages.React);
local l_useEventConnection_0 = require(l_script_FirstAncestor_0.Packages.ReactUtils).useEventConnection;
local l_Stylizer_0 = v1.ContextServices.Stylizer;
local l_UI_0 = v1.UI;
local l_AssetRenderModel_0 = l_UI_0.AssetRenderModel;
local l_Pane_0 = l_UI_0.Pane;
local v8 = require(l_script_FirstAncestor_0.Src.Components.GenerationAngleHelp);
local _ = require(l_script_FirstAncestor_0.Src.Resources.Theme);
local l_Util_0 = l_script_FirstAncestor_0.Src.Util;
local v11 = require(l_Util_0.Constants);
local v12 = require(l_Util_0.OptionsContext);
local v13 = require(l_Util_0.centerCameraOnModelForRotation);
local l_LayoutOrderIterator_0 = v1.Util.LayoutOrderIterator;
return function(v15)
    local v16 = l_Stylizer_0:use("ViewSelector");
    local l_current_0 = v2.useRef(Instance.new("Camera")).current;
    local v18 = v2.useContext(v12);
    local v23 = v2.useMemo(function()
        local l_MeshParts_0 = v15.MeshParts;
        if not l_MeshParts_0 then
            return nil;
        else
            local l_Model_0 = Instance.new("Model");
            for _, v22 in l_MeshParts_0, nil, nil do
                v22:Clone().Parent = l_Model_0;
            end;
            return l_Model_0;
        end;
    end, {
        v15.MeshParts
    });
    if v23 then
        local v24 = v2.useMemo(function()
            return v13(v23, CFrame.new());
        end, {
            v23
        });
        l_useEventConnection_0(l_current_0:GetPropertyChangedSignal("CFrame"), function()
            local v25, v26, v27 = (l_current_0.CFrame * v24:Inverse()):ToEulerAnglesYXZ();
            v18.setRotation((CFrame.fromEulerAnglesYXZ(-v25, -v26, -v27)));
        end, {
            v24, 
            v18.setRotation
        });
        v2.useEffect(function()
            local v28 = v13(v23, v18.rotation);
            if not v28:FuzzyEq(l_current_0.CFrame) then
                l_current_0.CFrame = v28;
            end;
            return function()
            end;
        end, {
            v18.rotation, 
            v23
        });
        local v29 = l_LayoutOrderIterator_0.new();
        return v2.createElement(l_Pane_0, {
            AutomaticSize = Enum.AutomaticSize.Y, 
            BackgroundColor = v16.BackgroundColor, 
            HorizontalAlignment = Enum.HorizontalAlignment.Left, 
            Layout = Enum.FillDirection.Vertical, 
            LayoutOrder = v15.LayoutOrder, 
            Size = v16.Size, 
            Spacing = 10, 
            VerticalAlignment = Enum.VerticalAlignment.Center
        }, {
            GenerationAngleHelp = v2.createElement(v8, {
                LayoutOrder = v29:getNextOrder()
            }), 
            Display = v2.createElement(l_Pane_0, {
                AnchorPoint = Vector2.new(0.5, 0.5), 
                LayoutOrder = v29:getNextOrder(), 
                Position = UDim2.fromScale(0.5, 0.5), 
                Size = v16.Size
            }, {
                UIPadding = v2.createElement("UIPadding", {
                    PaddingLeft = UDim.new(0, 8), 
                    PaddingRight = UDim.new(0, 8)
                }), 
                ImageContainer = v2.createElement(l_Pane_0, {
                    BackgroundColor3 = Color3.new(0, 0, 0), 
                    AnchorPoint = Vector2.new(0.5, 0.5), 
                    Position = UDim2.fromScale(0.5, 0.5), 
                    ZIndex = v29:getNextOrder()
                }, {
                    Corner = v2.createElement("UICorner"), 
                    ModelView = v2.createElement(l_AssetRenderModel_0, {
                        BackgroundColor3 = v16.BackgroundColor, 
                        Camera = l_current_0, 
                        DisablePan = v16.DisablePan, 
                        DisableZoom = v16.DisableZoom, 
                        Model = v23, 
                        Size = UDim2.new(1, 0, 1, -32), 
                        FocusDirection = v11.INITIAL_FOCUS_DIRECTION, 
                        LightColor = Color3.new(1, 1, 1), 
                        LightDirection = Vector3.new(1, 1, 1), 
                        ShowAxisIndicator = true, 
                        ShowResetCamera = true
                    })
                })
            })
        });
    else
        return nil;
    end;
end;
