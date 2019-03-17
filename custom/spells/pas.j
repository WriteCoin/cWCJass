scope pas init on
{
    pr void dmgs()
    {
        if uhsp(tru,'A00B') && !(isdum(dm))
        {
            isvi(htru,scn("a"),-1)
        }
    }

    pr void ua()
    {
        if uhsp(tru,'A00B')
        {
            isvi(htru,scn("a"))
            if ldi(htru,scn("a"))>3
            {
                uio(atu,"stop")
            }
        }
    }
    
    pr void init()
    {
        tra(ua)
        tra(dmgs)
    }
}