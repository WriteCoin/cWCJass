//события игрока

#guard player

define
{
	private wlp(c) = wlpi(0,mpl,c)

	evpl = ev##_PLAYER
	
	trevpl(t,pl,ev) = TriggerRegisterPlayerEvent(t,pl,ev)
	trevpl(pl,ev) = trevpl(gtr,pl,ev)
	trevapl(t,ev) = wlp(trevpl(pl(tmi),ev))//TriggerRegisterAnyPlayerEvent(t,ev)
	trevapl(ev) = trevapl(gtr,ev)
	//
	trpla(t,pl,ev) = trae(trevpl(t,pl,ev))
	trpla(pl,ev) = trpla(gtr,pl,ev)
	trapla(ev) = trae(trevapl(ev))
	
	trevplk(t,pl,evk) = TriggerRegisterPlayerKeyEventBJ(t,pl,bj_KEYEVENTTYPE_DEPRESS,evk)
	trevplk(pl,evk) = trevplk(gtr,pl,evk)
	trevaplk(evk) = wlp(trevplk(pl(tmi),evk))
	//
	trplka(t,pl,evk) = trae(trevplk(t,pl,evk))
	trplka(pl,evk) = trplka(gtr,pl,evk)
	traplka(evk) = trae(trevaplk(evk))
	
	trevplc(t,pl,s,b) = TriggerRegisterPlayerChatEvent(t,pl,s,b)
	trevplc(pl,s,b) = trevplc(gtr,pl,s,b)
	trevplc(pl,s) = trevplc(pl,s,false)
	trevplc(pl) = trevplc(pl,"-")
	trevaplc(t,s,b) = wlp(trevplc(t,pl(tmi),s,b))
	trevaplc(s,b) = trevaplc(gtr,s,b)
	trevaplc(s) = trevaplc(s,false)
	trevaplc = trevaplc("-")
	//
	trplca(t,pl,s,b) = trae(trevplc(t,pl,s,b))
	trplca(pl,s,b) = trplca(gtr,pl,s,b)
	trplca(pl,s) = trplca(pl,s,false)
	trplca(pl) = trplca(pl,"-")
	traplca(t,s,b) = trae(trevaplc(t,s,b))
	traplca(s,b) = traplca(gtr,s,b)
	traplca(s) = traplca(s,false)
	traplca = traplca("-")
	
	trevpls(t,pl,pls,l,lv) = TriggerRegisterPlayerStateEvent(t,pl,pls,l,lv)
	trevpls(pl,pls,l,lv) = trevpls(gtr,pl,pls,l,lv)
	trevapls(t,pls,l,lv) = wlp(trevpls(t,pl(tmi),pls,l,lv))
	trevapls(pls,l,lv) = trevapls(gtr,pls,l,lv)
	//
	trplsa(t,pl,pls,l,lv) = trae(trevpls(t,pl,pls,l,lv))
	trplsa(pl,pls,l,lv) = trplsa(gtr,pls,l,lv)
	traplsa(t,pls,l,lv) = trae(trevapls(t,pls,l,lv))
	traplsa(pls,l,lv) = traplsa(gtr,pls,l,lv)
	
	//playerstate
	plst = pl##_STATE
	plstav = plst##_ALLIED_VICTORY
	plstfcc = plst##_FOOD_CAP_CEILING
	plstgr = plst##_GAME_RESULT
	plstgb = plst##_GIVES_BOUNTY
	plstg = plst##_GOLD
	plstgg = plstg##_GATHERED
	plstgur = plstg##_UPKEEP_RATE
	plstl = plst##_LUMBER
	plstlg = plstl##_GATHERED
	plstlur = plstl##_UPKEEP_RATE
	plstnsl = plst##_NO_CREEP_SLEEP
	plsto = plst##_OBSERVER
	plstod = plsto##_ON_DEATH
	plstp = plst##_PLACED
	plstr = plst##_RESOURCE
	plstrfc = plstr##_FOOD_CAP
	plstrfu = plstr##_FOOD_USED
	plstrg = plstr##_GOLD
	plstrh = plstr##_HERO_TOKENS
	plstrl = plstr##_LUMBER
	plstu = plst##_UNFOLLOWABLE
}

/*void TriggerRegisterAnyPlayerEvent(trigger t,playerevent evt)
{
	tmpi=0
	while (tmpi<=maxpl)
	{
		trevpl(t,pl(tmpi),evt)
		tmpi++
	}
	evt=null
}*/

//изменяет отношения с другими игроками
scope plac init on
{
	define
	{
		evplac = evpl##_ALLIANCE_CHANGED
	}
	trapla(evplac)
}

//нажимает стрелка влево
scope plal init on
{
	define
	{
		evplal = bj_KEYEVENTKEY_RIGHT
	}
	traplka(evplal)
}

//нажимает стрелка вправо
scope plar init on
{
	define
	{
		evplar = bj_KEYEVENTKEY_LEFT
	}
	traplka(evplar)
}

//нажимает стрелка вверх
scope plau init on
{
	define
	{
		evplau = bj_KEYEVENTKEY_UP
	}
	traplka(evplau)
}

//нажимает стрелка вниз
scope plad init on
{
	define
	{
		evplad = bj_KEYEVENTKEY_DOWN
	}
	traplka(evplad)
}

//написал сообщение (без аргументов)
/*scope plc init on
{
	define
	{
		evplc = evpl##_CHAT
	}
	trapla(evplc)
}*/

//написал сообщение (команды)
scope plc init on
{
	traplca
}

//проиграл
scope pld init on
{
	define
	{
		evpld = evpl##_DEFEAT
	}
	trapla(evpld)
}

//пропустил кинематику (нажатие клавиши ESC)
scope ple init on
{
	define
	{
		evple = evpl##_END_CINEMATIC
	}
	trapla(evple)
}

//вышел из игры
scope pll init on
{
	define
	{
		evpll = evpl##_LEAVE
	}
	trapla(evpll)
}

//свойство
scope pls init on
{
	define
	{
		evpls = evpl##_STATE_LIMIT
	}
	trapla(evpls)
}

//победа
scope plv init on
{
	define
	{
		evplv = evpl##_VICTORY
	}
	trapla(evplv)
}