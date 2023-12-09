之所以用pynput而不是用selenium和pyautogui是因为这两个都限制了鼠标点到点移动所花费的最小时间，这样的话，生成的鼠标轨迹参数就会比较慢，如果都用最小的值的话速度曲线又会比较直

贝塞尔曲线算法
```
import random
import numpy as np
import matplotlib.pyplot as plt

def get_bezier_coef(points):
    line_num = len(points) - 1
    c = 4 * np.identity(line_num)
    np.fill_diagonal(c[1:], 1)
    np.fill_diagonal(c[:, 1:], 1)
    c[0,0] = 2
    c[line_num - 1, line_num - 1] = 7
    c[line_num - 1, line_num - 2] = 2

    p = [2 * (2 * points[i] + points[i + 1]) for i in range(line_num)]

    p[0] = points[0] + 2 * points[1]

    p[line_num - 1] = 8 * points[line_num - 1] + points[line_num]

    a = np.linalg.solve(c, p)
    b = [0] * line_num

    for i in range(line_num - 1):
        b[i] = 2 * points[i + 1] - a[i + 1]
    b[line_num - 1] = (a[line_num - 1] + points[line_num]) / 2

    return a, b

def get_cubic(a, b, c, d):
    return lambda t: np.power(1 - t, 3) * a + 3 * np.power(1-t, 2) * t * b + 3 * (1-t) * np.power(t, 2) * c + np.power(t, 3) * d

def get_bezier_cubic(points):
    a, b = get_bezier_coef(points)
    return [get_cubic(points[i], a[i], b[i], points[i + 1]) for i in range(len(points) - 1)]

def evaluate_bezier(points, n):
    curves = get_bezier_cubic(points)
    return np.array([np.append(fun(t), t) for fun in curves for t in np.linspace(0, 1, n)])

def gen_mouse_move(n, x_length, y_length, t_length):
    """
    获取随机的鼠标轨迹曲线
    n 贝塞尔曲线定位点数，4-6即可， 6的时候会出现不像正常人的鼠标轨迹
    x_length x的长度
    y_length y的长度
    t_length 总用时 1000-2000ms
    """
    location_points = np.random.rand(n, 2)
    path = evaluate_bezier(location_points, 50)
    px = path[:, 0] + np.random.normal(scale=0.003, size=50 * (n - 1))
    py = path[:, 1] + np.random.normal(scale=0.003, size=50 * (n - 1))
    px = [p_x * x_length for p_x in px]
    py = [p_y * y_length for p_y in py]

    pt = path[:, 2]
    t_points = []

    for i in range(len(pt)):
        t_points.append(round((pt[i] + (i // 50)) / (n - 1) * t_length))
        if (t_points[i] - t_points[i - 1]) <= 0:
            t_points[i] = t_points[i - 1] + random.randint(3, 5)
    
    sample_index = sorted(random.sample(range(0, 50 * (n - 1)), 150))

    points_x = [round(px[index]) for index in sample_index]
    points_y = [round(py[index]) for index in sample_index]
    points_t = [t_points[index] for index in sample_index]

    return points_x, points_y, points_t

if __name__ == "__main__":
    # 建议是4-6
    points_num = 4
    # x轴的行进距离
    x_length_random = random.randint(300, 1000)
    # y轴的行进距离
    y_length_random = random.randint(300, 1000)
    # 总用时
    t_length_random = random.randint(1000, 2000)

    test_points_x, test_points_y, test_points_t = gen_mouse_move(points_num, x_length_random, y_length_random, t_length_random)

    tmp = 0
    print(test_points_t[0])
    for point_t in test_points_t:
        if (point_t - tmp) <= 0 and point_t != 0:
            print(point_t)
            print(tmp)
        tmp = point_t
    plt.scatter(test_points_x, test_points_y)
    plt.show()

    plt.scatter(test_points_t, test_points_x)
    plt.show()

    plt.scatter(test_points_t, test_points_y)
    plt.show()
```

pynput和selenium
```
driver.maximize_window()
points_num = random.randint(4, 6)
x_length_random = random.randint(300, 800)
y_length_random = random.randint(400, 600)
t_length_random = random.randint(1000, 2000)
x_start = random.randint(100, 200)
y_start = random.randint(300, 400)
points_x, points_y, points_t = gen_mouse_move(points_num, x_length_random, y_length_random, t_length_random)
for i in range(len(points_t)):
    if i == 0:
        time.sleep(points_t[i] / 1000)
        mouse.position = (x_start + points_x[i], y_start + points_y[i])
    else:
        time.sleep((points_t[i] - points_t[i - 1]) / 1000)
        mouse.position = (x_start + points_x[i], y_start + points_y[i])
```