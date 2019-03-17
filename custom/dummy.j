//Инициализация dummy
#guard dummy
scope Dummy
{
    define {
    
        DUMMY = 'hdum'
        
        dummyunit(u) = Dummy_Dummy[ownplid(u)]
    }
    
    pb unit Dummy[]

    pb void init(int c)
    {
        int i=0
        //setdef DUMMY = c
        while (i<=maxpl)
        {
            Dummy[i] = ucreate(pl(i),DUMMY,0,0,0)
            i++
        }
    
    }
}