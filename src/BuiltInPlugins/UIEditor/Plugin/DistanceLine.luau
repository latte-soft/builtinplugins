local v0 = {};
local v1 = require(script.Parent.Enum.Axis);
local v2 = require(script.Parent.CoreGuiManager);
local _ = require(script.Parent.Log);
local v4 = require(script.Parent.RectUtility);
local v5 = require(script.Parent.ValueBox);
local v6 = Color3.fromRGB(255, 205, 0);
local function v10(v7)
    local l_Frame_0 = Instance.new("Frame");
    l_Frame_0.Name = "DistanceLine";
    l_Frame_0.BorderSizePixel = 0;
    l_Frame_0.BackgroundColor3 = v6;
    l_Frame_0.Visible = false;
    l_Frame_0.Parent = v2:findOrCreateScreenGui("DistanceLines");
    local l_Frame_1 = Instance.new("Frame");
    l_Frame_1.Name = "DistanceEnd";
    l_Frame_1.BorderSizePixel = 0;
    l_Frame_1.BackgroundColor3 = v6;
    l_Frame_1.Visible = true;
    l_Frame_1.Parent = l_Frame_0;
    l_Frame_1.Size = ({
        UDim2.new(0, 2, 0, 10), 
        UDim2.new(0, 10, 0, 2)
    })[v7];
    l_Frame_0:GetPropertyChangedSignal("AnchorPoint"):Connect(function()
        if v7 == v1.X then
            if l_Frame_0.AnchorPoint.X == 0 then
                l_Frame_1.AnchorPoint = Vector2.new(1, 0.5);
                l_Frame_1.Position = UDim2.new(1, 0, 0.5, 0);
                return ;
            else
                l_Frame_1.AnchorPoint = Vector2.new(0, 0.5);
                l_Frame_1.Position = UDim2.new(0, 0, 0.5, 0);
                return ;
            end;
        else
            if v7 == v1.Y then
                if l_Frame_0.AnchorPoint.Y == 0 then
                    l_Frame_1.AnchorPoint = Vector2.new(0.5, 1);
                    l_Frame_1.Position = UDim2.new(0.5, 0, 1, 0);
                    return ;
                else
                    l_Frame_1.AnchorPoint = Vector2.new(0.5, 0);
                    l_Frame_1.Position = UDim2.new(0.5, 0, 0, 0);
                end;
            end;
            return ;
        end;
    end);
    return l_Frame_0;
end;
local function v15(v11, v12)
    local v13 = {
        UDim2.new(0.5, 0, 0, 0), 
        UDim2.new(0, 0, 0.5, 0)
    };
    local v14 = v5.new(v12);
    v14.Name = "DistanceBox";
    v14:setAnchorPoint(Vector2.new(0.5, 0.5));
    v14:setPosition(v13[v11]);
    if v12 ~= nil then
        v14.Parent = v12;
    end;
    return v14;
end;
v0.new = function(v16)
    local v17 = {
        m_axis = v16, 
        m_distanceFrame = v10(v16)
    };
    v17.m_distanceBox = v15(v16, v17.m_distanceFrame);
    v17.m_canShow = false;
    return (setmetatable(v17, v0));
end;
v0.__index = v0;
v0.destroy = function(v18)
    v18.m_distanceBox:Destroy();
    v18.m_distanceFrame:Destroy();
    v18.m_distanceBox = nil;
    v18.m_distanceFrame = nil;
end;
local function _(v19, v20)
    return v19.AbsolutePosition.X - v20.AbsolutePosition.X;
end;
local function _(v22, v23)
    return (v23.AbsolutePosition.X + v23.AbsoluteSize.X) - (v22.AbsolutePosition.X + v22.AbsoluteSize.X);
end;
local function _(v25, v26)
    return v25.AbsolutePosition.Y - v26.AbsolutePosition.Y;
end;
local function _(v28, v29)
    return (v29.AbsolutePosition.Y + v29.AbsoluteSize.Y) - (v28.AbsolutePosition.Y + v28.AbsoluteSize.Y);
end;
local function _(v31, v32)
    v31.m_distanceBox:setText(("%d"):format(v32));
end;
local function v48(v34, v35, v36)
    local l_m_distanceFrame_0 = v34.m_distanceFrame;
    local v38 = Rect.new(v36.AbsolutePosition, v36.AbsolutePosition + v36.AbsoluteSize);
    local v39 = Vector2.new(v35.AbsolutePosition.X, (math.floor(v35.AbsolutePosition.Y + v35.AbsoluteSize.Y / 2)));
    local v40 = Vector2.new(v35.AbsolutePosition.X + v35.AbsoluteSize.X, (math.floor(v35.AbsolutePosition.Y + v35.AbsoluteSize.Y / 2)));
    local v41 = v4:containsPoint(v38, v39);
    local v42 = v4:containsPoint(v38, v40);
    local v43 = Vector2.new(1, 0.5);
    local v44 = Vector2.new(0, 0.5);
    local v45 = nil;
    if not v41 or not v42 then
        if not v41 then
            if not v42 then
                v34.m_canShow = false;
                return ;
            else
                l_m_distanceFrame_0.AnchorPoint = v44;
                l_m_distanceFrame_0.Position = UDim2.new(0, v40.X, 0, v40.Y);
                v45 = (v36.AbsolutePosition.X + v36.AbsoluteSize.X) - (v35.AbsolutePosition.X + v35.AbsoluteSize.X);
                l_m_distanceFrame_0.Size = UDim2.new(0, v45, 0, 2);
            end;
        else
            l_m_distanceFrame_0.AnchorPoint = v43;
            l_m_distanceFrame_0.Position = UDim2.new(0, v39.X, 0, v39.Y);
            v45 = v35.AbsolutePosition.X - v36.AbsolutePosition.X;
            l_m_distanceFrame_0.Size = UDim2.new(0, v45, 0, 2);
        end;
    else
        local v46 = v35.AbsolutePosition.X - v36.AbsolutePosition.X;
        local v47 = (v36.AbsolutePosition.X + v36.AbsoluteSize.X) - (v35.AbsolutePosition.X + v35.AbsoluteSize.X);
        v45 = math.min(v46, v47);
        l_m_distanceFrame_0.Size = UDim2.new(0, v45, 0, 2);
        if v46 <= v47 then
            l_m_distanceFrame_0.AnchorPoint = v43;
            l_m_distanceFrame_0.Position = UDim2.new(0, v39.X, 0, v39.Y);
        else
            l_m_distanceFrame_0.AnchorPoint = v44;
            l_m_distanceFrame_0.Position = UDim2.new(0, v40.X, 0, v40.Y);
        end;
    end;
    v34.m_canShow = true;
    v34.m_distanceBox:setText(("%d"):format(v45));
end;
local function v63(v49, v50, v51)
    local l_m_distanceFrame_1 = v49.m_distanceFrame;
    local v53 = Rect.new(v51.AbsolutePosition, v51.AbsolutePosition + v51.AbsoluteSize);
    local v54 = Vector2.new(math.floor(v50.AbsolutePosition.X + v50.AbsoluteSize.X / 2), v50.AbsolutePosition.Y);
    local v55 = Vector2.new(math.floor(v50.AbsolutePosition.X + v50.AbsoluteSize.X / 2), v50.AbsolutePosition.Y + v50.AbsoluteSize.Y);
    local v56 = v4:containsPoint(v53, v54);
    local v57 = v4:containsPoint(v53, v55);
    local v58 = Vector2.new(0.5, 1);
    local v59 = Vector2.new(0.5, 0);
    local v60 = nil;
    if not v56 or not v57 then
        if not v56 then
            if not v57 then
                v49.m_canShow = false;
                return ;
            else
                l_m_distanceFrame_1.Visible = true;
                l_m_distanceFrame_1.AnchorPoint = v59;
                l_m_distanceFrame_1.Position = UDim2.new(0, v55.X, 0, v55.Y);
                v60 = (v51.AbsolutePosition.Y + v51.AbsoluteSize.Y) - (v50.AbsolutePosition.Y + v50.AbsoluteSize.Y);
                l_m_distanceFrame_1.Size = UDim2.new(0, 2, 0, v60);
            end;
        else
            l_m_distanceFrame_1.Visible = true;
            l_m_distanceFrame_1.AnchorPoint = v58;
            l_m_distanceFrame_1.Position = UDim2.new(0, v54.X, 0, v54.Y);
            v60 = v50.AbsolutePosition.Y - v51.AbsolutePosition.Y;
            l_m_distanceFrame_1.Size = UDim2.new(0, 2, 0, v60);
        end;
    else
        local v61 = v50.AbsolutePosition.Y - v51.AbsolutePosition.Y;
        local v62 = (v51.AbsolutePosition.Y + v51.AbsoluteSize.Y) - (v50.AbsolutePosition.Y + v50.AbsoluteSize.Y);
        v60 = math.min(v61, v62);
        l_m_distanceFrame_1.Size = UDim2.new(0, 2, 0, v60);
        if v61 <= v62 then
            l_m_distanceFrame_1.AnchorPoint = v58;
            l_m_distanceFrame_1.Position = UDim2.new(0, v54.X, 0, v54.Y);
        else
            l_m_distanceFrame_1.AnchorPoint = v59;
            l_m_distanceFrame_1.Position = UDim2.new(0, v55.X, 0, v55.Y);
        end;
    end;
    v49.m_canShow = true;
    v49.m_distanceBox:setText(("%d"):format(v60));
end;
v0.update = function(v64, v65)
    local l_v65_FirstAncestorWhichIsA_0 = v65:FindFirstAncestorWhichIsA("GuiBase2d");
    if v64.m_axis == v1.X then
        v48(v64, v65, l_v65_FirstAncestorWhichIsA_0);
        return ;
    elseif v64.m_axis == v1.Y then
        v63(v64, v65, l_v65_FirstAncestorWhichIsA_0);
        return ;
    else
        error("Could not update the DistanceLine. The axis must be either X or Y");
        return ;
    end;
end;
v0.setVisible = function(v67, v68)
    if not v68 then
        v67.m_distanceFrame.Visible = false;
        return ;
    else
        v67.m_distanceFrame.Visible = v67.m_canShow;
        return ;
    end;
end;
return v0;
