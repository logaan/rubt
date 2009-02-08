require "pp"

def hexdigest_to_digest(h)
  h.unpack('a2'*(h.size/2)).collect {|i| i.hex.chr }.join
end

packet = "13426974546f7272656e742070726f746f636f6c80000000001300003711c999c5d791216da7b62fb6c705faa6672d862d415a343030342d7a6e6d7068686272696a3337"

# packet = "13426974546f7272656e742070726f746f636f6c657800000000000041ae3119149a085e51d26fab5d72"

pp unpacked = hexdigest_to_digest(packet).unpack("c a19 a8 a20 a20")
pp packed = unpacked.pack("c a19 a8 a20 a20")

pp packed.unpack("H*")[0]
pp packet

pp packed
pp hexdigest_to_digest(packet)

for part in unpacked
  puts part.to_s.length
end

