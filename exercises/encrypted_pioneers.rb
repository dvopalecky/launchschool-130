pioneers = <<PIONEERS
Nqn Ybirynpr
Tenpr Ubccre
Nqryr Tbyqfgvar
Nyna Ghevat
Puneyrf Onoontr
Noqhyynu Zhunzznq ova Zhfn ny-Xujnevmzv
Wbua Ngnanfbss
Ybvf Unyog
Pynhqr Funaaba
Fgrir Wbof
Ovyy Tngrf
Gvz Orearef-Yrr
Fgrir Jbmavnx
Xbaenq Mhfr
Wbua Ngnanfbss
Fve Nagbal Ubner
Zneiva Zvafxl
Lhxvuveb Zngfhzbgb
Unllvz Fybavzfxv
Tregehqr Oynapu
PIONEERS

class ROT13
  INPUT = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ'.freeze
  OUTPUT = 'nopqrstuvwxyzabcdefghijklmNOPQRSTUVWXYZABCDEFGHIJKLM'.freeze
  MAP = [INPUT.chars, OUTPUT.chars].transpose.to_h

  def self.decode(str)
    arr = str.chars
    arr.map! do |char|
      decode_char!(char)
    end
    arr.join('')
  end

  def self.decode_char!(char)
    char = MAP[char] if INPUT.include?(char)
    char
  end
end

puts ROT13.decode(pioneers)
