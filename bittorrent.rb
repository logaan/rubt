require "socket"
require "pp"

# Setup
transmission = TCPSocket.new( "192.168.1.6", 51413 )

# Send handshake
transmission.send("\023", 0) # pstrlen
transmission.send("BitTorrent protocol", 0) # pstr
transmission.send("\200\000\000\000\000\023\000\000", 0) #reserved
transmission.send("7\021\311\231\305\327\221!m\247\266/\266\307\005\372\246g-\206", 0) # info_hash
transmission.send("-AZ4004-znmphhbrij37", 0) # peer_id

pp transmission.recv(100).unpack("c a19 a8 a20 a20")

# Teardown
transmission.close

