scope ThunderClap
{
	pb int sp, eld, eled
	pb real ra=250, rb=15, kt=0.02
	pb real dami=1, dama=12, dbmi=1, dbma=6
	pb real kdmi=0.1, kdma=0.2
	
	pr void eldt(unit u)
	{
		efta("Abilities\\Weapons\\Bolt\\BoltImpact.mdl",u,"chest")
		sua(u,"death")
	}
	
	pb void eldf()
	{
		real r=rmui("rr")*rr(kdmi,kdma)*10, a=spclc(muiu("tru"),sp,rr(dami,dama)+r,rr(dbmi,dbma)+r)
		dmt(muiu("tru"),muiu,a,atkn,dmel)
		eldt(muiu)
	}
	
	pb void eldte()
	{
		efa("Abilities\\Spells\\Other\\Monsoon\\MonsoonBoltTarget.mdl",muiux,muiuy)
		eldt(muiu)
	}
	
	pb void eldtes()
	{
		sut(muiu)
	}
	
	pb void umovef()
	{
		if !(isua(muiu))
		{
			real t=rr(0.5,3)
			tu(muiu,t,rr(0.1,0.2),scn("eldte"))
			tu(muiu,t,scn("eldtes"))
		else
			sua(muiu)
			sut(muiu)
		}
	}
	
	pr void eldtfg()
	{
		if isspfil(enu,muiu("tru")) && enu!=muiu
		{
			tu(enu,rr(0.1,0.2)+rmui("rr")*kt,0.1,scn("eldf"))
		}
	}
	
	pb void eldtf()
	{
		fg(genrg(muiux,muiuy,rr(75,125)),eldtfg)
	}
	
	pr void gf()
	{
		if isspfil(enu,tru)
		{
			real r=rr(0.2,0.5)+ldr(htru,scn("rr"))*kt
			sut(enu,3)
			umove(enu,rr(4,7),angu(tru,enu),r)
			svb(hid(ldmui),"actondeath",true)
			tu(enu,r,0.05,scn("eldf"))
			svu(hid(ldmui),"tru",tru)
			svr(hid(ldmui),"rr",ldr(htru,scn("rr")))
			tu(enu,r,0.15,scn("eldtf"))
			svu(hid(ldmui),"tru",tru)
			svr(hid(ldmui),"rr",ldr(htru,scn("rr")))
		}
	}

	pr void spef()
	{
		if spid==sp
		{
			ukill(ldu(htru,scn("eld")))
			rsvh(htru,scn("eld"))
			tmu=ucr(opl(tru),eled,trux,truy)
			real r=ldr(htru,scn("rr"))
			usc(tmu,r)
			ukill(tmu)
			fg(genrg(trux,truy,spclc(tru,sp,ra,rb+(r*100))))
			rsvr(htru,scn("rr"))
		}
	}
	pr void spca()
	{
		if spid==sp
		{
			tmu=ucr(opl(tru),eld,trux,truy)
			real r=rr(1,2)
			usc(tmu,r)
			fla(tmu)
			sufl(tmu,rr(250,350),3000)
			svr(htru,scn("rr"),r)
			svu(htru,scn("eld"),tmu)
		}
	}
	
	pb void init(int spi, int eldi, int eledi)
	{
		sp = spi
		eld = eldi
		eled = eledi
		tra(spca)
		tra(spef)
	}
}