//Таймерные триггеры

#guard timer

define
{
	trevt(t,ti,b) = trev##TimerEvent(t,ti,b)
	trevt(ti,b) = trevt(gtr,ti,b)
	trevt(ti) = trevt(ti,false)
	trevt = trevt(0)
	trevpt = trevt(PT)
	trta(t,ti,b) = trae(trevt(t,ti,b))
	trta(ti,b) = trta(gtr,ti,b)
	trta(ti) = trta(ti,false)
	trta = trta(0)
	trpta(ti) = trta(ti,true)
	trpta = trpta(PT)
}

//периодический через 0.01 с.
scope tpev ion
{
	trpta
}

//однократный (через 0 с. начала игры)
scope tev ion
{
	trta
}