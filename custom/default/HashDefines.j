library HashDefines 
{
    
    hashtable Hash = InitHashtable()
    
    define
    {
        SaveStatBool(handleid, s,  value) = SaveBoolean(Hash, handleid, StringHash(s), value)
        LoadStatBool(handleid, s) = LoadBoolean(Hash, handleid, StringHash(s))
        SaveBool(handleid, i, value) = SaveBoolean(Hash, handleid, i, value)
        LoadBool(handleid, i) = LoadBoolean(Hash, handleid, i)
        SaveStatInt(handleid, s, value) = SaveInteger(Hash, handleid, StringHash(s), value)
        LoadStatInt(handleid, s) = LoadInteger(Hash, handleid, StringHash(s))
        SaveInt(handleid, i, value) = SaveInteger(Hash, handleid, i, value)
        LoadInt(handleid, i) = LoadInteger(Hash, handleid, i)
        SaveIncStatInt(handleid, s, value) = SaveInteger(Hash, handleid, StringHash(s), LoadInteger(Hash, handleid, StringHash(s))+value)
        SaveIncInt(handleid, i, value) = SaveInteger(Hash, handleid, i, LoadInteger(Hash, handleid, i)+value)
        SaveStatReal(handleid, s, value) = SaveReal(Hash, handleid, StringHash(s), value)
        LoadStatReal(handleid, s) = LoadReal(Hash, handleid, StringHash(s))
        <SaveReal(handleid, i, value)> = SaveReal(Hash, handleid, i, value)
        <LoadReal(handleid, i)> = LoadReal(Hash, handleid, i)
        SaveIncStatReal(handleid, s, value) = SaveReal(Hash, handleid, StringHash(s), LoadReal(Hash, handleid, StringHash(s))+value)
        SaveUnit(handleid, i, value) = SaveUnitHandle(Hash, handleid, i, value)
        SaveStatUnit(handleid, s, value) = SaveUnitHandle(Hash, handleid, StringHash(s), value)
        LoadUnit(handleid, i) = LoadUnitHandle(Hash, handleid, i)
        LoadStatUnit(handleid, s) = LoadUnitHandle(Hash, handleid, StringHash(s))
        <SaveStr(handleid, i, value)> = SaveStr(Hash, handleid, i, value)
        <LoadStr(handleid, i, value)> = LoadStr(Hash, handleid, i)
        SavePreIncStr(handleid, i, value) = SaveStr(Hash, handleid, i, value+LoadStr(Hash, handleid, i))
        SavePostIncStr(handleid, i, value) = SaveStr(Hash, handleid, i, LoadStr(Hash, handleid, i)+value)
        SaveStatStr(handleid, s, value) = SaveStr(Hash, handleid, StringHash(s), value)
        SavePreIncStatStr(handleid, s, value) = SaveStr(Hash, handleid, StringHash(s), value+LoadStr(Hash, handleid, StringHash(s)))
        SavePostIncStatStr(handleid, s, value) = SaveStr(Hash, handleid, StringHash(s), LoadStr(Hash, handleid, StringHash(s))+value)
        LoadStatStr(handleid, s) = LoadStr(Hash, handleid, StringHash(s))
        SaveStatEff(handleid, s, value) = SaveEffectHandle(Hash, handleid, StringHash(s), value)
        LoadStatEff(handleid, s) = LoadEffectHandle(Hash, handleid, StringHash(s))
        SaveStatGrp(handleid, s, value) = SaveGroupHandle(Hash, handleid, StringHash(s), value)
        LoadStatGrp(handleid, s) = LoadGroupHandle(Hash, handleid, StringHash(s))
        SaveStatRect(handleid, s, value) = SaveRectHandle(Hash, handleid, StringHash(s), value)
        LoadStatRect(handleid, s) = LoadRectHandle(Hash, handleid, StringHash(s))
        SaveStatReg(handleid, s, value) = SaveRegionHandle(Hash, handleid, StringHash(s), value)
        LoadStatReg(handleid, s) = LoadRegionHandle(Hash, handleid, StringHash(s))
        SaveStatBoolExpr(handleid, s, value) = SaveBooleanExprHandle(Hash, handleid, StringHash(s), value)
        LoadStatBoolExpr(handleid, s) = LoadBooleanExprHandle(Hash, handleid, StringHash(s))
        SaveStatTimer(handleid, s, value) = SaveTimerHandle(Hash, handleid, StringHash(s), value)
        LoadStatTimer(handleid, s) = LoadTimerHandle(Hash, handleid, StringHash(s))
        SaveStatPlayer(handleid, s, value) = SavePlayerHandle(Hash, handleid, StringHash(s), value)
        LoadStatPlayer(handleid, s) = LoadPlayerHandle(Hash, handleid, StringHash(s))
        SaveStatLtng(handleid, s, value) = SaveLightningHandle(Hash, handleid, StringHash(s), value)
        LoadStatLtng(handleid, s) = LoadLightningHandle(Hash, handleid, StringHash(s))
        
        FlushChildHash(h) = FlushChildHashtable(Hash, h)
    }
    
    void TriggerRegisterEnterRect(trigger trig,rect r)
    {
        region rectRegion = CreateRegion()
        RegionAddRect(rectRegion, r)
        SaveStatRect(GetHandleId(rectRegion),"rect",r)
        TriggerRegisterEnterRegion(trig, rectRegion, null)
        rectRegion=null
    }

    rect Reg2Rect(region reg)
    { 
        return LoadStatRect(GetHandleId(reg),"rect")
    }
}