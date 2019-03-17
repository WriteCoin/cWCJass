#guard TreasureClass
library treasureclass usg
{
	struct sTreasureClass
	{
		//! loaddata "data\treasureclass.slk"
		
		rd string name
		rd int picks
		rd real nodrop
		rd int item1, item2, item3, item4, item5, item6, item7, item8, item9, item10
		rd real prob1, prob2, prob3, prob4, prob5, prob6, prob7, prob8, prob9, prob10
		
		static sTreasureClass array values
		
		public static method getFromKey takes int i returns sTreasureClass
			values[i] = create()
			return values[i]
		endmethod
	}

	define
	{
		private h=sh(scn)
		private ind=ldi(h,"n")
		private n=i2s(ind)
		private nprob = ldi(h,"nprob")
		private npl = ldi(h,"npl")
		
		/*tcadd(na,p,no) = treasureclass_add(na,p,no)
		tcadd(na,p) = tcadd(na,p,0)
		tcadd(na) = tcadd(na,1)
		
		tcaddi(ni,c,p) = treasureclass_addi(ni,c,p)
		tcaddi(ni,c) = tcaddi(ni,c,0)
		tcadds(ni,c,p) = treasureclass_adds(ni,c,p)
		tcadds(ni,c) = tcadds(ni,c,0)*/
		
		tc(id,x,y) = treasureclass_TC(id,x,y)
		tc(id) = tc(id,0,0)
	}
	/*pb void add(string name, int picks, real nodrop)
	{
		isvi(h,"n",1)
		svi(h,"name"+n,sh(name))
		svr(h,"nodrop"+n,nodrop)
	}
	pb void addi(int ni,int c,real p)
	{
		svi(h,"item"+i2s(ni)+n,c)
		svb(h,"send"+i2s(ni)+n)
		svr(h,"prob"+i2s(ni)+n,p)
	}
	pb void adds(int ni,string c,real p)
	{
		svi(h,"item"+i2s(ni)+n,sh(c))
		svr(h,"prob"+i2s(ni)+n,p)
	}*/
	
	pb void TC(int tcid,real x,real y)
	{
		real nodrop = ldr(h,"nodrop"+i2s(tcid)), sumit = nodrop/npl, r
		int it, i=1, j=0, picks=ldi(h,"picks"+i2s(tcid))
		while (i<=nprob)
		{
			sumit+=ldr(h,`prob`+i2s(i)+i2s(tcid))
			i++
		}
		svr(h,`dropchance1`,(nodrop/npl)/sumit)
		i=2
		while (i<=nprob)
		{
			svr(h,`dropchance`+i2s(i),(ldr(h,`prob`+i2s(i-1)+i2s(tcid))/sumit)+ldr(h,`dropchance`+i2s(i-1)))
			i++
		}
		i=1
		while (i<=picks)
		{
			r=rr(0,1)
			j=0
			while (j<=nprob)
			{
				if r>ldr(h,`dropchance`+i2s(j)) && r<=ldr(h,`dropchance`+i2s(j+1))
				{
					it=ldi(h,`item`+i2s(j)+i2s(tcid))
					tcid = ihi(h,"n","name",it)
					if tcid == 0
					{
						tmit = itcr(it,x,y)
					else
						TC(tcid,x,y)
					}
				}
				j++
			}
			i++
		}
	}
	
	pbv udea()
	{
		TC(ihi(h,"n","name",ldi(htru,scn("tc"))),trux,truy)
	}
	
	prv tev()
	{
		int i=1, j
		//msgi(sTreasureClass.values[1])
		while (sTreasureClass.values[i] > 0)
		{
			isvi(h,"n")
			//msg(sTreasureClass.values[i].name)
			svi(h,"name"+n,sh(sTreasureClass.values[i].name))
			svr(h,"nodrop"+n,sTreasureClass.values[i].nodrop)
			svi(h,"item1"+n,sTreasureClass.values[i].item1)
			svr(h,"prob1"+n,sTreasureClass.values[i].prob1)
			svi(h,"item2"+n,sTreasureClass.values[i].item2)
			svr(h,"prob2"+n,sTreasureClass.values[i].prob2)
			svi(h,"item3"+n,sTreasureClass.values[i].item3)
			svr(h,"prob3"+n,sTreasureClass.values[i].prob3)
			svi(h,"item4"+n,sTreasureClass.values[i].item4)
			svr(h,"prob4"+n,sTreasureClass.values[i].prob4)
			svi(h,"item5"+n,sTreasureClass.values[i].item5)
			svr(h,"prob5"+n,sTreasureClass.values[i].prob5)
			svi(h,"item6"+n,sTreasureClass.values[i].item6)
			svr(h,"prob6"+n,sTreasureClass.values[i].prob6)
			svi(h,"item7"+n,sTreasureClass.values[i].item7)
			svr(h,"prob7"+n,sTreasureClass.values[i].prob8)
			svi(h,"item8"+n,sTreasureClass.values[i].item8)
			svr(h,"prob8"+n,sTreasureClass.values[i].prob9)
			svi(h,"item9"+n,sTreasureClass.values[i].item9)
			svr(h,"prob9"+n,sTreasureClass.values[i].prob10)
			svi(h,"item10"+n,sTreasureClass.values[i].item10)
			svr(h,"prob10"+n,sTreasureClass.values[i].prob10)
			i++
		}
	}
	
	pbi
	{
		tra(udea)
		tra(tev)
		svi(h,"nprob",10)
		svi(h,"npl",mpl)
	}
}