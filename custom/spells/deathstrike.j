#guard deathstrike
scope deathstrike
{
	//define private scn = SCOPE_PREFIX
	pb int sp = 'A001', m=30
	pb real chm = 0.45, cha=0.15, chb=0.01, dura=9, durb=1
	
	pb void endbuff()
	{
		svb(hid(muiu),scn+"buff",false)
	}
	
	pb void blood()
	{
		efa(imp+"Krovavoe pjatno.mdx",ux(muiu),uy(muiu),rr(30,60))
		efta("Objects\\Spawnmodels\\Human\\HumanBlood\\BloodElfSpellThiefBlood.mdl",muiu,"chest")
		dmt(ldu(hid(muiu),scn+"dm"),muiu,hp(muiu)*rr(0.01,0.02),atkh,dmed)
	}
	
	pb void animend()
	{
		svb(hid(muiu),scn+"buff",false)
	}
	
	pb void dmgs()
	{
		if uhsp(dm) && !(isdum(dm))
		{
			real ch,dur,amount
			if dml==m
			{
				ch=chm
			else
				ch=dmclc(cha,chb)
			}
			if chc(ch)
			{
				dur=dmclc(dura,durb)
				if dml==m
				{
					dur+=2
				}
				amount=(1.2*dml-1)*dmg
				sua(tru,"death")
				tunit(tru,0.5,scn+"animend")
				dmt(dm,tru,amount,atkh,dmed)
				ctt("|cffff0000"+r2s(amount)+"!",trux,truy,255,5,3,0,0.023)
				efa("war3mapImported\\Krovavjij vsrjiv Osobjij.mdx",trux,truy)
				efta("Objects\\Spawnmodels\\Human\\HumanLargeDeathExplode\\HumanLargeDeathExplode.mdl",tru,"chest")
				efta("Objects\\Spawnmodels\\Critters\\Albatross\\CritterBloodAlbatross.mdl",tru,"chest")
				dur=rr(dur,dur+5)
				efta(imp+"Krovotetschenie Net puti.mdx",tru,"chest",dur)
				svu(htru,scn+"dm",dm)
				if !ldb(htru,scn+"buff")
				{
					svb(htru,scn+"buff",true)
					tunit(tru,dur,rr(0.5,0.8),scn+"blood")
					tunit(tru,dur,scn+"endbuff")
				}
			}
		}
	}
    
    pb void init(int ab) { 
		sp = ab
		tra(dmgs)
	}
}