#guard meteorit
scope meteorit
{
	pr int sp='A000'
	
	pb void anim()
	{
		sua(muiu,"stand")
		psu(muiu,false)
	}

	pb void tanim()
	{
		tunit(muiu,rr(0.2,0.7),scn("anim"))
	}
	
	pr void efilt()
	{
		real amount = spclc(muiu,sp,100,50)
		bool d
		if isspfil(enu,muiu)
		{
			if amount>hp(enu)
			{
				sue(enu,true)
				d=true
			else
				sua(enu,"death")
				psu(enu,true)
				pjump(enu,5,angc(rmui("x"),rmui("y"),enux,enuy),200,200,0.01,scn("tanim"))
			}
			dmst(muiu,enu,amount)
			efta("Abilities\\Spells\\Items\\AIfb\\AIfbSpecialArt.mdl",enu,"chest")
			efa("war3mapImported\\OrbOfFire.mdx",enux,enuy)
		}
		if d { efa("war3mapImported\\Krovavjij vsrjiv Net puti.mdx",rmui("x"),rmui("y")) }
		amount=0
	}
	
	pb void explode()
	{
		efa("war3mapImported\\Vsrjiv BOLSCHOIJ.mdx",rmui("x"),rmui("y"))
		efa("Objects\\Spawnmodels\\Other\\NeutralBuildingExplosion\\NeutralBuildingExplosion.mdl",rmui("x"),rmui("y"))
		genrg(rmui("x"),rmui("y"),300)
		fg(tmg,efilt)
	}
	
	pr void spef()
	{
		if spid==sp
		{
			efa("war3mapImported\\Meteorit.mdx",sptx,spty)
			efa("war3mapImported\\meteor.mdx",sptx,spty)
			tunit(tru,1,scn("explode"))
			csrmui("x",sptx)
			csrmui("y",spty)
		}
	}

	pb void init(int sk)
	{
		sp = sk
		tra(spef)
	}
}