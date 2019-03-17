define
{
	//unit
	uat(u) = GetUnitArmorType(u)
	uar(u) = GetUnitArmor(u)
	uhpr(u) = GetUnitHPRegen(u)
	umpr(u) = GetUnitMPRegen(u)
	
	suat(u,i) = SetUnitArmorType(u,i)
	suar(u,r) = SetUnitArmor(u,r)
	smhp(u,v) = SetUnitMaxHP(u,v)
	amhp(u,v) = AddUnitMaxHP(u,v)
	smp(u,v) = SetUnitMaxMP(u,v)
	amp(u,v) = AddUnitMaxMP(u,v)
	shpr(u,r) = SetUnitHPRegen(u,r)
	smpr(u,r) = SetUnitMPRegen(u,r)
	ahpr(u,r) = AddUnitHPRegen(u,r)
	ampr(u,r) = AddUnitMPRegen(u,r)
	
	suas(u,r) = SetUnitAttackSpeed(u,r)
	uas(u) = GetUnitAttackSpeed(u)
	
	sacd(i,l,cd) = SetAbilityCD(i,l,cd)
	acd(i,l) = GetAbilityCD(i,l)
}