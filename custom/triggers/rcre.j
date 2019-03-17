#guard rcre
//Регион-область
define
{
	re2rc(re) = ldrc( hid(reg), "rc")
	re2rc = re2rc(re)
	rc2re(rc) = ldre( hid(rc), "re")
	rc2re = rc2re(rc)
	
	svrcre(re,rc) = svrc( hid(re), "rc", rc)
	svrcre(re) = svrcre(re,rc)
	svrcre = svrcre(re)
	svrerc(rc,re) = svre( hid(rc), "re", re)
	svrerc(rc) = svrerc(rc,re)
	svrerc = svrerc(rc)
	
	trevere(t,re,fi) = trev##EnterRegion(t,re,fi)
	trevere(t,re) = trevere(t,re,null)
	trevere(t) = trevere(t,re)
	trevlre(t,re,fi) = trev##LeaveRegion(t,re,fi)
	trevlre(t,re) = trevlre(t,re,null)
	trevlre(t) = trevlre(t,re)
	
	treverc(t,rc,fi) =
	{
		region re = cre
		rearc(re,rc)
		svrcre(re,rc)
		trevere(t,re,fi)
		re=null
	}
	treverc(t,rc) = treverc(t,rc,null)
	
	trevlrc(t,rc,fi) =
	{
		region re = cre
		rearc(re,rc)
		svrcre(re,rc)
		trevlre(t,re,fi)
		re=null
	}
	trevlrc(t,rc) = trevlrc(t,rc,null)
}

//Юнит входит в область всей карты
scope erc init on
{
	trae(treverc(gtr(erc),mapr))
}

//Юнит покидает область всей карты
scope lrc init on
{
	trae(trevlrc(gtr(lrc),mapr))
}