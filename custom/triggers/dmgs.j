//Система отлова урона
#guard dmgs
scope dmgs init on
{
	define 
	{
		evudm = evu##_DAMAGED
		//dmgisoff = svb(hid(gtr(dmgs)),"isoff"+i2s(ldi(hid(gtr(dmgs)),"n")),true)
		
		//attacktype
		atkc = ATTACK_TYPE_CHAOS
        atkh = ATTACK_TYPE_HERO
        atkma = ATTACK_TYPE_MAGIC
        atkme = ATTACK_TYPE_MELEE
        atkn = ATTACK_TYPE_NORMAL
		atkp = ATTACK_TYPE_PIERCE
		atks = ATTACK_TYPE_SIEGE
		
		i2at(i) = idmgs_i2atkt(i)
		
		//damagetype
		dmea = DAMAGE_TYPE_ACID
        dmec = DAMAGE_TYPE_COLD
        dmed = DAMAGE_TYPE_DEATH
        dmedef = DAMAGE_TYPE_DEFENSIVE
        dmedem = DAMAGE_TYPE_DEMOLITION
        dmedis = DAMAGE_TYPE_DISEASE
        dmediv = DAMAGE_TYPE_DIVINE
        dmee = DAMAGE_TYPE_ENHANCED
        dmefi = DAMAGE_TYPE_FIRE
        dmef = DAMAGE_TYPE_FORCE
        dmel = DAMAGE_TYPE_LIGHTNING
        dmem = DAMAGE_TYPE_MAGIC
        dmemi = DAMAGE_TYPE_MIND
        dmen = DAMAGE_TYPE_NORMAL
        dmepl = DAMAGE_TYPE_PLANT
        dmepo = DAMAGE_TYPE_POISON
        dmest = DAMAGE_TYPE_SHADOW_STRIKE
        dmespo = DAMAGE_TYPE_SLOW_POISON
        dmeso = DAMAGE_TYPE_SONIC
        dmesp = DAMAGE_TYPE_SPIRIT_LINK
        dmeu = DAMAGE_TYPE_UNIVERSAL
        dmeun = DAMAGE_TYPE_UNKNOWN
	}
	trae()
}
scope idmgs init on
{
	prv udea()
	{
		//flch(htru,ldi(hid(gtr(dmgs)),"flch"))
		if isut(tru,uth) { rsvb(htru,scn("add")) }
		else { flch(htru,ldi(hid(gtr(dmgs)),"flch")) }
	}
	
	prv erc()
	{
		if !ldb(htru,scn("add"))
		{
			trigevu(gtr(dmgs),tru,evudm)
			svb(htru,scn("add"),true)
		}
	}
	
	prv uifunc()
	{
		trigevu(gtr(dmgs),enu,evudm)
		svb(henu,scn("add"),true)
	}
	
	pb attacktype i2atkt(int i)
	{
		if i==0 { return atkn }
		if i==1 { return atkme }
		if i==2 { return atkp }
		if i==3 { return atks }
		if i==4 { return atkma }
		if i==5 { return atkc }
		if i==6 { return atkh }
		return null
	}
	
	pri
	{
		uif
		tra(erc)
		tra(udea)
		svi(hid(gtr(dmgs)),"flch",10)
		svs(hid(gtr(dmgs)),"func",scn("dmgf"))
		//msg("иниц. отлова")
	}
}