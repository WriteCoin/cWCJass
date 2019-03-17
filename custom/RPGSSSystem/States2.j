/*
		tms1=subs(tms,tmi1+2,tmi1+4)
		if tms1=="%v" || tms1=="%mi" || tms1=="%ma" || tms1=="%p"
		{
			if tms1=="%v" { v+=mrv; tmr=v; tmi2=2 }
			elseif tms1=="%mi" { mi+=mrv; tmr=mi; tmi2=3 }
			elseif tms1=="%ma" { ma+=mrv; tmr=ma; tmi2=3 }
			elseif tms1=="%p" { p+=mrv; tmr=p; tmi2=2 }
			tms = subs(tms,0,tmi1) + oname(r2i(tmr)) +subs(tms,tmi1+tmi2,strl(tms))
		else
			tms = subs(tms,0,tmi1) + subs(tms,tmi1+2,strl(tms))
		} 
	}
	tms = straw2r(c,r2i(p),r2i(v),r2i(mi),r2i(ma))
	tmi1 = spos("%v",tms)
	if tmi1>0
	{
		tms = subs(tms,0,tmi1) + i2s(r2i(v)) + subs(tms,tmi1+2,strl(tms))
	}
	tmi1 = spos("%mi-%ma",tms)
	if tmi1>0 && mi==ma
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
	tmi1 = spos("%p",tms)
	if tmi1>0
	{
		tms = subs(tms,0,tmi1) + i2s(r2i(p)) + subs(tms,tmi1+2,strl(tms))
	}
	tmi1 = spos("%%",tms)
	if tmi1>0
	{
		tms = subs(tms,0,tmi1) + "%" + subs(tms,tmi1+2,strl(tms))
	}
	tmi1 = spos("%c",tms)
	if tmi1>0
	{
		tms = subs(tms,0,tmi1) + subs(tms,tmi1+2,strl(tms))
	}
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
	elseif spos("%v",tms)>0 { v=ldr(h,stsc(c)) }
	elseif spos("%mi",tms)>0 { mi=ldr(h,stsc(c)+"-min") }
	elseif spos("%ma",tms)>0 { ma=ldr(h,stsc(c)+"-max") }
	return stinfo(u,c,p,v,mi,ma)
}

define pss(u,c,o,n) = States_psss(u,c,o,n)

pbv psss(unit u,string c,int ol,int nlv)
{
	
}

define
{
	uast(u,s,a,v,miv,mav,pv) = 
	{
		States_straw2r(s,r2i(v),r2i(miv),r2i(mav),r2i(pv))
		States_stadd(u,s,a,v,miv,mav,pv)
	}
	uast(u,s,a,v,miv,mav) = uast(u,s,a,v,miv,mav,0)
	uast(u,s,a,v,miv) = uast(u,s,a,v,miv,0)
	uast(u,s,a,v) = uast(u,s,a,v,0)
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
	elseif (s=="mana") || (s=="mana%") || (s=="mana/lvl") || (s=="mana/lvl%")
		smp(u,tmr)
		sum(u,umm(u))
	elseif (s=="str") || (s=="dex") || (s=="enr") || (s=="str/lvl") || (s=="dex/lvl") || (s=="enr/lvl") || (s=="vit") || (s=="vit/lvl")
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
	elseif (s=="res-all")
		isvr(h,stsc("res-fire"),vl*tmi1)
		isvr(h,stsc("res-cold"),vl*tmi1)
		isvr(h,stsc("res-ltng"),vl*tmi1)
		isvr(h,stsc("res-pois"),vl*tmi1)
	elseif (s=="res-all-max")
		isvr(h,stsc("res-fire-max"),vl*tmi1)
		isvr(h,stsc("res-cold-max"),vl*tmi1)
		isvr(h,stsc("res-ltng-max"),vl*tmi1)
		isvr(h,stsc("res-pois-max"),vl*tmi1)
	elseif (s=="skilltab")
		tmi = r2i(pal) + ldi(sh,"l")
		psss(u,tmi,ual(u,tmi),ual(u,tmi)+r2i(vl)*tmi1)
		isua(u,tmi,r2i(vl)*tmi1)
	elseif (s=="allskills")
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
	elseif (s=="skill")
		isvi(h,stsc(s),r2i(vl)*tmi1)
		tmi = r2i(pal) + ldi(sh,"l")
		if ldi(h,stsc(s))>0
		{
			uaa(u,tmi)
			sua(u,tmi,r2i(vl)*tmi1)
		else
			ura(u,tmi)
		}
	elseif (s=="cast")
		tmi=1
		whilenot tmi>20
		{
			tmi2=1
			whilenot tmi2>ldi(sh(abis),"i")
			{
				pal = ldi(sh(abis),"c"+i2s(tmi2))
				if ual(u,pal)>0
				{
					sacd(r2i(pal),tmi,acd(r2i(pal),tmi)-vl*tmi1)
				}
				tmi2++
			}
			tmi++
		}
	elseif (s=="hit-skill")
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
			isvi(h,stsc("hitl")+i2s(tmi3),vmal*tmi1)
		}
	elseif (s=="att-skill")
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
			isvi(h,stsc("attl")+i2s(tmi3),vmal*tmi1)
		}
	elseif (s=="light")
		if ad { tmi=2 } else { tmi=3 }
		tmi2=1
		whilenot tmi2>r2i(vl)
		{
			uaa(u,'AIsi')
			sual(u,'AIsi',tmi)
			ura(u,'AIsi')
			tmi2++
		}
	elseif (s=="swing")
		suas(u,uas(u)+uas(u)*vl*0.01*tmi1)
	elseif (s=="regen")
		ahpr(u,vl*tmi1)
	elseif (s=="regen-mana")
		ampr(u,vl*0.01*tmi1)
	elseif (s=="move")
		sums(u,ums(u)+ums(u)*0.01*vl*tmi1)
	elseif (s=="ease")
		if ldr(h,stsc(s))>100 { svr(h,stsc(s),100) }
	elseif (s=="color-red")
		sucr(u,ldr(h,"cr")+vl*tmi1)
	elseif (s=="color-green")
		sucg(u,ldr(h,"cg")+vl*tmi1)
	elseif (s=="color-blue")
		sucb(u,ldr(h,"cb")+vl*tmi1)
	elseif (s=="color-all")
		suc(u,ldr(h,"cr")+vl*tmi1,ldr(h,"cg")+vl*tmi1,ldr(h,"cb")+vl*tmi1)
	elseif (s=="trans")
		//sutr(u,ldr(h,"tr")+vl*tmi1)
	elseif (s=="time-scale")
		sut(u,ldr(h,"timescale")+vl*tmi1)
	elseif (s=="stupidity")
		isvi(h,stsc(s)+"-val",r2i(pal)*tmi1)
	elseif (s=="invul")
		if ldr(h,stsc(s))>0 { sui(u,true) } else { sui(u,false) }
	elseif (s=="magicarrow")
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
	elseif (s=="explosivearrow")
		uast(u,"att%",ad,spc(u,vl,20,9))
		uast(u,"fire-dmg",ad,0,spc(u,vl,4,5),spc(u,vl,8,6))
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
	usts(u,s,v,mi,ma,p) = Stats_stset(u,s,v,mi,ma,p)
	usts(u,s,v,mi,ma) = usts(u,s,v,mi,ma,0)
	usts(u,s,v,mi) = usts(u,s,v,mi,0)
	usts(u,s,v) = usts(u,s,v,0)
}

pbv stset(unit u,string c,real v,real mi,real ma,real p)
{
	int h=hid(u)
	uast(u,c,false,ldr(h,c),ldr(h,c+"-min"),ldr(h,c+"-max"),ldr(h,c+"-dur"))
	uast(u,c,true,v,mi,ma,p)
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
	//a("gethit-skill","%mi% шанс отразить атаку заклинанием %r%p %ma-го уровня")
	a("openwounds","+%v% шанс открытых ран")
	a("crit","+%v% шанс двойного урона")
	a("deadly","%v% шанс смертельного удара")
	a("crush","%v% шанс сокрушительного удара")
	a("stupidity","+%v% шанс ослепить цель на %p усл. ед. времени")
	a("nofreeze","Нельзя заморозить")
	//a("hp-set",null,0)
	a("res-fire-max","+%v к максимальной защите от огня")
	a("res-cold-max","+%v к максимальной защите от холода")
	a("res-ltng-max","+%v к максимальной защите от молнии")
	a("res-pois-max","+%v к максимальной защите от яда")
	a("res-all-max","+%v к максимальной защите от всего")
	//a("allskills","+%v ко всем навыкам")
	a("skill","Добавляет способность %r%p %v-го уровня")
	a("addxp","+%v% бонус к опыту")
	//a("invul","Неуязвимость")
	a("color-red","+%v красный цвет")
	a("color-green","+%v зеленый цвет")
	a("color-blue","+%v синий цвет")
	a("color-all","+%v ко всем цветам")
	a("trans","+%v% к прозрачности")
	a("slow","+%v% замедление цели")
	a("drain","%v% поглощаемость маны")
	a("life-drain","+%v поглощение здоровья")
	a("mana-drain","+%v поглощение маны")
	a("dmg-to-mag","+%v% физ. урона преобразуется в маг. урон")
}*/