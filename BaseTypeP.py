"""
Make with
https://www.codeconvert.ai/free-converter
"""

import struct

class BaseType:
    SingleMashEpsilon = 1.19209289550781E-07
    RealMashEpsilon = 9.09494701772928E-13
    DoubleMashEpsilon = 2.22044604925031E-16
    ExtendedMashEpsilon = 1.08420217248550E-19

    def __init__(self, name):
        self.name=name

    @property
    def SizeOfMyReal(self):
        return struct.calcsize(self.name)  # Assuming 'f' for single precision

    def GetMashEpsilon(self):
        if self.SizeOfMyReal == 4:
            return self.SingleMashEpsilon
        elif self.SizeOfMyReal == 6:
            return self.RealMashEpsilon
        elif self.SizeOfMyReal == 8:
            return self.DoubleMashEpsilon
        elif self.SizeOfMyReal == 10:
            return self.ExtendedMashEpsilon

    def GetRealTypeQuasiMax(self):
        if self.SizeOfMyReal == 4:
            return 3e37  # 3.4e38
        elif self.SizeOfMyReal == 6:
            return 1e37  # 1.7e38
        elif self.SizeOfMyReal == 8:
            return 1e307  # 1.7e308
        elif self.SizeOfMyReal == 10:
            return 1e4931  # 1.1e4932

    def RealTypeName(self):
        if self.SizeOfMyReal == 4:
            return 'single'
        elif self.SizeOfMyReal == 6:
            return 'real'
        elif self.SizeOfMyReal == 8:
            return 'double'
        elif self.SizeOfMyReal == 10:
            return 'extended'

# Example usage
if __name__ == "__main__":
    base_type = BaseType('f')
    print('GetRealTypeQuasiMax=', base_type.GetRealTypeQuasiMax())

    print('GetRealTypeQuasiMax=', BaseType('d').GetRealTypeQuasiMax())

    print('GetRealTypeQuasiMax=', BaseType('e').GetRealTypeQuasiMax())