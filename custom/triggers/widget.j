//события виджета

#guard widget

//смерть
scope wdea ion
{
	define
	{
		trevd(t,w) = TriggerRegisterDeathEvent(t,w)
		trevd(w) = trevd(gtr(wdea),w)
	}
	trae()
}

scope widget ion
{

	define 
	{
		CreateDestructable(i,x,y,f,s,v) = widget_CrDest(i,x,y,f,s,v)
	}

	pbd CrDest(int objectid, real x, real y, real face, real scale, int var)
	{
		tmd = dcr(objectid,x,y,face,scale,var)
		trevd(tmd)
		return tmd
	}

	prv itf()
	{
		trevd(gtr(wdea),fit)
	}

	prv drf()
	{
		trevd(gtr(wdea),fd)
	}

	prv wdea()
	{
		flch(hid(trw),FT)
	}

	prv tev()
	{
		enitr
		endr
	}

	pri
	{
		enitr
		endr
		tra(wdea)
		tra(tev)
	}
}