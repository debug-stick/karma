--Sin

function LightningPlayer(a_Player)
	a_Player:TakeDamage(dtLightning, nil,10,1)
end

function DamageFeedback(a_Player)
	a_Player:TakeDamage(dtAdmin, nil, 1, 1)
	a_Player:SendMessage("You get Sin")
end

function ViolenceDamage(a_Player, a_Entity)
	a_Entity:TakeDamage(dtAttack, a_Player, 1, 1)
	a_Player:SendMessage("You are violence")
end


--Merits

function RewardPlayerXP(a_World, a_Player, a_XP)
	a_World:SpawnExperienceOrb(a_Player:GetPosX(), a_Player:GetPosY(), a_Player:GetPosZ(), a_XP)
	a_Player:SendMessage("You have got reward experience")
end

function RewardPlayerItem(a_Player, a_Item)
	a_World:SpawnItemPickups(a_Item, a_Player:GetPosX(), a_Player:GetPosY(), a_Player:GetPosZ(), 1, nil)
end

function SkillHealing(a_Player, a_Animal, a_Health)
	a_Animal:SetHealth(a_Animal:GetHealth + a_Health)
	a_Player:SendMessage("You are healing animal")
end

function SkillRepair(a_Item, a_Durable)
	-- body
end
