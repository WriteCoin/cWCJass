//библиотека статов
//добавление, изменение, получение информации
//требуется мемхак!
#guard States

library States uses Utils
{
	define
	{
		svdef(u,a) =
		{
			svr(hid(u),"def",a)
			svr(hid(u),"def-c",a)
		}
		svhp(u,a) =
		{
			shp(u,a)
			svr(hid(u),"hp-c",a)
		}
		svmp(u,a) =
		{
			smp(u,a)
			svr(hid(u),"mp-c",a)
		}
	}
	
	public void add(string s,bool hv,int vl,bool hvmi,int vmil,bool hvma,int vmal,bool hpa,int pal)
	{
	}
}

scope SaveStatsFromMemHackSystem init on
{
	pr void uifunc()
	{
		wlpi(0,7,1,if uat(enu)==tmi { suar(enu,tmi) } )
		svr(henu,"hp-regen",uhpr(enu))
		if isut(enu,uth) 
		{ 
			svdef(enu,hagi(enu)/4) 
			svhp(enu,
		}
		
	
	
		if GetUnitArmorType(u)==0 { SetUnitArmor(u,0) }
        elseif GetUnitArmorType(u)==1 { SetUnitArmor(u,1) }
        elseif GetUnitArmorType(u)==2 { SetUnitArmor(u,2) }
        elseif GetUnitArmorType(u)==3 { SetUnitArmor(u,3) }
        elseif GetUnitArmorType(u)==4 { SetUnitArmor(u,4) }
        elseif GetUnitArmorType(u)==5 { SetUnitArmor(u,5) }
        elseif GetUnitArmorType(u)==6 { SetUnitArmor(u,6) }
        elseif GetUnitArmorType(u)==7 { SetUnitArmor(u,7) }
        SaveStatReal(h,"hp-regen",GetUnitHPRegen(u))
        if IsUnitType(u,UNIT_TYPE_HERO) {
            SaveStatReal(h,"def",GetHeroAgi(u,true)/4)
            SaveStatReal(h,"defc",GetHeroAgi(u,true)/4)
        }
        if IsUnitType(u,UNIT_TYPE_HERO) {
            //SaveStatReal(h,"hp-max",HeroVit[GetHeroIndex(GetUnitTypeId(u))]+HeroHPAdd)
            //SaveStatReal(h,"mp-max",GetHeroInt(u,true))
            SetUnitMaxHP(u,HeroVit[GetHeroIndex(GetUnitTypeId(u))]+HeroHPAdd)
            SetUnitMaxMP(u,GetHeroInt(u,true))
            SaveStatReal(h,"hp-c",GetUnitState(u,UNIT_STATE_MAX_LIFE))
            SaveStatReal(h,"mana-c",GetUnitState(u,UNIT_STATE_MAX_MANA))
            SetUnitState(u,UNIT_STATE_LIFE,GetUnitState(u,UNIT_STATE_MAX_LIFE))
            SetUnitState(u,UNIT_STATE_MANA,GetUnitState(u,UNIT_STATE_MAX_MANA))
        }
	}

	pr void init()
	{
		uif
	}
}