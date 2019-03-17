library raw
{
	define
	{
		a2s(a) = raw_A2S(a)
		s2a(s) = raw_S2A(s)
	}

	pb string RAWSTR[]
	pb int RAWINT[]
	
	pr int Char2Ascii(string s)
	{
        int a
        if ("\\"== s)
		{
            return 92
        }
        a=RAWINT[sh(s)/0x1F0748+0x3EA]
        if (s!=RAWSTR[a])
		{
            return a+32
        }
        return a
    }

    pr string Ascii2Char(int a)
	{
        return RAWSTR[a]
    }
	
    pb string A2S(int a)
	{
        string s=""
        loop
		{
            s=RAWSTR[a-a/256*256]+s
            a/=256
            exitwhen 0==a
        }
        return s
    }

    pb int S2A(string s)
	{
		int a=0,l=sh(s),j = 0,h
		string m
        loop
		{
            exitwhen j==l
            m=subs(s,j,j+1)
            if (m == "\\")
			{
                a=a*256+92
            else
                h=RAWINT[sh(m)/0x1F0748+0x3EA]
                if (m!=RAWSTR[h])
				{
                    a=a*256+h+32
                else
                    a=a*256+h
                }
            }
            j++
        }
        return a
    }
}

/*
raw_RAWINT[931]=8
raw_RAWINT[1075]=9
raw_RAWINT[1586]=10
raw_RAWINT[1340]=12
raw_RAWINT[412]=13
raw_RAWINT[198]=32
raw_RAWINT[1979]=33
raw_RAWINT[1313]=34
raw_RAWINT[1003]=35
raw_RAWINT[1264]=36
raw_RAWINT[983]=37
raw_RAWINT[1277]=38
raw_RAWINT[306]=39
raw_RAWINT[904]=40
raw_RAWINT[934]=41
raw_RAWINT[917]=42
raw_RAWINT[1972]=43
raw_RAWINT[1380]=44
raw_RAWINT[1985]=45
raw_RAWINT[869]=46
raw_RAWINT[1906]=47
raw_RAWINT[883]=48
raw_RAWINT[1558]=49
raw_RAWINT[684]=50
raw_RAWINT[582]=51
raw_RAWINT[668]=52
raw_RAWINT[538]=53
raw_RAWINT[672]=54
raw_RAWINT[1173]=55
raw_RAWINT[71]=56
raw_RAWINT[277]=57
raw_RAWINT[89]=58
raw_RAWINT[1141]=59
raw_RAWINT[39]=60
raw_RAWINT[1171]=61
raw_RAWINT[51]=62
raw_RAWINT[305]=63
raw_RAWINT[0]=64
raw_RAWINT[222]=65
raw_RAWINT[178]=66
raw_RAWINT[236] =67
raw_RAWINT[184]=68
raw_RAWINT[1295]=69
raw_RAWINT[1390]=70
raw_RAWINT[1276]=71
raw_RAWINT[203]=72
raw_RAWINT[1314]=73
raw_RAWINT[209]=74
raw_RAWINT[1315]=75
raw_RAWINT[170]=76
raw_RAWINT[1357]=77
raw_RAWINT[1343]=78
raw_RAWINT[1397]=79
raw_RAWINT[1420]=80
raw_RAWINT[1419]=81
raw_RAWINT[1396]=82
raw_RAWINT[1374]=83
raw_RAWINT[1407]=84
raw_RAWINT[499]=85
raw_RAWINT[1465]=86
raw_RAWINT[736]=87
raw_RAWINT[289]=88
raw_RAWINT[986]=89
raw_RAWINT[38]=90
raw_RAWINT[1230]=91
raw_RAWINT[1636]=93
raw_RAWINT[1416]=94
raw_RAWINT[1917]=95
raw_RAWINT[217]=96
raw_RAWINT[833]=123
raw_RAWINT[1219]=124
raw_RAWINT[553]=125
raw_RAWINT[58]=126
raw_RAWSTR[8]="\b"
raw_RAWSTR[9]="\t"
raw_RAWSTR[10]="\n"
raw_RAWSTR[12]="\f"
raw_RAWSTR[13]="\r"
raw_RAWSTR[32]=" "
raw_RAWSTR[33]="!"
raw_RAWSTR[34]="\""
raw_RAWSTR[35]="#"
raw_RAWSTR[36]="$"
raw_RAWSTR[37]="%"
raw_RAWSTR[38]="&"
raw_RAWSTR[39]="'"
raw_RAWSTR[40]="("
raw_RAWSTR[41]=")"
raw_RAWSTR[42]="*"
raw_RAWSTR[43]="+"
raw_RAWSTR[44]=","
raw_RAWSTR[45]="-"
raw_RAWSTR[46]="."
raw_RAWSTR[47]="/"
raw_RAWSTR[48]="0"
raw_RAWSTR[49]="1"
raw_RAWSTR[50]="2"
raw_RAWSTR[51]="3"
raw_RAWSTR[52]="4"
raw_RAWSTR[53]="5"
raw_RAWSTR[54]="6"
raw_RAWSTR[55]="7"
raw_RAWSTR[56]="8"
raw_RAWSTR[57]="9"
raw_RAWSTR[58]=":"
raw_RAWSTR[59]=";"
raw_RAWSTR[60]="<"
raw_RAWSTR[61]="="
raw_RAWSTR[62]=">"
raw_RAWSTR[63]="?"
raw_RAWSTR[64]="@"
raw_RAWSTR[65]="A"
raw_RAWSTR[66]="B"
raw_RAWSTR[67]="C"
raw_RAWSTR[68]="D"
raw_RAWSTR[69]="E"
raw_RAWSTR[70]="F"
raw_RAWSTR[71]="G"
raw_RAWSTR[72]="H"
raw_RAWSTR[73]="I"
raw_RAWSTR[74]="J"
raw_RAWSTR[75]="K"
raw_RAWSTR[76]="L"
raw_RAWSTR[77]="M"
raw_RAWSTR[78]="N"
raw_RAWSTR[79]="O"
raw_RAWSTR[80]="P"
raw_RAWSTR[81]="Q"
raw_RAWSTR[82]="R"
raw_RAWSTR[83]="S"
raw_RAWSTR[84]="T"
raw_RAWSTR[85]="U"
raw_RAWSTR[86]="V"
raw_RAWSTR[87]="W"
raw_RAWSTR[88]="X"
raw_RAWSTR[89]="Y"
raw_RAWSTR[90]="Z"
raw_RAWSTR[92]="\\"
raw_RAWSTR[97]="a"
raw_RAWSTR[98]="b"
raw_RAWSTR[99]="c"
raw_RAWSTR[100]="d"
raw_RAWSTR[101]="e"
raw_RAWSTR[102]="f"
raw_RAWSTR[103]="g"
raw_RAWSTR[104]="h"
raw_RAWSTR[105]="i"
raw_RAWSTR[106]="j"
raw_RAWSTR[107]="k"
raw_RAWSTR[108]="l"
raw_RAWSTR[109]="m"
raw_RAWSTR[110]="n"
raw_RAWSTR[111]="o"
raw_RAWSTR[112]="p"
raw_RAWSTR[113]="q"
raw_RAWSTR[114]="r"
raw_RAWSTR[115]="s"
raw_RAWSTR[116]="t"
raw_RAWSTR[117]="u"
raw_RAWSTR[118]="v"
raw_RAWSTR[119]="w"
raw_RAWSTR[120]="x"
raw_RAWSTR[121]="y"
raw_RAWSTR[122]="z"
raw_RAWSTR[91]="["
raw_RAWSTR[93]="]"
raw_RAWSTR[94]="^"
raw_RAWSTR[95]="_"
raw_RAWSTR[96]="`"
raw_RAWSTR[123]="{"
raw_RAWSTR[124]="|"
raw_RAWSTR[125]="}"
raw_RAWSTR[126]="~"
*/