
import typing
import collections.abc
from pathlib import Path

class AbstractFortranCompileUnit:
    pass

class FortranCompileUnitUnion(
    AbstractFortranCompileUnit, 
    collections.abc.Sequence
    ):

    def __init__(
        self,
        units: typing.Sequence[AbstractFortranCompileUnit] = None
        ):
        
        self.units = (
            [] 
            if units is None
            else list(units)
        )
    
    @property
    def __getitem__(self):
        return self.units.__getitem__
    
    @property
    def __len__(self):
        return self.units.__len__

    def __or__(self, other):
        new = self.__class__()

        new.units += self.units

        if isinstance(other, collections.abc.Sequence):
            new.units += other
        else:
            new.units.append(other)

        return new
    
    def __repr__(self):
        return ' | '.join(map(repr, self.units))

    def __lshift__(self, other):
        for unit in self.units:
            unit << other

        return other


class FortranCompileUnit(AbstractFortranCompileUnit):
    def __init__(
        self,
        name: str,
        dependencies: typing.Sequence[AbstractFortranCompileUnit] = None,
        ):

        self.dependencies = (
            [] 
            if dependencies is None
            else list(dependencies)
        )

        self.name = name

    def __repr__(self):
        return (
            f"{self.__class__.__name__}("
            f"name={self.name!r}, "
            f"dependencies={self.dependencies!r}"
            f")"
        )

    def __or__(self, other):
        return FortranCompileUnitUnion([self]) | other

    def __lshift__(self, other):
        if isinstance(other, collections.abc.Sequence):
            others = other
        else:
            others = [other]

        for unit in others:
            unit.dependencies.append(self)

        return other

    def get_file_name(self, directory: Path):
        return directory / f"{self.name}.f90"

    def codegenerator(self):
        yield "\n"

    def save_to_dir(self, directory):

        with self.get_file_name(directory).open('w', encoding='utf-8') as file_obj:
            file_obj.writelines(self.codegenerator())


class FortranModule(FortranCompileUnit):

    def codegenerator(self):
        yield f"module {self.name}" "\n"
        for depend in self.dependencies:
            yield f"    use {depend.name}" "\n"
        yield f"end module {self.name}" "\n"

class FortranProgram(FortranCompileUnit):
    
    def codegenerator(self):
        yield f"program {self.name}" "\n"
        for depend in self.dependencies:
            yield f"    use {depend.name}" "\n"
        yield f'    print *, "hello, world!"' "\n" 
        yield f"end program {self.name}" "\n"
        

A = FortranModule(name='a')
B = FortranModule(name='b')
C = FortranModule(name='c')
D = FortranModule(name='d')
E = FortranModule(name='e')
F = FortranModule(name='f')
G = FortranModule(name='g')
H = FortranModule(name='h')
I = FortranModule(name='i')
J = FortranModule(name='j')
K = FortranModule(name='k')
L = FortranModule(name='l')
M = FortranModule(name='m')
N = FortranModule(name='n')
O = FortranModule(name='o')
P = FortranModule(name='p')
Q = FortranModule(name='q')
R = FortranModule(name='r')
S = FortranModule(name='s')
T = FortranModule(name='t')
U = FortranModule(name='u')
V = FortranModule(name='v')
W = FortranModule(name='w')
X = FortranModule(name='x')
Y = FortranModule(name='y')
Z = FortranModule(name='z')

main = FortranProgram(name="main")

A << B << C << D << E << F
G << H << I << J << K << L
M << N << O << P << Q << R << S
T << U << V << W << X << Y << Z

A << I << Q << Z

(F | L | S | Z) << main

for unit in (A, B, C, D, E, F, G, H, I, J, K, L, M, N, O, P, Q, R, S, T, U, V, W, X, Y, Z, main):
    unit.save_to_dir(Path(__file__).parent)
