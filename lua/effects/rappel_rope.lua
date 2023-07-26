function EFFECT:Init(effectdata)
    self.endPoint = effectdata:GetOrigin()
	self.ent = effectdata:GetEntity()
	self.attach = effectdata:GetAttachment()
    
end

function EFFECT:Think()
    if !IsValid(self.ent) or self.attach == nil or !self.ent:IsCSBUser() or self.ent:IsNoClipping() or self.ent:IsOnLadder() then return false end
    self:SetPos(self.ent:GetAttachment(self.attach).Pos)
    self:SetRenderBoundsWS(self:GetPos(), self.endPoint)

    return !self.ent:OnGround()
end

local ropeMat = Material("cable/cable2")

function EFFECT:Render()
    local color = Color(10, 10, 10)
    render.SetMaterial(ropeMat)
    render.DrawBeam(self:GetPos(), self.endPoint, 2, 0, 0, color)
end
