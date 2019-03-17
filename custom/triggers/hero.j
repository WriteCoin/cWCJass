#guard hero

define 
{
	evplh = evpl##_HERO
	lsk = GetLearnedSkill()
	
}

//Повышает уровень
scope hl init on
{
	define
	{
		evplhl = evplh##_LEVEL
	}
	trae(trevau(gtr(hl),evplhl))
}
/* scope ihl init on
{
	pr void init()
	{
		trevau(gtr(hl),evplhl)
	}
} */

//Получает способность
scope hs init on
{
	define
	{
		evplhs = evplh##_SKILL
	}
	trae(trevau(gtr(hs),evplhs))
}
/* scope ihes init on
{
	pr void init()
	{
		trevau(gtr(hs),evplhs)
	}
} */

//Начинает воскрешение
scope hrs init on
{
	define
	{
		evplhrs = evplh##_REVIVE_FINISH
	}
	trae(trevau(gtr(hrs),evplhrs))
}
/* scope ihrs init on
{
	pr void init()
	{
		trevau(gtr(hrs),evplhrs)
	}
} */

//Отменяет воскрешение
scope hrc init on
{
	define
	{
		evplhrc = evplh##_REVIVE_FINISH
	}
	trae(trevau(gtr(hrc),evplhrc))
}

//Завершает воскрешение
scope hrf init on
{
	define
	{
		evplhrf = evplh##_REVIVE_FINISH
	}
	trae(trevau(gtr(hrf),evplhrf))
}