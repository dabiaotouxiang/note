from typing import TypeVar

Fraction = TypeVar("Fraction", bound="Fraction")

# from typing_extensions import Self

def gcd(m: int, n: int) -> int:
    """gcd
    获取m和n的最大公因数
    Args:
        m (int): 整数m
        n (int): 整数n

    Returns:
        int: m 和 n的最大公因数
    """
    while m % n != 0:
        oldm = m
        oldn = n

        m = oldn
        n = oldm % oldn
    return n

class Fraction(object):
    def __init__(self, top: int, bottom: int) -> None:
        """__init__
        分数类的init方法
        Args:
            top (int): 分子
            bottom (int): 分母
        """
        if type(top) != int or type(bottom) != int:
            raise Exception("传入的分子分母不为int")
        if top * bottom < 0:
            top = -abs(top)
            bottom = abs(bottom)
        else:
            top = abs(top)
            bottom = abs(bottom)

        common = gcd(top, bottom)
        self._num = top // common
        self._den = bottom // common
    
    def __str__(self) -> str:
        """__str__
        打印分数的格式
        Returns:
            str: 分子/分母
        """
        if self._den == 1:
            return str(self._num)
        return str(self._num) + "/" + str(self._den)

    def __repr__(self) -> str:
        """__str__
        在交互式环境中，用于提示
        Returns:
            str: 分子/分母
        """
        if self._den == 1:
            return str(self._num)
        return str(self._num) + "/" + str(self._den)

    def getNum(self) -> int:
        """获取分子

        Returns:
            int: 分子
        """
        return self._num
    
    def getDen(self) -> int:
        """获取分母

        Returns:
            int: 分母
        """
        return self._den

    def __add__(self, other_fraction: Fraction) -> Fraction:
        """实现+的魔术方法

        Args:
            other_fraction (Fraction): 另一个Fraction对象

        Returns:
            Fraction: 分数对象
        """
        new_num = self._num * other_fraction.getDen() + self._den * other_fraction.getNum()
        new_den = self._den * other_fraction.getDen()

        return Fraction(new_num, new_den)
    
    def __radd__(self, other_fraction: Fraction) -> Fraction:
        """实现radd的魔术方法
        对于a+b, 当a存在add方法的时候, 就用a的add, 当a不存在add方法的时候, 就看b存不存在radd方法, 存在的话就调用b的radd方法
        Args:
            other_fraction (Fraction): 另一个Fraction对象

        Returns:
            Fraction: 分数对象
        """
        new_num = self._num * other_fraction.getDen() + self._den * other_fraction.getNum()
        new_den = self._den * other_fraction.getDen()

        return Fraction(new_num, new_den)
    
    def __iadd__(self, other: Fraction) -> Fraction:
        """赋值加法

        Args:
            other (Fraction): 一个分数
        """
        new_num = self._num * other.getDen() + self._den * other.getNum()
        new_den = self._den * other.getDen()
        return Fraction(new_num, new_den)

    def __gt__(self, other: Fraction) -> bool:
        """大于的魔术方法

        Args:
            other (Fraction): 另一个Fraction对象

        Returns:
            bool: 当前的Fraction对象是否大于另一个
        """
        first_num = self._num * other.getDen()
        second_num = self._den * other.getNum()

        return first_num > second_num
    
    def __ge__(self, other: Fraction) -> bool:
        """大于等于的魔术方法

        Args:
            other (Fraction): 另一个Fraction对象

        Returns:
            bool: 当前的Fraction对象是否大于另一个
        """
        first_num = self._num * other.getDen()
        second_num = self._den * other.getNum()

        return first_num >= second_num

    def __lt__(self, other: Fraction) -> bool:
        """<的魔术方法

        Args:
            other (Fraction): 另一个Fraction对象

        Returns:
            bool: 当前的Fraction对象是否小于另一个
        """
        first_num = self._num * other.getDen()
        second_num = self._den * other.getNum()

        return first_num < second_num

    def __le__(self, other: Fraction) -> bool:
        """<=的魔术方法

        Args:
            other (Fraction): 另一个Fraction对象

        Returns:
            bool: 当前的Fraction对象是否小于等于另一个
        """
        first_num = self._num * other.getDen()
        second_num = self._den * other.getNum()

        return first_num <= second_num

    def __ne__(self, other: Fraction) -> bool:
        """!=的魔术方法

        Args:
            other (Fraction): 另一个Fraction对象

        Returns:
            bool: 当前的Fraction对象是否不等于另一个
        """
        first_num = self._num * other.getDen()
        second_num = self._den * other.getNum()

        return first_num != second_num

    def __eq__(self, other: Fraction) -> bool:
        """==的魔术方法

        Args:
            other (Fraction): 另一个分数对象

        Returns:
            bool: 是否相等
        """
        first_num = self._num * other.getDen()
        second_num = self._den * other.getNum()

        return first_num == second_num
    
    def __sub__(self, other: Fraction) -> Fraction:
        """- 的魔术方法

        Args:
            other (Fraction): 另一个分数

        Returns:
            Fraction: 两个分数相减的结果
        """
        new_num = self._num * other.getDen() - self._den * other.getNum()
        new_den = self._den * other.getDen()

        return Fraction(new_num, new_den)

    def __mul__(self, other: Fraction) -> Fraction:
        """__mul__ 相乘的魔术方法

        Args:
            other (Fraction): 一个分数

        Returns:
            Fraction: 结果的分数
        """
        new_num = self._num * other.getNum()
        new_den = self._den * other.getDen()

        return Fraction(new_num, new_den)

    def __truediv__(self, other: Fraction) -> Fraction:
        """__truediv__

        Args:
            other (Fraction): 一个分数

        Returns:
            Fraction: 结果的分数
        """
        new_num = self._num * other.getDen()
        new_den = self._den * other.getNum()

        return Fraction(new_num, new_den)

if __name__ == '__main__':
    f1 = Fraction(2, 6)
    f2 = Fraction(1, 6)
    print(f1 + f2)
    print(f1 == f2)
    print(f1 - f2)
    print(f1 * f2)
    print(f1 / f2)
    f1 += f2
    print(f1)