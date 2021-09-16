
if SERVER then
  AddCSLuaFile()
  resource.AddFile("materials/vgui/ttt/dynamic/roles/icon_revol.vmt")
end

function ROLE:PreInitialize()
  self.color = Color(124, 78, 158, 255)

  self.abbr = "revol" -- abbreviation
  self.surviveBonus = 0 -- bonus multiplier for every survive while another player was killed
  self.scoreKillsMultiplier = 1 -- multiplier for kill of player of another team
  self.scoreTeamKillsMultiplier = -4 -- multiplier for teamkill
  self.unknownTeam = true -- player don't know their teammates

  self.defaultTeam = TEAM_INNOCENT -- the team name: roles with same team name are working together
  self.defaultEquipment = SPECIAL_EQUIPMENT -- here you can set up your own default equipment

  self.conVarData = {
    pct = 0.15, -- necessary: percentage of getting this role selected (per player)
    maximum = 1, -- maximum amount of roles in a round
    minPlayers = 6, -- minimum amount of players until this role is able to get selected
    togglable = true, -- option to toggle a role for a client if possible (F1 menu)

    credits = 3,
    creditsTraitorKill = 0,
    creditsTraitorDead = 1,
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
