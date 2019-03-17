scope lightaggregation
{
	pr int a = 'A002'
	pb real cha = 0.15, chb = 0.01, mint  = 0.5 , maxt = 1
	pb string shief = "Abilities\\Spells\\Human\\DivineShield\\DivineShieldTarget.mdl"
	pb string boltef = "Abilities\\Spells\\Human\\HolyBolt\\HolyBoltSpecialArt.mdl"
	pb real ra=100, rb=200
	pb real ha=0.625, hb=0.125
	
	pb void tm()
	{
		unit hero
		real rad = spclc(muiu,a,ra,rb)
		genrg(ux(muiu),uy(muiu),rad)
		loop
		{
			hero=rg(tmg)
			if !(isut(hero,uth) && isua(hero,opl(muiu)) && opl(muiu)!=opl(hero) && isua(hero))
			{
				gru(tmg,hero)
				hero=null
			}
			exitwhen (hero!=null) || (gc(tmg)==0)
		}
		gcl(tmg)
		if hero==null
		{
			if ri(1,2)==1
			{
				hero=muiu
			else
				genrg(ux(muiu),uy(muiu),rad)
				loop
				{
					hero=rg(tmg)
					if !(!(isdum(muiu)) && opl(muiu)==opl(hero) && isua(hero))
					{
						gru(tmg,hero)
						hero=null
					}
					exitwhen (hero!=null) || (gc(tmg)==0)
				}
				if hero==null
				{
					hero=muiu
				}
			}
		}
		gcl(tmg)
		efa(boltef,ux(hero),uy(hero))
		aul(hero,ldr(hmuiu,scn("dm"))*spclc(muiu,a,ha,hb))
		svb(hmuiu,scn("istm"),false)
		hero=null
	}
	
	pr void dmgs()
	{
		if uhsp(tru,a) && chc(spclc(tru,a,cha,chb)) && !ldb(htru,scn("istm"))
		{
			svb(htru,scn("istm"),true)
			svr(htru,scn("dm"),dmg)
			real t=rr(mint,maxt)
			efta(shief,tru,"overhead",t)
			tu(tru,t,scn("tm"))
		}
	}

	pb void init(int ab, real ncha, real nchb, real nra, real nrb, real nha, real nhb)
	{
		a = ab
		cha=ncha
		chb=nchb
		ra=nra
		rb=nrb
		ha=nha
		hb=nhb
		tra(dmgs)
	}
}