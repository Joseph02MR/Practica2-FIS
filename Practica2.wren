// title:  Decantacion
// author: eqa
// desc:   Practica 2 FIS
// script: wren
import "random" for Random
var BtnLen = 46
var BtnWid = 14
var BtnY = 110

class Game is TIC{

	construct new(){
		_t=0
		_aux = [0]
		_main = [0,0,0,0,0]
		_mats = {
			0:"",
			1:"ACEITE",
			2:" AGUA ",
			3:"HIERRO"
		}
		_palGen = 0

		//mouse params
		_x = 0
		_y = 0
		_lclic = false

		//auxiliares logicos
		_generarOn = true
		_vaciarOn = false
		_salirOn = false
	}

	generarPalabra(){
		var ran = Random.new()
		var a = ran.int(1,4)
		_aux.clear()
		_aux.add(a)
		_palGen=_palGen+1
	}
	vaciarPalabra(){
		var palabra = _aux.removeAt(0)
		_aux.add(0)
		_main[0]=palabra
		ordenarDensidad()
	}

	ordenarDensidad(){
		for(i in 1...5){
			for(j in 1..5-i){
				if(_main[j-1]>_main[j]){
					_main.swap(j-1,j)
				}
			}
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
		TIC.spr(260,30,BtnY,8,1,0,0,6,2)
		TIC.spr(324,100,BtnY,8,1,0,0,6,2)
		TIC.spr(292,170,BtnY,8,1,0,0,6,2)
	}

	updatePalette(){
		var PALETTE_MAP = 0x3FF0
		var g1 = 6
		var g2 = 5
		var r1 = 2
		var r2 = 4
		var o1 = 3
		var o2 = 11

		if(_generarOn){
			TIC.poke4(PALETTE_MAP * 2 + g1, g1)
		}else{
			TIC.poke4(PALETTE_MAP * 2 + g1, g2)
		}
		if(_vaciarOn){
			TIC.poke4(PALETTE_MAP * 2 + o1, o1)
		}else{
			TIC.poke4(PALETTE_MAP * 2 + o1, o2)
		}
		if(_salirOn){
			TIC.poke4(PALETTE_MAP * 2 + r1, r1)
		}else{
			TIC.poke4(PALETTE_MAP * 2 + r1, r2)
		}
	}

	print_aux(){
		TIC.print("%(_mats[_aux[0]])",67,75,1)
	}

	print_main(){
		for(i in 0...5){
			TIC.print("%(_mats[_main[i]])", 137, 17+(17*i))
		}
	}

	btnGenerar(){
		if(_lclic && _t%6==0){
			if(_generarOn){
				if((31..(31+BtnLen)).contains(_x)){
					if(((BtnY+1)..(BtnY+1+BtnWid)).contains(_y)){
						generarPalabra()
						_generarOn = false
						_vaciarOn = true
					}
				}
			}
		}
	}
	btnVaciar(){
		if(_lclic && _t%6==0){
			if(_vaciarOn){
				if((101..(101+BtnLen)).contains(_x)){
					if(((BtnY+1)..(BtnY+1+BtnWid)).contains(_y)){
						vaciarPalabra()
						_vaciarOn = false
						if(_palGen == 5 ){
							_salirOn = true
						} else{
							_generarOn = true
						}
					}
				}
			}
		}
	}
	btnSalir(){
		if(_lclic && _t%6==0){
			if(_salirOn){
				if((171..(171+BtnLen)).contains(_x)){
					if(((BtnY+1)..(BtnY+1+BtnWid)).contains(_y)){
						TIC.exit()
					}
				}
			}
		}
	}

//ciclo principal de la aplicacion
	TIC(){
		//array mouse params

		var arr = List.new()
		arr = TIC.mouse()

		_lclic = arr[2]
		_x = arr[0]
		_y = arr[1]

		updatePalette()
		draw_interfaz()
		btnGenerar()
		btnVaciar()
		btnSalir()
		print_aux()
		print_main()

		//debug
		//mouse param
		for(i in 0...arr.count){
			TIC.print("%(arr[i])",0,i*6)
		}
		for(i in 0...5){
			TIC.print("%(_main[i])",10,90+(i*6))
		}
		TIC.print("%(_main[0])",10,50)
		TIC.print("%(_generarOn)",10,56)
		TIC.print("%(_vaciarOn)",10,62)
		TIC.print("%(_salirOn)",10,68)
		TIC.print("%(_t)",220,1)
		TIC.print("%(BtnLen)",220,7)
		TIC.print("%(BtnWid)",220,15)

		_t=_t+1
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
// 034:880ddcdd880ddcdd8800dddd880ddddd880ddddd880ddddd890ddddd99999999
// 035:dddde088dddde088dddde088dddde088dddde088dddde088dddde09899999999
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
// 000:1a1c2c000000b13e53ef7d578d00080c613c38b764257179ffffffb13e5341a6f68d4428f4f4f494b0c2566c86333c57
// </PALETTE>
