local l_script_FirstAncestor_0 = script:FindFirstAncestor("TerrainEditor");
local v1 = require(l_script_FirstAncestor_0.Packages.Framework);
local v2 = require(l_script_FirstAncestor_0.Packages.React);
local l_useState_0 = v2.useState;
local l_Stylizer_0 = v1.ContextServices.Stylizer;
local l_UI_0 = v1.UI;
local l_Button_0 = l_UI_0.Button;
local l_Image_0 = l_UI_0.Image;
local v8 = require(l_script_FirstAncestor_0.Src.Components.Renderers.Image.MetadataDialog);
local v9 = require(l_script_FirstAncestor_0.Src.Util.getImage);
local _ = require(l_script_FirstAncestor_0.Src.Resources.Theme);
local _ = require(l_script_FirstAncestor_0.Src.Types);
return function(v12)
    local v13 = l_Stylizer_0:use("ImageRenderer");
    local l_Schema_0 = v12.Schema;
    local v15, v16 = l_useState_0(false);
    local v17, v18 = l_useState_0(false);
    local v19 = nil;
    if v12.Value.Image then
        if not v12.Value.Image.Preview.Id then
            if v12.Value.Image.File then
                v19 = v12.Value.Image.File:GetTemporaryId();
            end;
        else
            v19 = v12.Value.Image.Preview.Id;
        end;
    end;
    if not v19 then
        return (v2.createElement(l_Button_0, {
            Icon = v13.ImportIcon, 
            IconSize = UDim2.fromOffset(28, 28), 
            OnClick = function()
                v9(function(v20, v21)
                    v12.OnChanged({
                        Error = v20, 
                        Image = v21
                    });
                end, l_Schema_0.ImageType);
            end, 
            Size = v13.PreviewSize
        }));
    else
        return (v2.createElement("ImageButton", {
            Image = "", 
            Size = v13.PreviewSize, 
            [v2.Event.MouseEnter] = function()
                v16(true);
            end, 
            [v2.Event.MouseLeave] = function()
                v16(false);
            end
        }, {
            Image = v2.createElement(l_Image_0, {
                AnchorPoint = Vector2.new(0.5, 0.5), 
                Image = v19, 
                Position = UDim2.fromScale(0.5, 0.5), 
                ScaleType = Enum.ScaleType.Fit, 
                Size = UDim2.fromScale(1, 1)
            }), 
            Toolbar = if not v15 then nil else v2.createElement("Frame", {
                ZIndex = 2, 
                AnchorPoint = Vector2.new(0, 1), 
                Position = UDim2.fromScale(0, 1), 
                Size = UDim2.new(1, 0, 0, v13.ToolbarHeight), 
                BackgroundTransparency = v13.ToolbarTransparency, 
                BorderSizePixel = 0, 
                BackgroundColor3 = v13.ToolbarBackgroundColor
            }, {
                ExpandPreview = v2.createElement(l_Button_0, {
                    Icon = v13.ExpandIcon, 
                    IconPadding = v13.IconPadding, 
                    Style = "RoundSubtle", 
                    OnClick = function()
                        v18(not v17);
                    end, 
                    Size = UDim2.fromOffset(v13.ToolbarHeight, v13.ToolbarHeight)
                }, {
                    v2.createElement("UIAspectRatioConstraint")
                }), 
                ClearButton = v2.createElement(l_Button_0, {
                    AnchorPoint = Vector2.new(1, 0), 
                    Position = UDim2.fromScale(1, 0), 
                    Icon = v13.ClearIcon, 
                    IconPadding = v13.IconPadding, 
                    Style = "RoundSubtle", 
                    OnClick = function()
                        v12.OnChanged({
                            Error = ""
                        });
                    end, 
                    Size = UDim2.fromOffset(v13.ToolbarHeight, v13.ToolbarHeight)
                }, {
                    v2.createElement("UIAspectRatioConstraint", {
                        AspectRatio = 1
                    })
                })
            }), 
            MetadataDialog = if not v17 then nil else v2.createElement(v8, {
                Image = v12.Value.Image, 
                OnClose = function()
                    v18(false);
                end
            })
        }));
    end;
end;
