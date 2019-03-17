//PowerSlash
#guard powerslash
scope powerslash
{
    //define private scn = SCOPE_PREFIX
    pb int sp = 'A002', ml = 30
    pb real ad=25, bd=1, md=55, ach=10.5, bch=0.5, st=0.2, ms = 4
	
	pb void dmgs()
	{
		if uhsp(dm) && !(isdum(dm))
		{
			real am
			if dml == ml
			{
				am = md
			else
				am = dmclc(ad,bd)
			}
			if rr(0,100) <= dmclc(ach,bch) && isua(tru)
			{
				dmt(dm,tru,am,atkh,dmef)
				ctt("|cffff0000"+r2s(am)+"!",dmx,dmy,255,5,3,0,0.023)
				efta("Abilities\\Spells\\NightElf\\SpiritOfVengeance\\SpiritOfVengeanceBirthMissile.mdl", tru, "chest")
				efta("Abilities\\Spells\\Human\\Thunderclap\\ThunderclapTarget.mdl", tru, "overhead", dmclc(0.2,1))
				if isua(tru)
				{
					stun(tru,dmclc(0.2,1))
					umove(tru,dmclc(ms,1), angc(dmx,dmy,trux,truy),0.5,0.03)			
				}
			}
			am = 0
		}
	}
    
    pb void init(int ab) 
    { 
		sp = ab
		tra(dmgs)
    } 
}