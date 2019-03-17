scope HarchikovSound
{
	pb int uId

	pb void txtpos()
	{
		ttp( ldtt( hmuiu, scn("texttag") ), ux(muiu), uy(muiu), 200 )
	}
    
    pb void prestart()
    {
        tmtt=ldtt(hmuiu,scn("texttag"))
        ttt(tmtt,"")
        stps(ldsd(hmuiu,scn("snd")))
        tu(muiu,rr(1,2),scn("start"))
    }

	pb void txttime()
	{
		int n=ldi(hmuiu,scn("n")), e=ldi(hh,"e"+i2s(ldi(hmuiu,scn("id"))))+1, idd=ldi(hmuiu,scn("id"))
		tmtt = ldtt(hmuiu,scn("texttag"))
		if isua(muiu)
		{
			ttt( tmtt, lds(hh,"s"+i2s(n)+i2s(idd)), 0.025 )
			//
			if n != e
			{
				if (e-n)==1
				{
				   tu(muiu,ldr(hh,"t"+i2s(n)+i2s(idd))+5,scn("prestart")) 
				else
					isvi(hmuiu,scn("n"))
					tu(muiu, ldr(hh, "t"+i2s(ldi(hmuiu,scn("n")))+i2s(idd)), scn("txttime"))
				}
			}
		}
		//
		n=0; e=0; idd=0
	}
    
    pb void start()
    {
        tmi=ldi(hmuiu,scn("id"))
        while (ldi(hmuiu, scn("id"))==tmi)
        {
            tmi = ri(1, ldi(hh,"id") )
        }
        svi(hmuiu,scn("id"),tmi)
        tmsd = ldsd(hh,"sound"+i2s(tmi))
        sts( tmsd )
        svsd(hmuiu,scn("snd"),tmsd)
        svi(hmuiu,scn("n"),1)
        tmt = tunit( muiu, ldr(hh,"t"+i2s(ldi(hmuiu,scn("n")))+i2s(tmi)), scn("txttime") )
		svt(hmuiu,scn("ti"),tmt)
    }

	define 
	{
        //private harch = "Александр Харчиков"
		private hh = sh(scn)
    	private id = i2s(ldi(hh, "id"))
    	
    	private add(s) =
    	{
    		isvi( hh, "id")
    		svs(hh, "name"+id, s)
    		tmsd = CreateSound( "Music\\" + s + ".mp3", false, false, false, 10, 10, "DefaultEAXON" )
    		svsd(hh, "sound"+id, tmsd)
    	}
    	private add(t,s) = Add(t,s)
    	/*{
            i++
            r+=t
            savereal( hh, "tt"+i2s(i)+id, t)
    		savereal( hh, "t"+i2s(i)+id, t-loadreal(hh,"tt"+i2s(i-1)+id))
    		savestr( hh, "s"+i2s(i)+id, s)
    	}*/
        private adde(t,s) = AddE(t,s)
        /*{
            add(t,s)
            svi(hh,"e"+id,i)
            i=0
            r=0
        }*/
        //private prip; pripe
        //private t(i); tp(i); t1
	}
    
    public void act()
    {
        sve(htru,scn("eff"),sefta("Abilities\\Spells\\Other\\TalkToMe\\TalkToMe.mdl",tru,"overhead"))
        tmtt=ldtt(htru,scn("texttag"))
        if tmtt==null { tmtt=ctt }
    	ttp(tmtt,trux,truy,200)
        tts(tmtt)
    	ttpt(tmtt)
    	svtt(htru,scn("texttag"),tmtt)
        ptu(tru,scn("txtpos"))
        tu(tru,rr(1,2),scn("start"))
    }
	
	pb void hrf()
	{
		if uc(tru) == uId//hrname(tru)==harch
		{
			sve(htru,scn("eff"),sefta("Abilities\\Spells\\Other\\TalkToMe\\TalkToMe.mdl",tru,"overhead"))
			tu(tru,rr(1,2),scn("start"))
		}
	}
    
    pb void udea()
    {
        if uc(tru) == uId//hrname(tru)==harch
        {
            //tthide(loadtt(htru,scn("texttag")))
			//ttdst(loadtt(htru,scn("texttag")))
			ttt(ldtt(htru,scn("texttag")),"")
			//rsvh(htru,scn("texttag"))
            def(lde(htru,scn("eff")))
            stps(ldsd(htru,scn("snd")))
			pt(ldt(htru,scn("ti")))
        }
    }
    
    pb void erc()
    {
    	if uc(tru) == uId//hrname(tru)==harch
    	{
			ExecuteFunc(scn("act"))
    	}
    }
    
    /*pb void uifunc()
    {
    	if hrname(enu)==harch
    	{
    		ExecuteFunc(scn("act"))
    	}
    }*/
    
    pb void Add(real time, string s)
    {
        tmi++
        tmr+=time
        svr( hh, "tt"+i2s(tmi)+id, time)
        svr( hh, "t"+i2s(tmi)+id, time-ldr(hh,"tt"+i2s(tmi-1)+id))
        svs( hh, "s"+i2s(tmi)+id, s)
    }
    pb void AddE(real time, string s)
    {
        Add(time,s)
        svi(hh,"e"+id,tmi)
        tmi=0
        tmr=0
    }
    
    pb void init(int uid)
    {
		uId = uid
	
        tmi=0
        tmr=0
        
    	//Ненавижу Пидорасов (Педерастов)
    	add( "NenavijuPidorasov" )
        //
        add( 6, "Я ненавижу педерастов" )
        add( 10.5, "Я ненавижу лесбиянок" )
        add( 14.6, "Я ненавижу трансвеститов" )
        add( 18.7, "Я ненавижу наркоманов" )
        //
        add( 23, "О, как я их ненавижу" )
        add( 27, "Я их во всём ненавижу" )
        add( 31, "Я их в упор ненавижу" )
        add( 34, "ДА" )
        add( 35, "Потому что я люблю Россию!" )
        //
        add( 39, "Я ненавижу прокуроров" )
        add( 43, " - церберов власти беззаконной" )
        add( 47, "Вышедших в судьи сутенёров" )
        add( 51, "и костоломов из ОМОНа" )
        //
        add( 55, "О, как я их ненавижу" )
        add( 59, "Я их во всём ненавижу" )
        add( 63, "Я их в упор ненавижу" )
        add( 66, "ДА" )
        add( 67, "Потому что я люблю Россию!" )
        //
        add( 71, "Я ненавижу офицеров" )
        add( 75, "Ставших сатрапами режима" )
        add( 78.5, "Я ненавижу изуверов" )
        add( 83, "От телевидения лживых" )
        //
        add( 86.3, "О, как я их ненавижу" )
        add( 90.5, "Я их во всём ненавижу" )
        add( 94, "Я их в упор ненавижу" )
        add( 97, "ДА" )
        add( 98, "Потому что я люблю Россию!" )
        //
        add( 102, "Я ненавижу диссидентов" )
        add( 106, "- подлых предателей России" )
        add( 109.7, "Я ненавижу резидентов" )
        add( 113.8, "что в депутаты проскочили!" )
        //
        add( 117.3, "О, как я их ненавижу" )
        add( 121, "Я их во всём ненавижу" )
        add( 125, "Я их в упор ненавижу" )
        add( 128, "ДА" )
        add( 129, "Потому что я люблю Россию!" )
        //
        add( 133, "Я ненавижу паразитов" )
        add( 137, "мордоворот - дегенератов" )
        add( 140.7, "Местных зажравшихся бандитов" )
        add( 144, "пришлых иудоплутократов" )
        //
        add( 148, "О, как я их ненавижу" )
        add( 152, "Я их во всём ненавижу" )
        add( 155.5, "Я их в упор ненавижу" )
        add( 158.8, "ДА" )
        add( 159.5, "Потому что я люблю Россию!" )
        //
        add( 163.3, "Я ненавижу всех лакеев" )
        add( 167, "Я ненавижу всех холуев" )
        add( 171, "Я ненавижу фарисеев" )
        add( 175, "и новоявленных буржуев!" )
        //
        add( 179, "О, как я их ненавижу" )
        add( 183, "Я их во всём ненавижу" )
        add( 187, "Я их в упор ненавижу" )
        add( 190, "ДА" )
        add( 191, "Потому что я люблю Россию!" ) 
        //
        add( 194, "Я ненавижу партократов -" )
        add( 198, "постперестроечных шакалов" )
        add( 201.7, "Я ненавижу демократов" )
        add( 205, "я ненавижу либералов!" )
        //
        add( 209, "О, как я их ненавижу" )
        add( 213, "Я их во всём ненавижу" )
        add( 217, "Я их в упор ненавижу" )
        add( 220, "ДА" )
        add( 221, "Потому что я люблю Россию!" ) 
        //
        add( 224.7, "О, как я их ненавижу" )
        add( 228, "Я их во всём ненавижу" )
        add( 232, "Я их в упор ненавижу" )
        add( 235.3, "ДА" )
        adde( 236, "Потому что я люблю Россию!" )
        
        //Путин - враг России
    	add( "PutinVragRossii" )
        //
        add( 4.7, "Кто опускает нашу Россию" )
        add( 9.6, "В колониальный ад?" )
        add( 13.6, "Явный изменник, явный насильник," )
        add( 18, "Родины... дегенерат!" )
        
        add( 22, "Кто добивает космос советский,")
        add( 26.3, "Армию гробит и флот?" )
        add( 30.7, "Прихвостень Штатов, регент немецкий")
        add( 35, "Их завербованный крот!")
        
        add( 39, "Кто, продолжая кОзни Боруха,")
        add( 43.3, "Множит пространство могил?")
        add( 47.7, "Новый гарант развала и блуда,")
        add( 52, "Первый по рангу вампир!")
        
        add( 56, "Верный холоп ельцинской банды,")
        add( 60.3, "Капиталистов слуга,")
        add( 64.7, "Бедных мучитель, раб олигархов,")
        add( 68.7, "Подлое семя врага!")
        
        add( 72.7, "НАТОвцам служит, правит - не тужит,")
        add( 76.7, "В тюрьмы героев сдаёт,")
        add( 80.7, "С трезвым цинизмом в русские души")
        add( 85, "Смачно и грубо плюёт!")
        
        add( 89, "Как Старовойтова, как Березовский,")
        add( 93, "Как пресловутый Собчак,")
        add( 97, "Этот пигмей и отморозок")
        add( 101.5, "Рушит родимый очаг!")
        
        add( 106, "Экс-палачей от кары спасает,")
        add( 110, "Нагло согражданам врёт,")
        add( 114, "Наших друзей в беде оставляет,")
        add( 118, "Недругам славу поёт!")
        
        add( 123, "Худший из худших, в своре бездарных")
        add( 127, "Всем Геростратам - пример,")
        add( 131, "Полу-полковник, полу-исправник,")
        add( 135, "Полу-юрист - лицемер!")
        
        add( 139, "Всю, как на блюдечке, землю родную")
        add( 143, "Рад бы ворам поднести")
        add( 147.5, "Их протеже с душонкой холуя")
        add( 152, "Засланный в кремль трансвестит!")
        
        add( 156, "С ним иудеи нас угнетают,")
        add( 160, "Янки за горло берут,")
        add( 164, "С ним наше всё у нас отнимают")
        add( 168, "И на торгах продают...")
        
        add( 172, "Хватит скулить, хватит как быдло")
        add( 176, "Манны небесной ждать!")
        add( 180, "Чтобы не сгинуть, чтоб не погибнуть,")
        add( 184, "Выход один - восстать!")
        
        add( 188, "Крысы плодятся, народ вымирает,")
        add( 192, "В доме устроен кабак.")
        add( 196, "Марионетка русскими правит...")
        adde( 200, "Путин -... России... враг!!!")
        
    	if rndi(1,2)==1 {
        
            add( "Reihsfhurer" ) 
            
            /*setdef t(1) = tmr+8
            setdef t(2) = tmr+5
            setdef t(3) = tmr+4.5
            setdef t(4) = tmr+4.5
            
            setdef tp(1) = tmr + 4.7
            setdef tp(2) = tmr + 4.8
            setdef tp(3) = tmr + 4.5
            setdef tp(4) = tmr + 4.5*/
            
            //setdef prip = add( tp1, "Луч солнца сияет на наших клинках," ); add( tp2, "Несущих нордический свет." ); add( tp3, "Запомни ! Рейхсфюрер пребудет в веках" ); add( tp4, "С последним, хранящим завет." )
            
            /*setdef prip1 = add( tp1, "Луч солнца сияет на наших клинках," )
            setdef prip2 = add( tp2, "Несущих нордический свет." )
            setdef prip3 = add( tp3, "Запомни ! Рейхсфюрер пребудет в веках" )
            setdef prip4 = add( tp4, "С последним, хранящим завет." )*/
            
            //setdef prip3 = prip1 ## prip2 ## prip3
                           
            //setdef pripa = prip3 ## prip(4)
                          
            //setdef pripe = prip3 ## adde( tp(4), "С последним, хранящим завет." )
            
            add( 8, "Король королей, повелитель времён" )
            add( 13, "Из чаши Грааля глядит на меня," )
            add( 17.5, "Сиянием Чёрной Луны озарён" )
            add( 22, "Учитель Закона в Короне Огня." )
            
            add( 26.7, "Луч солнца сияет на наших клинках," )
            add( 31.5, "Несущих нордический свет." )
            add( 36, "Запомни ! Рейхсфюрер пребудет в веках" )
            add( 40.5, "С последним, хранящим завет." )
            
            add( 45, "Нежданный пришелец из сумрачных снов," )
            add( 50, "Забытых мистерий оживший герой," )
            add( 54.5, "Суровый воитель, магистр орденов," )
            add( 59, "Что жизнь на земле почитали игрой." )
            
            add( 63, "Луч солнца сияет на наших клинках," )
            add( 68, "Несущих нордический свет." )
            add( 72.6, "Запомни ! Рейхсфюрер пребудет в веках" )
            add( 77, "С последним, хранящим завет." )
            
            add( 82, "Могучий наместник неведомых сил," )
            add( 86, "Навеки отринувший зло и добро," )
            add( 90.7, "Великую истину провозгласил," )
            add( 95, "И молнией вспыхнуло рун серебро !" )
            
            add( 99, "Луч солнца сияет на наших клинках," )
            add( 104, "Несущих нордический свет." )
            add( 108.6, "Запомни ! Рейхсфюрер пребудет в веках" )
            add( 113, "С последним, хранящим завет." )
            
            add( 118, "От моря степей до полярных морей," )
            add( 122, "От южных пустынь до арктических льдов" )
            add( 127.5, "Воитель по имени Гиперборей" )
            add( 131, "Пройдёт по колено в крови городов." )
            
            add( 135, "Луч солнца сияет на наших клинках," )
            add( 140, "Несущих нордический свет." )
            add( 144.5, "Запомни ! Рейхсфюрер пребудет в веках" )
            add( 149, "С последним, хранящим завет." )
            
            add( 154, "Погибнуть за Рейх - это лучший исход," )
            add( 158, "Сражаться за Север - вот избранный путь," )
            add( 163, "Ведь честь наша - верность, и кровь наша лёд," )
            add( 167, "И Время мы призваны вспять повернуть." )
            
            add( 171.5, "Луч солнца сияет на наших клинках," )
            add( 176, "Несущих нордический свет." )
            add( 181, "Запомни ! Рейхсфюрер пребудет в веках" )
            add( 185.5, "С последним, хранящим завет." )
            
            add( 190, "Восстаньте, потомки нордических рас!" )
            add( 195, "Придите, герои последнего дня!" )
            add( 199, "Рейхсфюрер ведёт нас, и в гибельный час" )
            add( 204, "Да примет Вальхалла тебя и меня !" )
            
            add( 208, "Луч солнца сияет на наших клинках," )
            add( 213, "Несущих нордический свет." )
            add( 217.5, "Запомни ! Рейхсфюрер пребудет в веках" )
            add( 222, "С последним, хранящим завет." )
            add( 226.7, "Запомни ! Рейхсфюрер пребудет в веках" )
            adde( 231.3, "С последним, хранящим завет." )
        }
        
        //Революция вернётся
    	add( "RevolutchiyaVernetsya" )
        
        /*setdef t(1) = tmr+6
        setdef t(2) = tmr+5
        setdef t(3) = tmr+4
        setdef t(4) = tmr+5*/
        
        add( 10.3, "Я знаю: скоро к нам вернётся Революция,")
        add( 15.2, "И лишь в Её огне воскреснет мой народ.")
        add( 20, "За муки тяжкие, за слёзы наши жгучие")
        add( 25, "Врагов Отечества возмездие найдёт!")
        
        add( 29.5, "Я знаю: Русская Надежда скоро сбудется,")
        add( 34.4, "Я знаю: наше исцеленье впереди,")
        add( 39, "Я знаю: будет праздник и на нашей улице,")
        add( 44, "Где станут воинами русские вожди!")
        add( 49, "Я знаю: будет праздник и на нашей улице,")
        add( 53.6, "Где станут воинами русские вожди!")
        
        add( 58.5, "Я знаю, знаю: над моею милой Родиной")
        add( 63,"Звезда высокая победная взойдёт.")
        add( 68,"И либеральная преступная уродина")
        add( 73,"Нечистым духом в преисподнюю взойдёт!")
        add( 77.6,"И либеральная преступная уродина")
        add( 82.6,"Нечистым духом в преисподней пропадёт!")
        
        add( 87.1,"Пусть только грянет гром, и затрепещут подлые")
        add( 92,"Сиделец думский и банкир, и телешут! ")
        add( 96.7,"Гуртом и в розницу трусливые, безродные,")
        add( 101.7,"Как тараканы, из России побегут! ")
        add( 106.4,"Гуртом и в розницу трусливые, безродные,")
        add( 111.3,"Как тараканы, из России побегут! ")
        
        add( 116,"Спасая шкуры, побросав личины зверские,")
        add( 121,"Продаст хозяев с потрохами пёс ОМОН,")
        add( 125.6,"И сам с себя сорвёт погоны офицерские")
        add( 130.5,"Сатрап, из танка убивавший Белый Дом!")
        add( 135.15,"И сам с себя сорвёт погоны офицерские")
        add( 140,"Сатрап, из танка убивавший Белый Дом!")
        
        add( 147.2,"Пока живу, пока дышу, борюсь! И верю я:")
        add( 152,"Зачтётся каждому геройство и вина,")
        add( 157,"Минует смутное, холодное безвременье,")
        add( 162,"И, наконец, с колен поднимется страна!")
        add( 166.5,"Минует смутное, холодное безвременье,")
        add( 172,"И, наконец, с колен поднимется страна!")
        
        add( 176,"Освобождение России - Революция!")
        add( 181,"В огне сражения воскреснет мой народ!")
        add( 186,"За муки тяжкие, за слёзы наши жгучие")
        add( 190.5,"Врагов Отечества возмездие найдёт!")
        add( 195.1,"Им отольются слёзы русские горючие,")
        add( 200,"А к нам святое искупление ПРИДЁТ!")
        adde( 206,"ПРИДЁТ! ПРИДЁТ!..")
        
    	add( "SositePivo" )
        
        //setdef t1 = tmr
        
        //msgr(t1+4)
        add(4,"Рабы, сосите пиво, расплата у дверей.")
        //msgr(t1)-
        add(8,"Сатрапы Тель-Авива вас держат за зверей")
        //msgr(t1)
        add(12,"Вас травят алкоголем, вам наркоту суют")
        //msgr(t1)
        add(16,"И вашу земли гои агрессорам сдают.")
        add(20,"Рабы, сосите пиво, расплата у дверей.")
        add(24,"Сатрапы Тель-Авива вас держат за зверей")
        
        add(28,"Но вы аполитичны, вам на борьбу плевать")
        add(32,"Для вас всегда первично лишь выпить да пожрать.")
        add(36,"Иметь бы тачку рядом, да тёлку без идей,")
        add(40,"Да ящик с телеядом, калечащий людей.")
        add(44,"Но вы аполитичны, вам на борьбу плевать")
        add(48,"Для вас всегда первично лишь выпить да пожрать")
        
        add(52,"Тупые остолопы, ходячие столбы,")
        add(56,"Посмешище Европы российские рабы.")
        add(60,"Вы все не равнодушны к хозяйскому кнуту,")
        add(64,"Вы все давно послушны узде и хомуту.")
        add(68,"Рабы демократично историю творят,")
        add(72,"Рабы педерастично о рынке говорят.")
        
        add(76,"Рабы, а вам не жутко, лакая и жуя")
        add(80,"Внимать весёлым шуткам кремлёвского ворья?")
        add(84,"Вы разум свой пропили, вы помогли врагу")
        add(88,"Живую Мать-Россию заколотить в гробу.")
        add(91.5,"Рабы, а вам не жутко лакая и жуя")
        add(95.5,"Дивиться прибауткам кремлёвского ворья?")
        
        add(99.2,"Вы с совестью простились, вы потеряли стыд,")
        add(103.5,"Вы в очередь столпились у выборных корыт.")
        add(107.2,"Вы к Богу обратились для красного словца,")
        add(111.1,"Из моды окрестились, не веруя в Христа.")
        add(115,"Вы в очередь столпились у выборных корыт,")
        add(119,"Вы с совестью простились, вы потеряли стыд.")
        
        add(123,"Лакейская порода, холопствующий сброд,")
        add(127,"Вам не нужна свобода, вам плохо без господ.")
        add(131,"Электрорат безликий, двуногое дубьё,")
        add(134.6,"Вы прадедов великих гнилое отребьё,")
        add(138.5,"Электрорат безликий, двуногое дубьё.")
        add(142,"Вы прадедов великих гнилоё отребьё")
        
        add(146,"Рабы сосите пиво насилуйте кишки,")
        add(150,"Вбивайте рок визгливый в куриные мозги.")
        add(154,"Воров адвокатура, предателей рука,")
        add(158,"Лишь собственная шкура вам в жизни дорога.")
        add(161.4,"Рабы сосите пиво, насилуйте кишки.")
        add(165.5,"Вбивайте рок визгливый в куриные мозги.")
        
        add(169.3,"Расплата у порога. Воспрянув ото сна,")
        add(173.1,"Отбросит крышку гроба родимая страна.")
        add(177.16,"И вновь единым махом, восстав среди невзгод")
        add(181.15,"Без жалости и страха раба в себе убьёт.")
        add(184.99,"И волею единой над бандою иуд")
        add(188.7,"Свершит неумолимый и справедливый суд.")
        add(192.7,"И волею единой над бандою иуд")
        adde(196.7,"Свершит неумолимый и справедливый суд!")
        
        //undef t1
        
    	add( "UbeiJida" )
        
        add( 24, "Сквозь стоны, гам и плач, и сквозь дебильный смех")
        add( 29, "Услышь мои слова,запомни навсегда,")
        add( 33, "О, русский: ВСЕМ  ЖИДАМ  НЕ ВЗЯТЬ ТЕБЯ ВОВЕК,")
        add( 38, "КОГДА ТЫ САМ  В   СЕБЕ   УБЬЁШЬ   ЖИДА ! ")
        add( 42, " Убей   в   себе   жида ,  убей   в   себе   жида ,")
        add( 47, " Убей  в самом  себе   жида !")
        
        add( 52, "Гноючие глаза скорее промывай,")
        add( 56, "И знай: не для тебя ослиная узда!")
        add( 61, "Злачёному скоту души не отдавай,")
        add( 65, " Убей ,  убей   в   себе   жида !")
        add( 70, " Убей   в   себе   жида ,  убей   в   себе   жида ,")
        add( 75, " Убей ,  убей   в   себе   жида !") 
        
        add( 79, "Безудержный обман, стяжательства дурман")
        add( 83.5, "И лица без стыда, и руки без труда")
        add( 88, "Иудаизма хлам. Швырни его ворам")
        add( 93, " Убей ,  убей   в   себе   жида !")
        add( 98, " Убей   в   себе   жида ,  убей   в   себе   жида ,")
        add( 103, " Убей ,  убей   в   себе   жида !")
        
        add( 106, "Разбей гнилой экран! Скажи: \"No pasaran!\"")
        add( 111, "Паскудному вранью, развратному жулью.")
        add( 115, "Снимай хомут с души,  жида   в   себе  круши")
        add( 119.5, " Убей ,  убей   в   себе   жида !")
        add( 124, " Убей   в   себе   жида ,  убей   в   себе   жида ,")
        add( 128, " Убей  в самом  себе   жида !")
        
        add( 133, "Заразную мораль не прячь, не укрывай")
        add( 137, "От совести своей, от Божьего Суда,")
        add( 141.5, "По каплям из  себя  выдавливай ,сливай")
        add( 146, " Убей ,  убей   в   себе   жида !")
        add( 150, " Убей   в   себе   жида ,  убей   в   себе   жида ,")
        add( 155, " Убей  в самом  себе   жида !")
        
        add( 159, "Твой враг - в тебе самом. И зло, и зависть - в нём.")
        add( 164, "Он - все твои грехи, он - вся твоя беда.")
        add( 168, "Пусть жгут тебя огнём, стучат в тебя, как гром,")
        add( 173, "Слова: \" УБЕЙ   В   СЕБЕ   ЖИДА !\"")
        add( 177.5, " Убей   в   себе   жида ,  убей   в   себе   жида ,")
        add( 182, " Убей ,  убей   в   себе   жида !")
        add( 186, " Убей   в   себе   жида ,  убей   в   себе   жида ,")
        add( 190, "О человек! Убей в себе жида!")
        add( 196, " Убей   в   себе   жида ,  убей   в   себе   жида ,")
        adde( 199, " Убей ,  убей   в   себе   ЖИДА !")
        
		tra(erc)
		tra(udea)
		tra(hrf)
    }
}