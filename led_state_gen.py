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
                    *[f"        led_state.d[{xy_to_i(5 * i + l, 5 * j + m, 16)}] = 1;  " for l, m in
                      itertools.product(range(2, 3), repeat = 2)],
                    f"      14:",
                    *[f"        led_state.d[{xy_to_i(5 * i + l, 5 * j + m, 16)}] = 1;  " for l, m in
                      itertools.product(range(1, 4), repeat = 2)],
                    f"      20:",
                    *[f"        led_state.d[{xy_to_i(5 * i + l, 5 * j + m, 16)}] = 1;  " for l, m in
                      itertools.product(range(0, 5), repeat = 2)],
                    f"      10:",
                    *[f"        led_state.d[{xy_to_i(5 * i + l, 5 * j + m, 16)}] = 2;  " for l, m in
                      itertools.product(range(2, 3), repeat = 2)],
                    f"      16:",
                    *[f"        led_state.d[{xy_to_i(5 * i + l, 5 * j + m, 16)}] = 2;  " for l, m in
                      itertools.product(range(1, 4), repeat = 2)],
                    f"      22:",
                    *[f"        led_state.d[{xy_to_i(5 * i + l, 5 * j + m, 16)}] = 2;  " for l, m in
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

    out += "\n    if(selection_highlight[26]) {\n"

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

    with open("./led_state.luc", "w") as file:
        file.write(out)

if __name__ == "__main__":
    main()

