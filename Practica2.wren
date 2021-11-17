// title:  Decantacion
// author: eqa
// desc:   Practica 2 FIS
// script: wren
import "random" for Random

class Game is TIC{

	construct new(){
		_t=0
		_aux = []
		_main = []
	}

	generarPalabra(){
		var ran = Random.new()
		var a = ran.int(0,3)
		if(a == 0){
			return "ACEITE"
		}
		if(a == 1){
			return " AGUA "
		}
		if(a == 2){
			return "HIERRO"
		}
	}

	draw_interfaz(){
		//color fondo
		TIC.cls(7)
		//vaso auxiliar
		TIC.spr(272,60,53,8,3,0,0,2,2)
		//vaso principal (en dos partes)
		TIC.spr(274,120,37,8,4,0,0,2,2)
		TIC.spr(258,120,5,8,4,0,0,2,1)
		//botones: generar, vaciar y salir
		TIC.spr(260,30,110,8,1,0,0,6,2)
		TIC.spr(324,100,110,8,1,0,0,6,2)
		TIC.spr(292,170,110,8,1,0,0,6,2)
	}

	TIC(){
		draw_interfaz()

		//palabras prueba
		//TIC.print("HIERRO",67,75,1)
		/*
		TIC.print(" AGUA",137,68,1)
		TIC.print("ACEITE",137,85,1)
		TIC.print("HIERRO",137,47,1)
		*/


		//debug
		TIC.print("%(generarPalabra())",67,75,1)

	}
}

// <TILES>
// 001:eccccccccc888888caaaaaaaca888888cacccccccacc0ccccacc0ccccacc0ccc
// 002:ccccceee8888cceeaaaa0cee888a0ceeccca0ccc0cca0c0c0cca0c0c0cca0c0c
// 003:eccccccccc888888caaaaaaaca888888cacccccccacccccccacc0ccccacc0ccc
// 004:ccccceee8888cceeaaaa0cee888a0ceeccca0cccccca0c0c0cca0c0c0cca0c0c
// 017:cacccccccaaaaaaacaaacaaacaaaaccccaaaaaaac8888888cc000cccecccccec
// 018:ccca00ccaaaa0ccecaaa0ceeaaaa0ceeaaaa0cee8888ccee000cceeecccceeee
// 019:cacccccccaaaaaaacaaacaaacaaaaccccaaaaaaac8888888cc000cccecccccec
// 020:ccca00ccaaaa0ccecaaa0ceeaaaa0ceeaaaa0cee8888ccee000cceeecccceeee
// </TILES>

// <SPRITES>
// 002:880ddddd880ddddd880ddddd8800dddd880ddcdd880ddcdd880ddcdd880ddcdd
// 003:dddde088dddde088dddde088dddde088dddde088dddde088dddde088dddde088
// 004:8888000088806666880666668066666606666000066600660666006606660066
// 005:0000000066666666666666666666666666000060060066606600666066000060
// 006:0000000066666666666666666666666606606000066060060060600600006000
// 007:0000000066666666666666666666666606000066660066066600660606006606
// 008:0000000066666666666666666666666660000660006600600066006000000060
// 009:0000888866660888666660886666660800066660066066600660666006606660
// 016:888888888888888800dddddd80dddddd80ddcddd800dcddd80ddcddd80dddddd
// 017:8888888888888888ddddde00ddddde08ddddde08ddddde08ddddde08ddddde08
// 018:8800dcdd880ddddd880ddddd880ddddd880ddddd8800dddd880ddddd880ddddd
// 019:dddde088dddde088dddde088dddde088dddde088dddde088dddde088dddde088
// 020:0666006006660066066600660666600080666666880666668880666688880000
// 021:0600666006006660060066606600006066666666666666666666666600000000
// 022:0600600606606006066060060660600066666666666666666666666600000000
// 023:6600006666006606660066060600660666666666666666666666666600000000
// 024:0066006000660060006600600066006066666666666666666666666600000000
// 025:0006666006606660066066600660666066666608666660886666088800008888
// 032:80dddddd80dddddd80dddddd80dddddd80ddcddd880dcddd880ddcdd88800000
// 033:ddddde08ddddde08ddddde08ddddde08ddddde08dddde088dddee08800000888
// 034:880ddcdd880ddcdd8800dddd880ddddd880ddddd880ddddd820ddddd22222222
// 035:dddde088dddde088dddde088dddde088dddde088dddde088dddde02822222222
// 036:8888000088802222880222228022222202222222022222220222222202222222
// 037:0000000022222222222222222222222222000002220020022200222222000002
// 038:0000000022222222222222222222222220000220002200200022002000000020
// 039:0000000022222222222222222222222202220000022220020222200202222002
// 040:0000000022222222222222222222222220000222200220222002202220022022
// 041:0000888822220888222220882222220822222220222222202222222022222220
// 052:0222222202222222022222220222222280222222880222228880222288880000
// 053:2222200222222002220020022200000222222222222222222222222200000000
// 054:0022002000220020002200200022002022222222222222222222222200000000
// 055:0222200202222002022220020002000022222222222222222222222200000000
// 056:2000022220022022200220222002202222222222222222222222222200000000
// 057:2222222022222220222222202222222022222208222220882222088800008888
// 068:8888000088803333880333338033333303333003033330030333300303333003
// 069:0000000033333333333333333333333333003300330030033300300333003000
// 070:0000000033333333333333333333333300333000300300333003003300030033
// 071:0000000033333333333333333333333333000033033003303330033033300330
// 072:0000000033333333333333333333333300003300033003000330030000000300
// 073:0000888833330888333330883333330800333330330333303303333033033330
// 084:0333330003333300033333300333333380333333880333338880333388880000
// 085:3003300330033003003330030333300333333333333333333333333300000000
// 086:3003003330030033300300333003300033333333333333333333333300000000
// 087:3330033033300330033003303300003033333333333333333333333300000000
// 088:0330030003300300033003000330030033333333333333333333333300000000
// 089:0033333033033330330333303303333033333308333330883333088800008888
// </SPRITES>

// <WAVES>
// 000:00000000ffffffff00000000ffffffff
// 001:0123456789abcdeffedcba9876543210
// 002:0123456789abcdef0123456789abcdef
// </WAVES>

// <SFX>
// 000:000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000304000000000
// </SFX>

// <PALETTE>
// 000:1a1c2c000000b13e53ef7d57ffcd75a7f07038b764257179ffffff3b5dc941a6f673eff7f4f4f494b0c2566c86333c57
// </PALETTE>
