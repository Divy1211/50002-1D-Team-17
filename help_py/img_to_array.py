from PIL import Image
with Image.open("./crown.png") as im:
    px = im.load()


col = []

for i in range(16):
    for j in range(16):
        col.append('2b0' if px[i, j] == (255, 255, 255, 255) else '2b10')


print(f"const WIN_P2 = {{ {', '.join(col)} }};")
