#guard equipment_system
library equipmentSystem init on usg
{
	define
	{
		private ABC = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
        private abc = "abcdefghijklmnopqrstuvwxyz"
        private digits = "0123456789"
        private idummy = DUMMY
        iteqp(h,it) = equipmentSystem_equip_item(h,it)
        iteqpid(h,id,c) = equipmentSystem_equip_items_id(h,id,c)
        ituneqp(h,id,c) = equipmentSystem_unequip_item_id(h,id,c)
        itreqp(id,l,c) = equipmentSystem_reg_item_eq(id,l,c)
        //isitreqp(it) = equipmentSystem_is_equip_item_reg(it)
        //isitreqpid(id) = equipmentSystem_is_equip_item_id_reg(id)
        //isitineqp(it) = equipmentSystem_is_item_in_sys(it)
        iteqpcid(h,id) = equipmentSystem_get_equip_item_id_count(h,id)
	}
	
	//###########################################################################
	pr string chr(int i)
	{
		if i>=65 && i<=90
		{
			return SubString(ABC,i-65,i-64)
		elseif i>=97 && i<=122
			return SubString(abc,i-97,i-96)
		elseif i>=48 && i<=57
			return SubString(digits,i-48,i-47)
		}
		return null
	}
	
	pr int cpos(string sdata, string find, int from)
	{
		whilenot (SubString(sdata,from,from+1)==find || SubString(sdata,from,from+1)=="")
		{
			from++
		}
		if SubString(sdata,from,from+1)==find
		{
			return from
		}
		return -1
	}
	
	pr int int2s(string str)
	{
		int pos=cpos(ABC,str,0)+65
		if pos==64
		{
			pos=cpos(digits,str,0)+48
		}
		if pos==47
		{
			pos=cpos(abc,str,0)+97
		}
		if str==""
		{
			return 0
		else
			return pos
		}
	}
	
	pr string id2string(int itemid)
	{
		return chr(itemid/256/256/256)+chr(ModuloInteger(itemid/256/256,256))+chr(ModuloInteger(itemid/256, 256))+chr(ModuloInteger(itemid,256))
	}
	
	pr int string2id(string str)
	{
		return int2s(SubString(str,0,1))*256*256*256+int2s(SubString(str,1,2))*256*256+int2s(SubString(str,2,3))*256+int2s(SubString(str,3,4))
	}
	
	//###########################################################################
	pr string get_string_str(string str,string divisor,int n)
	{
		int i=0, num=0
		string res=""
		whilenot (i>=strl(str))
		{
			if SubString(str,i,i+1)==divisor
			{
				if num==n
				{
					return res
				else
					res=""
					i++
				}
				num++
			else
				res+=SubString(str,i,i+1)
				i++
			}
		}
		return res
	}
	
	//###########################################################################
	pr void convitem() { rmit }
	
	pb void equip_item(unit hero, item it)
	{
		int i=0
		unit u=ucr(opl(hero),idummy,ux(hero),uy(hero))
		ctr(t)	
		//
		if !(uhsp(u,'AInv')) { uaa(u,'AInv') }
		if ldi(sh(scn),"c"+i2s(itc(it)))==0 { return }
		do {
			tmit=uits(hero,i)
		} whilenot i++>5 || tmit==null
		if i>=5 { tmit=uris(hero,4) }
		trigevu(evudi)
		traa(t,convitem)
		isvi(hid(hero),scn("c"+i2s(itc(it))))
		uai(u,it)
		uai(hero,it)
		ditr(t)
		urem(u)
		if tmit!=null { uai(hero,tmit) }
		//
		hero=null
		t=null; u=null; it=null
	}
	
	pb void equip_items_id(unit hero, int id, int c)
	{
		int i=0
		unit u=ucr(opl(hero),idummy,ux(hero),uy(hero))
		item it
		ctr(t)
		//
		if !(uhsp(u,'AInv')) { uaa(u,'AInv') }
		if ldi(sh(scn),"c"+i2s(id))==0 { return }
		do {
			tmit=uits(hero,i)
		} whilenot (i++==5 || tmit==null)
		if i>=5 { tmit=uris(hero,4) }
		i=1
		trigevu(evudi)
		traa(t,convitem)
		whilenot (i>c)
		{
			it=itcr(id)
			isvi(hid(hero),scn("c"+i2s(itc(it))),1)
			uai(u,it)
			uai(hero,it)
			i++
		}
		if tmit!=null { uai(hero,tmit) }
		ditr(t)
		urem(u)
		//
		hero=null
		t=null; u=null; it=null
	}
	
	pb void unequip_item_id(unit hero, int id, int c)
	{
		int i=1, i2=0, a=ldi(sh(scn),"c"+i2s(id))
		string l=lds(sh(scn),"l"+i2s(id))
		isvi(hid(hero),scn("c"+i2s(id)),-c)
		whilenot (i>c)
		{
			i2=0
			whilenot (i2>a-1)
			{
				ura(hero,string2id(get_string_str( l,",",i2)))
				//incsaveint(hid(hero),scn("c"+i2s(id)),-1)
				i2++
			}
			i++
		}
		l=null
	}
	
	/*pb bool is_equip_item_reg(item it)
	{
		return !(ldi(shash(scn),"c"+i2s(itcode))==0&&loadstr(shash(scn),"l"+i2s(itcode))==null)
	}
	pb bool is_equip_item_id_reg(int itemid)
	{
		return !(ldi(shash(scn),"c"+i2s(itemid))==0&&loadstr(shash(scn),"l"+i2s(itemid))==null)
	}
	//pb bool is_item_in_sys(item it) { return loadbool(hid(it),scn("eqp")) }
	pb int get_equip_item_id_count(unit hero,int id) { return ldi(hid(hero),scn("c"+i2s(id))) }*/
	
	
	pb void reg_item_eq(int id,string ablist,int c)
	{
		svi(sh(scn),"c"+i2s(id),c)
		svs(sh(scn),"l"+i2s(id),ablist)
	}

	pr void init()
	{
		itreqp('ratf',"AItf,AId5",2) // Claws of Attack +15 
		itreqp('belv',"AIa6",1)
	}
}