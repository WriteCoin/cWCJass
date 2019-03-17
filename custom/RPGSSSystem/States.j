//библиотека статов
//добавление, изменение, получение информации
//требуется мемхак!

#guard States

define
{
	stsc(s) = "States_" + s

	svdef(u,a) =
	{
		svr(hid(u),stsc("def"),a)
		svr(hid(u),stsc("def-c"),a)
	}
	svhp(u,a) =
	{
		shp(u,a)
		svr(hid(u),stsc("hp-c"),a)
	}
	svmp(u,a) =
	{
		smp(u,a)
		svr(hid(u),stsc("mp-c"),a)
	}
}

define 
{
	ba2i(b) = States_boa2i(b)
	i2b(i) = States_ia2b(b)
}

pb int boa2i(boolean b) { if b { return 1 } else { return -1 } }
pb bool ia2b(int i) { if i==1 { return true } else { return false } }

define
{
	uaist(u,c,p,v,mi,ma) = States_stinfo(u,c,p,v,mi,ma)
	uaist(u,c,p,v,mi) = uaist(u,c,p,v,mi,0)
	uaist(u,c,p,v) = uaist(u,c,p,v,0)
	uaist(u,c,p) = uaist(u,c,p,0)
	uaist(u,c) = uaist(u,c,0)
}

pbs straw2r(string c,int p,int v,int mi,int ma)
{
	int i = hi(string,sh,"i","c",c)
	int j=0, k=0, b=0
	string s = lds(sh,"s"+i2s(i)), s1
	j = spos("%r",s)
	if j>0
	{
		s1 = subs(s,j+2,j+4)
		if (s1=="%v") || (s1=="%mi") || (s1=="%ma") || (s1=="%p")
		{
			if s1=="%v" { k = v; b=2 }
			elseif s1=="%mi" { k = mi; b=3 }
			elseif s1=="%ma" { k = ma; b=3 }
			elseif s1=="%p" { k = p; b=2 }
			s = subs(s,0,j) + oname(k) + subs(s,j+b,strl(s))
			svi(sh,"l",k - 'A000'+48)
		else
			s = subs(s,0,j) + subs(s,j+2,strl(s))
		}
	}
	return s
}

pbs stinfo(unit u,string c,real p,real v,real mi,real ma)
{
	/* msg("p: "+r2s(p))
	msg("v: "+r2s(v))
	msg("mi: "+r2s(mi))
	msg("ma: "+r2s(ma)) */
	//string s
	if p==0 && v==0 && mi==0 && ma==0 { return "" }
	tmi = hi(string,sh,"i","c",c)
	tms = lds(sh,"s"+i2s(tmi))
	//s=tms
	//msg(tms)
	tmi1 = spos("%r",tms)
	tms = straw2r(c,r2i(p),r2i(v),r2i(mi),r2i(ma))
	tmi1 = spos("%v",tms)
	if tmi1>0
	{
		tms = subs(tms,0,tmi1) + i2s(r2i(v)) + subs(tms,tmi1+2,strl(tms))
	}
	msg(tms)
	tmi1 = spos("%mi-%ma",tms)
	if tmi1>0
	{
		if mi==ma
		{
			tms = subs(tms,0,tmi1) + i2s(r2i(mi)) + subs(tms,tmi1+7,strl(tms))
		else
			tmi1 = spos("%mi",tms)
			if tmi1>0
			{
				tms = subs(tms,0,tmi1) + i2s(r2i(mi)) + subs(tms,tmi1+3,strl(tms))
			}
			tmi1 = spos("%ma",tms)
			if tmi1>0
			{
				tms = subs(tms,0,tmi1) + i2s(r2i(ma)) + subs(tms,tmi1+3,strl(tms))
			}
		}
	}
	//msg(tms)
	tmi1 = spos("%p",tms)
	if tmi1>0
	{
		tms = subs(tms,0,tmi1) + i2s(r2i(p)) + subs(tms,tmi1+2,strl(tms))
	}
	//msg(tms)
	tmi1 = spos("%%",tms)
	if tmi1>0
	{
		tms = subs(tms,0,tmi1) + "%" + subs(tms,tmi1+2,strl(tms))
	}
	//msg(tms)
	tmi1 = spos("%c",tms)
	if tmi1>0
	{
		tms = subs(tms,0,tmi1) + subs(tms,tmi1+2,strl(tms))
	}
	//msg(tms)
	return tms
}

define uist(u,c) = States_ustinfo(u,c)

pbs ustinfo(unit u,string c)
{
	int h=hid(u)
	real p=0, v=0, mi=0, ma=0
	tmi = hi(string,sh,"i","c",c)
	tms = lds(sh,"s"+i2s(tmi))
	if spos("%p",tms)>0 { p=ldr(h,stsc(c)+"-dur") }
	if spos("%v",tms)>0 { v=ldr(h,stsc(c)) }
	if spos("%mi",tms)>0 { mi=ldr(h,stsc(c)+"-min") }
	if spos("%ma",tms)>0 { ma=ldr(h,stsc(c)+"-max") }
	return stinfo(u,c,p,v,mi,ma)
}

define pss(u,c,o,n) = States_psss(u,c,o,n)

pbv psss(unit u,int c,int ol,int nlv)
{
	
}

define
{
	uast(u,s,a,v,miv,mav,pv) = 
	{
		States_straw2r(s,r2i(v),r2i(miv),r2i(mav),r2i(pv))
		States_stadd(u,s,a,v,miv,mav,pv)
	}
	uast(u,s,a,v,miv,mav) = uast(u,s,a,v,miv,mav,0.)
	uast(u,s,a,v,miv) = uast(u,s,a,v,miv,0.)
	uast(u,s,a,v) = uast(u,s,a,v,0.)
}

pbv stadd(unit u,string s,bool ad,real vl,real vmil,real vmal,real pal)
{
	int h=hid(u)
	tmi1 = ba2i(ad)
	tmi = hi(string,sh,"i","c",s)
	
	if tmi>0 && ldb(sh,"b"+i2s(tmi))
	{
		isvr(h,stsc(s),vl*tmi1)
		tmb=spos("/lvl",s)>0
		tms1=lds(sh,"s"+i2s(tmi))
		if spos("%%",tms1)>0
		{
			tms = subs(s,0,spos("%",s))
			if tmb
			{
				isvr(h,stsc(tms),vl*ul(u)*tmi1)
			}
			tmi2=hi(string,sh,"i","c",tms)
			tms2=lds(sh,"s"+i2s(tmi2))
			tmb1=spos("%mi",tms2)>0||spos("%ma",tms2)>0
			if ldr(h,stsc(s))==0
			{
				tmr=ldr(h,stsc(tms)+"-c")
				if tmb1
				{
					tmr1=ldr(h,stsc(tms)+"-min-c")
					tmr2=ldr(h,stsc(tms)+"-max-c")
				}
			else
				tmr3=(ldr(h,stsc(s))+100)*PT
				tmr=ldr(h,stsc(tms)+"-c")*tmr3
				if tmb1
				{
					tmr1=ldr(h,stsc(tms)+"-min-c")*tmr3
					tmr2=ldr(h,stsc(tms)+"-max-c")*tmr3
				}
			}
			if tmb
			{
				uast(u,tms,false,ldr(h,stsc(tms)))
			}
			svr(h,stsc(tms),tmr)
			if tmb
			{
				uast(u,tms,true,tmr)
			}
			if tmb1
			{
				svr(h,stsc(tms)+"-min",tmr1)
				svr(h,stsc(tms)+"-max",tmr2)
			}
		else
			tms2=lds(sh,"s"+i2s(tmi))
			tmb1=spos("%mi",tms2)>0||spos("%ma",tms2)>0
			if tmb
			{
				tms=subs(s,0,spos("/lvl",s))
				isvr(h,stsc(tms),vl*ul(u)*tmi1)
				if tmb1
				{
					isvr(h,stsc(tms)+"-min",vmil*ul(u)*tmi1)
					isvr(h,stsc(tms)+"-max",vmal*ul(u)*tmi1)
				}
			elseif tmb1
				isvr(h,stsc(s)+"-min",vmil*tmi1)
				isvr(h,stsc(s)+"-max",vmal*tmi1)
			}
			tms1=s+"%"
			tmi2=hi(string,sh,"i","c",tms1)
			if !tmb1 && tmi2>0
			{
				if ldr(h,stsc(tms1))==0
				{
					tmr=ldr(h,stsc(s)+"-c")
					if tmb1
					{
						tmr1=ldr(h,stsc(s)+"-min-c")
						tmr2=ldr(h,stsc(s)+"-max-c")
					}
				else
					tmr3=PT*(ldr(h,stsc(tms1))+100)
					tmr=ldr(h,stsc(s)+"-c")*tmr3
					if tmb1
					{
						tmr1=ldr(h,stsc(s)+"-min-c")*tmr3
						tmr2=ldr(h,stsc(s)+"-max-c")*tmr3
					}
				}
				svr(h,stsc(s),tmr)
				if tmb1
				{
					svr(h,stsc(s)+"-min",tmr1)
					svr(h,stsc(s)+"-max",tmr2)
				}
			}
		}
		if spos("%p",tms1)>0
		{
			isvr(h,stsc(s)+"-dur",pal*tmi1)
		}
		if spos("%c",tms1)>0
		{
			if !(ismon(u))
			{
				svr(h,stsc(s)+"-pct",1)
			}
		}
	}
	if (s=="hp") || (s=="hp%") || (s=="hp/lvl") || (s=="hp/lvl%")
	{
		if s=="hp" { if tmr>150000 { urem(u) } }
		smhp(u,tmr)
		sul(u,uml(u))
	}
	if (s=="mana") || (s=="mana%") || (s=="mana/lvl") || (s=="mana/lvl%")
	{
		smp(u,tmr)
		sum(u,umm(u))
	}
	if (s=="str") || (s=="dex") || (s=="enr") || (s=="str/lvl") || (s=="dex/lvl") || (s=="enr/lvl") || (s=="vit") || (s=="vit/lvl")
	{
		tmi = r2i(vl)*tmi1
		if spos("/lvl",s)>0 { tmi*=ul(u) }
		if (spos("enr",s)>0) || (spos("vit",s)>0) { tmi3 = hi(int,sh(hst),"i","c",uc(u)) }
		if spos("str",s)>0 
		{ 
			ihstr(u,tmi,true,false) 
		elseif spos("dex",s)>0 
			ihagi(u,tmi,true,false) 
			uast(u,"ac",ad,tmi/hdpa)
			uast(u,"att",ad,tmi/hapa)
		elseif spos("enr",s)>0			
			amp(u,ldr(sh(hst),"mpe"+i2s(tmi3))*tmi*tmi1)
			ihint(u,tmi,true,false) 
		elseif spos("vit",s)>0
			amhp(u,ldr(sh(hst),"lpv"+i2s(tmi3))*tmi*tmi1)
		}
	}
	if (s=="res-all")
	{
		isvr(h,stsc("res-fire"),vl*tmi1)
		isvr(h,stsc("res-cold"),vl*tmi1)
		isvr(h,stsc("res-ltng"),vl*tmi1)
		isvr(h,stsc("res-pois"),vl*tmi1)
	}
	if (s=="res-all-max")
	{
		isvr(h,stsc("res-fire-max"),vl*tmi1)
		isvr(h,stsc("res-cold-max"),vl*tmi1)
		isvr(h,stsc("res-ltng-max"),vl*tmi1)
		isvr(h,stsc("res-pois-max"),vl*tmi1)
	}
	if (s=="skilltab")
	{
		tmi = r2i(pal) + ldi(sh,"l")
		psss(u,tmi,ual(u,tmi),ual(u,tmi)+r2i(vl)*tmi1)
		isua(u,tmi,r2i(vl)*tmi1)
	}
	if (s=="allskills")
	{
		tmi2=1
		whilenot tmi2>ldi(sh(abis),"i")
		{
			tmi = ldi(sh(abis),"c"+i2s(tmi2))
			if ual(u,tmi)>0
			{
				psss(u,tmi,ual(u,tmi),ual(u,tmi)+r2i(vl)*tmi1)
				isua(u,tmi,r2i(vl)*tmi1)
			}
			tmi2++
		}
	}
	if (s=="skill")
	{
		isvi(h,stsc(s),r2i(vl)*tmi1)
		tmi = r2i(pal) + ldi(sh,"l")
		if ldi(h,stsc(s))>0
		{
			uaa(u,tmi)
			sua(u,tmi,r2i(vl)*tmi1)
		else
			ura(u,tmi)
		}
	}
	if (s=="cast")
	{
		tmi=1
		whilenot tmi>20
		{
			tmi2=1
			whilenot tmi2>ldi(sh(abis),"i")
			{
				pal = ldi(sh(abis),"c"+i2s(tmi2))
				if ual(u,r2i(pal))>0
				{
					sacd(r2i(pal),tmi,acd(r2i(pal),tmi)-vl*tmi1)
				}
				tmi2++
			}
			tmi++
		}
	}
	if (s=="hit-skill")
	{
		tmi = r2i(pal) + ldi(sh,"l")
		tmi2 = hi(int,h,stsc("hiti"),stsc("hitc"),tmi)
		if tmi2>0
		{
			tmi3 = tmi2
		else
			if ad { isvi(h,stsc("hiti"),1) }
			tmi3 = ldi(h,stsc("hiti"))
		}
		if tmi3>0
		{
			isvr(h,stsc("hitch")+i2s(tmi3),vmil*tmi1)
			isvi(h,stsc("hitl")+i2s(tmi3),r2i(vmal)*tmi1)
		}
	}
	if (s=="att-skill")
	{
		tmi = r2i(pal) + ldi(sh,"l")
		tmi2 = hi(int,h,stsc("atti"),stsc("attc"),tmi)
		if tmi2>0
		{
			tmi3 = tmi2
		else
			if ad { isvi(h,stsc("atti"),1) }
			tmi3 = ldi(h,stsc("atti"))
		}
		if tmi3>0
		{
			isvr(h,stsc("attch")+i2s(tmi3),vmil*tmi1)
			isvi(h,stsc("attl")+i2s(tmi3),r2i(vmal)*tmi1)
		}
	}
	if (s=="light")
	{
		if ad { tmi=2 } else { tmi=3 }
		tmi2=1
		whilenot tmi2>r2i(vl)
		{
			uaa(u,'AIsi')
			sua(u,'AIsi',tmi)
			ura(u,'AIsi')
			tmi2++
		}
	}
	if (s=="swing") { suas(u,uas(u)+uas(u)*vl*0.01*tmi1) }
	if (s=="regen") { ahpr(u,vl*tmi1) }
	if (s=="regen-mana") { ampr(u,vl*0.01*tmi1) }
	if (s=="move") {sums(u,ums(u)+ums(u)*0.01*vl*tmi1) }
	if (s=="ease") && (ldr(h,stsc(s))>100) { svr(h,stsc(s),100) }
	if (s=="color-red") { sucr(u,ldr(h,"cr")+vl*tmi1) }
	if (s=="color-green") { sucg(u,ldr(h,"cg")+vl*tmi1) }
	if (s=="color-blue") { sucb(u,ldr(h,"cb")+vl*tmi1) }
	if (s=="color-all") { suc(u,ldr(h,"cr")+vl*tmi1,ldr(h,"cg")+vl*tmi1,ldr(h,"cb")+vl*tmi1) }
	if (s=="trans") { sutr(u,ldr(h,"tr")+vl*tmi1) }
	if (s=="time-scale") { sut(u,ldr(h,"timescale") + vl*tmi1) }
	if (s=="stupidity") { isvi(h,stsc(s)+"-val",r2i(pal)*tmi1) }
	if (s=="invul") { if ldr(h,stsc(s))>0 { sui(u,true) } else { sui(u,false) } }
	if (s=="magicarrow")
	{
		uast(u,"dmg-to-mag",ad,vl)
		uast(u,"att%",ad,10+9*vl)
		uast(u,"dmg",ad,vl)
		if !ad
		{
			ura(u,spmma)
			uaa(u,spma)
		else
			ura(u,spma)
			uaa(u,spmma)
		}
	}
	if (s=="explosivearrow")
	{
		uast(u,"att%",ad,spc(u,r2i(vl),20,9))
		uast(u,"fire-dmg",ad,0,spc(u,r2i(vl),4,5),spc(u,r2i(vl),8,6))
		isvr(h,stsc("misr"),150*tmi1)
		isvr(h,stsc("misc"),4*tmi1)
		if !ad
		{
			ura(u,spmexa)
			uaa(u,spma)
			rsvs(h,stsc("mise"))
		else
			ura(u,spma)
			uaa(u,spmexa)
			svs(h,stsc("mise"),"Abilities\\Spells\\Other\\Incinerate\\FireLordDeathExplode.mdl")
		}
	}
} 

define
{
	usts(u,s,v,mi,ma,p) = States_stset(u,s,v,mi,ma,p)
	usts(u,s,v,mi,ma) = usts(u,s,v,mi,ma,0.)
	usts(u,s,v,mi) = usts(u,s,v,mi,0.)
	usts(u,s,v) = usts(u,s,v,0.)
}

pbv stset(unit u,string c,real v,real mi,real ma,real p)
{
	int h=hid(u)
	uast(u,c,false,ldr(h,c),ldr(h,c+"-min"),ldr(h,c+"-max"),ldr(h,c+"-dur"))
	uast(u,c,true,v,mi,ma,p)
}

define uphp(x) = States_monuphp(x)

prv gf2()
{
	usts(enu,"hp",uml(enu)/aplc*ldi(sh,"x"))
}

pbv monuphp(int x)
{
	svi(sh,"x",x)
	fg(genp(monpl),gf2)
	rsvi(sh,"x")
}

define
{
	private n=i2s(ldi(sh,"i"))
	private a(c,s,i) = add(c,s,i)
	private a(c,s) = a(c,s,1)
	private a(c) = a(c,null)
}

prv add(string c,string s,int i)
{
	isvi(sh,"i",1)
	svs(sh,"c"+n,c)
	svs(sh,"s"+n,s)
	svb(sh,"b"+n,ia2b(i))
}

//База статов
pbv in2()
{
	a("dmg","Добавляет %mi-%ma урона")
	a("dmg-min","+%v к минимальному урону")
	a("dmg-max","+%v к максимальному урону")
	a("dmg/lvl","Добавляет %mi-%ma урона за уровень")
	a("dmg/lvl-min","+%v к минимальному урону за уровень")
	a("dmg/lvl-max","+%v к максимальному урону за уровень")
	a("dmg%","+%v%% улучшенный урон")
	a("dmg/lvl%","+%v%% бонус к урону за уровень")
	a("dmg-item","+%mi-%ma к урону оружием")
	a("dmg-item-min","+%v к минимальному урону оружием")
	a("dmg-item-max","+%v к максимальному урону оружием")
	a("dmg-item/lvl","+%mi-%ma к урону оружием за уровень")
	a("dmg-item%","+%v%% улучшенный урон оружием")
	a("dmg-item/lvl%","+%v%% бонус к урону оружием за уровень")
	a("dmg-item-mis","+%mi-%ma к урону оружием дальнего боя")
	a("dmg-item-mis-min","+%v к минимальному урону оружием дальнего боя")
	a("dmg-item-mis-max","+%v к максимальному урону оружием дальнего боя")
	a("dmg-item-mis%","+%v%% улучшенный урон оружием дальнего боя")
	a("dmg-item-mis/lvl","+%mi-%ma к урону оружием дальнего боя за уровень")
	a("dmg-item-mis/lvl%","+%v%% бонус к урону оружием дальнего боя за уровень")
	a("dmg-item-str","+%v% бонус от силы к урону оружием")
	a("dmg-item-dex","+%v% бонус от ловкости к урону оружием")
	a("dmg-mag","Добавляет %mi-%ma урона магией%c")
	a("mag-min","+%v к минимальному урону магией%c")
	a("mag-max","+%v к максимальному урону магией%c")
	a("cold-dmg","Добавляет %mi-%ma урона холодом с замедлением на %p секунд%c")
	a("cold-min","+%v к минимальному урону холодом%c")
	a("cold-max","+%v к максимальному урону холодом%c")
	a("cold-len","+%v с. замедление холодом%c")
	a("fire-dmg","Добавляет %mi-%ma урона огнем%c")
	a("fire-min","+%v к минимальному урону огнем%c")
	a("fire-max","+%v к максимальному урону огнем%c")
	a("ltng-dmg","Добавляет %mi-%ma урона молнией%c")
	a("ltng-min","+%v к минимальному урону молнией%c")
	a("ltng-max","+%v к максимальному урону молнией%c")
	a("dmg-pois","Добавляет %mi-%ma урона ядом в течение %p секунд%c")
	a("hp","+%v к здоровью")
	a("hp/lvl","+%v к здоровью за уровень")
	a("mana","+%v к мане")
	a("mana/lvl","+%v к мане за уровень")
	a("light","+%v к радиусу света")
	a("gold%","+%v% доп. золото от монстров")
	a("mag%","+%v% выше шанс найти маг. предмет")
	a("red-dmg","Полученный урон снижается на %v")
	a("red-dmg%","Полученный урон снижается на %v%%")
	a("red-mag","Полученный маг. урон снижается на %v")
	a("red-mag%","Полученный маг. урон снижается на %v%%")
	a("ignore-ac","Игнорирование защиты цели")
	//a("dmg-ac","-%v к защите монстра на удар")
	a("pierce","+%v% шанс пролететь снаряду сквозь противника")
	a("thorns","Атакующий получает урон в %v")
	a("light-thorns","Атакующий получает урон молнией в %v")
	a("swing","+%v% повышение скорости атаки")
	a("block","+%v% повышение шанса блокировки")
	a("cast","-%v к перезарядке заклинания %r%p")
	a("half-freeze","Время заморозки уменьшается на %v с.")
	a("str","+%v к силе")
	a("str/lvl","+%v к силе за уровень")
	a("dex","+%v к ловкости")
	a("dex/lvl","+%v к ловкости за уровень")
	a("enr","+%v к энергии")
	a("enr/lvl","+%v к энергии за уровень")
	a("balance","+%v% очень быстрое восстановление после удара")
	a("noheal","Монстры не могут лечиться")
	a("regen","Восстановление здоровья +%v")
	a("regen-mana","Восстановление маны +%v")
	a("knock","Отброс")
	a("lifesteal","+%mi-%ma здоровье, воруемое при попадании%с")
	a("manasteal","+%mi-%ma мана, воруемая при попадании%с")
	a("res-pois-len","Время отравления уменьшается на %v%")
	a("ease","Требования %v%")
	a("move","+%v% повышение скорости перемещения")
	a("res-fire","Защита от огня +%v%")
	a("res-cold","Защита от холода +%v%")
	a("res-ltng","Защита от молнии +%v%")
	a("res-pois","Защита от яда +%v%")
	a("res-fire/lvl","Защита от огня +%v% за уровень")
	a("res-cold/lvl","Защита от холода +%v% за уровень")
	a("res-ltng/lvl","Защита от молнии +%v% за уровень")
	a("res-pois/lvl","Защита от яда +%v% за уровень")
	a("res-all","Защита от всего +%v%")
	a("abs-fire","Поглощение огня +%v")
	a("abs-cold","Поглощение холода +%v")
	a("abs-ltng","Поглощение молнии +%v")
	a("dmg-to-mana","%v% полученного урона переходит в ману")
	a("att","+%v к уровню атаки")
	a("att%","+%v%% бонус к уровню атаки")
	a("att/lvl","+%v к уровню атаки за уровень")
	a("att/lvl%","+%v%% бонус к уровню атаки за уровень")
	a("ac","Защита +%v")
	a("ac%","Защита +%v%%")
	a("ac/lvl","Защита +%v за уровень")
	a("ac/lvl%","Защита +%v%% за уровень")
	a("howl","При попадании монстр бежит +%v%")
	a("skilltab","+%v к %r%p",0)
	a("mana-kill","+%v к мане после каждого убийства")
	a("att-demon","+%v к уровню атаки против Демонов")
	a("dmg-demon","+%v к урону против Демонов")
	a("dmg-demon%","+%v%% бонус к урону против Демонов")
	a("att-undead","+%v к уровню атаки против Нежити")
	a("dmg-undead","+%v к урону против Нежити")
	a("dmg-undead%","+%v%% бонус к урону против Нежити")
	a("hit-skill","%mi% шанс прочесть заклинание %r%p %ma-го уровня при ударе",0)
	a("att-skill","%mi% шанс прочесть заклинание %r%p %ma-го уровня при атаке",0)
	a("openwounds","+%v% шанс открытых ран")
	a("crit","+%v% шанс двойного урона")
	a("deadly","%v% шанс смертельного удара")
	a("crush","%v% шанс сокрушительного удара")
	a("stupidity","+%v% шанс ослепить цель на %p усл. ед. времени")
	a("nofreeze","Нельзя заморозить")
}