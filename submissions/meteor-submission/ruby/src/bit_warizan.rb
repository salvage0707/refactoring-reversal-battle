def bit_warizanh(x,y)
    bit_x = [x].pack('Q<')
    bit_y = [y].pack('Q<')

    bit_alu = [0].pack('Q<')

    bit_result = [0].pack('Q<')

    while (bit_y != 1)
        bit_y_left_32bit = bit_y >> 32

        bit_alu = (bit_y_left_32bit - bit_y) << 32

        bit_x = bit_alu + (bit_x << 32 >> 64)

        bit_y = bit_y >> 1

        bit_result = bit_x >> 32
    end
    bit_result
end
