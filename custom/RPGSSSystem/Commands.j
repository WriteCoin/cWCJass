//команды

#guard Commands

prv gf()
{
	msg(tms)
	msg(uist(enu,tms),trpl)
	msg(tms)
	tms1=subs(tms,0,6)
	tmi=s2i(subs(tms,7,strl(tms)))
	if tms1=="xp_add" 
	{ 
		axp(enu,tmi,false) 
	elseif tms1=="xp_set"
		sxp(enu,tmi,false) 
	}
	tms1=subs(tms,0,7)
	tmi=s2i(subs(tms,8,strl(tms)))
	if (tms1=="players") && (issp) && ((tmi>=1) && (tmi<=12))
	{ 
		uphp(tmi)
		aplc=tmi
		msgf("Players set to " + i2s(tmi),hf)
	}
	tms1=subs(tms,0,9)
	tmi=s2i(subs(tms,10,strl(tms)))
	if tms1=="level_add" 
	{ 
		ahl(enu,tmi,false)
	elseif tms1=="level_set"
		shl(enu,tmi,false)
	}
}

prv plc()
{
	tms=subs(chs,1,strl(chs))
	msgb(isplaut(trpl))
	if isplaut(trpl)
	{
		fg(genp(trpl))
	}
}

pri
{
	tra(plc)
}