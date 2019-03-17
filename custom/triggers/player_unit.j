//события юнита

#guard player_unit

define 
{
	evplu = evpl##_UNIT
	evu = ev##_UNIT
	
	trigevau(t,ev) = TriggerRegisterAnyUnitEventBJ(t,ev)
	trigevau(ev) = trigevau(t,ev)
	trevau(t,ev) = trigevau(t,ev)
	
	trevplu(t,pl,ev) = TriggerRegisterPlayerUnitEvent(t,pl,ev)
	
	trigevu(t,u,ev) = TriggerRegisterUnitEvent(t,u,ev)
	trigevu(u,ev) = trigevu(t,u,ev)
    trigevu(ev) = trigevu(u,ev)
	trevu(t,u,ev) = trigevu(t,u,ev)
	
	traua(ev) =
	{
		gtra
		pr void init()
		{
			svtr(sh(scn),ctr)
			trevau(ldtr(sh(scn),`ctr`),ev)
		}
	}
	trplua(pl,ev) =
	{
		gtra
		pr void init()
		{
			svtr(sh(scn),ctr)
			trevplu(ldtr(sh(scn),`ctr`),pl,ev)
		}
	}
	trua(u,ev) =
	{
		gtra
		pr void init()
		{
			svtr(sh(scn),ctr)
			trevu(ldtr(sh(scn),`ctr`),u,ev)
		}
	}
}

//атакован
scope ua init on
{
	define 
	{
		evplua = evplu##_ATTACKED
		evua = evu##_ATTACKED
	}
	traua(evplua)
}

//сменил владельца
scope uch init on
{
	define 
	{
		evpluch = evplu##_CHANGE_OWNER
		evuch = evu##_CHANGE_OWNER
	}
	traua(evpluch)
}

//начинает строительство
scope ucs init on
{
	define 
	{
		evplucs = evplu##_CONSTRUCT_START
		//evucs = evu##_CONSTRUCT_START
	}
	traua(evplucs)
}

//отменяет строительство
scope ucc init on
{
	define 
	{
		evplucc = evplu##_CONSTRUCT_CANCEL
		evucc = evu##_CONSTRUCT_CANCEL
	}
	traua(evplucc)
}

//завершает строительство
scope ucf init on
{
	define 
	{
		evplucf = evplu##_CONSTRUCT_FINISH
		evucf = evu##_CONSTRUCT_FINISH
	}
	traua(evplucf)
}

//умирает
scope udea init on
{
	define 
	{
		evpludea = evplu##_DEATH
		evudea = evu##_DEATH
	}
	traua(evpludea)
}

//разлагается
scope udec init on
{
	define 
	{
		evpludec = evplu##_DECAY
		evudec = evu##_DECAY
	}
	traua(evpludec)
}

//отменяет выбор
scope udes init on
{
	define 
	{
		evpludes = evplu##_DESELECTED
		evudes = evu##_DESELECTED
	}
	traua(evpludes)
}

//обнаружен
scope udet init on
{
	define 
	{
		evpludet = evplu##_DETECTED
		evudet = evu##_DETECTED
	}
	traua(evpludet)
}

//теряет предмет
scope udi init on
{
	define 
	{
		evpludi = evplu##_DROP_ITEM
		evudi = evu##_DROP_ITEM
	}
	traua(evpludi)
}

//скрыт
scope uh init on
{
	define 
	{
		evpluh = evplu##_HIDDEN
		evuh = evu##_HIDDEN
	}
	traua(evpluh)
}

//отдал приказ (без цели)
scope uo init on
{
	define 
	{
		evpluo = evplu##_ISSUED_ORDER
		evuo = evu##_ISSUED_ORDER
	}
	traua(evpluo)
}

//отдал приказ (цель - точка)
scope upo init on
{
	define 
	{
		evplupo = evplu##_ISSUED_POINT_ORDER
		evupo = evu##_ISSUED_POINT_ORDER
	}
	traua(evplupo)
}

//отдал приказ (цель - цель)
scope uto init on
{
	define 
	{
		evpluto = evplu##_ISSUED_TARGET_ORDER
		evuto = evu##_ISSUED_TARGET_ORDER
		
		isord = GetIssuedOrderId()
		isordit = isord>852001 && isord<852008
		ordit = GetOrderTargetItem()
		ot = GetOrderTarget()
		o2slot(o) = uto_Order2ItemSlot(o)
		o2slot = o2slot(isord)
		slot2o(i) = uto_ItemSlot2Order(i)
	}
	
	traua(evpluto)
	
	pb int Order2ItemSlot(int o)
	{
		return o-852002
	}
	
	pb int ItemSlot2Order(int slot)
	{
		return slot+852002
	}
}

//отдал приказ (цель - юнит)
scope uuo init on
{
	define evpluuo = evplu##_ISSUED_UNIT_ORDER
	traua(evpluuo)
}

//погружен на транспорт
scope uld init on
{
	define 
	{
		evpluld = evplu##_LOADED
		evuld = evu##_LOADED
	}
	traua(evpluld)
}

//закладывает предмет (в лавку)
scope upa init on
{
	define 
	{
		evplupa = evplu##_PAWN_ITEM
		evupa = evu##_PAWN_ITEM
	}
	traua(evplupa)
}

//получает предмет
scope upi init on
{
	define 
	{
		evplupi = evplu##_PICKUP_ITEM
		evupi = evu##_PICKUP_ITEM
	}
	traua(evplupi)
}

//спасён
scope ur init on
{
	define 
	{
		evplur = evplu##_RESCUED
		evur = evu##_RESCUED
	}
	traua(evplur)
}

//начинает исследование
scope urs init on
{
	define 
	{
		evplurs = evplu##_RESEARCH_START
		evurs = evu##_RESEARCH_START
	}
	traua(evplurs)
}

//отменяет исследование
scope urc init on
{
	define 
	{
		evplurc = evplu##_RESEARCH_CANCEL
		evurc = evu##_RESEARCH_CANCEL
	}
	traua(evplurc)
}

//завершает исследование
scope urf init on
{
	define 
	{
		evplurf = evplu##_RESEARCH_FINISH
		evurf = evu##_RESEARCH_FINISH
	}
	traua(evplurf)
}

//выбран
scope usd init on
{
	define 
	{
		evplusd = evplu##_SELECTED
		evusd = evu##_SELECTED
	}
	traua(evplusd)
}

//продан
scope use init on
{
	define 
	{
		evpluse = evplu##_SELL
		evuse = evu##_SELL
	}
	traua(evpluse)
}

//продает предмет
scope usi init on
{
	define 
	{
		evplusi = evplu##_SELL_ITEM
		evusi = evu##_SELL_ITEM
	}
	traua(evplusi)
}

//начинает применение способности
scope spca init on
{
	define 
	{
		evplspca = evplu##_SPELL_CAST
		evspca = evu##_SPELL_CAST
	}
	traua(evplspca)
}

//начинает направлять способность
scope spch init on
{
	define 
	{
		evplspch = evplu##_SPELL_CHANNEL
		evspch = evu##_SPELL_CHANNEL
	}
	traua(evplspch)
}

//приводит способность в действие
scope spef init on
{
	define 
	{
		evplspef = evplu##_SPELL_EFFECT
		evspef = evu##_SPELL_EFFECT
	}
	traua(evplspef)
}

//прекращает применение способности
scope spen init on
{
	define 
	{
		evplspen = evplu##_SPELL_ENDCAST
		evspen = evu##_SPELL_ENDCAST
	}
	traua(evplspen)
}

//завершает применение способности
scope spfi init on
{
	define 
	{
		evplspfi = evplu##_SPELL_FINISH
		evspfi = evu##_SPELL_FINISH
	}
	traua(evplspfi)
}

//призывает юнита
scope usu init on
{
	define 
	{
		evplusu = evplu##_SUMMON
		evusu = evu##_SUMMON
	}
	traua(evplusu)
}

//начинает подготовку
scope uts init on
{
	define 
	{
		evpluts = evplu##_TRAIN_START
		evuts = evu##_TRAIN_START
	}
	traua(evpluts)
}

//отменяет подготовку
scope utc init on
{
	define 
	{
		evplutc = evplu##_TRAIN_CANCEL
		evutc = evu##_TRAIN_CANCEL
	}
	traua(evplutc)
}

//завершает подготовку
scope utf init on
{
	define 
	{
		evplutf = evplu##_TRAIN_FINISH
		evutf = evu##_TRAIN_FINISH
	}
	traua(evplutf)
}

//начинает улучшение
scope uus init on
{
	define 
	{
		evpluus = evplu##_UPGRADE_START
		evuus = evu##_UPGRADE_START
	}
	traua(evpluus)
}

//отменяет улучшение
scope uuc init on
{
	define 
	{
		evpluuc = evplu##_UPGRADE_CANCEL
		evuuc = evu##_UPGRADE_CANCEL
	}
	traua(evpluuc)
}

//завершает улучшение
scope uuf init on
{
	define 
	{
		evpluuf = evplu##_UPGRADE_FINISH
		evuuf = evu##_UPGRADE_FINISH
	}
	traua(evpluuf)
}

//использует предмет
scope uui init on
{
	define 
	{
		evpluui = evplu##_USE_ITEM
		evuui = evu##_USE_ITEM
	}
	traua(evpluui)
}