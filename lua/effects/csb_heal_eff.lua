function EFFECT:Init( data )

	self.Target = data:GetEntity()
	self.StartTime = CurTime()
	self.Length = 0.5

end

function EFFECT:Think()
	
	if ( !IsValid( self.Target ) ) then self.Target = nil return end
	
	return self.StartTime + self.Length > CurTime()

end

function EFFECT:Render()

	if ( !IsValid( self.Target ) ) then self.Target = nil return end

	local delta = ( ( CurTime() - self.StartTime ) / self.Length ) ^ 0.5
	local idelta = 1 - delta

	local size = 1
	halo.Add( { self.Target }, Color( 0, 255, 0, 255 * idelta ), size, size, 1, true, false )

end