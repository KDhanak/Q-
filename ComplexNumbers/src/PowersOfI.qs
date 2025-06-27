namespace PowersOfI {
    import Microsoft.Quantum.Math.*;

    function ComputePowerOfI(n : Int) : Complex {
        let remainder = n % 4;
        if (remainder == 0) {
            return Complex(1.0, 0.0);
        }
        if (remainder == 1) {
            return Complex(0.0, 1.0);
        }
        if (remainder == 2) {
            return Complex(-1.0, 0.0);
        }
        return Complex(0.0, -1.0);
    }
}
