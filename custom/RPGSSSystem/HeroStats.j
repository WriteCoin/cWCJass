//Герои
#guard HeroStats

cnst string hst = scn
cnst real hhpa = 30, hdpa = 4, hapa=5
cnst group hg = cg
cnst force hf = cf

define
{
	private h = sh(scn)
	private i = i2s(ldi(h,"i"))
	private a(c,at,v,spcl,lpv,mpe,lplvl,mplvl,clo,i1,i2,i3,i4,i5) = add(c,at,v,spcl,lpv,mpe,lplvl,mplvl,clo,i1,i2,i3,i4,i5)
	private a(c,at,v,spcl,lpv,mpe,lplvl,mplvl,clo,i1,i2,i3,i4) = a(c,at,v,spcl,lpv,mpe,lplvl,mplvl,clo,i1,i2,i3,i4,0)
	private a(c,at,v,spcl,lpv,mpe,lplvl,mplvl,clo,i1,i2,i3) = a(c,at,v,spcl,lpv,mpe,lplvl,mplvl,clo,i1,i2,i3,0)
	private a(c,at,v,spcl,lpv,mpe,lplvl,mplvl,clo,i1,i2) = a(c,at,v,spcl,lpv,mpe,lplvl,mplvl,clo,i1,i2,0)
	private a(c,at,v,spcl,lpv,mpe,lplvl,mplvl,clo,i1) = a(c,at,v,spcl,lpv,mpe,lplvl,mplvl,clo,i1,0)
	private a(c,at,v,spcl,lpv,mpe,lplvl,mplvl,clo) = a(c,at,v,spcl,lpv,mpe,lplvl,mplvl,clo,0)
	private a(c,at,v,spcl,lpv,mpe,lplvl,mplvl) = a(c,at,v,spcl,lpv,mpe,lplvl,mplvl,null)
	private a(c,at,v,spcl,lpv,mpe,lplvl) = a(c,at,v,spcl,lpv,mpe,lplvl,0)
	private a(c,at,v,spcl,lpv,mpe) = a(c,at,v,spcl,lpv,mpe,0)
	private a(c,at,v,spcl,lpv) = a(c,at,v,spcl,lpv,0)
	private a(c,at,v,spcl) = a(c,at,v,spcl,0)
	private a(c,at,v) = a(c,at,v,false)
	private a(c,at) = a(c,at,0)
	private a(c) = a(c,0)
}

pr void add(int c, real at, int v, bool spcl, real lpv, real mpe, real lplvl, real mplvl, string clo, int i1, int i2, int i3, int i4, int i5 )
{
	isvi(h,"i",1)
	svi(h,"c"+i,c)
	svr(h,"at"+i,at)
	svi(h,"v"+i,v)
	svb(h,"spcl"+i,spcl)
	svr(h,"lpv"+i,lpv)
	svr(h,"mpe"+i,mpe)
	svr(h,"lplvl"+i,lplvl)
	svr(h,"mpl"+i,mpl)
	svs(h,"clo"+i,clo)
	svi(h,"i1"+i,i1)
	svi(h,"i2"+i,i2)
	svi(h,"i3"+i,i3)
	svi(h,"i4"+i,i4)
	svi(h,"i5"+i,i5)  
}

pr void hl()
{
	
}

pr void uifunc()
{
	wlpi(0,7,1,if uat(enu)==tmi { suar(enu,tmi) } )
	svr(henu,stsc("regen"),uhpr(enu))
	if isut(enu,uth) 
	{ 
		svdef(enu,hagi(enu)/hdpa)
		tmi = ihi(sh(hst),"i","c",enuc)
		if tmi>0
		{
			svhp(enu,ldr(sh(hst),"c"+i2s(tmi))+hhpa)
			gau(hg,enu)
		}
		smp(enu,hint(enu))
		svr(henu,stsc("mana-c"),umm(enu))
		sul(enu,uml(enu))
		sum(enu,umm(enu))
	}
}	