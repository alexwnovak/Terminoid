using System;

namespace LineInput
{
    public struct Color : IEquatable<Color>
    {
        public byte R { get; }
        public byte G { get; }
        public byte B { get; }

        public Color(byte r, byte g, byte b)
        {
            R = r;
            G = g;
            B = b;
        }

        public override bool Equals(object obj)
        {
            if (obj is Color color)
            {
                return Equals(color);
            }

            return false;
        }

        public override int GetHashCode() => (B << 16) | (G << 8) | R;

        public bool Equals(Color other)
        {
            return R == other.R && G == other.G && B == other.B;
        }

        public static bool operator ==(Color lhs, Color rhs) => lhs.Equals(rhs);
        public static bool operator !=(Color lhs, Color rhs) => !lhs.Equals(rhs);
    }
}