import numpy as np
from PIL import Image


def main():
    out = ""

    out += "      case(wave1.out) {\n"

    num = int('01111110', 2)

    i = 1
    while True:
        out += f"        8b{np.binary_repr(num, width = 8)}:\n"
        with Image.open(f"./anim/f{i}.png") as im:
            px = im.load()

        col = []

        for l in range(16):
            for m in range(16):
                r, g, b, a = px[l, m]

                if r >= 200 and g < 200 and b < 200:
                    col.append('2b10')
                elif r < 200 and g >= 200 and b < 200:
                    col.append('2b01')
                elif r > 225 and g > 225 and b > 225:
                    col.append('2b11')
                else:
                    col.append('2b00')

        out += f"          led_state.d = {{ {', '.join(col)} }};\n"
        # print(f"led = [ {', '.join(map(lambda x: {'2b01': '1', '2b10': '2', '2b11': '3', '2b00': '0'}[x], col))} ];")

        if num == np.int8(int('11111100', 2)):
            break

        if num == int('00111111', 2):
            num = np.int8(int('10011111', 2))
        else:
            num >>= 1

        i += 1


    out += "\n      }"

    with open("pinwheel_gen.luc", "w") as file:
        file.write(out)

if __name__ == "__main__":
    main()
