
if SERVER then
  AddCSLuaFile()
  resource.AddFile("materials/vgui/ttt/dynamic/roles/icon_revol.vmt")
end

function ROLE:PreInitialize()
  self.color = Color(124, 78, 158, 255)

  self.abbr = "revol" -- abbreviation
  
  self.defaultTeam = TEAM_INNOCENT
	self.defaultEquipment = SPECIAL_EQUIPMENT

	self.score.killsMultiplier = 8
	self.score.teamKillsMultiplier = -8
	self.score.bodyFoundMuliplier = 3
	self.fallbackTable = {}
	self.unknownTeam = true

	self.isPublicRole = true
	self.isPolicingRole = true

  self.conVarData = {
    pct = 0.15, -- necessary: percentage of getting this role selected (per player)
    maximum = 1, -- maximum amount of roles in a round
    minPlayers = 6, -- minimum amount of players until this role is able to get selected
    togglable = true, -- option to toggle a role for a client if possible (F1 menu)

    credits = 3,
		creditsAwardDeadEnable = 1,
		creditsAwardKillEnable = 0,
    random = 40,

    shopFallback = SHOP_FALLBACK_TRAITOR
  }
end

function ROLE:Initialize()
  roles.SetBaseRole(self, ROLE_DETECTIVE)
end

if SERVER then
  function ROLE:GiveRoleLoadout(ply, isRoleChange)
    if not isRoleChange then return end

    ply:GiveEquipmentItem("item_ttt_armor")
  end

  function ROLE:RemoveRoleLoadout(ply, isRoleChange)
    ply:RemoveEquipmentItem("item_ttt_armor")
  end
end
