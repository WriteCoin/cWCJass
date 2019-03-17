//Таймеры
#guard mui
library MUI init on usg
{
    
    define
    {
		/* private */ PT = 0.01
		/* private */ FT = 10
        muideathfunc = if isua(muiu)||(!(isua(muiu))&&muibool("actondeath")) { ExecuteFunc(muistr("funcname2")) }
		private muimovefunc(x,y,u) = !(mxy(x,y))||(!(isua(u))&&muibool("breakatdeath"))||iswalkpath(x,y)
        private muimovefunc = muimovefunc(x,y,u)
        muiend =
        {
            muideathfunc
            muidestroy
        }
        muitimer = MUI_MUITimer
        mui=muitimer
		
		//load
		hmui = het
		
        muibool(s) = ldb(hmui,s)
        bmui(s)=muibool(s)
		
        muiint(s) = ldi(hmui,s)
        imui(s)=muiint(s)
		
        muireal(s) = ldr(hmui,s)
        rmui(s)=muireal(s)
		
        muistr(s) = lds(hmui,s)
        smui(s)=muistr(s)
		
        muiu = ldu(hmui,"u")
		muiux = ux(muiu)
		muiuy = uy(muiu)
        umui=muiu
        hmuiu = hid(muiu)
        humui=hmuiu
        muiunit(s) = ldu(hmui,s)
        umui(s)=muiunit(s)
		muiu(s) = umui(s)
		
        muie = lde(hmui,"e")
        muieff(s) = lde(hmui,s)
        emui(s)=muieff(s)
		
        muiwidg(s) = ldw(hmui,s)
        wmui(s)=muiwidg(s)
		
		tmui(s)=ldt(hmui,s)
		
		ttmui(s) = ldtt(hmui,s)
		
        //save
        muisavebool(s,v) = svb(hmui,s,v)
        svbmui(s,v)=muisavebool(s,v)
        sbmui(s,v)=svbmui(s,v)
		
        muisaveint(s,v) = svi(hmui,s,v)
        svimui(s,v)=muisaveint(s,v)
        simui(s,v)=svimui(s,v)
        muiincsaveint(s,v) = muisaveint(s,muiint(s)+v)
        isvimui(s,v)=muiincsaveint(s,v)
        isimui(s,v)=isvimui(s,v)
		
        muisavereal(s,v) = svr(hmui,s,v)
        svrmui(s,v)=muisavereal(s,v)
        srmui(s,v)=svrmui(s,v)
        muiincsavereal(s,v) = muisavereal(s,muireal(s)+v)
        isvrmui(s,v)=muiincsavereal(s,v)
        isrmui(s,v)=isvrmui(s,v)
		
        muisaveunit(s,v) = svu(hmui,s,v)
        svumui(s,v)=muisaveunit(s,v)
        sumui(s,v)=svumui(s,v)
		
        muisavestr(s,v) = svs(hmui,s,v)
        svsmui(s,v)=muisavestr(s,v)
        ssmui(s,v)=svsmui(s,v)
		
        muisaveeff(s,v) = sve(hmui,s,v)
        svemui(s,v)=muisaveeff(s,v)
        semui(s,v)=svemui(s,v)
		
        muisavewidg(s,v) = svw(hmui,s,v)
        svwmui(s,v)=muisavewidg(s,v)
        swmui(s,v)=svwmui(s,v)
		
		sttmui(s,v) = svtt(hmui,s,v)
		sttmui(v) = svtt(hmui,v)
		
        //create
        chcmui(plid) = MUI_NewMUI(plid)
        chcmui = chcmui(pli(dfpl))//hid(t)
        tcreate(t) =
        {
            timer t = CreateTimer()
            int h##t = hid(t)
        }
        muicreate(pi) = MUI_NewMUI(pi)//int htid##t=chcmui
        ccmui(pi)=muicreate(pi)
        muicreate = ccmui(pli(dfpl))
        ccmui=muicreate
        
		//load last created mui
        ldmui(plid)=MUI_LoadMUI(plid)
        ldmui=ldmui(pli(dfpl))
		hldmui = hid(ldmui)
        
		//start mui
        muistart(t,b,f) = ts(ldmui,t,b,f)
        muistart(t,b) = muistart(t,b,muitimer)
        muistart(t) = muistart(t,cbmui("per"))
        stmui(t,b,f) = muistart(t,b,f)
        stmui(t,b)=muistart(t,b)
        stmui(t)=muistart(t)
		stmui = 
		{
			#if cbmui("per")
				stmui(0.01)
			#else
				stmui(0)
			#endif
		}
		pstmui(t,f) = stmui(t,true,f)
		pstmui(f) = pstmui(PT,f)
		pstmui = pstmui(mui)
        
		//handle
		hcmui(pid)=hid(ldmui(pid))
		hcmui=hcmui(pli(dfpl))
        //hcmui(t)=htid##t
        //hcmui=hcmui(t)
        
		//destroy,null
        muidestroy = 
        {
            //destrtimer(exptimer)
            pt(et)
            flch(hmui)
        }
        drmui=muidestroy
        /*tnull(t) =
        {
            htid##t=0
        }
        tnull=tnull(t)*/
		
		//hash load craeted mui
        cmuibool(s) = ldb(hcmui,s) 
        cbmui(s)=cmuibool(s)
		
        cmuiint(s) = ldi(hcmui,s)
        cimui(s)=cmuiint(s)
		
        cmuireal(s) = ldr(hcmui,s)
        crmui(s)=cmuireal(s)
		
        cmuistr(s) = lds(hcmui,s)
        csmui(s)=cmuistr(s)
		
        cmuiunit(s) = ldu(hcmui,s)
        cumui(s)=cmuiunit(u)
		
        cmuieff(s) = lde(hcmui,s)
        cemui(s)=cmuieff(s)
		
        cmuiwidg(s) = ldw(hcmui,s)
        cwmui(s)=cmuiwidg(s)
		
        cmuitimer(s) = ldt(hcmui,s)
        ctmui(s)=cmuitimer(s)
        
		//hash save last created mui
        cmuisavebool(s,v) = svb(hcmui,s,v)
        csbmui(s,v)=cmuisavebool(s,v)
		csbmui(v) = csbmui(`v`,v)
		
        cmuisaveint(s,v) = svi(hcmui,s,v)
        csimui(s,v)=cmuisaveint(s,v)
		csimui(v) = csimui(`v`,v)
        cmuiincsaveint(s,v) = cmuisaveint(s,cmuiint(s)+v)
        cisimui(s,v)=cmuiincsaveint(s,v)
		cisimui(v) = cisimui(`v`,v)
		
        cmuisavereal(s,v) = svr(hcmui,s,v)
        csrmui(s,v)=cmuisavereal(s,v)
		csrmui(v) = csrmui(`v`,v)
        cmuiincsavereal(s,v) = cmuisavereal(s,cmuireal(s)+v)
        cisrmui(s,v)=cmuiincsavereal(s,v)
		cisrmui(v) = cisrmui(`v`,v)
		
        cmuisaveunit(v) = svu(hcmui,"u",v)
        csumui(v)=cmuisaveunit(v)
        cmuisaveunit(s,v) = svu(hcmui,s,v)
        csumui(s,v)=cmuisaveunit(s,v)
		
        cmuisavestr(s,v) = svs(hcmui,s,v)
        cssmui(s,v)=cmuisavestr(s,v)
		cssmui(v) = cssmui(`v`,v)
		
        cmuisaveeff(v) = sve(hcmui,"e",v)
        csemui(v)=cmuisaveeff(v)
        cmuisaveeff(s,v) = sve(hcmui,s,v)
        csemui(s,v)=cmuisaveeff(s,v)
		
        cmuisavewidg(s,v) = svw(hcmui,s,v)
        cswmui(s,v)=cmuisavewidg(s,v)
		
        cmuisavetimer(s,v) = svt(hcmui,s,v)
        cstmui(s,v)=cmuisavetimer(s,v)
		
		csttmui(s,v)= svtt(hcmui,s,v)
		csttmui(v) = svtt(hcmui,v)
        
        //равномерное движение
        umove(u,dist,face,time,T,func,break,act) = MUI_UnitMove(u,dist,face,time,T,func,break,act)
        umove(u,dist,face,time,T,func,break) = umove(u,dist,face,time,T,func,break,false)
        umove(u,dist,face,time,T,func) = umove(u,dist,face,time,T,func,false)
        umove(u,dist,face,time,T) = umove(u,dist,face,time,T,scn("umovef"))
        umove(u,dist,face,time) = umove(u,dist,face,time,PT)
		/*umv(u,d,f,t,T,ff,b,a) = umove(u,d,f,t,T,ff,b,a)
		umv(u,d,f,t,T,ff,b) = umove(u,d,f,t,T,ff,b)
		umv(u,d,f,t,T,ff) = umove(u,d,f,t,T,ff)
		umv(u,d,f,t,T) = umove(u,d,f,t,T)
		umv(u,d,f,t) = umove(u,d,f,t)*/
        //равнопеременное движение
        speededmove(u,face,v0,time,a,T,func,break,act) = MUI_UnitSpeededMove(u,face,v0,time,a,T,func,break,act)
        speededmove(u,face,v0,time,a,T,func,break) = speededmove(u,face,v0,time,a,T,func,break,false)
        speededmove(u,face,v0,time,a,T,func) = speededmove(u,face,v0,time,a,T,func,false)
        speededmove(u,face,v0,time,a,T) = speededmove(u,face,v0,time,a,T,"spmovef")
        speededmove(u,face,v0,time,a) = speededmove(u,face,v0,time,a,PT)
		spmove(u,f,v,t,a,T,ff,b,a) = speededmove(u,f,v,t,a,T,ff,b,a)
		spmove(u,f,v,t,a,T,ff,b) = speededmove(u,f,v,t,a,T,ff,b)
		spmove(u,f,v,t,a,T,ff) = speededmove(u,f,v,t,a,T,ff)
		spmove(u,f,v,t,a,T) = speededmove(u,f,v,t,a,T)
		spmove(u,f,v,t,a) = speededmove(u,f,v,t,a)
        //периодический приказ в точку
        uipo(u,o,x,y,t,T) = MUI_IssuePointOrderTimed(u,o,x,y,t,T)
        uipo(u,o,x,y,t) = uipo(u,o,x,y,t,PT)
        //периодический приказ без цели
        uio(u,o,t,T) = MUI_IssueImmediateOrderTimed(u,o,t,T)
        uio(u,o,t) = uio(u,o,t,PT)
        //таймерный эффект
        addeff(s,x,y,time,per) = MUI_AddEffectTimed(s,x,y,time,per)
        addeff(s,x,y,time) = addeff(s,x,y,time,false)
		efa(s,x,y,t,p) = addeff(s,x,y,t,p)
		efa(s,x,y,t) = addeff(s,x,y,t)
        addpereff(s,x,y,time) = addeff(s,x,y,time,true)
        addpereff(s,x,y) = addpereff(s,x,y,PT)
		pefa(s,x,y,t) = addpereff(s,x,y,t)
		pefa(s,x,y) = addpereff(s,x,y)
        addefftarg(s,targ,attach,time,per) = MUI_AddEffectTargetTimed(s,targ,attach,time,per)
        addefftarg(s,targ,attach,time) = addefftarg(s,targ,attach,time,false)
		efta(s,ta,a,t,p) = addefftarg(s,ta,a,t,p)
		efta(s,ta,a,t) = addefftarg(s,ta,a,t)
        addperefftarg(s,targ,attach,time) = addefftarg(s,targ,attach,time,true)
        addperefftarg(s,targ,attach) = addperefftarg(s,targ,attach,PT)
		pefta(s,ta,a,t) = addperefftarg(s,ta,a,t)
		pefta(s,ta,a) = addperefftarg(s,ta,a)
        //прыжок вверх
        evenjump(u,v,time,T,func,break,act) = MUI_UnitEvenJump(u,v,time,T,func,break,act)
        evenjump(u,v,time,T,func,break) = evenjump(u,v,time,T,func,break,false)
        evenjump(u,v,time,T,func) = evenjump(u,v,time,T,func,false)
        evenjump(u,v,time,T) = evenjump(u,v,time,T,"ejumpf") 
        evenjump(u,v,time) = evenjump(u,v,time,PT)
		ejump(u,v,t,T,f,b,a) = evenjump(u,v,t,T,f,b,a)
		ejump(u,v,t,T,f,b) = evenjump(u,v,t,T,f,b)
		ejump(u,v,t,T,f) = evenjump(u,v,t,T,f)
		ejump(u,v,t,T) = evenjump(u,v,t,T)
		ejump(u,v,t) = evenjump(u,v,t)
        //равноускоренный прыжок
        speededjump(u,v0,time,a,T,func,break,act) = MUI_UnitSpeededJump(u,v0,time,a,T,func,break,act)
        speededjump(u,v0,time,a,T,func,break) = speededjump(u,v0,time,a,T,func,break,false)
        speededjump(u,v0,time,a,T,func) = speededjump(u,v0,time,func,false)
        speededjump(u,v0,time,a,T) = speededjump(u,v0,time,a,T,"spjumpf")
        speededjump(u,v0,time,a) = speededjump(u,v0,time,a,PT)
		spjump(u,v,t,a,T,f,b,a) = speededjump(u,v,t,a,T,f,b,a)
		spjump(u,v,t,a,T,f,b) = speededjump(u,v,t,a,T,f,b)
		spjump(u,v,t,a,T,f) = speededjump(u,v,t,a,T,f)
		spjump(u,v,t,a,T) = speededjump(u,v,t,a,T)
		spjump(u,v,t,a) = speededjump(u,v,t,a)
        //параболический прыжок
        parabolicjump(u,dist,f,z,d,T,func,break,act) = MUI_UnitParabolicJump(u,dist,f,z,d,T,func,break,act)
        parabolicjump(u,dist,f,z,d,T,func,break) = parabolicjump(u,dist,f,z,d,T,func,break,false)
        parabolicjump(u,dist,f,z,d,T,func) = parabolicjump(u,dist,f,z,d,T,func,false)
        parabolicjump(u,dist,f,z,d,T) = parabolicjump(u,dist,f,z,d,T,"pjumpf")
        parabolicjump(u,dist,f,z,d) = parabolicjump(u,dist,f,z,d,PT)
		pjump(u,di,f,z,d,T,ff,b,a) = parabolicjump(u,di,f,z,d,T,ff,b,a)
		pjump(u,di,f,z,d,T,ff,b) = parabolicjump(u,di,f,z,d,T,ff,b)
		pjump(u,di,f,z,d,T,ff) = parabolicjump(u,di,f,z,d,T,ff)
		pjump(u,di,f,z,d,T) = parabolicjump(u,di,f,z,d,T)
		pjump(u,di,f,z,d) = parabolicjump(u,di,f,z,d)
        //Таймер юнита
        tunit(u,time,func) = MUI_UnitSingleTimer(u,time,func)
        tunit(u,time,t,func) = MUI_UnitPeriodicTimer(u,time,t,func)
		tu(u,t,f) = tunit(u,t,f)
		tu(u,ti,t,f) = tunit(u,ti,t,f)
        tperunit(u,t,func) = tunit(u,99999,t,func)
        tperunit(u,func) = tperunit(u,PT,func)
		tpunit(u,t,f) = tperunit(u,t,f)
		tpunit(u,f) = tperunit(u,f)
		ptu(u,t,f) = tpunit(u,t,f)
		ptu(u,f) = tpunit(u,f)
        //стан
        stunmodel = "Abilities\\Spells\\Human\\Thunderclap\\ThunderclapTarget.mdl"
        stun(u,t) = MUI_StunUnit(u,t)
        //очищение ключа
        flch(h,t) = MUI_FlushChildTimed(h,t)
        //flch(h,t)=flushchild(h,t)
        RemoveUnit(u) =
        {
            flch(hid(u),FT)
            Remove##Unit(u)
			svb(hid(u),"removed",true)
        }
        
        private hpl=hid(pl(pid))
        private lldt=ldt(hpl,scn(i2s(itr)))
    }
    
    pb int NewMUI(int pid)
    {
    	int itr = ldi( hid(pl(pid)), scn("itr") )//, hpl=hid(pl(pid))

	    if itr > ldi( sh(scn), "max" ) { itr = 0 }
	    
	    whilenot ( !ldb( hid( lldt ), scn("st") ) )
	    {
	        itr++
	        if itr > ldi( sh(scn), "max" ) { itr = 0 }
	    }
	    
	    svi( hpl, scn("itr"), itr )
	    itr = ldi( hpl, scn("itr") )
	    
	    if lldt == null { svt( hpl, scn(i2s(itr)), ct ) }
	    
	    svb( hid( lldt ), scn( "st" ), true )
	    return hid( lldt ) 
    }
    
    pb timer LoadMUI(int pid)
    {
    	return ldt( hpl,  scn( i2s( ldi( hpl, scn( "itr" ) ) ) ) )
    }

    pb void MUITimer()
    {
        if !muibool("per")
        {
            ExecuteFunc(muistr("funcname"))
            muidestroy
        } 
        else
        {
            muiincsavereal("time",-tet)
            if muireal("time")<=0
            {
                muiend
            }
            else
            {
                ExecuteFunc(muistr("funcname"))
            }
        }
    }
    
    pb void UnitMoveTimer()
    {
        unit u=muiu
        real d=muireal("dist"), f=muireal("face"), x=px(ux(u),d,f), y=py(uy(u),d,f)
        if muimovefunc
        {
            muiend
        }
        else
        {
            nsup(u,x,y)
        }
        u=null
    }

    pb void UnitMove(unit u, real dist, real face, real time, real T, string funcName, bool breakAtDeath, bool actOnDeath)
    {
        muicreate
        //
        cmuisaveunit(u)
        cmuisavereal("dist",dist)
        cmuisavereal("face",face)
        cmuisavereal("time",time)
        cmuisavestr("funcname",scn("UnitMoveTimer"))
        cmuisavestr("funcname2",funcName)
        cmuisavebool("breakatdeath",breakAtDeath)
        cmuisavebool("actondeath",actOnDeath)
        cmuisavebool("per",true)
        muistart(T)
        //
        //tnull
    }
    
    pb void UnitSpeededMoveTimer()
    {
        unit u=muiu
        real f=rmui("face"), dist, x, y, dta
        //
        isrmui("dt",tet)
        dta=rmui("dt")
        dist=speedmove(rmui("v0"),dta,rmui("a"))
        x=px(ux(u),dist,f)
        y=py(uy(u),dist,f)
        if muimovefunc
        {
            muiend
        }
        else
        {
            nsup(u,x,y)
        }
        //
        dta=0; x=0; y=0; dist=0; f=0; u=null
    }
    
    pb void UnitSpeededMove(unit u, real face, real v0, real time, real a, real T, string funcname, bool breakatdeath, bool actondeath)
    {
        muicreate
        //
        cmuisaveunit(u)
        cmuisavereal("v0",v0)
        cmuisavereal("face",face)
        cmuisavereal("a",a)
        cmuisavestr("funcname",scn("UnitSpeededMoveTimer"))
        cmuisavestr("funcname2",funcname)
        cmuisavebool("breakatdeath",breakatdeath)
        cmuisavebool("actondeath",actondeath)
        cmuisavereal("dt",0)
        cmuisavebool("per",true)
        stmui(T,true)
        //
        //tnull
    }
    
    pb void MUIIssuePointOrder()
    {
        if ucuo(muiu)!=oid(muistr("order"))
        {
            uipo(muiu,muistr("order"),muireal("x"),muireal("y"))
        }
    }
    
    pb void IssuePointOrderTimed(unit u, string order, real x, real y, real time, real T)
    {
        muicreate
        //
        uipo(u,order,x,y)
        cmuisaveunit(u)
        cmuisavestr("order",order)
        cmuisavereal("x",x)
        cmuisavereal("y",y)
        cmuisavereal("time",time)
        cmuisavestr("funcname",scn("MUIIssuePointOrder"))
        cmuisavebool("per",true)
        stmui(T,true)
        //
        //tnull
    }
    
    pb void AddEffectTimer()
    {
        def(muie)
        drmui
    }
    
    pb void AddPerEffectTimer()
    {
        if muibool("istarg")
        {
            sefta(smui("model"),wmui("targ"),smui("attach"))
        }
        else
        {
            sefa(muistr("model"),muireal("x"),muireal("y"))
        }
    }
    
    pb void AddEffectTargetTimed(string model, widget targ, string attach, real time, bool per)
    {
        string s
        muicreate
        //
        cmuisavebool("per",per)
        if !per 
        { 
            cmuisaveeff(sefta(model,targ,attach))
            s=scn("AddEffectTimer")
        } 
        else 
        { 
            s=scn("AddPerEffectTimer")
            cmuisavebool("istarg",true)
            cmuisavestr("model",model)
            cmuisavewidg("targ",targ)
            cmuisavestr("attach",attach)
        }
        cmuisavestr("funcname",s)
        muistart(time)
        //
        //tnull
        s=null
    }
    
    pb void AddEffectTimed(string model, real x, real y, real time, bool per)
    {
        string s
        muicreate
        //
        cmuisavebool("per",per)
        if !per
        {
            cmuisaveeff(sefa(model,x,y))
            s=scn("AddEffectTimer")
        }
        else
        {
            s=scn("AddEffectTimer")
            cmuisavestr("model",model)
            cmuisavereal("x",x)
            cmuisavereal("y",y)
        }
        cmuisavestr("funcname",s)
        muistart(time)
        //
        //tnull
        s=null
    }
    
    pb void UnitEvenJumpTimer()
    {
        unit u=muiu
        real v
        //
        if !(isua(u))&&muibool("breakatdeath")
        {
            sufl(u,0)
            muiend
        }
        else
        {
            v=muireal("v")
            if muireal("time")<=muireal("T")/2
            {
                v*=(-1)
            }
            sufl(u,uflh(u)+v)
        }
        //
        v=0
        u=null
    }
    
    pb void UnitEvenJump(unit u,real v,real time,real T,string func,bool breakatdeath,bool act)
    {
        muicreate
        //
        fla(u)
        cmuisaveunit(u)
        cmuisavereal("v",v)
        cmuisavereal("time",time)
        cmuisavestr("funcname",scn("UnitEvenJumpTimer"))
        cmuisavestr("funcname2",func)
        cmuisavebool("breakatdeath",breakatdeath)
        cmuisavebool("actondeath",act)
        cmuisavereal("T",time)
        cmuisavebool("per",true)
        muistart(T)
        //
        //tnull
    }
    
    pb void UnitSpeededJumpTimer()
    {
        unit u=muiu
        real v0, a, T=rmui("T"), time=rmui("time"), dur, H, dta
        //
        muiincsavereal("dur",T)
        dur=rmui("dur")
        if dur>=time||(!(isua(u))&&bmui("breakatdeath"))
        {
            sufl(u,0)
            muiend
        }
        else
        {
            v0=muireal("v0")
            a=muireal("a")
            if dur<=time/2
            {
                muiincsavereal("dta",T)
                a*=(-1)
            }
            else
            {
                muiincsavereal("dta",-T)
            }
            dta=muireal("dt")
            H=speedmove(v0,dta,a)
            if dur>time/2
            {
                H*=(-1)
            }
            sufl(u,uflh(u)+H)
        }
        //
        dta=0; H=0; dur=0; time=0; T=0; a=0; v0=0; u=null
    }
    
    pb void UnitSpeededJump(unit u,real v0,real time,real a,real T,string func,bool breakatdeath,bool actondeath)
    {
        ccmui
        fla(u)
        csumui(u)
        csrmui(v0)
        csrmui(time)
        csrmui(a)
        csrmui(T)
        cssmui("funcname","UnitSpeededJumpTimer")
		cssmui("funcname2",func)
        csbmui(breakatdeath)
        csbmui(actondeath)
        csrmui("dur",0)
        csrmui("dt",0)
		csbmui("per",true)
        stmui(T)
    }
    
    pr void UnitParabolicJumpTimer()
    {
		unit u=muiu
        real dist, f=rmui("f"), d=rmui("d"), x=ux(u), y=uy(u), x0=rmui("x0"), y0=rmui("y0"), r=dtc(x,y,px(x0,d,f),py(y0,d,f))
        if r<=5||(muimovefunc)
        {
            sufl(muiu,0)
            muiend
        }
        else
        {
            dist=rmui("dist")
            sux(muiu,px(x,dist,f))
            suy(muiu,py(y,dist,f))
            sufl(u,prb(rmui("z"),d,r))
        }
        r=0; x0=0; y0=0; x=0; y=0; d=0; f=0; dist=0; u=null
    }
    
    pb void UnitParabolicJump(unit u,real dist,real f,real z,real d,real T,string func,bool breakatdeath,bool actondeath)
    {
        ccmui
        fla(u)
		csumui(u)
		csrmui(dist)
		csrmui(f)
		csrmui(z)
		csrmui(d)
		csbmui(breakatdeath)
		csbmui(actondeath)
		csrmui("x0",ux(u))
		csrmui("y0",uy(u))
		cssmui("funcname2",func)
		stmui(T,true,UnitParabolicJumpTimer)
    }
    
    pb timer UnitSingleTimer(unit u,real timeout,string func)
    {
        muicreate
        int h=hcmui
        //
        cmuisaveunit(u)
        cmuisavestr("funcname",func)
        cmuisavebool("per",false)
        muistart(timeout)
        //
        cmuisavetimer("timer",ldmui)
        //tnull
        u=null; timeout=0; func=null
        return ldt(h,"timer")
    }
    
    pb timer UnitPeriodicTimer(unit u,real time,real timeout,string func)
    {
        muicreate
        int h=hcmui
        //
        cmuisaveunit(u)
        cmuisavereal("time",time)
        cmuisavestr("funcname",func)
        cmuisavebool("per",true)
        muistart(timeout)
        //
        cmuisavetimer("timer",ldmui)
        //tnull
        u=null; time=0; timeout=0; func=null
        return ldt(h,"timer")
    }
    
    pb void IssueImmediateOrderTimer()
    {
        if ucuo(muiu)!=oid(muistr("ord"))
        {
            uio(muiu,muistr("ord"))
        }
    }
    
    pb void IssueImmediateOrderTimed(unit u,string ord,real time,real T)
    {
        muicreate
        //
        uio(u,ord)
        cmuisaveunit(u)
        cmuisavestr(`ord`,ord)
        cmuisavereal(`time`,time)
        cmuisavestr(`funcname`,scn("IssueImmediateOrderTimer"))
        cmuisavebool(`per`,true)
        muistart(T)
        //
        //tnull
    }
    
    pb void StunUnit(unit u,real time)
    {
        addefftarg(stunmodel,u,"overhead",time)
        uio(u,`stop`,time)
    }
	
	define
	{
		sufl(u,h,v,t,f) = MUI_SetUnitFlyTimed(u,h,v,t,f)
		sufl(u,h,v,t) = sufl(u,h,v,t,"suflf")
		suflt(u,h,v,f) = sufl(u,h,v,PT,f)
		suflt(u,h,v) = suflt(u,h,v,"suflf")
	}
    
    pb void SetUnitFlyTimer()
    {
        unit u=muiu
        real h=uflh(u), H=muireal(`H`), v=muireal(`v`)
        //
        if ((h<=H)&&(v<0))||((h>=H)&&(v>0))||v==0
        {
            sufl(u,H)
            muiend
        }
        else
        {
			msg("fl")
            sufl(u,h+v)
        }
        //
        v=0; h=0; H=0; u=null
    }
	
    pb void SetUnitFlyTimed(unit u,real newH,real v,real T,string func)
    {
        muicreate
        real time, H=uflh(u), dh
        //
        fla(u)
        if newH<H
        {
            dh=H-newH
            time=dh/v
            v*=(-1)
        }
        else
        {
            dh=newH-H
            time=dh/v
        }
        cmuisaveunit(u)
        cmuisavereal(`H`,newH)
        cmuisavereal(`v`,v)
        cmuisavereal(`time`,time)
        cmuisavestr(`funcname`,scn("SetUnitFlyTimer"))
        cmuisavestr(`funcname2`,func)
        cmuisavebool(`per`,true)
        muistart(T)
        //
        time=0; dh=0; H=0; u=null; newH=0; v=0
        //tnull
    }
	
	define
    {
        //hmis(u,ab,ta,mc,ms,f,b,a) = MUI_HomingMissile(u,ab,ta,mc,ms,f,b,a)
        //hmis(u,ab,ta,mc,ms,f,b) = hmis(u,ab,ta,mc,ms,f,b,false)
        hmis(u,ab,ta,mc,ms,f) = MUI_HomingMissile(u,ab,ta,mc,ms,f)
        hmis(u,ab,ta,mc,ms) = hmis(u,ab,ta,mc,ms,"hmisf")
    }

    pr void HomingMissileTimer()
    {
        real ang=angu(umui("msl"),umui("ta")), x=ux(umui("msl")), y=uy(umui("msl")),ms=rmui("ms")*tet
		//msg("msl: "+b2s(isnl(umui("msl"))))
		//msg("ta: "+b2s(isnl(umui("ta"))))
		//msg("d: "+r2s(dtu(umui("msl"),umui("ta"))))
        if dtu(umui("msl"),umui("ta"))<=5
        {
            exf(smui("func"))
			ukill(umui("msl"))
			drmui
        elseif mxy(x,y)
            sup(umui("msl"),px(x,ms,ang),py(y,ms,ang))
        }
    }

    pb void HomingMissile(unit u,int ab,unit ta,int mc,real ms,string func)
    {
        ccmui
        csumui("u",u)
        csumui("ta",ta)
        csumui("msl",ucr(opl(u),mc,ux(u),uy(u),uf(u)))
        csimui("ab",ab)
        csrmui("ms",ms)
        //cssmui("funcname",scn("HomingMissileTimer"))
        cssmui("func",func)
        //csbmui("breakatdeath",brkd)
        //csbmui("actondeath",actond)
        //csbmui("per",true)
        pstmui(HomingMissileTimer)
		psu(ldu(hcmui,"msl"),false)
    }
    
    pr void FlushChildTimer()
    {
        flch(muiint("pkey"))
        muidestroy
    }
    
    pb void FlushChildTimed(int pKey,real time)
    {
        muicreate
        //
        cmuisaveint("pkey",pKey)
        stmui(time,false,FlushChildTimer)
        //
        //tnull
    }
	
	define SetTextTagLifespan(t,life) =
		{
			MUI_TextTagLifeTime(t,life)
			SetText##TagLifespan(t,life)
		}
	
	pr void TextTagLifeTimer()
	{
		flch(hid(ttmui("tt")))
		dtt(ttmui("tt"))
		muidestroy
	}
	
	pb void TextTagLifeTime(texttag tt,real life)
	{
		ccmui
		csttmui("tt",tt)
		stmui(life,false,TextTagLifeTimer)
		//tnull
		tt=null;life=0
	}
	
	/* //триггер смерти виджета
	scope wdea
	{
		define
		{
			trevd(t,w) = TriggerRegisterDeathEvent(t,w)
			trevd(w) = trevd(gtr(wdea),w)
		}
		trae()
	} */
	    
    pr void init()
    {
    	svi( sh(scn), "max", 1100)
		//MUI_tev_init()
		//MUI_tpev_init()
		/*MUI_wdea_init()
		enitr
		endr
		tra(wdea)
		tra(tev) */
	}
}