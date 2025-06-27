namespace Arithmatic {
    import Std.Math.*;

    function ComplexAdd(x : Complex, y : Complex) : Complex {
        let (a, b) = (x.Real, x.Imag);
        let (c, d) = (y.Real, y.Imag);

        return Complex(a + c, b + d);
    }

    function ComplexMulti(x : Complex, y : Complex) : Complex {
        let (a, b) = (x.Real, x.Imag);
        let (c, d) = (y.Real, y.Imag);

        return Complex(((a * c) - (b * d)), ((a * d) + (b * c)));
    }

    function CompelxConjugate(x : Complex) : Complex {
        return Complex(x.Real, -x.Imag);
    }

    function ComplexDivide(x : Complex, y : Complex) : Complex {
        let (a, b) = (x.Real, x.Imag);
        let (c, d) = (y.Real, y.Imag);

        let Nom = Complex(((a * c) + (b * d)), ((b * c) - (a * d)));
        let Deno = (c * c) + (d * d);

        let resultReal = Nom.Real / Deno;
        let resultImag = Nom.Imag / Deno;

        let result = Complex(resultReal, resultImag);

        return result;
    }
}
