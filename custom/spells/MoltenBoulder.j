scope MoltenBoulder
{
	pb int dummy, ab, efdu, d=25, md=75
	
	pr void expfil()
	{
		if isspfil(enu,muiu)
		{
			dmt(ldu(hmuiu,"u"),enu,(rr(spclc(ldu(hmuiu,"u"),ab,d,d),spclc(ldu(hmuiu,"u"),ab,md,d))*2)-ldr(henu,scn("dmg")),atkn,dmefi)
			efta("Abilities\\Spells\\Items\\AIfb\\AIfbSpecialArt.mdl",enu,"chest")
			efa("war3mapImported\\OrbOfFire.mdx",enux,enuy)
			svb(henu,scn("dm"),false)
			svb(henu,scn("mv"),false)
			svr(henu,scn("dmg"),0)
		}
	}
	
	pb void explode()
	{
		efa("war3mapImported\\Ognennaja bomba.mdx",muiux,muiuy)
		efa("war3mapImported\\Ognennaja solnetschnaja raketa.MDX",muiux,muiuy)
		tmu=ucr(plnp,efdu,muiux,muiuy)
		usc(tmu,rr(2.7,3.1))
		uat(tmu,5)
		fg(genrg(muiux,muiuy,300),expfil)
		ukill(muiu)
	}
	
	pb void anim()
	{
		psu(muiu,false)
		sua(muiu,"stand")
		svb(hmuiu,scn("mv"),false)
		svb(hmuiu,scn("dm"),false)
		svr(hmuiu,scn("dmg"),0)
		stun(muiu,rr(0.5,1))
	}
	
	pr void gf()
	{
		if isspfil(enu,muiu) && !ldb(henu,scn("mv"))
		{
			svb(henu,scn("mv"),true)
			sua(enu,"death")
			psu(enu,true)
			umove(enu,rr(1.7,2.2),angc(muiux,muiuy,enux,enuy),rr(0.17,0.3),0.01,scn("anim"),true)
			if !ldb(henu,scn("dm"))
			{
				real a=rr(spclc(ldu(hmuiu,"u"),ab,d,d),spclc(ldu(hmuiu,"u"),ab,md,d))
				dmt(ldu(hmuiu,"u"),enu,a,atkn,dmefi)
				efta("Abilities\\Spells\\Items\\AIfb\\AIfbSpecialArt.mdl",enu,"chest")
				svb(henu,scn("dm"),true)
				svr(henu,scn("dmg"),a)
			}
		}
	}
	
	pb void move()
	{
		fg(genrg(muiux,muiuy,150))
	}
	
	pr void spef()
	{
		if spid == ab
		{
			real f=angc(trux,truy,sptx,spty), ms=450, t=dtc(ux(tmu),uy(tmu),px(ux(tmu),ms,f),py(uy(tmu),ms,f))/ms
			tmu=ucr(opl(tru),dummy,px(trux,50,f),py(truy,50,f))
			svu(htmu,"u",tru)
			umove(tmu,ms*0.01,f,t,0.01,scn("explode"))
			tu(tmu,t,0.01,scn("move"))
		}
	}
	
	pb void init(int dummyid,int abc,int eui)
	{
		dummy=dummyid
		ab=abc
		efdu=eui
		tra(spef)
	}
}