scope ChargeLightning
{
	pb int ab, dum, /*abs,*/ abcs, aba //равкоды скилла, дамми, побочных скиллов
    pb real dmia=20, dmaa=25, dmib=5, dmab=12 //урон
    pb real dk=0.25, dts=0.25, dtma=2, dtmi=0.25 //скорость анимации
    pb real cat=20, chdt=3 //период каста брони и снижения заряда
    pb real cha=0.05, chb=0.01 //шанс цепи молнии
    pb real rad=500 //радиус цепи молнии
	
	/*pb void dabcs()
	{
		ura(muiu,abcs)
	}*/
	
	pr void filc()
	{
		if !(isspfil(enu,dm)) || isdum(enu)
		{
			gru(tmg,enu)
		}
	}
	
	pb void pos2()
	{
		sux(muiu,ux(muiu("hero")))
		suy(muiu,uy(muiu("hero")))
	}
	
	pr void dmgs()
    {
        if uhsp(dm,ab) && !(isdum(dm)) && dmg>0
        {
            if ldr(hid(ldu(hdm,scn("dummy"))),"timescale")<dtma
            {
                isvi(hdm,scn("ch"),1)
                sut(ldu(hdm,scn("dummy")),ldr(hid(ldu(hdm,scn("dummy"))),"timescale")+dts)
				isua(dm,aba,1)
            }
            dmt(dm,tru,spc(dm,ab,rr(dmia,dmaa)*ldi(hdm,scn("ch"))*dk,rr(dmib,dmab))*ldi(hdm,scn("ch"))*dk,atkn,dmel)
            efta("Abilities\\Weapons\\Bolt\\BoltImpact.mdl",tru,"chest")
			fg(genrg(dmx,dmy,rad),filc)
            if chc(spc(dm,ab,cha,chb*ldi(hdm,scn("ch")))) && gc(tmg)>1
            {
                sup(dumu(dm),dmx,dmy)
				tmu=ucr(opl(dm),DUMMY,dmx,dmy)
				uaa(tmu,abcs)
				uito(tmu,"chainlightning",tru)
				tu(tmu,5,0.01,scn("pos2"))
				svu(hid(ldmui),"hero",dm)
				uat(tmu,0)
                //uaa(dumu(dm),abcs)
                //uito(dumu(dm),"chainlightning",tru)
				//tu(dumu(dm),0.01,scn("dabcs"))
            }
        }
    }
    
    pb void pos()
    {
        sup(muiu,ux(ldu(hmuiu,"hero")),uy(ldu(hmuiu,"hero")))
    }
    
    /*pb void cast()
    {
        uito(muiu,"lightningshield",ldu(hmuiu,"hero"))
    }*/
    
    pb void chd()
    {
        if ldi(hmuiu,scn("ch"))>1
        {
            isvi(hmuiu,scn("ch"),-1)
            sut(ldu(hmuiu,scn("dummy")),ldr(hid(ldu(hmuiu,scn("dummy"))),"timescale")-dts)
			isua(muiu,aba,-1)
        }
    }
	
	pr void gf()
	{
		if isspfil(enu,muiu)
		{
			dmt(muiu,enu,spc(muiu,ab,rr(15,20),rr(15,20)),atkn,dmel)
			efta("Abilities\\Spells\\Orc\\LightningShield\\LightningShieldBuff.mdl",enu,"chest")
		}
	}
	
	pb void absd()
	{
		if isua(muiu)
		{
			fg(genrg(muiux,muiuy,160))
		else
			muiend
		}
	}
	
	pb void dumb()
	{
		suai(muiu,0)
		sut(muiu,dtmi)
		ptu(muiu,scn("pos"))
		ptu(ldu(hmuiu,"hero"),chdt,scn("chd"))
		ptu(ldu(hmuiu,"hero"),1,scn("absd"))
	}
    
    pr void cdummy()
    {
        tmu=ucr(opl(tru),dum,trux,truy)
		sua(tmu,"birth")
		svu(htru,scn("dummy"),tmu)
		svu(htmu,"hero",tru)
		tu(tmu,0.6,scn("dumb"))
        //uaa(tmu,abs)
        //uito(tmu,"lightningshield",tru)
        //ptu(tmu,cat,scn("cast"))
		uaa(tru,aba)
		plab(opl(tru),aba,false)
		//uaa(dumu(tru),abcs)
    }

    pr void erc()
    {
        if uhsp(tru,ab)
        {
            cdummy()
        }
    }
    
    pr void hs()
    {
        if lsk==ab && ual(tru,lsk)==1
        {
			cdummy()
		}
    }
    
    pr void udea()
    {
        if uhsp(tru,ab)
        {
            ukill(ldu(htru,scn("dummy")))
            rsvh(htru,scn("dummy"))
			rsvi(htru,scn("ch"))
			ura(tru,aba)
			//ura(dumu(tru),abcs)
        }
    }

	pb void init(int abi, int dumi, /*int absi,*/ int abcsi, int abai)
	{
		ab=abi
		dum=dumi
        //abs=absi
        abcs=abcsi
		aba=abai
		//
        tra(erc)
        tra(hs)
        tra(udea)
		tra(dmgs)
	}
}