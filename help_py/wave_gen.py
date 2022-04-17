import numpy as np

def main():
    out = ""

    out += "      case(wave1.out) {\n"
    out += f"        8b00000000:\n"
    for i in range(16):
        out += f"          led_state.d[{16*i + 7}:{16*i + 0}] = {{ {', '.join(['2b0' if j == '0' else '2b01' for j in np.binary_repr(0, width = 8)])} }};\n"
        out += f"          led_state.d[{16*i + 15}:{16*i + 8}] = {{ {', '.join(['2b0' if j == '0' else '2b01' for j in np.binary_repr(0, width = 8)])} }};\n"

    num = np.int8(-128)

    r_63 = False

    while True:
        out += f"        8b{np.binary_repr(num, width = 8)}:\n"
        for i in range(16):
            if i % 2:
                out += f"          led_state.d[{16 * i + 7}:{16 * i + 0}] = {{ {', '.join(['2b0' if j == '0' else '2b01' for j in np.binary_repr(num, width = 8)])} }};\n"
                out += f"          led_state.d[{16 * i + 15}:{16 * i + 8}] = {{ {', '.join(['2b0' if j == '0' else '2b01' for j in np.binary_repr(num, width = 8)])} }};\n"
            else:
                out += f"          led_state.d[{16 * i + 7}:{16 * i + 0}] = {{ {', '.join(['2b0' if j == '0' else '2b10' for j in np.binary_repr(num, width = 8)][::-1])} }};\n"
                out += f"          led_state.d[{16 * i + 15}:{16 * i + 8}] = {{ {', '.join(['2b0' if j == '0' else '2b10' for j in np.binary_repr(num, width = 8)][::-1])} }};\n"

        if num == -4:
            num = 126
            if r_63:
                break
        elif num == 63:
            num = -97
            r_63 = True
        else:
            num >>= 1


    out += "\n      }"

    with open("wave_gen.luc", "w") as file:
        file.write(out)

if __name__ == "__main__":
    main()
