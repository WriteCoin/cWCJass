#guard stashshift
scope stashshift
{
	define 
	{
		private truco = truhsp || truhsp(spdown)
		private enuco = enuhsp || enuhsp(spdown)
		
		private npage(u) = ldi(hid(u),scn("n"))
		private npage = npage(tru)
		//private ni = i2s(n)+i2s(i)
	}
	pb int sp = 'A01B', spdown = 'A01C'
	
	pb void moveo(unit u,int nPage,int lPage)
	{
		int i=1
		while (i<=minv)
		{
			tmit=uits(u,i-1)
			if tmit!=null
			{
				svit(hid(u),scn("it")+i2s(nPage)+i2s(i),tmit)
				svi(hid(tmit),scn("index"),invindexitcode(u,itc(tmit)))
				svi(hid(u),scn("index")+i2s(nPage)+i2s(i),invindexitcode(u,itc(tmit)))
				svb( hid(tmit), scn("drop"), true)
				uri(u,tmit)
				rsvb(hid(tmit), scn("drop"))
				sitv(tmit,false)
			else
				rsvh(hid(u),scn("it")+i2s(nPage)+i2s(i))
				svi(hid(u),scn("index")+i2s(nPage)+i2s(i),0)
			}
			i++
		}
		i=1
		while (i<=minv)
		{
			tmit=ldit(hid(u),scn("it")+i2s(nPage)+i2s(i))
			if tmit!=null
			{
				iteqpid(u,itc(tmit),1)
			} 
			i++
		}
		i=1
		while (i<=minv)
		{
			tmit=ldit(hid(u),scn("it")+i2s(lPage)+i2s(i))
			if tmit!=null
			{
				ituneqp(u,itc(tmit),1)
			}
			i++
		}
		i=1
		while (i<=minv)
		{
			tmit = ldit(hid(u),scn("it")+i2s(lPage)+i2s(i))
			if tmit!=null
			{
				sitv(tmit)
				uai(u,tmit)
				udis(u,tmit,ldi(hid(tmit),scn("index"))-1)
			}
			i++
		}
	}

	pb void spef()
	{
		if truco
		{
			int n=npage
			if spid == sp
			{
				if n < ldi(sh(scn),"max")
				{
					isvi(htru,scn("n"),1)
				}
			elseif npage>1 && spid == spdown
				isvi(htru,scn("n"),-1)
			}
			if n!=npage
			{
				moveo(tru,n,npage)
			}
		}
	}
	
	pb void erc()
	{
		if truco
		{
			svi(htru,scn("n"),1)
		}
	}
	
	pb void uifunc()
	{
		if enuco
		{
			svi(henu,scn("n"),1)
		}
	}
	
	define private s = i2s(npage)+i2s(ldi(hmit,scn("index")))
	
	pr void udi()
	{
		if truco && !ldb(hmit,scn("drop"))
		{
			rsvh(htru,scn("it")+s)
			rsvi(hmit,scn("index"))
		}
	}
	
	pr void plcact()
	{
		if ldb(hid(opl(enu)),scn("b1"))
		{
			tmit = uits(enu,tmi2-1)
			if tmit!=null
			{
				wlpi(minv,if ldit(henu,scn("it")+i2s(tmi1)+i2s(tmi))==null { break } )
				if tmi < minv
				{
					svit(henu,scn("it")+i2s(tmi1)+i2s(tmi),tmit)
					svi(hid(tmit),scn("index"),tmi)
					svi(henu,scn("index")+i2s(tmi1)+i2s(tmi),tmi)
					svb( hid(tmit), scn("drop"), true)
					uri(enu,tmit)
					rsvb(hid(tmit), scn("drop"))
					sitv(tmit,false)
					iteqpid(enu,itc(tmit),1)
				}
			}
			svb(hid(opl(enu)),scn("b1"),false)
		elseif ldb(hid(opl(enu)),scn("b2"))
			moveo(enu,npage(enu),tmi1)
			svi(henu,scn("n"),tmi1)
			svb(hid(opl(enu)),scn("b2"),false)
		else
			msg("Номер отсека в инвентаре: "+i2s(npage(enu)),opl(enu))
		}
	}
	
	pr bool fil()
	{
		return uhsp(ufi,sp) || uhsp(ufi,spdown)
	}
	
	pr void plc()
	{
		bool b1 = gc(gens(trpl,fil))>0
		if b1 && (subs(chs,1,6)=="stash") && (strl(chs)>6)
		{
			int i = 7
			tmi1=0
			tmi2=0
			while i<strl(chs) && subs(chs,i,i+1)!=" "
			{
				i++
			}
			tmi1 = s2i(subs(chs,7,i))
			//msgi(i)
			//msg("strl: "+i2s(strl(chs)))
			if i!=strl(chs)
			{
				tmi2 = s2i(subs(chs,i+1))
			}
			//msgi(tmi1)
			//msgi(tmi2)
			b1 = (tmi1>0) && (tmi1<=ldi(sh(scn),"max"))
			bool b2 = (tmi2>0) && (tmi2<=minv)
			if b1 && b2
			{
				svb(hid(trpl),scn("b1"),true)
			elseif b1 && !b2
				svb(hid(trpl),scn("b2"),true)
			}
			fg(tmg,plcact)
		elseif b1 && subs(chs,1,6)=="npage"
			fg(tmg,plcact)
		}
	}
	
	pb void init(int sp1,int sp2)
	{
		sp=sp1
		spdown=sp2
		svi(sh(scn),"max",1000)
		tra(spef)
		tra(erc)
		tra(udi)
		tra(plc)
		scuif(stashshift)
	}
}