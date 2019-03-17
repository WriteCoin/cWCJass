//=============================================================
//=============================================================
// TCLibrary (Библиотека дропа)
//=============================================================
//=============================================================

library TCLibrary initializer init {

    int TC_ID = 0
    int TC_Name[], TC_Picks[]
    real TC_NoDrop[]
    int TC_Item1[], TC_Item2[], TC_Item3[], TC_Item4[], TC_Item5[], TC_Item6[], TC_Item7[], TC_Item8[], TC_Item9[], TC_Item10[]
    real TC_Prob1[], TC_Prob2[], TC_Prob3[], TC_Prob4[], TC_Prob5[], TC_Prob6[], TC_Prob7[], TC_Prob8[], TC_Prob9[], TC_Prob10[]
    bool TC_Send1[], TC_Send2[], TC_Send3[], TC_Send4[], TC_Send5[], TC_Send6[], TC_Send7[], TC_Send8[], TC_Send9[], TC_Send10[]
    
    define {
        private add(name) = {
            TC_ID = TC_ID + 1
            TC_Name[TC_ID] = StringHash(name)
            TC_Picks[TC_ID] = 1
        } 
        private add(name,picks) = {
            TC_ID = TC_ID + 1
            TC_Name[TC_ID] = StringHash(name)
            TC_Picks[TC_ID] = picks
        }
        private add(name,picks,nodrop) = {
            TC_ID = TC_ID + 1
            TC_Name[TC_ID] = StringHash(name)
            TC_Picks[TC_ID] = picks
            TC_NoDrop[TC_ID] = nodrop
        }
        private addi(i,item,prob) = {
            TC_Item##i[TC_ID] = item
            TC_Prob##i[TC_ID] = prob
            TC_Send##i[TC_ID] = true
        }
        private adds(i,item,prob) = {
            TC_Item##i[TC_ID] = StringHash(item)
            TC_Prob##i[TC_ID] = prob
            TC_Send##i[TC_ID] = false
        }
    }
    
    private void init(){
        
    }

    private real DropChance[]
    private real SumItems
    private real Random
    private int I, J, TC_Item
    private bool TC_SendItem
    
    int GetTC_ID(int name)
    {
        int i=0
        whilenot ++i>TC_ID 
        { 
            if TC_Name[i] == name
            {
                return i
                i = TC_ID
            }
        }
        return 0
    }
    
    private real TC_SetProb(int i, int tcid){
        if i==1 { return TC_Prob1[tcid] }
        elseif i==2 { return TC_Prob2[tcid] }
        elseif i==3 { return TC_Prob3[tcid] }
        elseif i==4 { return TC_Prob4[tcid] }
        elseif i==5 { return TC_Prob5[tcid] }
        elseif i==6 { return TC_Prob6[tcid] }
        elseif i==7 { return TC_Prob7[tcid] }
        elseif i==8 { return TC_Prob8[tcid] }
        elseif i==9 { return TC_Prob9[tcid] }
        elseif i==10 { return TC_Prob10[tcid] }
        return 0.
    }

    private bool TC_SetSend(int tcid, int probs_loop){
        if probs_loop == 1 { return TC_Send1[tcid] } 
        elseif probs_loop == 2 { return TC_Send2[tcid] } 
        elseif probs_loop == 3 { return TC_Send3[tcid] } 
        elseif probs_loop == 4 { return TC_Send4[tcid] } 
        elseif probs_loop == 5 { return TC_Send5[tcid] }
        elseif probs_loop == 6 { return TC_Send6[tcid] } 
        elseif probs_loop == 7 { return TC_Send7[tcid] } 
        elseif probs_loop == 8 { return TC_Send8[tcid] } 
        elseif probs_loop == 9 { return TC_Send9[tcid] }
        elseif probs_loop == 10 { return TC_Send10[tcid] }
        return false
    }

    private int TC_SetItem(int tcid, int probs_loop){
        if probs_loop == 1 { return TC_Item1[tcid] } 
        elseif probs_loop == 2 { return TC_Item2[tcid] } 
        elseif probs_loop == 3 { return TC_Item3[tcid] } 
        elseif probs_loop == 4 { return TC_Item4[tcid] } 
        elseif probs_loop == 5 { return TC_Item5[tcid] } 
        elseif probs_loop == 6 { return TC_Item6[tcid] }
        elseif probs_loop == 7 { return TC_Item7[tcid] } 
        elseif probs_loop == 8 { return TC_Item8[tcid] } 
        elseif probs_loop == 9 { return TC_Item9[tcid] } 
        elseif probs_loop == 10 { return TC_Item10[tcid] }
        return 0
    }

    void TC(int tcid, real x, real y) {
        SumItems = TC_NoDrop[tcid] / udg_NPlayers
        I=0
        whilenot (++I>11) 
        { 
            SumItems += TC_SetProb(I,tcid)  
        }
        I=0
        DropChance[1] = (TC_NoDrop[tcid] / udg_NPlayers) / SumItems
        I=1
        whilenot (++I>11) 
        { 
            DropChance[I] = TC_SetProb(I-1,tcid) / SumItems + DropChance[I-1] 
        }
        I=0
        whilenot (++I > TC_Picks[TC_ID])
        {
            Random = GetRandomReal(0,1)
            J=0
            whilenot (++J>10)
            {
                if (Random > DropChance[J]) && (Random <= DropChance[J+1])
                {
                    TC_Item = TC_SetItem(tcid,J)
                    TC_SendItem = TC_SetSend(tcid,J)
                    if TC_SendItem
                    {
                        bj_lastCreatedItem = CreateItem(TC_Item,x,y)
                        SetItemUserData(bj_lastCreatedItem,udg_Wave_Current)
                    }
                    else
                    {
                        tcid = GetTC_ID(TC_Item)
                        TC(tcid, x, y)
                        return
                    }
                }
            }
        }
    }
}
