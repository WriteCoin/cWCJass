//Способности
#guard Abilities

cnst string abis = scn

define
{
	private i=i2s(ldi(sh,"i"))
	
	private a(c,o) = add(c,o)
	private e(t) = 
	{
		tmi++
		svi(sh,"et"+i2s(tmi)+i,sh(t))
	}
}

prv add(int c, string o)
{
	tmi=0
	isvi(sh,"i",1)
	svi(sh,"c"+i,c)
	svi(sh,"o"+i,oid(o))
}