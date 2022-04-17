import itertools
from AoE2ScenarioParser.helper.helper import xy_to_i

def main():
    out = ""
    for i in range(3):
        for j in range(3):
            out += "\n".join(
                [
                    f"\n    case(box{i}{j}) {{",
                    f"      8:",
                    *[f"        led_state.d[{xy_to_i(5 * j + l, 5 * i + m, 16)}] = 1;  " for l, m in
                      itertools.product(range(2, 3), repeat = 2)],
                    f"      14:",
                    *[f"        led_state.d[{xy_to_i(5 * j + l, 5 * i + m, 16)}] = 1;  " for l, m in
                      itertools.product(range(1, 4), repeat = 2)],
                    f"      20:",
                    *[f"        led_state.d[{xy_to_i(5 * j + l, 5 * i + m, 16)}] = 1;  " for l, m in
                      itertools.product(range(0, 5), repeat = 2)],
                    f"      10:",
                    *[f"        led_state.d[{xy_to_i(5 * j + l, 5 * i + m, 16)}] = 2;  " for l, m in
                      itertools.product(range(2, 3), repeat = 2)],
                    f"      16:",
                    *[f"        led_state.d[{xy_to_i(5 * j + l, 5 * i + m, 16)}] = 2;  " for l, m in
                      itertools.product(range(1, 4), repeat = 2)],
                    f"      22:",
                    *[f"        led_state.d[{xy_to_i(5 * j + l, 5 * i + m, 16)}] = 2;  " for l, m in
                      itertools.product(range(0, 5), repeat = 2)],
                    f"    }}"
                ]
            )

        out += "\n"

    sizes = ['small', 'med', 'large']
    for i, s in enumerate(sizes):
        out += "\n".join(
            [
                f"\n    case(pieces_remaining_{s}_p1) {{",
                f"      1:",
                *[f"        led_state.d[{xy_to_i(5*i+2, 15, 16)}] = 1;  "],
                f"      2:",
                *[f"        led_state.d[{xy_to_i(5*i+1, 15, 16)}] = 1;  "],
                *[f"        led_state.d[{xy_to_i(5*i+3, 15, 16)}] = 1;  "],
                f"    }}"
            ]
        )

        out += "\n".join(
            [
                f"\n    case(pieces_remaining_{s}_p2) {{",
                f"      1:",
                *[f"        led_state.d[{xy_to_i(15, 5*i+2, 16)}] = 2;  "],
                f"      2:",
                *[f"        led_state.d[{xy_to_i(15, 5*i+1, 16)}] = 2;  "],
                *[f"        led_state.d[{xy_to_i(15, 5*i+3, 16)}] = 2;  "],
                f"    }}"
            ]
        )

    out += "\n".join(
        [
            f"\n    case(game_state) {{",
            f"      p1_select_box:",
            *[f"        led_state.d[{xy_to_i(15, 15, 16)}] = 1;  "],
            f"      p1_select_size:",
            *[f"        led_state.d[{xy_to_i(15, 15, 16)}] = 1;  "],
            f"      p2_select_box:",
            *[f"        led_state.d[{xy_to_i(15, 15, 16)}] = 2;  "],
            f"      p2_select_size:",
            *[f"        led_state.d[{xy_to_i(15, 15, 16)}] = 2;  "],
            f"    }}"
        ]
    )

    case_box = f"\n          case(box_addr) {{"

    for i in range(3):
        for j in range(3):
            case_box += "\n".join([
                f"\n            {i*3 + j}:",
                f"              led_state.d[{xy_to_i(j * 5, i * 5, 16)}] = PLAYER_COLOUR;",
                f"              led_state.d[{xy_to_i(j * 5, i * 5 + 1, 16)}] = PLAYER_COLOUR;",
                f"              led_state.d[{xy_to_i(j * 5 + 1, i * 5, 16)}] = PLAYER_COLOUR;",

                f"              led_state.d[{xy_to_i(j * 5 + 4, i * 5, 16)}] = PLAYER_COLOUR;",
                f"              led_state.d[{xy_to_i(j * 5 + 4, i * 5 + 1, 16)}] = PLAYER_COLOUR;",
                f"              led_state.d[{xy_to_i(j * 5 + 3, i * 5, 16)}] = PLAYER_COLOUR;",

                f"              led_state.d[{xy_to_i(j * 5, i * 5 + 4, 16)}] = PLAYER_COLOUR;",
                f"              led_state.d[{xy_to_i(j * 5, i * 5 + 3, 16)}] = PLAYER_COLOUR;",
                f"              led_state.d[{xy_to_i(j * 5 + 1, i * 5 + 4, 16)}] = PLAYER_COLOUR;",

                f"              led_state.d[{xy_to_i(j * 5 + 4, i * 5 + 4, 16)}] = PLAYER_COLOUR;",
                f"              led_state.d[{xy_to_i(j * 5 + 3, i * 5 + 4, 16)}] = PLAYER_COLOUR;",
                f"              led_state.d[{xy_to_i(j * 5 + 4, i * 5 + 3, 16)}] = PLAYER_COLOUR;",
            ])
    case_box += f"\n          }}"

    out += "\n    if(selection_highlight.value[26]) {\n"

    out += "\n".join(
        [
            f"\n      case(game_state) {{",
            f"        p1_select_size:",
            case_box.replace("PLAYER_COLOUR", "1"),
            f"        p2_select_size:",
            case_box.replace("PLAYER_COLOUR", "2"),
            f"      }}"
        ]
    )

    out += "\n    }"

    with open("led_state.luc", "w") as file:
        file.write(out)

    # a = [0]*256
    #
    # for i in range(2, 3):
    #     for j in range(1, 2):
    #         def f(l, m, v):
    #             nonlocal i, j, a
    #             a[xy_to_i(5 * j + l, 5 * i + m, 16)] = v
    #
    #         [f(l, m, 1) for l, m in itertools.product(range(2, 3), repeat = 2)]
    #         [f(l, m, 1) for l, m in itertools.product(range(1, 4), repeat = 2)]
    #         [f(l, m, 1) for l, m in itertools.product(range(0, 5), repeat = 2)]
    #         [f(l, m, 2) for l, m in itertools.product(range(2, 3), repeat = 2)]
    #         [f(l, m, 2) for l, m in itertools.product(range(1, 4), repeat = 2)]
    #         [f(l, m, 2) for l, m in itertools.product(range(0, 5), repeat = 2)]
    #
    #         a[xy_to_i(j * 5, i * 5, 16)] = 1
    #         a[xy_to_i(j * 5, i * 5 + 1, 16)] = 1
    #         a[xy_to_i(j * 5 + 1, i * 5, 16)] = 1
    #         a[xy_to_i(j * 5 + 4, i * 5, 16)] = 1
    #
    #         a[xy_to_i(j * 5 + 4, i * 5 + 1, 16)] = 1
    #         a[xy_to_i(j * 5 + 3, i * 5, 16)] = 1
    #         a[xy_to_i(j * 5, i * 5 + 4, 16)] = 1
    #         a[xy_to_i(j * 5, i * 5 + 3, 16)] = 1
    #
    #         a[xy_to_i(j * 5 + 1, i * 5 + 4, 16)] = 1
    #         a[xy_to_i(j * 5 + 4, i * 5 + 4, 16)] = 1
    #         a[xy_to_i(j * 5 + 3, i * 5 + 4, 16)] = 1
    #         a[xy_to_i(j * 5 + 4, i * 5 + 3, 16)] = 1
    #
    # for i in range(16):
    #     print(a[i*16:(i+1)*16])

import numpy as np


def main2():
    a = np.ndarray.flatten(np.array([[1]*8 + [0]*8 for _ in range(16)]))
    ra = np.ndarray.flatten(np.array([[1]*8 + [0]*8 for _ in range(16)]))

    # print(np.reshape(a, (16, 16)))

    for i in range(1, 16, 2):
        print(f"reversedArray[{i*16+15}:{i*16}] = array[{i*16+15}:{i*16}];")
        ra[i*16+15:i*16] = a[i*16+15:i*16]

    for i in range(0, 16, 2):
        for j, r in zip(range(i*16, (i+1)*16), range(i*16, (i+1)*16)[::-1]):
            print(f"reversedArray[{j}] = array[{r}];")
            ra[j] = a[r]

    # print(np.reshape(ra, (16, 16)))





if __name__ == "__main__":
    main2()

