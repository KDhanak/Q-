namespace RandomNumber {
    import Std.Convert.ResultArrayAsInt;
    import Std.Math.BitSizeI;
    import Microsoft.Quantum.Random;
    import Microsoft.Quantum.Convert.*;
    import Microsoft.Quantum.Math.*;

    operation GenerateRandomNumber() : Result {
        use q = Qubit();
        H(q);
        let result = M(q);
        Reset(q);
        return result;
    }

    operation GenerateRandomNumberInRange(min : Int, max : Int) : Int {
        let range = max - min + 1;
        let nBits = BitSizeI(range);
        mutable bits : Result[] = [];

        for idxBit in 1..nBits {
            bits += [GenerateRandomNumber()];
        }
        mutable sample = ResultArrayAsInt(bits);

        if (sample >= range) {
            return GenerateRandomNumberInRange(min, max);
        }

        return sample + min;
    }
}

namespace TestingSpace {
    import Std.Math.Complex;
    open Microsoft.Quantum.Math;
    open RandomNumber;
    open PowersOfI;

    @EntryPoint()
    operation UsePowerOfI() : Unit {
        let randomNumber = GenerateRandomNumberInRange(-64, 64);
        let result = ComputePowerOfI(randomNumber);
        Message($"Random n: {randomNumber}");
        Message($"i^{randomNumber} = {result::Real} + {result::Imag}i");
    }
}
