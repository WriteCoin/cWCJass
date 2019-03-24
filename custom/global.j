#guard global
library global
{    
    pb hashtable hash = InitHashtable()
	pb bool TempBool, TempBool1, TempBool2, TempBool3, TempBool4, TempBoolA[]
    pb real X, Y, X1, Y1, X2, Y2, X3, Y3, X4, Y4, XA[], YA[]
	pb real TempReal, TempReal1, TempReal2, TempReal3, TempReal4, TempRealA[]
    pb int TempInt, TempInt1, TempInt2, TempInt3, TempInt4, TempIntA[]
    pb string TempString, TempString1, TempString2, TempString3, TempString4, TempStringA[]
    pb widget TempWidg, TempWidg1, TempWidg2, TempWidgA[]
    pb unit TempUnit, TempUnit1, TempUnit2, TempUnitA[]
	pb group TempGroup=cg, TempGroup1=cg, TempGroup2=cg, TempGroupA[]
    pb item TempItem, TempItem1, TempItem2, TempItemA[]
    pb texttag TempTextTag=CreateTextTag(), TempTextTag1=CreateTextTag(), TempTextTag2=CreateTextTag(), TempTextTagA[]
    pb location TempLoc, TempLoc1, TempLoc2, TempLocA[]
    pb player TempPlayer, TempPlayer1, TempPlayer2, TempPlayerA[]
    pb force TempForce=CreateForce()
    pb timer TempTimer=CreateTimer(), TempTimer1=CreateTimer(), TempTimer2=CreateTimer(), TempTimerA[]
    pb rect TempRect, TempRect1, TempRect2, TempRectA[]
	pb region TempRegion=CreateRegion()
    pb trigger TempTrig, TempTrig1, TempTrig2, TempTrigA[]
    pb sound TempSound, TempSound1, TempSound2, TempSoundA[]
	pb camerasetup TempCameraSetup=CreateCameraSetup(), TempCameraSetup1=CreateCameraSetup(), TempCameraSetup2=CreateCameraSetup(), TempCameraSetupA[]
	pb destructable TempDest, TempDest1, TempDest2, TempDestA[]
    
    define
    {
		//in = include
		in = init()
		vo = void
    	pr = private
		prv = pr vo
		prv(a) = pr vo a
		prv(a,c) = pr vo a { c }
		pri = prv in
		prs = pr string
    	pb = public
		pbv = pb vo
		pbv(a) = pb vo a
		pbv(a,c) = pb vo a { c }
		pbs = pb string
		pbd = pb destructable
		pbi = pbv in
		rd = readonly
		cnst = constant
    	<init on> = initializer init
		ion = init on
    	usg = uses global
    	scn = SCOPE_PREFIX
    	scn(s) = SCOPE_PREFIX+s
		
		exf(s) = ExecuteFunc(s)
		
		udg(v) = udg_##v
		ggu(u) = gg_unit_##u
		ggt(t) = gg_trg_##t
		ggr(r) = gg_rct_##r
		ggd(d) = gg_dest_##d
		ggc(c) = gg_cam_##c
		ggs(s) = gg_snd_##s
		trs(i) = "TRIGSTR_"+i2s(i)
		
		wlpi(i,j,a,c) =
		{
			tmi = i
			loop
			{
				if i < j
				{
					exitwhen (tmi > j)
				elseif i > j
					exitwhen (tmi < j)
				else
					break
				}
				c
				if i < j
				{
					tmi += a
				elseif i > j
					tmi -= a
				}
			}
		}
		wlpi(i,j,c) = wlpi(i,j,1,c)
		wlpi(j,c) = wlpi(1,j,c)
		
		isi(i) = (i == int) || (i == integer)
		isr(i) = (i == real) || (i == float)
		isb(b) = (b == bool) || (b == boolean)
		iss(s) = (s == string)
    
        //string
        tms = global_TempString
        tms1 = tms##1
        tms2 = tms##2
        tms3 = tms##3
        tms4 = tms##4
        tms(i) = tms##A[i]

		msgt(pl,x,y,t,s) = DisplayTimedTextToPlayer(pl,x,y,t,s)
		msgt(pl,t,s) = msgt(pl,0,0,t,s)
		msgt(t,s) = msgt(locpl,t,s)
		msgtf(s,f,x,y,t) = if isplf(f) { msgt(locpl,x,y,t,s) }
		msgtf(s,f,t) = msgtf(s,f,0,0,t)
		msg(s,pl,x,y) = DisplayTextToPlayer(pl,x,y,s)
		msg(s,pl) = msg(s,pl,0,0)
		msg(s) = msg(s,locpl)
		msgf(s,f,x,y) = if isplf(f) { msg(s,locpl,x,y) }
		msgf(s,f) = msgf(s,f,0,0)
		dmsg(s) = BJDebugMsg(s)
        msgi(i) = dmsg(i2s(i))
        msgir(i) = dmsg(r2s(i2r(i)))
        msgr(r) = dmsg(r2s(r))
        msgri(r) = dmsg(i2s(r2i(r)))
        msgb(b) = dmsg(b2s(b))
        imp = "war3mapImported\\"
        strl(s) = StringLength(s)
        subs(s,st,e) = SubString(s,st,e)
		subs(s,st) = subs(s,st,strl(s))
		chs=GetEventPlayerChatString()
		subs(st) = subs(chs,st)
        clmsg = ClearTextMessages()
		
		oname(i) = GetObjectName(i)
        
        //hashtable
        
        sh(s)=StringHash(s)
		sh = sh(scn)
		
		
		svb(h,s,v) = SaveBoolean(global_hash,h,sh(s),v)
		svb(h,v) = svb(h,`v`,v)
		ldb(h,s) = LoadBoolean(global_hash,h,sh(s))
		hsvb(h,s) = HaveSavedBoolean(global_hash,h,sh(s))
		rsvb(h,s)=RemoveSavedBoolean(global_hash,h,sh(s))
        
		svi(h,s,v) = SaveInteger(global_hash,h,sh(s),v)
		svi(h,v) = svi(h,`v`,v)
		ldi(h,s) = LoadInteger(global_hash,h,sh(s))
		isvi(h,s,v) = svi(h,s,ldi(h,s)+v)
		isvi(h,s) = isvi(h,s,1)
		hsvi(h,s) = HaveSavedInteger(global_hash,h,sh(s))
		rsvi(h,s)=RemoveSavedInteger(global_hash,h,sh(s))
		
		svr(h,s,v) = SaveReal(global_hash,h,sh(s),v)
		svr(h,v) = svr(h,`v`,v)
		ldr(h,s) = LoadReal(global_hash,h,sh(s))
		isvr(h,s,v) = svr(h,s,ldr(h,s)+v)
		isvr(h,s) = isvr(h,s,1)
		hsvr(h,s) = HaveSavedReal(global_hash,h,sh(s))
		rsvr(h,s)=RemoveSavedReal(global_hash,h,sh(s))
        
		svu(h,s,v) = SaveUnitHandle(global_hash,h,sh(s),v)
		svu(h,v) = svu(h,`v`,v)
		ldu(h,s) = LoadUnitHandle(global_hash,h,sh(s))
		
		svs(h,s,v) = SaveStr(global_hash,h,sh(s),v)
		svs(h,v) = svs(h,`v`,v)
		lds(h,s) = LoadStr(global_hash,h,sh(s))
		prsvs(h,s,v) = svs(h,s,v+lds(h,s))
		posvs(h,s,v) = svs(h,s,lds(h,s)+v)
		hsvs(h,s) = HaveSavedString(global_hash,h,sh(s))
		rsvs(h,s)=RemoveSavedString(global_hash,h,sh(s))
		
		sve(h,s,v) = SaveEffectHandle(global_hash,h,sh(s),v)
		sve(h,v) = sve(h,`v`,v)
		lde(h,s) = LoadEffectHandle(global_hash,h,sh(s))
		
		svg(h,s,v) = SaveGroupHandle(global_hash,h,sh(s),v)
		svg(h,v) = svg(h,`v`,v)
		ldg(h,s) = LoadGroupHandle(global_hash,h,sh(s))
		
		svrc(h,s,v) = SaveRectHandle(global_hash,h,sh(s),v)
		svrc(h,v) = svrc(h,`v`,v)
		ldrc(h,s) = LoadRectHandle(global_hash,h,sh(s))
		
		svre(h,s,v) = SaveRegionHandle(global_hash,h,sh(s),v)
		svre(h,v) = svre(h,`v`,v)
		ldre(h,s) = LoadRegionHandle(global_hash,h,sh(s))
		
		svbe(h,s,v) = SaveBooleanExprHandle(global_hash,h,sh(s),v)
		svbe(h,v) = svbe(h,`v`,v)
		ldbe(h,s) = LoadBooleanExprHandle(global_hash,h,sh(s))
		
		svt(h,s,v) = SaveTimerHandle(global_hash,h,sh(s),v)
		svt(h,v) = svt(h,`v`,v)
		ldt(h,s) = LoadTimerHandle(global_hash,h,sh(s))
		
		svp(h,s,v) = SavePlayerHandle(global_hash,h,sh(s),v)
		svp(h,v) = svp(h,`v`,v)
		ldp(h,s) = LoadPlayerHandle(global_hash,h,sh(s))
		
		svf(h,s,v) = SaveForceHandle(global_hash,h,sh(s),v)
		svf(h,v) = svf(h,`v`,v)
		ldf(h,s) = LoadForceHandle(global_hash,h,sh(s))
        
		svl(h,s,v) = SaveLightningHandle(global_hash,h,sh(s),v)
		svl(h,v) = svl(h,`v`,v)
		ldl(h,s) = LoadLightningHandle(global_hash,h,sh(s))
		
		svw(h,s,v) = SaveWidgetHandle(global_hash,h,sh(s),v)
		svw(h,v) = svw(h,`v`,v)
		ldw(h,s) = LoadWidgetHandle(global_hash,h,sh(s))
		
		svsd(h,s,v) = SaveSoundHandle(global_hash,h,sh(s),v)
		svsd(h,v) = svsd(h,`v`,v)
		ldsd(h,s) = LoadSoundHandle(global_hash,h,sh(s))
		
		svtt(h,s,v) = SaveTextTagHandle(global_hash,h,sh(s),v)
		svtt(h,v) = svtt(h,`v`,v)
		ldtt(h,s) = LoadTextTagHandle(global_hash,h,sh(s))
		
		svit(h,s,v) = SaveItemHandle(global_hash,h,sh(s),v)
		svit(h,v) = svit(h,`v`,v)
		ldit(h,s) = LoadItemHandle(global_hash,h,sh(s))
		
		svtr(h,s,v) = SaveTriggerHandle(global_hash,h,sh(s),v)
		svtr(h,v) = svtr(h,`v`,v)
		ldtr(h,s) = LoadTriggerHandle(global_hash,h,sh(s))
		
		svta(h,s,v) = SaveTriggerActionHandle(global_hash,h,sh(s),v)
		svta(h,v) = svta(h,`v`,v)
		ldta(h,s) = LoadTriggerActionHandle(global_hash,h,sh(s))
        
        sva(h,s,v) = SaveAgentHandle(global_hash,h,sh(s),v)
		sva(h,v) = sva(h,`v`,v)
		
		sv(t,h,s,v) =
		{
			#if (t == int || t == integer)
				svi(h,s,v)
			#elseif (t == real || t == float)
				svr(h,s,v)
			#elseif (t == bool || t == boolean)
				svb(h,s,v)
			#elseif (t == unit)
				svu(h,s,v)
			#elseif (t == string)
				svs(h,s,v)
			#elseif (t == effect)
				sve(h,s,v)
			#elseif (t == group)
				svg(h,s,v)
			#elseif (t == rect)
				svrc(h,s,v)
			#elseif (t == region)
				svre(h,s,v)
			#elseif (t == boolexpr)
				svbe(h,s,v)
			#elseif (t == timer)
				svt(h,s,v)
			#elseif (t == player)
				svp(h,s,v)
			#elseif (t == force)
				svf(h,s,v)
			#elseif (t == lightning)
				svl(h,s,v)
			#elseif (t == widget)
				svw(h,s,v)
			#elseif (t == sound)
				svsd(h,s,v)
			#elseif (t == texttag)
				svtt(h,s,v)
			#elseif (t == item)
				svit(h,s,v)
			#endif
		}
		sv(t,h,v) = sv(t,h,`v`,v)
		ld(t,h,s) =
		{
			#if isi(t)
				ldi(h,s)
			#elseif isr(t)
				ldr(h,s)
			#elseif isb(t)
				ldb(h,s)
			#elseif (t == unit)
				ldu(h,s)
			#elseif iss(t)
				lds(h,s)
			#elseif (t == effect)
				lde(h,s)
			#elseif (t == group)
				ldg(h,s)
			#elseif (t == rect)
				ldrc(h,s)
			#elseif (t == region)
				ldre(h,s)
			#elseif (t == boolexpr)
				ldbe(h,s)
			#elseif (t == timer)
				ldt(h,s)
			#elseif (t == player)
				ldp(h,s)
			#elseif (t == force)
				ldf(h,s)
			#elseif (t == lightning)
				ldl(h,s)
			#elseif (t == widget)
				ldw(h,s)
			#elseif (t == sound)
				ldsd(h,s)
			#elseif (t == texttag)
				ldtt(h,s)
			#elseif (t == item)
				ldit(h,s)
			#elseif (t == trigger)
				ldtr(h,s)
			#elseif (t == triggeraction)
				ldta(h,s)
			#endif
		}
		isv(t,h,s,v) = sv(t,h,s,ldx(t,h,s)+v)
		isv(t,h,v) = isv(t,h,`v`,v)
		
		vt2t(t) =
		{
			#if (t == int || t == integer)
				i
			#elseif (t == real || t == float)
				r
			#elseif (t == bool || t == boolean)
				b
			#elseif (t == unit)
				u
			#elseif (t == string)
				s
			#elseif (t == effect)
				e
			#elseif (t == group)
				g
			#elseif (t == rect)
				rc
			#elseif (t == region)
				re
			#elseif (t == boolexpr)
				be
			#elseif (t == timer)
				t
			#elseif (t == player)
				p
			#elseif (t == force)
				f
			#elseif (t == lightning)
				l
			#elseif (t == widget)
				w
			#elseif (t == sound)
				sd
			#elseif (t == texttag)
				tt
			#elseif (t == item)
				it
			#elseif (t == trigger)
				tr
			#elseif (t == triggeraction)
				ta
			#endif
		}
		t2vt(vt) =
		{
			#if (vt == i)
				int
			#elseif (vt == r)
				real
			#elseif (vt == b)
				bool
			#elseif (vt == u)
				unit
			#elseif (vt == s)
				string
			#elseif (vt == e)
				effect
			#elseif (vt == g)
				group
			#elseif (vt == rc)
				rect
			#elseif (vt == re)
				region
			#elseif (vt == be)
				boolexpr
			#elseif (vt == t)
				timer
			#elseif (vt == p)
				player
			#elseif (vt == f)
				force
			#elseif (vt == l)
				lightning
			#elseif (vt == w)
				widget
			#elseif (vt == sd)
				sound
			#elseif (vt == tt)
				texttag
			#elseif (vt == it)
				item
			#elseif (vt = tr)
				trigger
			#elseif (vt = ta)
				triggeraction
			#endif
		}
        
        hid(h) = GetHandleId(h)
		hsvh(h,s) = HaveSavedHandle(global_hash,h,sh(s))
        rsvh(h,s) = RemoveSavedHandle(global_hash,h,sh(s))
        flch(h) = FlushChildHashtable(global_hash,h)
        
        //widget
        tmwt=global_TempWidg
		tmwt1=tmwt##1
		tmwt2=tmwt##2
		tmwt(i)=tmwt##A[i]
        
		trw = GetTriggerWidget()
		wx(w) = GetWidgetX(w)
		wy(w) = GetWidgetY(w)
        hp(w) = GetWidgetLife(w)
		
		shp(w,v) = SetWidgetLife(w,v)
		ahp(w,v) = shp(w,hp(w)+v)
        
        //unit
		tmu=global_TempUnit
		tmu1=global_TempUnit1
		tmu2=global_TempUnit2
		tmu(i)=global_TempUnitA[i]
		
        /* tmpu=global_TempUnit
        tmpu1=tmpu##1
        tmpu2=tmpu##2
        tmpu(i)=tmpu##A[i] */
		
        lstu = bj_lastCreatedUnit

        tru = GetTriggerUnit()
        htru = hid(tru)
        enu = GetEnumUnit()
        henu = hid(enu)
        ufi = GetFilterUnit()
		hufi = hid(ufi)
		dm=GetEventDamageSource()
		dmc = uc(dm)
        dmx = ux(dm)
        dmy = uy(dm)
		dmh = hid(dm)
		hdm = dmh
		atu=GetAttacker()
		hatu=hid(atu)
		kiu=GetKillingUnit()
		hkiu=hid(kiu)
        
        htmu = hid(tmu)
        
        ucr(p,id,x,y,f) = CreateUnit(p,id,x,y,f)
        ucr(p,id,x,y) = ucr(p,id,x,y,270)
        ucr(p,id) = ucr(p,id,0,0)
        ucr(id) = ucr(pl(0),id)
		sup(u,x,y) = SetUnitPosition(u,x,y)
		sup(u1,u2) = sup(u1,ux(u2),uy(u2))
		supa(u,b) = 
		{
			SetUnitPathing(u,b)
			svb(hid(u),"path")
		}
		sufa(u,f,t) = SetUnitFacingTimed(u,f,t)
		sufa(u,f) = SetUnitFacing(u,f)
		sufap(u,x,y,t) = sufa(u,angcoo(ux(u),uy(u),x,y),t)
		sufap(u,x,y) = sufa(u,angcoo(ux(u),uy(u),x,y))
		sufau(u,u1,t) = sufa(u,angu(u,u1),t)
		sufau(u,u1) = sufa(u,angu(u,u1))
        uipo(u,o,x,y) = IssuePointOrder(u,o,x,y)
		uio(u,o) = IssueImmediateOrder(u,o)
		uito(u,o,w) = IssueTargetOrder(u,o,w)
		uitoi(u,o,w) = IssueTargetOrderById(u,o,w)
		sufl(u,h,r) = SetUnitFlyHeight(u,h,r)
		sufl(u,h) = sufl(u,h,0)
		sux(u,x) = SetUnitX(u,x)
		suy(u,y) = SetUnitY(u,y)
		urem(u) = RemoveUnit(u)
        ukill(u) = KillUnit(u)
		sua(u,s) = 
		{
			SetUnitAnimation(u,s)
			svs(hid(u),"curanim",s)
		}
		sua(u) = sua(u,"stand")
		suai(u,i) = 
		{
			SetUnitAnimationByIndex(u,i)
			svi(hid(u),"curanimid",i)
		}
		sud(u,i) = SetUnitUserData(u,i)
        psu(u,b) = PauseUnit(u,b)
		uai(u,it) = UnitAddItem(u,it)
		uri(u,it) = UnitRemoveItem(u,it)
		udis(u,it,sl) = UnitDropItemSlot(u,it,sl)
		uris(u,sl) = UnitRemoveItemFromSlot(u,sl)
		sue(u,b) =
		{
			SetUnitExploded(u,b)
			svb(hid(u),"exp",b)
		}
		sue(u) = sue(u,!ldb(hid(u),"exploded"))
		sui(u,b) =
		{
			SetUnitInvulnerable(u,b)
			svb(hid(u),"invul",b)
		}
		sui(u) = sui(u,!ldb(hid(u),"invul"))
		sut(u,r) = 
		{
			SetUnitTimeScale(u,r)
			isvr(hid(u),"timescale",r-ldr(hid(u),"timescale"))
		}
		sut(u) = sut(u,1)
		suc(u,r,g,b,t) = global_SetUColor(u,r,g,b,t)
		/* {
			SetUnitVertexColorBJ(u,r,g,b,t)
			if r<0 { r=0 } elseif r>255 { r=255 }
			svr(hid(u),"cr",r)
			if g<0 { g=0 } elseif g>255 { g=255 }
			svr(hid(u),"cg",g)
			if b<0 { b=0 } elseif b>255 { b=255 }
			svr(hid(u),"cb",b)
			if t<0 { t=0 } elseif t>100 { t=100 }
			svr(hid(u),"tr",t)
		} */
		suc(u,r,g,b) = suc(u,r,g,b,ldr(hid(u),"tr"))
		suc(u,r,t) = suc(u,r,r,r,t)
		suc(u,r) = suc(u,r)
		sucr(u,r,t) = suc(u,r,ldr(hid(u),"cg"),ldr(hid(u),"cb"),t)
		sucr(u,r) = sucr(u,r,ldr(hid(u),"tr"))
		sucg(u,g,t) = suc(u,ldr(hid(u),"cr"),g,ldr(hid(u),"cb"),t)
		sucg(u,g) = sucg(u,g,ldr(hid(u),"tr"))
		sucb(u,b,t) = suc(u,ldr(hid(u),"cr"),ldr(hid(u),"cg"),b,t)
		sucb(u,b) = sucb(u,b,ldr(hid(u),"tr"))
		sutr(u,t) = suc(u,ldr(hid(u),"cr"),ldr(hid(u),"cg"),ldr(hid(u),"cb"),t)
		sust(u,ust,v) = SetUnitState(u,ust,v)
		sul(u,v) = sust(u,ustl,v)
		aul(u,v) = sul(u,hp(u)+v)
		sum(u,v) = sust(u,ustm,v)
		aum(u,v) = sum(u,mp(u)+v)
		usc(u,a,b,c) = 
		{
			SetUnitScale(u,a,b,c)
			svr(hid(u),"scaleX",a)
			svr(hid(u),"scaleY",b)
			svr(hid(u),"scaleZ",c)
		}
		usc(u,sc) = usc(u,sc,sc,sc)
		uaa(u,ab) = UnitAddAbility(u,ab)
		sua(u,ab,l) = SetUnitAbilityLevel(u,ab,l)
		isua(u,ab,i) = sua(u,ab,ual(u,ab)+i)
		ura(u,ab) = UnitRemoveAbility(u,ab)
		uat(u,b,d) = UnitApplyTimedLife(u,b,d)
		uat(u,d) = uat(u,'BTLF',d)
		sums(u,r) = SetUnitMoveSpeed(u,r)
		
		un(u) = GetUnitName(u)
        ux(u) = GetUnitX(u)
		trux = ux(tru)
		enux = ux(enu)
		ufix = ux(ufi)
        uy(u) = GetUnitY(u)
		truy = uy(tru)
		enuy = uy(enu)
		ufiy = uy(ufi)
        uc(u) = GetUnitTypeId(u)
		truc = uc(tru)
		enuc = uc(enu)
		ufic = uc(ufi)
		uf(u) = GetUnitFacing(u)
        ucuo(u) = GetUnitCurrentOrder(u)
		ioid = GetIssuedOrderId()
		oi2s(i)=OrderId2String(i)
        opl(u) = GetOwningPlayer(u)
		isua(u) = hp(u)>=0.405
		isua(u,p) = IsUnitAlly(u,p)
        ustp(u,st,stmax) = GetUnitStatePercent(u,st,stmax)
		ust(u,ust) = GetUnitState(u,ust)
        uml(u) = ust(u,ustml)
        umm(u) = ust(u,ustmm)
		mp(u) = ust(u,ustm)
        isue(u,p) = IsUnitEnemy(u,p)
        isut(u,ut) = IsUnitType(u,ut)
		uflh(u) = GetUnitFlyHeight(u)
		isuing(u,g) = IsUnitInGroup(u,g)
        ud(u) = GetUnitUserData(u)
        ums(u) = GetUnitMoveSpeed(u)
        udms(u) = GetUnitDefaultMoveSpeed(u)
        uloc(u) = GetUnitLoc(u)
		ul(u) = GetUnitLevel(u)
		uits(u,i) = UnitItemInSlot(u,i)
		ual(u,a) = GetUnitAbilityLevel(u,a)
		
		//unittype
		uth = UNIT_TYPE_HERO
		utd = UNIT_TYPE_DEAD
		utmi = UNIT_TYPE_MAGIC_IMMUNE
		
		//unitstate
		ustl = UNIT_STATE_LIFE
		ustm = UNIT_STATE_MANA
		ustml = UNIT_STATE_MAX_LIFE
		ustmm = UNIT_STATE_MAX_MANA
        
        //hero
        hrn(u) = GetHeroProperName(u)
		hrl(u) = GetHeroLevel(u)
		hstr(u,b) = GetHeroStr(u,b)
		hstr(u) = hstr(u,true)
		hagi(u,b) = GetHeroAgi(u,b)
		hagi(u) = hagi(u,true)
		hint(u,b) = GetHeroInt(u,b)
		hint(u) = hint(u,true)
		hxp(u) = GetHeroXP(u)
		
		hrr(u,x,y,b) = ReviveHero(u,x,y,b)
		hrr(u,x,y) = hrr(u,x,y,false)
		shstr(u,i,b) = SetHeroStr(u,i,b)
		ihstr(u,i,b1,b) = shstr(u,hstr(u,b1)+i,b)
		shagi(u,i,b) = SetHeroAgi(u,i,b)
		ihagi(u,i,b1,b) = shagi(u,hagi(u,b1)+i,b)
		shint(u,i,b) = SetHeroInt(u,i,b)
		ihint(u,i,b1,b) = shint(u,hint(u,b1)+i,b)
		sxp(u,v,b) = SetHeroXP(u,v,b)
		axp(u,v,b) = AddHeroXP(u,v,b)
		shl(u,v,b) = SetHeroLevel(u,v,b)
		ahl(u,v,b) = shl(u,hrl(u)+v,b)
        
        //group
		tmg = global_TempGroup
		tmg1 = tmg##1
		tmg2 = tmg##2
		tmg(i) = 
		{
			#if tmg(i) == null
				tmg(i) = cg
			#endif
			tmg##A[i]
		}
		
        lstg = bj_lastCreatedGroup
        
		cg = CreateGroup()
		dg(g) = DestroyGroup(g)
		gcl(g) = GroupClear(g)
		gau(g,u) = GroupAddUnit(g,u)
		gag(g1,g2) = GroupAddGroup(g1,g2)
		gru(g,u) = GroupRemoveUnit(g,u)
        gremg(g1,g2) = GroupRemoveGroup(g1,g2)
		grg(g1,g2) = gremg(g1,g2)
		fg(g,c) = ForGroup(g,function c)
		fg(g) = ForGroup(g,function gf)
		rg(g) = GroupPickRandomUnit(g)
		gio(g,o) = GroupImmediateOrder(g,o)
		gc(g) = CountUnitsInGroup(g)
		fig(g) = FirstOfGroup(g)
        
        //item
        tmit=global_TempItem
        tmit1=tmit##1
        tmit2=tmit##2
        tmit(i)=tmit##A[i]
        
		lstit=bj_lastCreatedItem
		
        mit = GetManipulatedItem()
        hmit = hid(mit)
		fit = GetFilterItem()
		hfit = hid(fit)
		
		itx(it) = GetItemX(it)
		ity(it) = GetItemY(it)
		itc(it) = GetItemTypeId(it)
        itch(it) = GetItemCharges(it)
        itn(it) = GetItemName(it)

		itcr(id,x,y) = CreateItem(id,x,y)
		itcr(id) = itcr(id,0,0)
		rit(it) = RemoveItem(it)
		rmit = rit(mit)
		sitc(it,i) = SetItemCharges(it,i)
		sitv(it,b) =
        {
        	svb(hid(it),"vis",b)
        	SetItemVisible(it,b)
        }
        sitv(it) = sitv(it,!ldb(hid(it),"vis"))
		sitps(it,x,y) = SetItemPosition(it,x,y)
		
		enitr(r,b,c) = EnumItemsInRect(r,function b,function c)
		enitr(r,c) = EnumItemsInRect(r,null,function c)
		enitr(r) = enitr(r,itf)
		enitr = enitr(mapr)
		
		//destructable
		tmd = global_TempDest
		tmd1 = global_TempDest1
		tmd2 = global_TempDest2
		tmd(i) = global_TempDestA[i]
		
		fd = GetFilterDestructable()
		ed = GetEnumDestructable()
		
		dn(d) = GetDestructableName(d)
		
		dcr(i,x,y,f,s,v) = CreateDestructable(i,x,y,f,s,v)
		dcr(i,x,y,f,s) = dcr(i,x,y,f,s,-1)
		dcr(i,x,y,f) = dcr(i,x,y,f,1)
		dcr(i,x,y) = dcr(i,x,y,rf)
		dcr(i) = dcr(i,0,0)
		endr(r,b,c) = EnumDestructablesInRect(r,function b,function c)
		endr(r,c) = EnumDestructablesInRect(r,null,function c)
		endr(r) = endr(r,drf)
		endr = endr(mapr)
        
        //texttag
        tmtt=global_TempTextTag
        tmtt1=tmtt##1
        tmtt2=tmptt##2
        tmtt(i)=tmtt##A[i]
		
		
        lstt=bj_lastCreatedTextTag
        
        ctt = CreateTextTag()
		dtt(t) = DestroyTextTag(t)
		
        ttc(t,r,g,b,a) = SetTextTagColor(t,r,g,b,a)
        ttc(t,r,g,b) = ttcolor(t,r,g,b,255)
        ttc(t,r,g) = ttcolor(t,r,g,255,255)
        ttc(t,r) = ttcolor(t,r,255,255,255)
        ttl(t,life) = SetTextTagLifespan(t,life)
        ttf(t,fade) = SetTextTagFadepoint(t,fade)
        ttp(t,x,y,h) = SetTextTagPos(t,x,y,h)
        ttp(t,x,y) = ttp(t,x,y,0)
		ttpu(t,u,h) = SetTextTagPosUnit(t,u,h)
		ttpu(t,u) = ttpu(t,u,0)
        ttt(t,s,h) = SetTextTagText(t,s,h) 
        ttt(t,s) = ttt(t,s,0.023)
        ttvl(t,x,y) = SetTextTagVelocity(t,x,y)
        ttvl(t,x) = ttvl(t,x,0)
        ttvs(t,b) = 
		{
			SetTextTagVisibility(t,b)
			svb(hid(t),"vis",b)
		}
		ttvs(t) = ttvs(t,!ldb(hid(t),"vis"))
        tts(t) = ttvs(t,true)
        tth(t) = ttvs(t,false)
        ttpt(t,b) = 
		{
			SetTextTagPermanent(t,b)
			svb(hid(t),"pt",b)
		}
        ttpt(t) = ttpt(t,!ldb(hid(t),"pt"))
        ttnpt(t) = ttpt(t,false)
		
        
        //location
        tmlc=global_TempLoc
        tmlc1=tmlc##1
        tmlc2=tmlc##2
        tmlc(i)=tmlc##A[i]
        
        lcz(l) = GetLocationZ(l)
        
        //effect
        sefa(m,x,y) = AddSpecialEffect(m,x,y)
        sefta(m,t,a) = AddSpecialEffectTarget(m,t,a)
        def(e) = DestroyEffect(e)
        
        //player
		pl = PLAYER
		
		tmpl = global_TempPlayer
		tmpl1 = tmpl##1
		tmpl2 = tmpl##2
		tmpl(i)=tmpl##A[i]
        
        dfpl = pl(15)
        
        pl(i) = Player(i)
		locpl = GetLocalPlayer()
        trpl=GetTriggerPlayer()
        htrpl=hid(trpl)
        pln(p)=GetPlayerName(p)
        trpln=pln(trpl)
		plnpi = PLAYER_NEUTRAL_PASSIVE
		plnai = PLAYER_NEUTRAL_AGGRESSIVE
		plnp = pl(plnpi)
		plna = pl(plnai)
        
        //force
        tmf = global_TempForce

		apl = bj_FORCE_ALL_PLAYERS
        
        isplf(p,f) = IsPlayerInForce(p,f)
        isplf(f) = isplf(locpl,f)
        fapl(f,p) = ForceAddPlayer(f,p)
        cf = CreateForce()
        fcl(f) = ForceClear(f)
        df(f) = DestroyForce(f)
		plab(pl,ab,b) = 
		{
			SetPlayerAbilityAvailable(pl,ab,b)
			svb(hid(pl),"abisav"+i2s(ab),b)
		}
		plab(ab,b) = plab(locpl,ab,b)
		plab(ab) = plab(ab,false)
        
        //timer
		tmt = global_TempTimer
		tmt1 = tmt##1
		tmt2 = tmt##2
		tmt(i) = 
		{
			#if tmt(i) == null
				tmt(i) = ct
			#endif
		}
        
        ct = CreateTimer()
		et = GetExpiredTimer()
		tgr(t) = TimerGetRemaining(t)
		tgt(t) = TimerGetTimeout(t)
		tge(t) = TimerGetElapsed(t)
        tet = tgt(et)
		het = hid(et)
		ts(t,ti,p,f) = TimerStart(t,ti,p,function f)
		ts(t,ti,f) = ts(t,ti,false,f)
		ts(t,f) = ts(t,0,f)
		pts(t,ti,f) = ts(t,ti,true,f)
		pts(t,f) = pts(t,0.01,f)
		dt(t) = DestroyTimer(t)
        pt(t)=PauseTimer(t)
        
        //Преобразования типов       
		i2s(i) = I2S(i)
        s2i(s) = S2I(s)
        r2s(r) = R2S(r)
        s2r(s) = S2R(s)
        i2r(i) = I2R(i)
		r2i(r) = R2I(r)
        
        //region
		tmre = global_TempRegion
		
		cre=CreateRegion()
		rearc(re,rc) = RegionAddRect(re,rc)
        
        //rect
		tmrc = global_TempRect
		tmrc1 = tmrc##1
		tmrc2 = tmrc##2
		tmrc(i) = tmrc##A[i]
        
        mapr = bj_mapInitialPlayableArea
		rcmix(r) = GetRectMinX(r)
		rcmax(r) = GetRectMaxX(r)
		rcmiy(r) = GetRectMinY(r)
		rcmay(r) = GetRectMaxY(r)
		rccx(r) = GetRectCenterX(r)
		rccy(r) = GetRectCenterY(r)
        
        //event
        ev = EVENT
        
        //trigger
		tmtr = global_TempTrig
		tmtr1=tmtr##1
		tmtr2=tmtr##2
		tmtr(i)=tmtr##A[i]
		
		tr = Trigger
		trev = tr##Register
        
		trtr = GetTriggeringTrigger()
		htrtr = hid(trtr)
		ctr = CreateTrigger()
		ctr(t) = trigger t = CreateTrigger()
		dtr(t) = DestroyTrigger(t)
		etr(t) = EnableTrigger(t)
		ditr(t) = DisableTrigger(t)
		trac(t,c) = TriggerAddCondition(t,function c)
		traa(t,a) = TriggerAddAction(t,function a)


		gtra = pb trigger get() { return ldtr(sh(scn),`ctr`) }
		gtr(sc) = sc##_get()
		gtr = get()
		/* t2d(t) =
		{
			#if t == int || t == integer || t == real || t == float
				0
			#elseif t == bool || t == boolean
				false
			#else
				null
			#endif
		} */
		trae(ev) =
		{
			pb trigger get() { return ldtr(sh(scn),`ctr`) }
			pb void init()
			{
				svtr(sh(scn),ctr)
				ev
			}
		}
		tra(sc,f) = traa(ldtr(sh(`sc`+"_"),`ctr`),f)
		tra(sc) = tra(sc,sc)
        
        //int
		tmi = global_TempInt
		tmi1=global_TempInt1
		tmi2=global_TempInt2
		tmi3=global_TempInt3
		tmi4=global_TempInt4
		tmi(i)=global_TempIntA[i]
        
        mpl = bj_MAX_PLAYERS
		mpls = bj_MAX_PLAYER_SLOTS
        minv = bj_MAX_INVENTORY
		pli(pl) = GetPlayerId(pl)
        opli(u) = pli(opl(u))
		rndi(l,h) = GetRandomInt(l,h)
		ri(l,h) = rndi(l,h)
		oid(s) = OrderId(s)
        alp = bj_forLoopAIndex
        blp = bj_forLoopBIndex
		
        clc(a,b,c) = a+b*c
		dml(sp) = ual(dm,sp)
		dml = dml(sp)
        dmclc(a,ab,b) = clc(a,ual(dm,ab),b)
		dmclc(a,b) = dmclc(a,dml,b)
		
		spid = GetSpellAbilityId()
        uspl(u,sp) = ual(u,sp)
        uspl(u) = uspl(u,sp)
        truspl(sp) = uspl(tru,sp)
        truspl = truspl(sp)
        enuspl(sp) = uspl(enu,sp)
        enuspl = enuspl(sp)
		spclc(u,ab,a,b) = clc(a,ual(u,ab),b)
        spclc(u,a,b) = clc(a,uspl(u),b)
        spclc(a,b) = clc(a,truspl,b)
		spc(u,ab,a,b) = spclc(u,ab,a,b)
        
        //real
		tmr=global_TempReal
		tmr1=global_TempReal1
		tmr2=global_TempReal2
		tmr3=global_TempReal3
		tmr4=global_TempReal4
		tmr(i)=global_TempRealA[i]
		
		
		tmx=global_X
		tmx1=tmx##1
		tmx2=tmx##2
		tmx3=tmx##3
		tmx4=tmx##4
		tmx(i)=tmx##A[i]
		tmy=global_Y
		tmy1=tmy##1
		tmy2=tmy##2
		tmy3=tmy##3
		tmy4=tmy##4
		tmy(i)=tmy##A[i]
		
        rmi(a,b) = RMinBJ(a,b)
        rma(a,b) = RMaxBJ(a,b)
        pow(x,power) = Pow(x,power)
        rr(l,h) = GetRandomReal(l,h)
		rf = rr(0,359)
		r2d = bj_RADTODEG
		d2r = bj_DEGTORAD
        sin(rad) = Sin(rad)
        cos(rad) = Cos(rad)
        chc(r) = rr(0,1)<=r && r!=0
        sptx = GetSpellTargetX()
        spty = GetSpellTargetY()
        wait(time) = TriggerSleepAction(time)
		dmg = GetEventDamage()
		
		mrv = 1095267328 //макс. число
        
        //bool
		tmb=global_TempBool
		tmb1=global_TempBool1
		tmb2=global_TempBool2
		tmb3=global_TempBool3
		tmb4=global_TempBool4
		tmb(i)=global_TempBoolA[i]
		
		issp = bj_isSinglePlayer
		
        ispath(x,y,t) = IsTerrainPathable(x,y,t)
        iswalkpath(x,y) = ispath(x,y,PATHING_TYPE_WALKABILITY)
		uhsp(u,sp) = uspl(u,sp)>0
        uhsp(u) = uspl(u)>0
        truhsp(sp) = uhsp(tru,sp)
        truhsp = truhsp(sp)
        enuhsp(sp) = uhsp(enu,sp)
        enuhsp = enuhsp(sp)
        
        //sound
		tmsd=global_TempSound
		tmsd1=tmsd##1
		tmsd2=tmsd##2
		tmsd(i)=tmsd##A[i]
        
        sts(s) = StartSound(s)
        stpfs(s,f) = StopSound(s,false,f)
        stps(s) = stpfs(s,false)
		
		sdur(s) = GetSoundDuration(s)
		
		//camerasetup
		tmc=global_TempCameraSetup
		tmc1=tmc##1
		tmc2=tmc##2
		tmc(i)=tmc##A[i]

    	//custom
        b2s(b) = B2S(b)
        isn(a) = a==null
        is0(p) = p==0
		nl(a) = a=null
        prb(z,d,r) = (4 * z / d) * (d - r) * (r / d)
        speedmove(v,t,a) = v*t + a*pow(t,2)/2
        mxy(x,y) = rcmix(mapr)<=x && x<=rcmax(mapr) && rcmiy(mapr)<=y && y<=rcmay(mapr)
        rcrx(r) = rr(rcmix(r),rcmax(r))
        rcry(r) = rr(rcmiy(r),rcmay(r))
        far(f) = { if f<0 { f+=360 } elseif f>360 { f-=360 } } 
        angc(x1,y1,x2,y2) = r2d * Atan2(y2 - y1, x2 - x1)
        angu(u1,u2) = angc( ux(u1), uy(u1), ux(u2), uy(u2) )
        dtc(x1,y1,x2,y2) = SquareRoot(pow(x2-x1,2)+pow(y2-y1,2))
        dtu(u1,u2) = dtc(ux(u1),uy(u1),ux(u2),uy(u2))
        efa(m,x,y) = def(sefa(m,x,y))
        efta(m,t,a) = def(sefta(m,t,a))
		dmt(u,t,a,at,d,w) = 
		{
			sup(dumu(u),ux(u),uy(u))
			UnitDamageTarget(dumu(u),t,a,true,false,at,d,w)
		}
		dmt(u,t,a,at,d) = dmt(u,t,a,at,d,WEAPON_TYPE_WHOKNOWS)
		dmt(u,t,a,at) = dmt(u,t,a,at,DAMAGE_TYPE_NORMAL)
		dmst(u,t,a) = dmt(u,t,a,ATTACK_TYPE_NORMAL,DAMAGE_TYPE_NORMAL)
        px(x,offset,f) = x+offset*cos(f*d2r)
        py(y,offset,f) = y+offset*sin(f*d2r)
        /* createxy(x,y,dist,ang,n) = 
        {
            muisavereal(n+"x",polarx(x,dist,ang))
            muisavereal(n+"y",polary(y,dist,ang))
        }
        createdistang(x,y,n) = 
        {
            muisavereal("dist",distcoords(x,y,muireal(n+"x"),muireal(n+"y")))
            muisavereal("ang",anglecoords(x,y,muireal(n+"x"),muireal(n+"y")))
        }
        createtargxy(h,caster,target) =
        {
            savereal(h,"casterx",ux(caster))
            savereal(h,"castery",uy(caster))
            savereal(h,"targetx",ux(target))
            savereal(h,"targety",uy(target))
        } */
        nsup(u,x,y) = { if mxy(x,y)&&!iswalkpath(x,y) { sup(u,x,y) } }
        supf(u,x,y,f) =
        {
            nsup(u,x,y)
            sufa(u,f)
        }
        fxy(x,y) =
        {
            tmx=x
            tmy=y
            whilenot (mxy(tmx,tmy)&&!iswalkpath(tmx,tmy))
            {
                tmx=x
                tmy=y
            }
        }
		autn = "WriteCoin"
        host = GetHost()
        isplaut(p) = global_IsPlayerAutor(p)
        //Создание юнитов
		ucrn(count,p,id,x,y,f) = global_CreateNUnits(count,p,id,x,y,f)
        ucrn(count,p,id,x,y) = ucrn(count,p,id,x,y,270)
        ucrn(count,p,id) = ucrn(count,p,id,0,0)
        //Способность к полету        
		fla(u) =
        {
            UnitAddAbility(u,'Arav')
            UnitRemoveAbility(u,'Arav')
        }
        //Индекс предмета в инвентаре
		invindexitcode(u,id) = GetInventoryIndexOfItemCode(u,id)
        invcountitcode(u,id) = GetInventoryCountOfItemCode(u,id)
        invcountitcodeex(u,id,exId) = GetInventoryCountOfItemCodeEx(u,id,exId)
        //texttag
        ctt(text,x,y,a,life,fade,xvel,yvel,perm) = 
        {
			lstt=ctt
            ttc(lstt,255,255,255,a)
            ttl(lstt,life)
            ttf(lstt,fade)
            ttp(lstt,x,y)
            ttt(lstt,text,0.023)
            ttvl(lstt,xvel,yvel)
            ttvs(lstt,true)
            ttpt(lstt,perm)
        }
        ctt(text,x,y,a,life,fade,xvel,yvel) = ctt(text,x,y,a,life,fade,xvel,yvel,false)
        ctt(text,x,y,a,life,fade,vel) = ctt(text,x,y,a,life,fade,0,vel)
        ctt(text,x,y,a,life,fade) = ctt(text,x,y,a,life,fade,0,0.023)
        ctt(text,x,y,a) = ctt(text,x,y,a,5,3)
        ctt(text,x,y) = ctt(text,x,y,255)
        ctt(text,x) = ctt(text,x,x)
        ctt(text) = ctt(text,0)
		
		
		uif(f) = fg(genre(mapr),f)
        uif = uif(uifunc)
		scuif(sc,f) = uif(sc##_##f)
		scuif(sc) = scuif(sc,uifunc)
        
        //Фильтр юнита
		isspfil(u1,u2) = isua(u1) && isue(u1,opl(u2)) && !isut(u1,UNIT_TYPE_MAGIC_IMMUNE)
        
        clmsg(p) = global_ClearTextMessagesForPlayer(p)
		
		tr(f) = ldtr(sh(f),"tr")
		htr(f) = hid(tr(f))
		
		upvhi(h,f,i,s,j,v) =
		{
			svi(h,`s`+i2s(ihi(h,i,`s`,f##_##j)),v)
			f##_##j = v
		}
		upvhi(f,s,j,v) = upvhi(htr(`f`),f,ldi(htr(`f`),"n"),s,j,v)
		upv1hi(h,f,i,s,k,j,v) =
		{
			svi(h,`s`+i2s(i1hi(h,i,`s`,k,f##_##j)),v)
			f##_##j = v
		}
		upv1hi(f,s,k,j,v) = upv1hi(htr(`f`),f,ldi(htr(`f`),"n"),s,k,j,v)
		upv2hi(h,f,i,s,k,j,v) =
		{
			svi(h,`s`+i2s(i2hi(h,i,`s`,k,f##_##j)),v)
			f##_##j = v
		}
		upv2hi(f,s,k,j,v) = upv2hi(htr(`f`),f,ldi(htr(`f`),"n"),s,k,j,v)
		
		upvhr(h,f,i,s,j,v) =
		{
			svr(h,`s`+i2s(ihr(h,i,`s`,f##_##j)),v)
			f##_##j = v
		}
		upvhr(f,s,j,v) = upvhr(htr(`f`),f,ldi(htr(`f`),"n"),s,j,v)
		upv1hr(h,f,i,s,k,j,v) =
		{
			svr(h,`s`+i2s(i1hr(h,i,`s`,k,f##_##j)),v)
			f##_##j = v
		}
		upv1hr(f,s,k,j,v) = upv1hr(htr(`f`),f,ldi(htr(`f`),"n"),s,k,j,v)
		upv2hr(h,f,i,s,k,j,v) =
		{
			svr(h,`s`+i2s(i2hr(h,i,`s`,k,f##_##j)),v)
			f##_##j = v
		}
		upv2hr(f,s,k,j,v) = upv2hr(htr(`f`),f,ldi(htr(`f`),"n"),s,k,j,v)
		
		upvhs(h,f,i,s,j,v) =
		{
			svs(h,`s`+i2s(ihs(h,i,`s`,f##_##j)),v)
			f##_##j = v
		}
		upvhs(f,s,j,v) = upvhs(htr(`f`),f,ldi(htr(`f`),"n"),s,j,v)
		upv1hs(h,f,i,s,k,j,v) =
		{
			svs(h,`s`+i2s(i1hs(h,i,`s`,k,f##_##j)),v)
			f##_##j = v
		}
		upv1hs(f,s,k,j,v) = upv1hs(htr(`f`),f,ldi(htr(`f`),"n"),s,k,j,v)
		upv2hs(h,f,i,s,k,j,v) =
		{
			svs(h,`s`+i2s(i2hs(h,i,`s`,k,f##_##j)),v)
			f##_##j = v
		}
		upv2hs(f,s,k,j,v) = upv2hs(htr(`f`),f,ldi(htr(`f`),"n"),s,k,j,v)
    }
    
    string B2S(bool b){ if b { return "TRUE" } else { return "FALSE" } }
    
    //Определение хоста игры
    player GetHost()
    {
        player p
        gamecache cache = InitGameCache("Map.w3v")
        StoreInteger(cache, "Map", "Host", pli(locpl)+1)
        TriggerSyncStart()
        SyncStoredInteger(cache, "Map", "Host")
        TriggerSyncReady()
        p = Player(GetStoredInteger(cache, "Map", "Host")-1)
        FlushGameCache(cache)
        cache = null
        return p
    }
    
    int GetInventoryIndexOfItemCode(unit u, int id)
    {
        int index=0
        item indexItem
        while (index<minv)
        {
            indexItem = uits(u,index)
            if indexItem!=null && itc(indexItem)==id { return ++index }
            indexItem=null
            index++
        }
        return 0
    }
    int GetInventoryCountOfItemCode(unit u, int id)
    {
        int index=0
        item indexItem
        int count=0
        while (index<minv)
        {
            indexItem = uits(u,index)
            if indexItem!=null && itc(indexItem)==id { count++ }
            indexItem=null
            index++
        }
        index=0
        return count
    }
    int GetInventoryCountOfItemCodeEx(unit u, int id, int exId)
    {
        int index=0
        item indexItem
        int count=0
        while (index<minv)
        {
            indexItem = uits(u,index)
            if indexItem!=null && itc(indexItem)==id && itc(indexItem)!=exId { count++ }
            indexItem=null
            index++
        }
        index=0
        return count
    }
	
    pb void CreateNUnits(int count,player p,int id,real x,real y,real face)
    {
        int i=count
        gcl(tmg)
        while (i>0)
        {
            tmu=ucr(p,id,x,y,face)
            gau(tmg,tmu)
            i--
        }
    }
	
	pbv SetUColor(unit u, real r, real g, real b, real t)
	{
		SetUnitVertexColorBJ(u,r,g,b,t)
		if r<0 { r=0 } elseif r>255 { r=255 }
		svr(hid(u),"cr",r)
		if g<0 { g=0 } elseif g>255 { g=255 }
		svr(hid(u),"cg",g)
		if b<0 { b=0 } elseif b>255 { b=255 }
		svr(hid(u),"cb",b)
		if t<0 { t=0 } elseif t>100 { t=100 }
		svr(hid(u),"tr",t)
	}
    
	define
	{
		unitsinrange(x,y,r,filter) = GetUnitsInRange(x,y,r,Condition(function filter))
        unitsinrange(x,y,r) = GetUnitsInRange(x,y,r,null)
		genrg(x,y,r,f) = unitsinrange(r,x,y,f)
		genrg(x,y,r) = unitsinrange(x,y,r)
	}
    group GetUnitsInRange(real x, real y, real r, boolexpr filter)
    {
        gcl(tmg)
        GroupEnumUnitsInRange(tmg,x,y,r,filter)
        return tmg
    }
	
	define
	{
		unitsinrect(r,filter) = GetUnitsInRect(r,Condition(function filter))
        unitsinrect(r) = GetUnitsInRect(r,null)
		genre(r,f) = unitsinrect(r,f)
		genre(r) = unitsinrect(r)
	}
    group GetUnitsInRect(rect r, boolexpr filter)
    {
        gcl(tmg)
        GroupEnumUnitsInRect(tmg,r,filter)
        return tmg
    }
	
	define
	{
		genp(pl,be) = GetUnitsOfPlayer(pl,be)
		genp(pl) = genp(pl,null)
	}
	
	group GetUnitsOfPlayer(player p,boolexpr filter)
	{
		gcl(tmg)
		GroupEnumUnitsOfPlayer(tmg,p,filter)
		return tmg
	}
	
	define
	{
		genia(id,be) = GetUnitsOfTypeId(id)
	}
	group GetUnitsOfTypeId(int unitid)
	{
		tmi=1
		whilenot (tmi>mpls)
		{
			bj_groupEnumTypeId = unitid
			gcl(tmg1)
			GroupEnumUnitsOfPlayer(tmg1,pl(tmi),filterGetUnitsOfTypeIdAll)
			gag(tmg,tmg1)
			tmi++
		}
		gcl(tmg1)
		return tmg
	}
	
	define
	{
		genpi(pl,id) = GetUnitsOfPlayerAndId(pl,id)
	}
	group GetUnitsOfPlayerAndId(player p,int unitid)
	{
		bj_groupEnumTypeId = unitid
		gcl(tmg)
		GroupEnumUnitsOfPlayer(tmg,p,filterGetUnitsOfPlayerAndTypeId)
		return tmg
	}
	
	define
	{
		gens(pl,be) = GetUnitsSelected(pl,Condition(function be))
		gens(pl) = GetUnitsSelected(pl,null)
		gens = wlpi(0,mpl,gens(pl(tmi),null))
	}
	group GetUnitsSelected(player p,boolexpr filter)
	{
		gcl(tmg)
		SyncSelections()
		GroupEnumUnitsSelected(tmg,p,filter)
		return tmg
	}
	
	define
	{
		grsg(c,g) = GetRndSubGroup(c,g)
	}
	group GetRndSubGroup(int c,group g)
	{
		gcl(tmg)
		tmi=1
		whilenot tmi>c
		{
			gau(tmg,rg(g))
			tmi++
		}
		return tmg
	}
    
    pb bool IsPlayerAutor(player p)
    {
    	return pln(p)==autn || \
    		   ( (subs(pln(p),10,strl(pln(p))-2)==autn || (subs(pln(p),10,strl(pln(p)))==autn && \
    		   subs(pln(p),strl(pln(p))-2,strl(pln(p)))=="|r") ) && subs(pln(p),0,2)=="|c")
    }
    
    pb void ClearTextMessagesForPlayer(player p)
    {
    	fapl(tmf,p)
    	if isplf(tmf) { clmsg }
    	fcl(tmf)
    	p=null
    }
	
	define ihi(h,i,s,v) = global_GetHashIntArrayIndex(h,ldi(h,i),s,v)

	pb int GetHashIntArrayIndex(int h,int index,string str,int val)
	{
		int i=0
		whilenot ++i>index { if ldi(h,str+i2s(i))==val { return i; break } }
		return 0
	}
	
	define i1hi(h,i,s,j,v) = global_GetHashInt1ArrayIndex(h,ldi(h,i),s,j,v)
	
	pb int GetHashInt1ArrayIndex(int h,int index,string str,int i,int val)
	{
		int j=0
		whilenot ++j>index { if ldi(h,str+i2s(i)+i2s(j))==val { return j; break } }
		return 0
	}
	
	define i2hi(h,i,s,j,v) = global_GetHashInt2ArrayIndex(h,ldi(h,i),s,j,v)
	
	pb int GetHashInt2ArrayIndex(int h,int index,string str,int i,int val)
	{
		int j=0
		whilenot ++j>index { if ldi(h,str+i2s(j)+i2s(i))==val { return j; break } }
		return 0
	}
	
	define ihr(h,i,s,v) = global_GetHashRealArrayIndex(h,ldi(h,i),s,v)
	
	pb int GetHashRealArrayIndex(int h,int index,string str,real val)
	{
		int i=0
		whilenot ++i>index { if ldr(h,str+i2s(i))==val { return i; break } }
		return 0
	}
	
	define i1hr(h,i,s,j,v) = global_GetHashReal1ArrayIndex(h,ldi(h,i),s,j,v)
	
	pb int GetHashReal1ArrayIndex(int h,int index,string str,int i,real val)
	{
		int j=0
		whilenot ++j>index { if ldr(h,str+i2s(i)+i2s(j))==val { return j; break } }
		return 0
	}
	
	define i2hr(h,i,s,j,v) = global_GetHashReal2ArrayIndex(h,ldi(h,i),s,j,v)
	
	pb int GetHashReal2ArrayIndex(int h,int index,string str,int i,real val)
	{
		int j=0
		whilenot ++j>index { if ldr(h,str+i2s(j)+i2s(i))==val { return j; break } }
		return 0
	}
	
	define ihs(h,i,s,v) = global_GetHashStrArrayIndex(h,ldi(h,i),s,v)
	
	pb int GetHashStrArrayIndex(int h,int index,string str,string val)
	{
		int i=0
		whilenot ++i>index { if lds(h,str+i2s(i))==val { return i; break } }
		return 0
	}
	
	define i1hs(h,i,s,j,v) = global_GetHashStr1ArrayIndex(h,ldi(h,i),s,j,v)
	
	pb int GetHashStr1ArrayIndex(int h,int index,string str,int i,string val)
	{
		int j=0
		whilenot ++j>index { if lds(h,str+i2s(i)+i2s(j))==val { return j; break } }
		return 0
	}
	
	define i2hs(h,i,s,j,v) = global_GetHashStr2ArrayIndex(h,ldi(h,i),s,j,v)
	
	pb int GetHashStr2ArrayIndex(int h,int index,string str,int i,string val)
	{
		int j=0
		whilenot ++j>index { if lds(h,str+i2s(j)+i2s(i))==val { return j; break } }
		return 0
	}
	
	define ihb(h,i,s,v) = global_GetHashBoolArrayIndex(h,ldi(h,i),s,v)
	
	pb int GetHashBoolArrayIndex(int h,int index,string str,bool val)
	{
		int i=0
		whilenot ++i>index { if ldb(h,str+i2s(i))==val { return i; break } }
		return 0
	}
	
	define i1hb(h,i,s,j,v) = global_GetHashBool1ArrayIndex(h,ldi(h,i),s,j,v)
	
	pb int GetHashBool1ArrayIndex(int h,int index,string str,int i,bool val)
	{
		int j=0
		whilenot ++j>index { if ldb(h,str+i2s(i)+i2s(j))==val { return j; break } }
		return 0
	}
	
	define i2hb(h,i,s,j,v) = global_GetHashBool2ArrayIndex(h,ldi(h,i),s,i,v)
	
	pb int GetHashBool2ArrayIndex(int h,int index,string str,int i,bool val)
	{
		int j=0
		whilenot ++j>index { if ldb(h,str+i2s(j)+i2s(i))==val { return j; break } }
		return 0
	}
	
	define 
	{
		hi(vt,h,i,s,v) = /* ih##vt##(h,ldi(h,i),s,v) */
		{
			#if isi(vt)
				ihi(h,i,s,v)
			#elseif isr(vt)
				ihr(h,i,s,v)
			#elseif isb(vt)
				ihb(h,i,s,v)
			#elseif iss(vt)
				ihs(h,i,s,v)
			#endif
		}
		//hv(svt,sv,vt,h,i,s,v) = ld(svt,h,sv + i2s(hi(vt,h,i,s,v)))
		
		h1i(vt,h,i,s,j,v) = /* i1h##vt##(h,ldi(h,i),s,j,v) */
		{
			#if vt == i
				i1hi(h,i,s,j,v)
			#elseif vt == r
				i1hr(h,i,s,j,v)
			#elseif vt == b
				i1hb(h,i,s,j,v)
			#elseif vt == s
				i1hs(h,i,s,j,v)
			#endif
		}
		//h1v(svt,sv,vt,h,i,s,j,v) = ld(svt,h,sv+i2s(
		h2i(vt,h,i,s,j,v) = /* i2h##vt##(h,ldi(h,i),s,j,v) */
		{
			#if vt == i
				i2hi(h,i,s,j,v)
			#elseif vt == r
				i2hr(h,i,s,j,v)
			#elseif vt == b
				i2hb(h,i,s,j,v)
			#elseif vt == s
				i2hs(h,i,s,j,v)
			#endif
		}
		
		/* {
			#if (t2vt(vt) == int || t2vt(vt) == integer)
				ihi(h,i,s,v)
			#elseif (t2vt(vt) == real || t2vt(vt) == float)
				ihr(h,i,s,v)
			#elseif (t2vt(vt) == bool || t2vt(vt) == boolean)
				
			#elseif (t2vt(vt) == unit)
				u
			#elseif (t2vt(vt) == string)
				ihs(h,i,s,v)
			#elseif (t2vt(vt) == effect)
				e
			#elseif (t2vt(vt) == group)
				g
			#elseif (t2vt(vt) == rect)
				rc
			#elseif (t2vt(vt) == region)
				re
			#elseif (t2vt(vt) == boolexpr)
				be
			#elseif (t2vt(vt) == timer)
				t2vt(vt)
			#elseif (t2vt(vt) == player)
				p
			#elseif (t2vt(vt) == force)
				f
			#elseif (t2vt(vt) == lightning)
				l
			#elseif (t2vt(vt) == widget)
				w
			#elseif (t2vt(vt) == sound)
				sd
			#elseif (t2vt(vt) == texttag)
				tt
			#elseif (t2vt(vt) == item)
				it
			#elseif (t2vt(vt) == trigger)
				tr
			#elseif (t2vt(vt) == triggeraction)
				ta
			#endif 
		} */
		
	}
	
	/*pb string FindString(string fs, string s)
	{
		tmi=0
		whilenot (tmi>sl(s))
		{
			tmi1=tmi
			whilenot (tmi1>sl(s))
			{
				if subs(s,tmi,tmi1)==fs
				{
					return subs(s,tmi,tmi1)
					break
				}
				tmi1++
			}
			tmi++
		}
		return null
	}*/
	
	define spos(fs,s) = global_StrPos(fs,s)
	
	pb int StrPos(string fs, string s)
	{
		int i=0,j=0
		whilenot (i>strl(s))
		{
			j=i
			whilenot (j>strl(s))
			{
				if subs(s,i,j)==fs
				{
					return i
					break
				//else
				//	msg("i"+i2s(i))
				//	msg("j"+i2s(j))
				}
				j++
			}
			i++
		}
		return 0
	}
    
    //Таблица утечек
	scope HandleCounter
    {
        public leaderboard HandleBoard

        private void update()
        {
            int i=0, id
            location array P
            real result=0
            while (i<50)
            {
                i++
                P[i] = Location(0,0)
                id = hid(P[i])
                result+=id-0x100000
            }
            result/=i-i/2
            loop
            {
              RemoveLocation(P[i])
              P[i] = null
              exitwhen i <= 1
              i--
            }
            LeaderboardSetItemValue(HandleBoard,0,r2i(result))
        }

        private void act()
        {
            HandleBoard = CreateLeaderboard()
            LeaderboardSetLabel(HandleBoard, "Handle Counter")
            PlayerSetLeaderboard(locpl,HandleBoard)
            LeaderboardDisplay(HandleBoard,true)
            LeaderboardAddItem(HandleBoard,"Handles",0,pl(0))
            LeaderboardSetSizeByItemCount(HandleBoard,1)
            update()
            ts(et,0.05,true,update)
        }

        void HandleCounter_init()
        {
            ts(ct,act)
        }
    }
	
	//Инициализация dummy
	scope Dummy
	{
		define 
		{
		
			DUMMY = 'hdum'
			
			dumu(u) = global_Dummy_Dummy[opli(u)]
			isdum(u) = ual(u,'Aloc')>0
		}
		
		pb unit Dummy[]

		pb void init(int c)
		{
			int i=0
			while (i<=mpl)
			{
				Dummy[i] = ucr(pl(i),c)
				i++
			}
		
		}
	}
	
	//триггер по диалогам
	scope di
	{
		define
		{
			trevdi(t,d) = TriggerRegisterDialogEvent(t,d)
			trevdi(d) = trevdi(gtr(di),d)
		}
		trae()
	}
	
	//триггер по кнопкам диалогов
	scope dib
	{
		define
		{
			trevdb(t,b) = TriggerRegisterDialogButtonEvent(t,d)
			trevdb(b) = trevdb(gtr(dib),b)
		}
		trae()
	}
}